/* system.h
 *
 * Machine generated for a CPU named "cpu_1" as defined in:
 * C:\DE2\NiosIItwoProcessor\software\TwoProc2_syslib\..\..\TwoProc.ptf
 *
 * Generated: 2006-10-10 15:43:33.109
 *
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/*

DO NOT MODIFY THIS FILE

   Changing this file will have subtle consequences
   which will almost certainly lead to a nonfunctioning
   system. If you do modify this file, be aware that your
   changes will be overwritten and lost when this file
   is generated again.

DO NOT MODIFY THIS FILE

*/

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2003 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
*                                                                             *
******************************************************************************/

/*
 * system configuration
 *
 */

#define ALT_SYSTEM_NAME "TwoProc"
#define ALT_CPU_NAME "cpu_1"
#define ALT_CPU_ARCHITECTURE "altera_nios2"
#define ALT_DEVICE_FAMILY "CYCLONEII"
#define ALT_STDIN "/dev/null"
#define ALT_STDIN_TYPE ""
#define ALT_STDIN_BASE UNDEFINED VARIABLE %BASE_ADDRESS%
#define ALT_STDOUT "/dev/null"
#define ALT_STDOUT_TYPE ""
#define ALT_STDOUT_BASE UNDEFINED VARIABLE %BASE_ADDRESS%
#define ALT_STDERR "/dev/null"
#define ALT_STDERR_TYPE ""
#define ALT_STDERR_BASE UNDEFINED VARIABLE %BASE_ADDRESS%
#define ALT_CPU_FREQ 50000000
#define ALT_IRQ_BASE NULL

/*
 * processor configuration
 *
 */

#define NIOS2_CPU_IMPLEMENTATION "small"
#define NIOS2_BIG_ENDIAN 0

#define NIOS2_ICACHE_SIZE 1024
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_FLUSHDA_SUPPORTED

#define NIOS2_EXCEPTION_ADDR 0x00020020
#define NIOS2_RESET_ADDR 0x00020000
#define NIOS2_BREAK_ADDR 0x00000020

#define NIOS2_HAS_DEBUG_STUB

#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 1

/*
 * A define for each class of peripheral
 *
 */

#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_TIMER
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_MUTEX

/*
 * onchip_memory_1 configuration
 *
 */

#define ONCHIP_MEMORY_1_NAME "/dev/onchip_memory_1"
#define ONCHIP_MEMORY_1_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY_1_BASE 0x00020000
#define ONCHIP_MEMORY_1_SPAN 16384
#define ONCHIP_MEMORY_1_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY_1_RAM_BLOCK_TYPE "M4K"
#define ONCHIP_MEMORY_1_INIT_CONTENTS_FILE "onchip_memory_1"
#define ONCHIP_MEMORY_1_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY_1_GUI_RAM_BLOCK_TYPE "Automatic"
#define ONCHIP_MEMORY_1_WRITEABLE 1
#define ONCHIP_MEMORY_1_DUAL_PORT 0
#define ONCHIP_MEMORY_1_SIZE_VALUE 16
#define ONCHIP_MEMORY_1_SIZE_MULTIPLE 1024
#define ONCHIP_MEMORY_1_CONTENTS_INFO "QUARTUS_PROJECT_DIR/onchip_memory_1.hex 1160495082 SIMDIR/onchip_memory_1.dat 1160495082"

/*
 * timer_1 configuration
 *
 */

#define TIMER_1_NAME "/dev/timer_1"
#define TIMER_1_TYPE "altera_avalon_timer"
#define TIMER_1_BASE 0x00000840
#define TIMER_1_SPAN 32
#define TIMER_1_IRQ 0
#define TIMER_1_ALWAYS_RUN 0
#define TIMER_1_FIXED_PERIOD 0
#define TIMER_1_SNAPSHOT 1
#define TIMER_1_PERIOD 1
#define TIMER_1_PERIOD_UNITS "ms"
#define TIMER_1_RESET_OUTPUT 0
#define TIMER_1_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_1_MULT 0.001
#define TIMER_1_FREQ 50000000

/*
 * out_1 configuration
 *
 */

#define OUT_1_NAME "/dev/out_1"
#define OUT_1_TYPE "altera_avalon_pio"
#define OUT_1_BASE 0x00000860
#define OUT_1_SPAN 16
#define OUT_1_DO_TEST_BENCH_WIRING 0
#define OUT_1_DRIVEN_SIM_VALUE 0x0000
#define OUT_1_HAS_TRI 0
#define OUT_1_HAS_OUT 1
#define OUT_1_HAS_IN 0
#define OUT_1_CAPTURE 0
#define OUT_1_EDGE_TYPE "NONE"
#define OUT_1_IRQ_TYPE "NONE"
#define OUT_1_FREQ 50000000

/*
 * in_1 configuration
 *
 */

#define IN_1_NAME "/dev/in_1"
#define IN_1_TYPE "altera_avalon_pio"
#define IN_1_BASE 0x00000870
#define IN_1_SPAN 16
#define IN_1_DO_TEST_BENCH_WIRING 0
#define IN_1_DRIVEN_SIM_VALUE 0x0000
#define IN_1_HAS_TRI 0
#define IN_1_HAS_OUT 0
#define IN_1_HAS_IN 1
#define IN_1_CAPTURE 0
#define IN_1_EDGE_TYPE "NONE"
#define IN_1_IRQ_TYPE "NONE"
#define IN_1_FREQ 50000000

/*
 * mutex_0 configuration
 *
 */

#define MUTEX_0_NAME "/dev/mutex_0"
#define MUTEX_0_TYPE "altera_avalon_mutex"
#define MUTEX_0_BASE 0x00000880
#define MUTEX_0_SPAN 8
#define MUTEX_0_VALUE_WIDTH 16
#define MUTEX_0_OWNER_WIDTH 16
#define MUTEX_0_VALUE_INIT 0
#define MUTEX_0_OWNER_INIT 0

/*
 * system library configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER_1
#define ALT_TIMESTAMP_CLK none

/*
 * Devices associated with code sections.
 *
 */

#define ALT_TEXT_DEVICE       ONCHIP_MEMORY_1
#define ALT_RODATA_DEVICE     ONCHIP_MEMORY_1
#define ALT_RWDATA_DEVICE     ONCHIP_MEMORY_1
#define ALT_EXCEPTIONS_DEVICE ONCHIP_MEMORY_1
#define ALT_RESET_DEVICE      ONCHIP_MEMORY_1

/*
 * The text section is initialised so no bootloader will be required.
 * Set a variable to tell crt0.S to provide code at the reset address and
 * to initialise rwdata if appropriate.
 */

#define ALT_NO_BOOTLOADER


#endif /* __SYSTEM_H_ */