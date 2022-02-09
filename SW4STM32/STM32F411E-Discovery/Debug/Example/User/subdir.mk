################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Src/audio_play.c \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Src/audio_record.c \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Src/main.c \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Src/mems.c \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Src/stm32f4xx_it.c 

OBJS += \
./Example/User/audio_play.o \
./Example/User/audio_record.o \
./Example/User/main.o \
./Example/User/mems.o \
./Example/User/stm32f4xx_it.o 

C_DEPS += \
./Example/User/audio_play.d \
./Example/User/audio_record.d \
./Example/User/main.d \
./Example/User/mems.d \
./Example/User/stm32f4xx_it.d 


# Each subdirectory must supply rules for building sources it contributes
Example/User/audio_play.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Src/audio_play.c Example/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DUSE_STM32F411E_DISCO -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F411E-Discovery -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Example/User/audio_play.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Example/User/audio_record.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Src/audio_record.c Example/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DUSE_STM32F411E_DISCO -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F411E-Discovery -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Example/User/audio_record.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Example/User/main.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Src/main.c Example/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DUSE_STM32F411E_DISCO -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F411E-Discovery -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Example/User/main.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Example/User/mems.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Src/mems.c Example/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DUSE_STM32F411E_DISCO -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F411E-Discovery -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Example/User/mems.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Example/User/stm32f4xx_it.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Src/stm32f4xx_it.c Example/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DUSE_STM32F411E_DISCO -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F411E-Discovery -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Example/User/stm32f4xx_it.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Example-2f-User

clean-Example-2f-User:
	-$(RM) ./Example/User/audio_play.d ./Example/User/audio_play.o ./Example/User/audio_record.d ./Example/User/audio_record.o ./Example/User/main.d ./Example/User/main.o ./Example/User/mems.d ./Example/User/mems.o ./Example/User/stm32f4xx_it.d ./Example/User/stm32f4xx_it.o

.PHONY: clean-Example-2f-User

