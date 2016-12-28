library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
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
			BL_EN : out STD_LOGIC;
			GND : out STD_LOGIC;
			
			BTN1 : in STD_LOGIC;
			
		--	SDO : out STD_LOGIC;
			MISO : in STD_LOGIC;
			MOSI : out STD_LOGIC;
			BUSY : in STD_LOGIC;
			SCK : out STD_LOGIC;
			SSEL : out STD_LOGIC;
			
			LEDS : out STD_LOGIC_VECTOR(3 downto 0));
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
	
	component GAMESCREEN is
		port(	CLK : in STD_LOGIC;
				DCLK : in STD_LOGIC;
				RST : in STD_LOGIC;
				XPOS : in STD_LOGIC_VECTOR(8 downto 0);
				YPOS : in STD_LOGIC_VECTOR(8 downto 0);
				
				SCORE_UP : in STD_LOGIC;
				
				-- control signals for the top module (to know when to draw)
				DRAW_BG : out BOOLEAN;
				RED_BG : out STD_LOGIC_VECTOR(7 downto 0);
				GREEN_BG : out STD_LOGIC_VECTOR(7 downto 0);
				BLUE_BG : out STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	component GAME_CONTROLLER is
		port(	CLK : in STD_LOGIC;
	    		RST : in STD_LOGIC;
	    		X_POS : in STD_LOGIC_VECTOR(8 downto 0);
	    		Y_POS : in STD_LOGIC_VECTOR(8 downto 0);
	    		
	    		DRAW : out BOOLEAN;
	    		RED : out STD_LOGIC_VECTOR(7 downto 0);
	    		GREEN : out STD_LOGIC_VECTOR(7 downto 0);
	    		BLUE : out STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	-- TEMP -- proof of concept
	component SCORE_INCR_COUNTER IS
	  PORT (
	    CLK : IN STD_LOGIC;
	    THRESH0 : OUT STD_LOGIC;
	    Q : OUT STD_LOGIC_VECTOR(24 DOWNTO 0)
	  );
	END component;
	
	component TOUCH_TOP is
	    Port ( CLK : in STD_LOGIC;
	           CLR: in STD_LOGIC;
	           INTERRUPT_REQUEST : in STD_LOGIC;
	           SDO : out STD_LOGIC;
	           SDI : in STD_LOGIC;
	           DCLK : out STD_LOGIC;
	           BUSY : in STD_LOGIC;
	           CS : out STD_LOGIC;
	           X_POS : out STD_LOGIC_VECTOR(7 downto 0);
	           Y_POS : out STD_LOGIC_VECTOR(7 downto 0));
	           
	          -- LEDS: out STD_LOGIC_VECTOR(3 downto 0));
	end component;

	-- VGA control
	signal X_POS : STD_LOGIC_VECTOR(8 downto 0);
	signal Y_POS : STD_LOGIC_VECTOR(8 downto 0);
	signal RED : STD_LOGIC_VECTOR(7 downto 0);
	signal GREEN : STD_LOGIC_VECTOR(7 downto 0);
	signal BLUE : STD_LOGIC_VECTOR(7 downto 0);
	
	-- signals for the background
	signal DRAW_BG : BOOLEAN;
	signal RED_BG : STD_LOGIC_VECTOR(7 downto 0);
	signal GREEN_BG : STD_LOGIC_VECTOR(7 downto 0);
	signal BLUE_BG : STD_LOGIC_VECTOR(7 downto 0);
	
	-- signals for moving game blocks
	signal DRAW_BLOCK : BOOLEAN;
	signal RED_BLOCK : STD_LOGIC_VECTOR(7 downto 0);
	signal GREEN_BLOCK : STD_LOGIC_VECTOR(7 downto 0);
	signal BLUE_BLOCK : STD_LOGIC_VECTOR(7 downto 0);
	
	-- ROM's
	signal DCLK_ROM : STD_LOGIC; --TODO mss CLK buff bij gebruiken
	
	-- temp
	signal SCORE_INCR : STD_LOGIC;
	signal SW_SAMPLE : STD_LOGIC;
	
	-- tocuhscreen
	signal X_TOUCH : STD_LOGIC_VECTOR(7 downto 0);
	signal Y_TOUCH : STD_LOGIC_VECTOR(7 downto 0);
	
	signal TEST : INTEGER;
	
	signal BLOCK_COL : STD_LOGIC_VECTOR(23 downto 0);
	
	signal ROW1 : BOOLEAN;
	signal ROW2 : BOOLEAN;
	signal ROW3 : BOOLEAN;


begin
VGA: VGA_CONTROLLER port map(CLK => CLK, RST => RST, RED_IN => RED, GREEN_IN => GREEN, BLUE_IN => BLUE, X_POS_OUT => X_POS, Y_POS_OUT => Y_POS,
								RED_OUT => RED_OUT, GREEN_OUT => GREEN_OUT, BLUE_OUT => BLUE_OUT, DCLK => DCLK_ROM, H_SYNC_O => H_SYNC_O,
								V_SYNC_O => V_SYNC_O, DISP => DISP, BL_EN => BL_EN);
BACKGROUND: GAMESCREEN port map(CLK => CLK, DCLK => DCLK_ROM, RST => RST, XPOS => X_POS, YPOS => Y_POS, DRAW_BG => DRAW_BG, RED_BG => RED_BG,
								GREEN_BG => GREEN_BG, BLUE_BG => BLUE_BG, SCORE_UP => SCORE_INCR);
incr: SCORE_INCR_COUNTER port map(CLK => CLK, THRESH0 => SCORE_INCR);
GAME_CONTROL: GAME_CONTROLLER port map(CLK => CLK, RST => RST, X_POS => X_POS, Y_POS => Y_POS, DRAW => DRAW_BLOCK,
								RED => RED_BLOCK, GREEN => GREEN_BLOCK, BLUE => BLUE_BLOCK);
TOUCH_CONTROLLER: TOUCH_TOP port map(CLK => CLK, CLR => RST, INTERRUPT_REQUEST => '0', SDO => MOSI, SDI => MISO, DCLK => SCK, BUSY => BUSY,
								CS => SSEL,	X_POS => X_TOUCH, Y_POS => Y_TOUCH);

DCLK <= DCLK_ROM;
GND <= '0';



process(Y_POS)
	variable COUNT_RED : INTEGER RANGE 0 TO 100000;
	variable COUNT_PINK : INTEGER RANGE 0 TO 100000;
	variable COUNT_GREEN : INTEGER RANGE 0 TO 100000;
	variable COUNT_CYAN: INTEGER RANGE 0 TO 100000;
	
	begin
	if (CLK'event and CLK = '1') then
--		if Y_TOUCH < "00100100" then
		if X_TOUCH > "00100110" and X_TOUCH < "00101110" and Y_TOUCH < "00101010" then
			COUNT_RED  := 0;
			COUNT_PINK := COUNT_PINK + 1;
			COUNT_GREEN:= 0;
			COUNT_CYAN := 0;
		
			LEDS(3) <= '1';
		
			if COUNT_PINK = 100000 then
				BLOCK_COL(23 downto 16) <= "11111111";
				BLOCK_COL(15 downto 8) <=  "00000000";
				BLOCK_COL(7 downto 0) <=   "11111111";
			end if;
		elsif X_TOUCH > "01000101" and X_TOUCH < "01001111" and Y_TOUCH < "00100111" then
			COUNT_RED  := 0;
			COUNT_PINK := 0;
			COUNT_GREEN:= COUNT_GREEN + 1;
			COUNT_CYAN := 0;
		
			LEDS(2) <= '1';
			
			if COUNT_GREEN = 100000 then
				BLOCK_COL(23 downto 16) <= "00000000";
				BLOCK_COL(15 downto 8) <=  "11111111";
				BLOCK_COL(7 downto 0) <=   "00000000";
			end if;
		elsif X_TOUCH > "11000011" and X_TOUCH < "11001100" and Y_TOUCH < "00100100" then
			COUNT_RED  := 0;
			COUNT_PINK := 0;
			COUNT_GREEN:= 0;
			COUNT_CYAN := COUNT_CYAN + 1;
		
			LEDS(1) <= '1';
			
			if COUNT_CYAN = 100000 then
				BLOCK_COL(23 downto 16) <= "00000000";
				BLOCK_COL(15 downto 8) <=  "11111111";
				BLOCK_COL(7 downto 0) <=   "11111111";
			end if;
			
		elsif X_TOUCH > "11010000" and X_TOUCH < "11011000" and Y_TOUCH < "00100100" then
			COUNT_RED  := COUNT_RED + 1;
			COUNT_PINK := 0;
			COUNT_GREEN:= 0;
			COUNT_CYAN := 0;
			
			LEDS(0) <= '1';
		
			if COUNT_RED = 100000 then
				BLOCK_COL(23 downto 16) <= "11111111";
				BLOCK_COL(15 downto 8) <=  "00000000";
				BLOCK_COL(7 downto 0) <=   "00000000";
			end if;
		else
			LEDS <= "0000";
			COUNT_RED  := 0;
			COUNT_PINK := 0;
			COUNT_GREEN:= 0;
			COUNT_CYAN := 0;
		end if;
--	else
--		LEDS <= "0000";
--		COUNT_RED  := 0;
--		COUNT_PINK := 0;
--		COUNT_GREEN:= 0;
--		COUNT_CYAN := 0;
--		--RED <=   "XXXXXXXX";
--		--GREEN <= "XXXXXXXX";
--		--BLUE <=  "XXXXXXXX";		
	end if;
--	end if;
end process;


process(Y_POS)
	variable COUNT_ROW1 : INTEGER RANGE 0 TO 100000;
	variable COUNT_ROW2 : INTEGER RANGE 0 TO 100000;
	variable COUNT_ROW3 : INTEGER RANGE 0 TO 100000;
	
	begin
	if (CLK'event and CLK = '1') then
		--if X_TOUCH < "00011101" then
		if X_TOUCH > "11100000" then
			--if Y_TOUCH > "11011000" and Y_TOUCH < "11101000" then
			if Y_TOUCH > "11010110" and Y_TOUCH < "11100111" then
				COUNT_ROW1  := COUNT_ROW1 + 1;
				COUNT_ROW2  := 0;
				COUNT_ROW3  := 0;
				
--				LEDS(3) <= '1';
			
				if COUNT_ROW1 >= 100000 then
					ROW1 <= true;
					ROW2 <= false;
					ROW3 <= false;
				end if;
				
			--elsif Y_TOUCH > "11001000" and Y_TOUCH < "11010000" then
			elsif Y_TOUCH > "10110001" and Y_TOUCH < "10111111" then
				COUNT_ROW1  := 0;
				COUNT_ROW2  := COUNT_ROW2 + 1;
				COUNT_ROW3  := 0;
				
--				LEDS(2) <= '1';
			
				if COUNT_ROW2 >= 100000 then
					ROW1 <= false;
					ROW2 <= true;
					ROW3 <= false;
				end if;
				
			--elsif Y_TOUCH > "01001010" and Y_TOUCH < "10010001" then
			elsif Y_TOUCH > "00101100" and Y_TOUCH < "00111010" then
				COUNT_ROW1  := 0;
				COUNT_ROW2  := 0;
				COUNT_ROW3  := COUNT_ROW3 + 1;
				
--				LEDS(1) <= '1';
			
				if COUNT_ROW3 >= 100000 then
					ROW1 <= false;
					ROW2 <= false;
					ROW3 <= true;
				end if;	

			else
--				LEDS <= "0000";
				COUNT_ROW1  := 0;
				COUNT_ROW2  := 0;
				COUNT_ROW3  := 0;
			end if;
		else
--			LEDS <= "0000";
			COUNT_ROW1  := 0;
			COUNT_ROW2  := 0;
			COUNT_ROW3  := 0;	
		end if;
	end if;
end process;

process(CLK)
	begin
	if (CLK'event and CLK = '1') then
		if DRAW_BG = true then
			RED <=	 RED_BG;
			GREEN <= GREEN_BG;
			BLUE <=  BLUE_BG;
			
		--elsif X_POS < "000111101" and Y_POS < "011001011" and (ROW1 = true or ROW2 = true or ROW3 = true) then
		elsif X_POS > "110100100" and Y_POS < "011001011" and (ROW1 = true or ROW2 = true or ROW3 = true) then
			if ROW1 = true then
				if Y_POS > "000000100" and Y_POS < "001000011" then
					RED <=   BLOCK_COL(23 downto 16);
					GREEN <= BLOCK_COL(15 downto 8);
					BLUE <=  BLOCK_COL(7 downto 0);
				else
					RED <=   "00000000";
					GREEN <= "01000011";
					BLUE <=  "10101111";
				end if;
					
			elsif ROW2 = true then
				if Y_POS > "001001010" and Y_POS < "01000011" then
					RED <=   BLOCK_COL(23 downto 16);
					GREEN <= BLOCK_COL(15 downto 8);
					BLUE <=  BLOCK_COL(7 downto 0);
				else
					RED <=   "00000000";
					GREEN <= "01000011";
					BLUE <=  "10101111";
				end if;
				
			elsif ROW3 = true then
				if Y_POS > "010001101" and Y_POS < "011001011" then
					RED <=   BLOCK_COL(23 downto 16);
					GREEN <= BLOCK_COL(15 downto 8);
					BLUE <=  BLOCK_COL(7 downto 0);
				else
					RED <=   "00000000";
					GREEN <= "01000011";
					BLUE <=  "10101111";
				end if;
			else
				RED <=   "00000000";
				GREEN <= "01000011";
				BLUE <=  "10101111";			
			end if;
			
		else -- background color
			RED <=   "00000000"; -- 0
			GREEN <= "01000011"; -- 67
			BLUE <=  "10101111"; -- 175
		end if;
	end if;
end process;


--process(CLK)
--	begin
----	--	if (X_TOUCH > X_POS) and (TO_INTEGER(unsigned(X_TOUCH)) < TO_INTEGER(unsigned(X_POS)) + 20 ) then
--	if (X_TOUCH < "100000000") and (Y_TOUCH < "100000000") then
--		LEDS(0) <= '1';
--	else
--		LEDS(0) <= '0';
----		RED <=   "11111111";
----		GREEN <= "00000000";
----		BLUE <=  "00000000";
----	elsif (X_TOUCH > "100000000") and (Y_TOUCH < "100000000") then
----		RED <=   "00000000";
----		GREEN <= "11111111";
----		BLUE <=  "00000000";	
----	elsif (X_TOUCH < "100000000") and (Y_TOUCH > "100000000") then
----		RED <=   "00000000";
----		GREEN <= "00000000";
----		BLUE <=  "11111111";	
----	elsif (X_TOUCH < "100000000") and (Y_TOUCH > "100000000") then
----		RED <=   "00000000";
----		GREEN <= "00000000";
----		BLUE <=  "11111111";
----	elsif (X_TOUCH > "100000000") and (Y_TOUCH > "100000000") then
----		RED <=   "11111111";
----		GREEN <= "00000000";
----		BLUE <=  "11111111";		
----	else
----		RED <=   "00000000"; -- 0
----		GREEN <= "01000011"; -- 67
----		BLUE <=  "10101111"; -- 175
--	end if;
--end process;


end Behavioral;