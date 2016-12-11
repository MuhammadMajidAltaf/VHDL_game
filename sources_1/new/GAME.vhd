library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;

entity GAME is
	port(	CLK : in STD_LOGIC;
			RST : in STD_LOGIC;
			
			-- VGA signals
			RED_OUT : out STD_LOGIC_VECTOR(7 downto 0);
			GREEN_OUT : out STD_LOGIC_VECTOR(7 downto 2);
			BLUE_OUT : out STD_LOGIC_VECTOR(7 downto 4);
			DCLK : out STD_LOGIC;
			H_SYNC_O : out STD_LOGIC;
			V_SYNC_O : out STD_LOGIC;
			DISP : out STD_LOGIC;
			BL_EN : out STD_LOGIC);
end GAME;

architecture Behavioral of GAME is
	component VGA_CONTROLLER is
		port(	CLK : in STD_LOGIC;
				RST : in STD_LOGIC;
				
				-- control signals for the screen
				RED_OUT : out STD_LOGIC_VECTOR(7 downto 0);
				GREEN_OUT : out STD_LOGIC_VECTOR(7 downto 2);
				BLUE_OUT : out STD_LOGIC_VECTOR(7 downto 4);
				DCLK : out STD_LOGIC;
				H_SYNC_O : out STD_LOGIC;
				V_SYNC_O : out STD_LOGIC;
				DISP : out STD_LOGIC;
				BL_EN : out STD_LOGIC;
				
				-- signals used to change screen
				RED_IN : in STD_LOGIC_VECTOR(7 downto 0);
				GREEN_IN : in STD_LOGIC_VECTOR(7 downto 0);
				BLUE_IN : in STD_LOGIC_VECTOR(7 downto 0);
				X_POS_OUT : out STD_LOGIC_VECTOR(8 downto 0);
				Y_POS_OUT : out STD_LOGIC_VECTOR(8 downto 0));
	end component;
	
	component DRAW_BLOCK is
		port(	CLK : in STD_LOGIC;
				RST : in STD_LOGIC;
				-- current position to draw
				X_POS_CURRENT : in STD_LOGIC_VECTOR(8 downto 0);
				Y_POS_CURRENT : in STD_LOGIC_VECTOR(8 downto 0);
				
				-- coordinates of the block to needs to be drawn
				X_1 : in INTEGER;
				X_2 : in INTEGER;
				Y_1 : in INTEGER;
				Y_2 : in INTEGER;
				
				-- returns true if the block can be drawn; false otherwise
				DRAW : out BOOLEAN);
	end component;
	
	component dist_mem_gen_0 is
	  PORT (
	    a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	    spo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	  );
	end component;
	
	component ROM_counter IS
	  PORT (
	    CLK : IN STD_LOGIC;
	    CE : IN STD_LOGIC;
	    Q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	  );
	END component;
	
	signal X_POS : STD_LOGIC_VECTOR(8 downto 0);
	signal Y_POS : STD_LOGIC_VECTOR(8 downto 0);
	signal RED : STD_LOGIC_VECTOR(7 downto 0);
	signal GREEN : STD_LOGIC_VECTOR(7 downto 0);
	signal BLUE : STD_LOGIC_VECTOR(7 downto 0);
	
	-- block 1
	signal BLOCK1_X1 : INTEGER;
	signal BLOCK1_X2 : INTEGER;
	signal BLOCK1_Y1 : INTEGER;
	signal BLOCK1_Y2 : INTEGER;
	signal BLOCK1_DRAW : BOOLEAN;
	
	signal BLOCK2_DRAW : BOOLEAN;
	signal BLOCK3_DRAW : BOOLEAN;
	signal BLOCK4_DRAW : BOOLEAN;
	signal BLOCK5_DRAW : BOOLEAN;
	
	signal ROM_ADR : STD_LOGIC_VECTOR(4 downto 0);
	signal DCLK_ROM : STD_LOGIC;
	signal ROM_EN : STD_LOGIC;
	signal DISP_EN : STD_LOGIC;
	signal ROM_OUTPUT : STD_LOGIC_VECTOR(7 downto 0);
	
begin
vga_controller1: VGA_CONTROLLER port map(CLK => CLK, RST => RST, RED_IN => RED, GREEN_IN => GREEN, BLUE_IN => BLUE, X_POS_OUT => X_POS, Y_POS_OUT => Y_POS,
										RED_OUT => RED_OUT, GREEN_OUT => GREEN_OUT, BLUE_OUT => BLUE_OUT, DCLK => DCLK_ROM, H_SYNC_O => H_SYNC_O,
										V_SYNC_O => V_SYNC_O, DISP => DISP_EN, BL_EN => BL_EN);
DCLK <= DCLK_ROM;
DISP <= DISP_EN;
block1: DRAW_BLOCK port map(CLK => CLK, RST => RST, X_POS_CURRENT => X_POS, Y_POS_CURRENT => Y_POS, X_1 => BLOCK1_X1, X_2 => BLOCK1_X2,
										Y_1 => BLOCK1_Y1, Y_2 => BLOCK1_Y2, DRAW => BLOCK1_DRAW);
--block2: DRAW_BLOCK port map(CLK => CLK, RST => RST, X_POS_CURRENT => X_POS, Y_POS_CURRENT => Y_POS, X_1 => 250, X_2 => 400,
--										Y_1 => 0, Y_2 => 50, DRAW => BLOCK2_DRAW);
--block3: DRAW_BLOCK port map(CLK => CLK, RST => RST, X_POS_CURRENT => X_POS, Y_POS_CURRENT => Y_POS, X_1 => 100, X_2 => 150,
--										Y_1 => 200, Y_2 => 250, DRAW => BLOCK3_DRAW);
--block4: DRAW_BLOCK port map(CLK => CLK, RST => RST, X_POS_CURRENT => X_POS, Y_POS_CURRENT => Y_POS, X_1 => 0, X_2 => 25,
--										Y_1 => 0, Y_2 => 25, DRAW => BLOCK4_DRAW);
--block5: DRAW_BLOCK port map(CLK => CLK, RST => RST, X_POS_CURRENT => X_POS, Y_POS_CURRENT => Y_POS, X_1 => 454, X_2 => 478,
--										Y_1 => 246, Y_2 => 270, DRAW => BLOCK5_DRAW);
BLOCK1_X1 <= 100;
BLOCK1_X2 <= 200;
BLOCK1_Y1 <= 100;
BLOCK1_Y2 <= 200;

rom1: dist_mem_gen_0 port map(a => ROM_ADR, spo => ROM_OUTPUT);
rom_count: ROM_COUNTER port map(CLK => DCLK_ROM, CE => ROM_EN, Q => ROM_ADR);
RED <= "00000000";
BLUE <= "00000000";

process(CLK)
	begin -- 100..116
		if (DISP_EN = '1') and (X_POS >= "000000000") and (X_POS < "000001000") and (Y_POS >= "000000000") and (Y_POS < "000000100") then
			ROM_EN <= '1';
			GREEN <= ROM_OUTPUT;
		else
			ROM_EN <= '0';
			GREEN <= "00101010";
		end if;
end process;

process(CLK)
	begin
--		if BLOCK1_DRAW = true then
--			RED <=	"00000000";
--			GREEN <="00000000";
--			BLUE <=	"11111111";
----		elsif BLOCK2_DRAW = true then
----			RED <=	"00000000";
----			GREEN <="11111111";
----			BLUE <=	"11111111";
----		elsif BLOCK3_DRAW = true then
----			RED <=	"11111111";
----			GREEN <="00000000";
----			BLUE <=	"11111111";
----		elsif BLOCK4_DRAW = true then
----			RED <=	"11001111";
----			GREEN <="00110000";
----			BLUE <=	"11111111";
----		elsif BLOCK5_DRAW = true then
----			RED <=	"11110000";
----			GREEN <="11111111";
----			BLUE <=	"11111111";
--		else
--			RED <=	"11111111";
--			GREEN <="00000000";
--			BLUE <=	"00000000";
--		end if;
end process;


end Behavioral;
