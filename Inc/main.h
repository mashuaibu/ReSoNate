/**
  ******************************************************************************
  * @file    BSP/Inc/main.h 
  * @author  MCD Application Team
  * @brief   Header for main.c module
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

/* Includes ------------------------------------------------------------------*/

#include "stm32f411e_discovery.h"
#include "stm32f411e_discovery_audio.h"
#include "mems.h"
#include "audio_play.h"
#include "audio_record.h"
#include <stdio.h>

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/
// LoRa related pins
#define L3GD20_CS_Pin GPIO_PIN_3
#define L3GD20_CS_GPIO_Port GPIOE
#define LoRa_IRQ_Pin GPIO_PIN_2
#define LoRa_IRQ_GPIO_Port GPIOA
#define SPI1_SCK_Pin GPIO_PIN_5
#define SPI1_SCK_GPIO_Port GPIOA
#define SPI1_MISO_Pin GPIO_PIN_6
#define SPI1_MISO_GPIO_Port GPIOA
#define SPI1_MOSI_Pin GPIO_PIN_7
#define SPI1_MOSI_GPIO_Port GPIOA
#define LoRa_RESET_Pin GPIO_PIN_9
#define LoRa_RESET_GPIO_Port GPIOC
#define LoRa_CS_Pin GPIO_PIN_10
#define LoRa_CS_GPIO_Port GPIOA

/* Size of the recorder buffer (Multiple of 4096, RAM_BUFFER_SIZE used in BSP)*/
//#define WR_BUFFER_SIZE           0x7000
#define WR_BUFFER_SIZE           640
/* Defines for the Audio playing process */
#define PAUSE_STATUS     ((uint32_t)0x00) /* Audio Player in Pause Status */
#define RESUME_STATUS    ((uint32_t)0x01) /* Audio Player in Resume Status */
#define IDLE_STATUS      ((uint32_t)0x02) /* Audio Player in Idle Status */

/* Exported functions ------------------------------------------------------- */
void Toggle_Leds(void);
void Error_Handler(void);

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
