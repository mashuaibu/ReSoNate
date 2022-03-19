/**
  ******************************************************************************
  * @file    BSP/Src/audio_record.c 
  * @author  MCD Application Team
  * @brief   This example code shows how to use AUDIO features for the record.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2017 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "audio_record.h"
#include <string.h>
#include "codec2.h"
#include <stdlib.h>
#include "SX1278.h"
#include "codec2_fifo.h"
#include "audio_play.h"
/** @addtogroup STM32F4xx_HAL_Examples
  * @{
  */

/** @addtogroup BSP
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
//#define AUDIO_BUFFER_SIZE   8192

typedef struct {
  int32_t offset;
  uint32_t fptr;
}Audio_BufferTypeDef;

typedef enum
{
  BUFFER_OFFSET_NONE = 0,
  BUFFER_OFFSET_HALF,
  BUFFER_OFFSET_FULL,
}BUFFER_StateTypeDef;


/* Private define ------------------------------------------------------------*/
#define TX_DEV
#define LIVE
//#define DEBUG_PRINT

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
uint8_t  pHeaderBuff[44];
uint16_t WrBuffer[WR_BUFFER_SIZE];

static uint16_t RecBuf[PCM_OUT_SIZE];
static uint16_t InternalBuffer[INTERNAL_BUFF_SIZE];
__IO uint32_t ITCounter = 0;
Audio_BufferTypeDef  BufferCtl;

/* Temporary data sample */
__IO uint32_t AUDIODataReady = 0, AUDIOBuffOffset = 0;  // AUDIOBuffOffset seemed not useful

/* Variable used to replay audio sample (from play or record test)*/
extern uint32_t AudioTest;

/* Variable used for play in infinite loop */
extern __IO uint8_t UserPressButton;

/* Variables used in norma mode to manage audio file during DMA transfer */
extern uint32_t AudioTotalSize; /* This variable holds the total size of the audio file */
extern uint32_t AudioRemSize;   /* This variable holds the remaining data in audio file */
extern uint16_t *CurrentPos;   /* This variable holds the current position of audio pointer */

// codec2
struct CODEC2 *c2;

extern SX1278_t SX1278;
extern UART_HandleTypeDef huart1;

struct FIFO* rx_fifo;
/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Test Audio Hardware.
  *   The main objective of this test is to check the hardware connection of the 
  *   Audio peripheral.
  * @param  None
  * @retval None
  */
void AudioRecord_Test(void)
{
  
  /********** codec 2 **********/
  c2 = codec2_create(CODEC2_MODE_1300);
  int nsam = codec2_samples_per_frame(c2);
//  short *buf = (short*)malloc(nsam*sizeof(short));
  int nbit = codec2_bits_per_frame(c2);
  int nbyte = (nbit + 7) / 8;
//  unsigned char *bits = (unsigned char*)malloc(nbyte*sizeof(char));
  
  

  while(1) {
#ifdef TX_DEV
  if(UserPressButton) {
    UserPressButton = 0;
    
    BufferCtl.offset = BUFFER_OFFSET_NONE;
    if(BSP_AUDIO_IN_Init(DEFAULT_AUDIO_IN_FREQ, DEFAULT_AUDIO_IN_BIT_RESOLUTION, DEFAULT_AUDIO_IN_CHANNEL_NBR) != AUDIO_OK)
    {
      /* Record Error */
      Error_Handler();
    }  

    while(!UserPressButton) {
    
    }
    UserPressButton = 0;
    
    // Turn off LED4
    BSP_LED_Off(LED4);
    
    /* Turn ON LED3: start record */
    BSP_LED_On(LED3);
    
    /* Start the record */
    if (BSP_AUDIO_IN_Record((uint16_t*)&InternalBuffer[0], INTERNAL_BUFF_SIZE) != AUDIO_OK)
    {
      /* Record Error */
      Error_Handler();
    }
    BufferCtl.fptr = 0;
    
    AUDIODataReady = 0; 
    
    ITCounter = 0;
    
    /* Wait for the data to be ready with PCM form */
  #ifdef LIVE
//    unsigned char *bits = (unsigned char*)malloc(nbyte*sizeof(char));
    int encodedSize = 1050;
    volatile int encodedCount = 0;
    unsigned char encoded[2*nbyte];
    while (!UserPressButton)
    {
      if(encodedCount >= encodedSize) {
        break;
      }
      
      if(BufferCtl.offset == BUFFER_OFFSET_HALF)
      {
        /* PDM to PCM data convert */
        BSP_AUDIO_IN_PDMToPCM((uint16_t*)&InternalBuffer[0], (uint16_t*)&RecBuf[0]);

        /* Copy PCM data in internal buffer */
        memcpy((uint16_t*)&WrBuffer[ITCounter * (PCM_OUT_SIZE)], RecBuf, PCM_OUT_SIZE*2); // 3rd arg is number of bytes, uint16_t is 2 bytes
        
        BufferCtl.offset = BUFFER_OFFSET_NONE;
        
        if(ITCounter == (WR_BUFFER_SIZE/(PCM_OUT_SIZE*2))-1)
        {
          AUDIODataReady = 1;
          AUDIOBuffOffset = 0;
//          codec2_encode(c2, bits, (short *)&WrBuffer);
          codec2_encode(c2, encoded, (short *)&WrBuffer);
          encodedCount += nbyte;
//          SX1278_transmit(&SX1278, bits, nbyte, 1000);
          ITCounter++;
        }
        else if(ITCounter == (WR_BUFFER_SIZE/(PCM_OUT_SIZE))-1)
        {
          AUDIODataReady = 2;
          AUDIOBuffOffset = WR_BUFFER_SIZE/2;
          codec2_encode(c2, &encoded[nbyte], (short *)&WrBuffer[nsam]);
          encodedCount += nbyte;
          SX1278_transmit(&SX1278, encoded, 2*nbyte, 1000);
          ITCounter = 0;
        }
        else
        {
          ITCounter++;
        }     
        
      }
      
      if(BufferCtl.offset == BUFFER_OFFSET_FULL)
      {
        /* PDM to PCM data convert */
        BSP_AUDIO_IN_PDMToPCM((uint16_t*)&InternalBuffer[INTERNAL_BUFF_SIZE/2], (uint16_t*)&RecBuf[0]);
        
        /* Copy PCM data in internal buffer */
        memcpy((uint16_t*)&WrBuffer[ITCounter * (PCM_OUT_SIZE)], RecBuf, PCM_OUT_SIZE*2);
        
        BufferCtl.offset = BUFFER_OFFSET_NONE;
        
        if(ITCounter == (WR_BUFFER_SIZE/(PCM_OUT_SIZE*2))-1)
        {
          AUDIODataReady = 1;
          AUDIOBuffOffset = 0;
          codec2_encode(c2, encoded, (short *)&WrBuffer);
          encodedCount += nbyte;
//          SX1278_transmit(&SX1278, bits, nbyte, 1000);
          ITCounter++;
        }
        else if(ITCounter == (WR_BUFFER_SIZE/(PCM_OUT_SIZE))-1)
        {
          AUDIODataReady = 2;
          AUDIOBuffOffset = WR_BUFFER_SIZE/2;
          codec2_encode(c2, &encoded[nbyte], (short *)&WrBuffer[nsam]);
          encodedCount += nbyte;
          SX1278_transmit(&SX1278, encoded, 2*nbyte, 1000);
          ITCounter = 0;
        }
        else
        {
          ITCounter++;
        } 
      }   
    };
  #else
    int encodedSize = 1050;
    unsigned char encoded[encodedSize];
    volatile int encodedCount = 0;
    
    while (!UserPressButton)
    {
      if(encodedCount >= encodedSize) {
        break;
      }
      if(BufferCtl.offset == BUFFER_OFFSET_HALF)
      {
        /* PDM to PCM data convert */
        BSP_AUDIO_IN_PDMToPCM((uint16_t*)&InternalBuffer[0], (uint16_t*)&RecBuf[0]);

        /* Copy PCM data in internal buffer */
        memcpy((uint16_t*)&WrBuffer[ITCounter * (PCM_OUT_SIZE)], RecBuf, PCM_OUT_SIZE*2); // 3rd arg is number of bytes, uint16_t is 2 bytes
        
        BufferCtl.offset = BUFFER_OFFSET_NONE;
        
        if(ITCounter == (WR_BUFFER_SIZE/(PCM_OUT_SIZE*2))-1)
        {
          AUDIODataReady = 1;
          AUDIOBuffOffset = 0;
          codec2_encode(c2, &encoded[encodedCount], (short *)&WrBuffer);
          encodedCount += nbyte;
          ITCounter++;
        }
        else if(ITCounter == (WR_BUFFER_SIZE/(PCM_OUT_SIZE))-1)
        {
          AUDIODataReady = 2;
          AUDIOBuffOffset = WR_BUFFER_SIZE/2;
          codec2_encode(c2, &encoded[encodedCount], (short *)&WrBuffer[nsam]);
          encodedCount += nbyte;
          ITCounter = 0;
        }
        else
        {
          ITCounter++;
        }     
        
      }
      
      if(BufferCtl.offset == BUFFER_OFFSET_FULL)
      {
        /* PDM to PCM data convert */
        BSP_AUDIO_IN_PDMToPCM((uint16_t*)&InternalBuffer[INTERNAL_BUFF_SIZE/2], (uint16_t*)&RecBuf[0]);
        
        /* Copy PCM data in internal buffer */
        memcpy((uint16_t*)&WrBuffer[ITCounter * (PCM_OUT_SIZE)], RecBuf, PCM_OUT_SIZE*2);
        
        BufferCtl.offset = BUFFER_OFFSET_NONE;
        
        if(ITCounter == (WR_BUFFER_SIZE/(PCM_OUT_SIZE*2))-1)
        {
          AUDIODataReady = 1;
          AUDIOBuffOffset = 0;
          codec2_encode(c2, &encoded[encodedCount], (short *)&WrBuffer);
          encodedCount += nbyte;
          ITCounter++;
        }
        else if(ITCounter == (WR_BUFFER_SIZE/(PCM_OUT_SIZE))-1)
        {
          AUDIODataReady = 2;
          AUDIOBuffOffset = WR_BUFFER_SIZE/2;
          codec2_encode(c2, &encoded[encodedCount], (short *)(&WrBuffer[nsam]));
          encodedCount += nbyte;
          ITCounter = 0;
        }
        else
        {
          ITCounter++;
        } 
      }   
    }
  #endif

    
    /* Stop audio record */
    if (BSP_AUDIO_IN_Stop() != AUDIO_OK)
    {
      /* Record Error */
      Error_Handler();
    }
    

    
    /* Turn OFF LED3: record stopped */
    BSP_LED_Off(LED3);
    
  #ifndef LIVE
    // start transmission
    encodedCount = 0;
    while(encodedCount < encodedSize) {
      SX1278_transmit(&SX1278, &encoded[encodedCount], 2*nbyte, 1000);
      encodedCount += 2*nbyte;
    }
  #endif
    
    // start play
//    BSP_LED_On(LED6);
//    
//    rx_fifo = fifo_create(1280);
//    
//    /* Initialize audio IN at REC_FREQ */ 
//    BSP_AUDIO_OUT_Init(OUTPUT_DEVICE_AUTO, 70, DEFAULT_AUDIO_IN_FREQ);
//    
//    SpeakerStart(rx_fifo);
//    
//    encodedCount = 0;
//    while(encodedCount < encodedSize) {
//      if(fifo_free(rx_fifo) >= 320) {
//        codec2_decode(c2, buf, &encoded[encodedCount]);
//        encodedCount += nbyte;
//        fifo_write(rx_fifo, buf, 320);
//      }
//    }
//    
//    /* Stop Player before close Test */
//    if (BSP_AUDIO_OUT_Stop(CODEC_PDWN_SW) != AUDIO_OK)
//    {
//      /* Audio Stop error */
//      Error_Handler();
//    }
//    
//    fifo_destroy(rx_fifo);
//    
//    // stop play
//    BSP_LED_Off(LED6);
    


    
    UserPressButton = 0;
    // Turn on LED4: wait for instruction
    BSP_LED_On(LED4);
  }
#else
  if(UserPressButton) {
    
    UserPressButton = 0;
    
    int i = 0;

    int ret = 0;
//    unsigned char *bits = (unsigned char*)malloc(nbyte*sizeof(char));
//    short *buf = (short*)malloc(nsam*sizeof(short));
    unsigned char encoded[2*nbyte];
    short buf[640];
    char msg[30];
    int msglen = 0;
//    unsigned char encoded[encodedSize];
    rx_fifo = fifo_create(1280);

    while(!UserPressButton) {
      
    }
    UserPressButton = 0;
    
    BSP_LED_Off(LED4);
    
    // start receive
    BSP_LED_On(LED6);
    
    /* Initialize audio IN at REC_FREQ */ 
    BSP_AUDIO_OUT_Init(OUTPUT_DEVICE_AUTO, 70, DEFAULT_AUDIO_IN_FREQ);
    
    SpeakerStart(rx_fifo);
    
    SX1278_LoRaEntryRx(&SX1278, 2*nbyte, 1000);
    
    
    #ifdef LIVE
    int encodedSize = 1050;
    volatile int encodedCount = 0;
    while(!UserPressButton) {
      
      if(encodedCount >= encodedSize) {
        break;
      }
      
      ret = SX1278_LoRaRxPacket(&SX1278);
      if(ret > 0) {

        SX1278_read(&SX1278, encoded, 2*nbyte);
        encodedCount += 2*nbyte;
        codec2_decode(c2, buf, encoded);
        codec2_decode(c2, &buf[320], &encoded[nbyte]);
        while(fifo_write(rx_fifo, buf, 640));

        i += ret;
        msglen = sprintf(msg, "rec count %d\n", i);
        HAL_UART_Transmit(&huart1, (uint8_t *)msg, msglen, 100);
      }
    }
    
    #else
//    unsigned char encoded[2*nbyte];
    unsigned char encoded[encodedSize];
    short buf[640];
    volatile int encodedCount = 0;
    while(!UserPressButton) {
      
      if(encodedCount >= encodedSize) {
        break;
      }
      
      ret = SX1278_LoRaRxPacket(&SX1278);
      if(ret > 0) {

//        SX1278_read(&SX1278, &encoded[encodedCount], 2*nbyte);
//        SX1278_read(&SX1278, bits, nbyte);
        SX1278_read(&SX1278, encoded, 2*nbyte);
        encodedCount += ret;
        codec2_decode(c2, buf, encoded);
        codec2_decode(c2, &buf[320], &encoded[nbyte]);
        while(fifo_write(rx_fifo, buf, 640));
//        
        i += ret;
        msglen = sprintf(msg, "rec count %d\n", i);
        HAL_UART_Transmit(&huart1, (uint8_t *)msg, msglen, 100);
      }
    }
    
    // first store, then decode
//    encodedCount = 0;
//    while(encodedCount < encodedSize) {
//      if(fifo_free(rx_fifo) >= 640) {
//        codec2_decode(c2, buf, &encoded[encodedCount]);
//        encodedCount += nbyte;
//        codec2_decode(c2, &buf[320], &encoded[encodedCount]);
//        encodedCount += nbyte;
//        fifo_write(rx_fifo, buf, 640);
//      }
//    }
    #endif
    
    fifo_destroy(rx_fifo);
    
    UserPressButton = 0;
    // stop receive
    BSP_LED_Off(LED6);
    
      
    /* Stop Player before close Test */
    if (BSP_AUDIO_OUT_Stop(CODEC_PDWN_SW) != AUDIO_OK)
    {
      /* Audio Stop error */
      Error_Handler();
    }
//    BSP_LED_Off(LED6);
    BSP_LED_On(LED4);
  }
#endif
}


  
//  free(buf);
//  free(bits);
  codec2_destroy(c2);
  /********** codec 2 **********/


  
}

/**
  * @brief  Calculates the remaining file size and new position of the pointer.
  * @param  None
  * @retval None
  */
void BSP_AUDIO_IN_TransferComplete_CallBack(void)
{ 
  BufferCtl.offset = BUFFER_OFFSET_FULL;
}

/**
  * @brief  Manages the DMA Half Transfer complete interrupt.
  * @param  None
  * @retval None
  */
void BSP_AUDIO_IN_HalfTransfer_CallBack(void)
{
  BufferCtl.offset = BUFFER_OFFSET_HALF;
}

/**
  * @brief  Audio IN Error callback function
  * @param  pData
  * @retval None
  */
void BSP_AUDIO_IN_Error_Callback(void)
{
  /* Stop the program with an infinite loop */
  Error_Handler();
}


/**
  * @}
  */ 

/**
  * @}
  */ 

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
