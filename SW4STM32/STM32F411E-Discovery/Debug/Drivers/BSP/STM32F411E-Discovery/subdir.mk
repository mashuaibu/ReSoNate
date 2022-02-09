################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery.c \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_accelerometer.c \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_audio.c \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_gyroscope.c 

OBJS += \
./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery.o \
./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_accelerometer.o \
./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_audio.o \
./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_gyroscope.o 

C_DEPS += \
./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery.d \
./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_accelerometer.d \
./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_audio.d \
./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_gyroscope.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery.c Drivers/BSP/STM32F411E-Discovery/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DUSE_STM32F411E_DISCO -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F411E-Discovery -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_accelerometer.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_accelerometer.c Drivers/BSP/STM32F411E-Discovery/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DUSE_STM32F411E_DISCO -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F411E-Discovery -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_accelerometer.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_audio.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_audio.c Drivers/BSP/STM32F411E-Discovery/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DUSE_STM32F411E_DISCO -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F411E-Discovery -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_audio.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_gyroscope.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_gyroscope.c Drivers/BSP/STM32F411E-Discovery/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DUSE_STM32F411E_DISCO -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F411E-Discovery -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_gyroscope.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-STM32F411E-2d-Discovery

clean-Drivers-2f-BSP-2f-STM32F411E-2d-Discovery:
	-$(RM) ./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery.d ./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery.o ./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_accelerometer.d ./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_accelerometer.o ./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_audio.d ./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_audio.o ./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_gyroscope.d ./Drivers/BSP/STM32F411E-Discovery/stm32f411e_discovery_gyroscope.o

.PHONY: clean-Drivers-2f-BSP-2f-STM32F411E-2d-Discovery

