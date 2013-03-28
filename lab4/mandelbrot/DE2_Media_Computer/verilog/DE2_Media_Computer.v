
module DE2_Media_Computer (
	// Inputs
	CLOCK_50,
	CLOCK_27,
	EXT_CLOCK,
	KEY,
	SW,

	//  Communication
	UART_RXD,
	
	// Audio
	AUD_ADCDAT,

/*****************************************************************************/
	// Bidirectionals
	GPIO_0,
	GPIO_1,

	// Memory (SRAM)
	SRAM_DQ,
	
	// Memory (SDRAM)
	DRAM_DQ,

	// PS2 Port
	PS2_CLK,
	PS2_DAT,
	
	// Audio
	AUD_BCLK,
	AUD_ADCLRCK,
	AUD_DACLRCK,
	
	// Char LCD 16x2
	LCD_DATA,

	// AV Config
	I2C_SDAT,
	
/*****************************************************************************/
	// Outputs
	TD_RESET,
	
	// 	Simple
	LEDG,
	LEDR,

	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6,
	HEX7,
	
	// 	Memory (SRAM)
	SRAM_ADDR,

	SRAM_CE_N,
	SRAM_WE_N,
	SRAM_OE_N,
	SRAM_UB_N,
	SRAM_LB_N,
	
	//  Communication
	UART_TXD,
	
	// Memory (SDRAM)
	DRAM_ADDR,
	
	DRAM_BA_1,
	DRAM_BA_0,
	DRAM_CAS_N,
	DRAM_RAS_N,
	DRAM_CLK,
	DRAM_CKE,
	DRAM_CS_N,
	DRAM_WE_N,
	DRAM_UDQM,
	DRAM_LDQM,
	
	// Audio
	AUD_XCK,
	AUD_DACDAT,
	
	// VGA
	VGA_CLK,
	VGA_HS,
	VGA_VS,
	VGA_BLANK,
	VGA_SYNC,
	VGA_R,
	VGA_G,
	VGA_B,

	// Char LCD 16x2
	LCD_ON,
	LCD_BLON,
	LCD_EN,
	LCD_RS,
	LCD_RW,
	
	// AV Config
	I2C_SCLK,
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input				CLOCK_50;
input				CLOCK_27;
input				EXT_CLOCK;
input		[3:0]	KEY;
input		[17:0]	SW;


//  Communication
input				UART_RXD;

//  Audio
input				AUD_ADCDAT;

// Bidirectionals
inout		[35:0]	GPIO_0;
inout		[35:0]	GPIO_1;

// 	Memory (SRAM)
inout		[15:0]	SRAM_DQ;

//  Memory (SDRAM)
inout		[15:0]	DRAM_DQ;

//  PS2 Port
inout				PS2_CLK;
inout				PS2_DAT;

//  Audio
inout				AUD_BCLK;
inout				AUD_ADCLRCK;
inout				AUD_DACLRCK;

//  AV Config
inout				I2C_SDAT;

//  Char LCD 16x2
inout		[ 7: 0]	LCD_DATA;

// Outputs
output				TD_RESET;

// 	Simple
output		[8:0]	LEDG;
output		[17:0]	LEDR;

output		[6:0]	HEX0;
output		[6:0]	HEX1;
output		[6:0]	HEX2;
output		[6:0]	HEX3;
output		[6:0]	HEX4;
output		[6:0]	HEX5;
output		[6:0]	HEX6;
output		[6:0]	HEX7;

// 	Memory (SRAM)
output		[17:0]	SRAM_ADDR;

output				SRAM_CE_N;
output				SRAM_WE_N;
output				SRAM_OE_N;
output				SRAM_UB_N;
output				SRAM_LB_N;

//  Communication
output				UART_TXD;

//  Memory (SDRAM)
output		[11:0]	DRAM_ADDR;

output				DRAM_BA_1;
output				DRAM_BA_0;
output				DRAM_CAS_N;
output				DRAM_RAS_N;
output				DRAM_CLK;
output				DRAM_CKE;
output				DRAM_CS_N;
output				DRAM_WE_N;
output				DRAM_UDQM;
output				DRAM_LDQM;

//  Audio
output				AUD_XCK;
output				AUD_DACDAT;

//  VGA
output				VGA_CLK;
output				VGA_HS;
output				VGA_VS;
output				VGA_BLANK;
output				VGA_SYNC;
output		[ 9: 0]	VGA_R;
output		[ 9: 0]	VGA_G;
output		[ 9: 0]	VGA_B;

//  Char LCD 16x2
output				LCD_ON;
output				LCD_BLON;
output				LCD_EN;
output				LCD_RS;
output				LCD_RW;

//  AV Config
output				I2C_SCLK;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires

// Internal Registers

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/
 reg[3:0] seconds_ones;
 reg[3:0] seconds_tens;
 reg[3:0] seconds_hundreds;
 reg[3:0] seconds_tenths;
 
 reg[26:0] counter_ones;

//TIMER RESET
//00 - Hold at Zero
//01 - Reset to Zero
//10 - Stop Incremeting and Hold
//11 - Actively Incrementing
 
//every 1 seconds
always@(posedge CLOCK_50 or negedge KEY[0] or negedge RESTART_TIMER[1])
begin
	if(!KEY[0] || RESTART_TIMER[1] == 0)
	begin
		seconds_tenths		<= 0;
		seconds_ones		<=	0;
		seconds_tens		<= 0;
		seconds_hundreds 	<= 0;
		counter_ones		<=	0;
	end
	else if (RESTART_TIMER[1] && RESTART_TIMER[0])
	begin
		if(counter_ones == 4999999 )
		begin
			seconds_tenths	<=	seconds_tenths+1;
		   counter_ones	<=	0;		
		end
		
		else
		    counter_ones	<=	counter_ones+1;	
		
		if (seconds_tenths == 10)
		begin
			seconds_tenths <= 0;
			seconds_ones <= seconds_ones+1;
		end
		
		if (seconds_ones == 10)
		begin
			seconds_ones <= 0;
			seconds_tens <= seconds_tens+1;
		end
		
		if (seconds_tens == 10)
		begin
			seconds_tens <=0;
			seconds_hundreds <= seconds_hundreds+1;
		end
		
	end
	else
	begin
		counter_ones <= counter_ones;
		seconds_tenths <= seconds_tenths;
		seconds_ones <= seconds_ones;
		seconds_tens <= seconds_tens;
		seconds_hundreds <= seconds_hundreds;
	end
end

HexDigit H0(HEX0, seconds_tenths);
HexDigit H1(HEX1, seconds_ones);
HexDigit H2(HEX2, seconds_tens);
HexDigit H3(HEX3, seconds_hundreds);


assign HEX4 = 7'h7F;
assign HEX5 = 7'h7F;
assign HEX6 = 7'h7F;
assign HEX7 = 7'h7F;


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign TD_RESET		= 1'b1;
assign GPIO_0[ 0]	= 1'bZ;
assign GPIO_0[ 2]	= 1'bZ;
assign GPIO_0[16]	= 1'bZ;
assign GPIO_0[18]	= 1'bZ;
assign GPIO_1[ 0]	= 1'bZ;
assign GPIO_1[ 2]	= 1'bZ;
assign GPIO_1[16]	= 1'bZ;
assign GPIO_1[18]	= 1'bZ;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


// This wire is used to connect the unmodi?ed clock signal c1 from the PLL to the
// NIOS II system
//wire pll_c1;

wire [1:0] RESTART_TIMER;


 nios_system NiosII (
	// 1) global signals:
	.audio_clk							(AUD_XCK),
	.clk									(CLOCK_50),
	.clk_27								(CLOCK_27),
	.reset_n								(SW[0]),
	.sdram_clk							(DRAM_CLK),
	.sys_clk								(),
	.vga_clk								(),
	
	

	// the_AV_Config
	.I2C_SCLK_from_the_AV_Config				(I2C_SCLK),
	.I2C_SDAT_to_and_from_the_AV_Config		(I2C_SDAT),

	// the_Green_LEDs
	.LEDG_from_the_Green_LEDs				(LEDG),
	
	// the_Pushbuttons
	.KEY_to_the_Pushbuttons					(KEY[3:0]),

	// the_Red_LEDs
	.LEDR_from_the_Red_LEDs					(LEDR),
	
	// the_SDRAM
	.zs_addr_from_the_SDRAM					(DRAM_ADDR),
	.zs_ba_from_the_SDRAM					({DRAM_BA_1, DRAM_BA_0}),
	.zs_cas_n_from_the_SDRAM				(DRAM_CAS_N),
	.zs_cke_from_the_SDRAM					(DRAM_CKE),
	.zs_cs_n_from_the_SDRAM					(DRAM_CS_N),
	.zs_dq_to_and_from_the_SDRAM			(DRAM_DQ),
	.zs_dqm_from_the_SDRAM					({DRAM_UDQM, DRAM_LDQM}),
	.zs_ras_n_from_the_SDRAM				(DRAM_RAS_N),
	.zs_we_n_from_the_SDRAM					(DRAM_WE_N),
	
	// the_SRAM
	.SRAM_DQ_to_and_from_the_SRAM			(SRAM_DQ),
	.SRAM_ADDR_from_the_SRAM				(SRAM_ADDR),
	.SRAM_LB_N_from_the_SRAM				(SRAM_LB_N),
	.SRAM_UB_N_from_the_SRAM				(SRAM_UB_N),
	.SRAM_CE_N_from_the_SRAM				(SRAM_CE_N),
	.SRAM_OE_N_from_the_SRAM				(SRAM_OE_N),
	.SRAM_WE_N_from_the_SRAM				(SRAM_WE_N),

	// the_Serial_port
	.UART_RXD_to_the_Serial_Port			(UART_RXD),
	.UART_TXD_from_the_Serial_Port		(UART_TXD),
	
	// the_Slider_switches
	.SW_to_the_Slider_Switches				(SW),

	// the_VGA_Controller
	.VGA_CLK_from_the_VGA_Controller			(VGA_CLK),
	.VGA_HS_from_the_VGA_Controller			(VGA_HS),
	.VGA_VS_from_the_VGA_Controller			(VGA_VS),
	.VGA_BLANK_from_the_VGA_Controller		(VGA_BLANK),
	.VGA_SYNC_from_the_VGA_Controller		(VGA_SYNC),
	.VGA_R_from_the_VGA_Controller			(VGA_R),
	.VGA_G_from_the_VGA_Controller			(VGA_G),
	.VGA_B_from_the_VGA_Controller			(VGA_B),
	
	// the_pio_0
   .out_port_from_the_pio_0						(RESTART_TIMER)
	
);
 
 // Instantiate the module sdram_pll (inclk0, c0, c1)
//sdram_pll neg_3ns (CLOCK_50, DRAM_CLK);
 
endmodule

//////////////////////////////////////////////
// Decode one hex digit for LED 7-seg display
module HexDigit(segs, num);
	input [3:0] num	;		//the hex digit to be displayed
	output [6:0] segs ;		//actual LED segments
	reg [6:0] segs ;
	always @ (num)
	begin
		case (num)
				4'h0: segs = 7'b1000000;
				4'h1: segs = 7'b1111001;
				4'h2: segs = 7'b0100100;
				4'h3: segs = 7'b0110000;
				4'h4: segs = 7'b0011001;
				4'h5: segs = 7'b0010010;
				4'h6: segs = 7'b0000010;
				4'h7: segs = 7'b1111000;
				4'h8: segs = 7'b0000000;
				4'h9: segs = 7'b0010000;
				default segs = 7'b1111111;
		endcase
	end
endmodule
///////////////////////////////////////////////


