library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity that generates the background for the game
-- this includes the horizontal black lines, the 4 colored blocks at the bottom and the score
entity GAMESCREEN is
	port(	CLK : in STD_LOGIC;
			DCLK : in STD_LOGIC;
			RST : in STD_LOGIC;
			XPOS : in STD_LOGIC_VECTOR(8 downto 0);
			YPOS : in STD_LOGIC_VECTOR(8 downto 0);
			SCORE_UP : in STD_LOGIC;						-- increase the score
			DRAW_BG : out BOOLEAN;							-- draw the background pixels
			DATA_BG : out STD_LOGIC_VECTOR(23 downto 0);	-- color of the background pixels
			SCORE_1_OUT : out INTEGER range 0 to 9;			-- score xxx1
			SCORE_10_OUT : out INTEGER range 0 to 9;		-- score xx1x
			SCORE_100_OUT : out INTEGER range 0 to 9;		-- score x1xx
			SCORE_1000_OUT : out INTEGER range 0 to 9);		-- score 1xxx
end GAMESCREEN;

architecture Behavioral of GAMESCREEN is
	component DRAW_BLOCK is
		port(	CLK : in STD_LOGIC;
				X_POS_CURRENT : in STD_LOGIC_VECTOR(8 downto 0);
				Y_POS_CURRENT : in STD_LOGIC_VECTOR(8 downto 0);
				X_1 : in INTEGER range 0 to 479;	-- x of top left corner of the block
				X_2 : in INTEGER range 0 to 479;	-- x of bottom right corner of the block
				Y_1 : in INTEGER range 0 to 271;	-- y of top left corner of the block
				Y_2 : in INTEGER range 0 to 271;	-- y of the bottom right corner of the block
				DRAW : out BOOLEAN);				-- returns TRUE if the block can be drawn
	end component;
	
	-- component that stores the ROM with 'SCORE' text
	component SCORE_TEXT is
		port(	a : in STD_LOGIC_VECTOR(10 downto 0);
				spo : out STD_LOGIC_VECTOR(0 downto 0));
	end component;
	
	-- component that generates the address for the SCORE text ROM
	component SCORE_TEXT_COUNTER is
		port(	CLK : in STD_LOGIC;
				CE : in STD_LOGIC;
				SCLR : in STD_LOGIC;
				Q : out STD_LOGIC_VECTOR(10 downto 0));
	end component;
	
	-- component that stores the ROM with numbers 0..9 text
	component SCORE_NUMBERS is
		port(	a : in STD_LOGIC_VECTOR(7 downto 0);
				spo : out STD_LOGIC_VECTOR(9 downto 0));
	end component;
	
	-- component to generate the address for the SCORE ROM
	component SCORE_NUMBERS_COUNTER is
		port(	CLK : in STD_LOGIC;
				CE : in STD_LOGIC;
				SCLR : in STD_LOGIC;
				Q : out STD_LOGIC_VECTOR(7 downto 0));
	end component;
		
	-- signals for background lines and buttons
	signal FIELD_LINE1 : BOOLEAN;
	signal FIELD_LINE2 : BOOLEAN;
	signal FIELD_LINE3 : BOOLEAN;
	signal FIELD_LINE4 : BOOLEAN;
	signal FIELD_BUTTON1 : BOOLEAN;
	signal FIELD_BUTTON2 : BOOLEAN;
	signal FIELD_BUTTON3 : BOOLEAN;
	signal FIELD_BUTTON4 : BOOLEAN;
	
	-- signals for the 'SCORE' text
	signal ADR_SCORE_TEXT : STD_LOGIC_VECTOR(10 downto 0);
	signal OUT_SCORE_TEXT : STD_LOGIC_VECTOR(0 downto 0);
	signal EN_SCORE_TEXT : STD_LOGIC;
	signal DRAW_SCORE_TEXT : BOOLEAN;
	
	-- signals for the score
	signal ADR_SCORE : STD_LOGIC_VECTOR(7 downto 0);
	signal ADR_SCORE_1 : STD_LOGIC_VECTOR(7 downto 0);
	signal ADR_SCORE_10 : STD_LOGIC_VECTOR(7 downto 0);
	signal ADR_SCORE_100 : STD_LOGIC_VECTOR(7 downto 0);
	signal ADR_SCORE_1000 : STD_LOGIC_VECTOR(7 downto 0);
	signal OUT_SCORE : STD_LOGIC_VECTOR(9 downto 0);
	signal EN_SCORE_1 : STD_LOGIC;
	signal EN_SCORE_10 : STD_LOGIC;
	signal EN_SCORE_100 : STD_LOGIC;
	signal EN_SCORE_1000 : STD_LOGIC;
	signal DRAW_SCORE_1 : BOOLEAN;
	signal DRAW_SCORE_10 : BOOLEAN;
	signal DRAW_SCORE_100 : BOOLEAN;
	signal DRAW_SCORE_1000 : BOOLEAN;
	signal SCORE : INTEGER range 0 to 9;
	signal SCORE_1 : INTEGER range 0 to 9;
	signal SCORE_10 : INTEGER range 0 to 9;
	signal SCORE_100 : INTEGER range 0 to 9;
	signal SCORE_1000 : INTEGER range 0 to 9;

	-- signal used to convert ROM (1 and 0) to color (white and blue)
	signal DATA_1_bit : STD_LOGIC_VECTOR(0 downto 0);
	
	-- signal to display that a new highscore has been reached
	signal NEW_HIGH_SCORE : BOOLEAN;
	
begin
-- draws boundary lines on the screen
line1: DRAW_BLOCK port map(CLK => CLK, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 0, X_2 => 479,
								Y_1 => 0, Y_2 => 4, DRAW => FIELD_LINE1);
line2: DRAW_BLOCK port map(CLK => CLK, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 0, X_2 => 479,
								Y_1 => 67, Y_2 => 72, DRAW => FIELD_LINE2);
line3: DRAW_BLOCK port map(CLK => CLK, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 0, X_2 => 479,
								Y_1 => 135, Y_2 => 140, DRAW => FIELD_LINE3);
line4: DRAW_BLOCK port map(CLK => CLK, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 0, X_2 => 479,
								Y_1 => 203, Y_2 => 218, DRAW => FIELD_LINE4);

-- draws gamebuttons on the screen
button1: DRAW_BLOCK port map(CLK => CLK, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 327, X_2 => 379,
								Y_1 => 219, Y_2 => 271, DRAW => FIELD_BUTTON1);
button2: DRAW_BLOCK port map(CLK => CLK, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 81, X_2 => 133,
								Y_1 => 219, Y_2 => 271, DRAW => FIELD_BUTTON2);
button3: DRAW_BLOCK port map(CLK => CLK, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 163, X_2 => 215,
								Y_1 => 219, Y_2 => 271, DRAW => FIELD_BUTTON3);
button4: DRAW_BLOCK port map(CLK => CLK, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 245, X_2 => 297,
								Y_1 => 219, Y_2 => 271, DRAW => FIELD_BUTTON4);

-- writes 'SCORE' on the screen
score_text_draw: DRAW_BLOCK port map(CLK => CLK, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 399, X_2 => 470,
								Y_1 => 225, Y_2 => 242, DRAW => DRAW_SCORE_TEXT);
score_text_rom: SCORE_TEXT port map(a => ADR_SCORE_TEXT, spo => OUT_SCORE_TEXT);
score_text_count: SCORE_TEXT_COUNTER port map(CLK => CLK, CE => EN_SCORE_TEXT, SCLR => RST, Q => ADR_SCORE_TEXT);

-- writes the score on the screen
SCORE_ROM: SCORE_NUMBERS port map(a => ADR_SCORE, spo => OUT_SCORE);
score_count_1: SCORE_NUMBERS_COUNTER port map(CLK => CLK, CE => EN_SCORE_1, SCLR => RST, Q => ADR_SCORE_1);
score_count_10: SCORE_NUMBERS_COUNTER port map(CLK => CLK, CE => EN_SCORE_10, SCLR => RST, Q => ADR_SCORE_10);
score_count_100: SCORE_NUMBERS_COUNTER port map(CLK => CLK, CE => EN_SCORE_100, SCLR => RST, Q => ADR_SCORE_100);
score_count_1000: SCORE_NUMBERS_COUNTER port map(CLK => CLK, CE => EN_SCORE_1000, SCLR => RST, Q => ADR_SCORE_1000);
score_1_draw: DRAW_BLOCK port map(CLK => CLK, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 459, X_2 => 470,
								Y_1 => 247, Y_2 => 266, DRAW => DRAW_SCORE_1);
score_10_draw: DRAW_BLOCK port map(CLK => CLK, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 444, X_2 => 455,
								Y_1 => 247, Y_2 => 266, DRAW => DRAW_SCORE_10);
score_100_draw: DRAW_BLOCK port map(CLK => CLK, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 429, X_2 => 440,
								Y_1 => 247, Y_2 => 266, DRAW => DRAW_SCORE_100);
score_1000_draw: DRAW_BLOCK port map(CLK => CLK, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 414, X_2 => 425,
								Y_1 => 247, Y_2 => 266, DRAW => DRAW_SCORE_1000);

SCORE_1_OUT <= SCORE_1;
SCORE_10_OUT <= SCORE_10;
SCORE_100_OUT <= SCORE_100;
SCORE_1000_OUT <= SCORE_1000;

-- process that generates DRAW_BG signal for the top module
process(CLK)
	begin
	if (CLK'event and CLK = '1') then
		if (FIELD_LINE1 = true) or (FIELD_LINE2 = true) or (FIELD_LINE3 = true) or (FIELD_LINE4 = true) then
			DATA_BG <= X"000000";
			DRAW_BG <= true;
		elsif FIELD_BUTTON1 = true then
			DATA_BG <= X"FF0000";
			DRAW_BG <= true;
		elsif FIELD_BUTTON2 = true then
			DATA_BG <= X"FF00FF";
			DRAW_BG <= true;
		elsif FIELD_BUTTON3 = true then
			DATA_BG <= X"00FF00";
			DRAW_BG <= true;
		elsif FIELD_BUTTON4 = true then
			DATA_BG <= X"00FFFF";
			DRAW_BG <= true;	
		elsif (DRAW_SCORE_TEXT = true) or (DRAW_SCORE_1 = true) or (DRAW_SCORE_10 = true) or (DRAW_SCORE_100 = true) or (DRAW_SCORE_1000 = true) then
			if (DRAW_SCORE_TEXT = true) then
				EN_SCORE_TEXT <= DCLK;
				EN_SCORE_1 <= '0';
				EN_SCORE_10 <= '0';
				EN_SCORE_100 <= '0';
				EN_SCORE_1000 <= '0';
				
				DATA_1_bit <= OUT_SCORE_TEXT;
				
			elsif (DRAW_SCORE_1 = true) then
				SCORE <= SCORE_1;
				ADR_SCORE <= ADR_SCORE_1;
				
				EN_SCORE_TEXT <= '0';
				EN_SCORE_1 <= DCLK;
				EN_SCORE_10 <= '0';
				EN_SCORE_100 <= '0';
				EN_SCORE_1000 <= '0';
				
				DATA_1_bit <= OUT_SCORE(SCORE downto SCORE);
				
			elsif (DRAW_SCORE_10 = true) then
				SCORE <= SCORE_10;
				ADR_SCORE <= ADR_SCORE_10;
				
				EN_SCORE_TEXT <= '0';
				EN_SCORE_1 <= '0';
				EN_SCORE_10 <= DCLK;
				EN_SCORE_100 <= '0';
				EN_SCORE_1000 <= '0';
				
				DATA_1_bit <= OUT_SCORE(SCORE downto SCORE);
				
			elsif (DRAW_SCORE_100 = true) then
				SCORE <= SCORE_100;
				ADR_SCORE <= ADR_SCORE_100;
				
				EN_SCORE_TEXT <= '0';
				EN_SCORE_1 <= '0';
				EN_SCORE_10 <= '0';
				EN_SCORE_100 <= DCLK;
				EN_SCORE_1000 <= '0';
				
				DATA_1_bit <= OUT_SCORE(SCORE downto SCORE);
				
			elsif (DRAW_SCORE_1000 = true) then
				SCORE <= SCORE_1000;
				ADR_SCORE <= ADR_SCORE_1000;
				
				EN_SCORE_TEXT <= '0';
				EN_SCORE_1 <= '0';
				EN_SCORE_10 <= '0';
				EN_SCORE_100 <= '0';
				EN_SCORE_1000 <= DCLK;
				
				DATA_1_bit <= OUT_SCORE(SCORE downto SCORE);
				
			end if;
			
			-- convert ROM to real colors
			if DATA_1_BIT = "1" then
				if (DRAW_SCORE_TEXT = true) and (NEW_HIGH_SCORE = true) then	-- if a high score has been reached, SCORE will be red
					DATA_BG <= X"FF0000";
				else
					DATA_BG <= X"FFFFFF";
				end if;
			else
				DATA_BG <= X"0043AF";
			end if;
			
			DRAW_BG <= true;
		
		else
			EN_SCORE_TEXT <= '0';
			EN_SCORE_1 <= '0';
			EN_SCORE_10 <= '0';
			EN_SCORE_100 <= '0';
			EN_SCORE_1000 <= '0';
			DRAW_BG <= false;
		end if;
	end if;
end process;

-- process that adjust the score (range 0 .. 9999)
process(CLK)
	variable SCORE_VAR_1 : INTEGER range 0 to 9;
	variable SCORE_VAR_10 : INTEGER range 0 to 9;
	variable SCORE_VAR_100 : INTEGER range 0 to 9;
	variable SCORE_VAR_1000 : INTEGER range 0 to 9;
	
	begin
	if (CLK'event and CLK = '1') then
		if RST = '1' then
			SCORE_VAR_1 := 0;
			SCORE_VAR_10 := 0;
			SCORE_VAR_100 := 0;
			SCORE_VAR_1000 := 0;
		else
			if SCORE_UP = '1' then
				if SCORE_VAR_1 < 9 then
					SCORE_VAR_1 := SCORE_VAR_1 + 1;
				else
					SCORE_VAR_1 := 0;
					if SCORE_VAR_10 < 9 then
						SCORE_VAR_10 := SCORE_VAR_10 + 1;
					else
						SCORE_VAR_10 := 0;
						if SCORE_VAR_100 < 9 then
							SCORE_VAR_100 := SCORE_VAR_100 + 1;
						else
							SCORE_VAR_100 := 0;
							if SCORE_VAR_1000 < 9 then
								SCORE_VAR_1000 := SCORE_VAR_1000 + 1;
							else
								SCORE_VAR_1000 := 0;
							end if;
						end if;
					end if;				
				end if;
			end if;
		end if;
	end if;
	SCORE_1 <= SCORE_VAR_1;
	SCORE_10 <= SCORE_VAR_10;
	SCORE_100 <= SCORE_VAR_100;
	SCORE_1000 <= SCORE_VAR_1000;
end process;

-- process to check if a new high-score has been reached
process(CLK)
	variable HISCORE_1 : INTEGER range 0 to 9 := 0;
	variable HISCORE_10 : INTEGER range 0 to 9 := 0;
	variable HISCORE_100 : INTEGER range 0 to 9 := 0;
	variable HISCORE_1000 : INTEGER range 0 to 9 := 0;
	
	begin
	if (CLK'event and CLK = '1') then
		if RST = '1' then
			NEW_HIGH_SCORE <= false;
		else
			if (SCORE_1 + SCORE_10 * 10 + SCORE_100 * 100 + SCORE_1000 * 1000) > (HISCORE_1 + HISCORE_10 * 10 + HISCORE_100 * 100 + HISCORE_1000 * 1000) then
				NEW_HIGH_SCORE <= true;
				HISCORE_1 := SCORE_1;
				HISCORE_10 := SCORE_10;
				HISCORE_100 := SCORE_100;
				HISCORE_1000 := SCORE_1000;
			end if;
		end if;
	end if;
end process;
end Behavioral;

