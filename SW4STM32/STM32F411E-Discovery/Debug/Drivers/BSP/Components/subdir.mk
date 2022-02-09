################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/Components/cs43l22/cs43l22.c \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/Components/i3g4250d/i3g4250d.c \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/Components/l3gd20/l3gd20.c \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/Components/lsm303agr/lsm303agr.c \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/Components/lsm303dlhc/lsm303dlhc.c 

OBJS += \
./Drivers/BSP/Components/cs43l22.o \
./Drivers/BSP/Components/i3g4250d.o \
./Drivers/BSP/Components/l3gd20.o \
./Drivers/BSP/Components/lsm303agr.o \
./Drivers/BSP/Components/lsm303dlhc.o 

C_DEPS += \
./Drivers/BSP/Components/cs43l22.d \
./Drivers/BSP/Components/i3g4250d.d \
./Drivers/BSP/Components/l3gd20.d \
./Drivers/BSP/Components/lsm303agr.d \
./Drivers/BSP/Components/lsm303dlhc.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/cs43l22.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/Components/cs43l22/cs43l22.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DUSE_STM32F411E_DISCO -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F411E-Discovery -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/Components/cs43l22.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/Components/i3g4250d.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/Components/i3g4250d/i3g4250d.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DUSE_STM32F411E_DISCO -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F411E-Discovery -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/Components/i3g4250d.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/Components/l3gd20.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/Components/l3gd20/l3gd20.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DUSE_STM32F411E_DISCO -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F411E-Discovery -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/Components/l3gd20.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/Components/lsm303agr.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/Components/lsm303agr/lsm303agr.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DUSE_STM32F411E_DISCO -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F411E-Discovery -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/Components/lsm303agr.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/Components/lsm303dlhc.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/Drivers/BSP/Components/lsm303dlhc/lsm303dlhc.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DUSE_STM32F411E_DISCO -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F411E-Discovery -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/Components/lsm303dlhc.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components

clean-Drivers-2f-BSP-2f-Components:
	-$(RM) ./Drivers/BSP/Components/cs43l22.d ./Drivers/BSP/Components/cs43l22.o ./Drivers/BSP/Components/i3g4250d.d ./Drivers/BSP/Components/i3g4250d.o ./Drivers/BSP/Components/l3gd20.d ./Drivers/BSP/Components/l3gd20.o ./Drivers/BSP/Components/lsm303agr.d ./Drivers/BSP/Components/lsm303agr.o ./Drivers/BSP/Components/lsm303dlhc.d ./Drivers/BSP/Components/lsm303dlhc.o

.PHONY: clean-Drivers-2f-BSP-2f-Components

