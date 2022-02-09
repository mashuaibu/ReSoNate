################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/SW4STM32/startup_stm32f411xe.s 

C_SRCS += \
C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/SW4STM32/syscalls.c 

OBJS += \
./Example/SW4STM32/startup_stm32f411xe.o \
./Example/SW4STM32/syscalls.o 

S_DEPS += \
./Example/SW4STM32/startup_stm32f411xe.d 

C_DEPS += \
./Example/SW4STM32/syscalls.d 


# Each subdirectory must supply rules for building sources it contributes
Example/SW4STM32/startup_stm32f411xe.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/SW4STM32/startup_stm32f411xe.s Example/SW4STM32/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -x assembler-with-cpp -MMD -MP -MF"Example/SW4STM32/startup_stm32f411xe.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Example/SW4STM32/syscalls.o: C:/Users/Yandi\ Liu/STM32Cube/Example/BSP/SW4STM32/syscalls.c Example/SW4STM32/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DUSE_STM32F411E_DISCO -c -I../../../Inc -I../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../Drivers/BSP/STM32F411E-Discovery -I../../../Drivers/CMSIS/Include -Os -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Example/SW4STM32/syscalls.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Example-2f-SW4STM32

clean-Example-2f-SW4STM32:
	-$(RM) ./Example/SW4STM32/startup_stm32f411xe.d ./Example/SW4STM32/startup_stm32f411xe.o ./Example/SW4STM32/syscalls.d ./Example/SW4STM32/syscalls.o

.PHONY: clean-Example-2f-SW4STM32

