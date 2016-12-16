library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity GAMESCREEN is
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
end GAMESCREEN;

architecture Behavioral of GAMESCREEN is
	component DRAW_BLOCK is
	port(	CLK : in STD_LOGIC;
			RST : in STD_LOGIC;
			X_POS_CURRENT : in STD_LOGIC_VECTOR(8 downto 0);
			Y_POS_CURRENT : in STD_LOGIC_VECTOR(8 downto 0);
			X_1 : in INTEGER;
			X_2 : in INTEGER;
			Y_1 : in INTEGER;
			Y_2 : in INTEGER;
			DRAW : out BOOLEAN);
	end component;
	
	-- used to display the text 'SCORE'
	component SCORE_TEXT is
		port(	a : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
				spo : OUT STD_LOGIC_VECTOR(23 DOWNTO 0));
	end component;
	component SCORE_TEXT_COUNTER is
		port(	CLK : IN STD_LOGIC;
				CE : IN STD_LOGIC;
				Q : OUT STD_LOGIC_VECTOR(10 DOWNTO 0));
	end component;
	
	-- used to display the current score
	component SCORE_NUMBERS is
		port(	a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				spo : OUT STD_LOGIC_VECTOR(239 DOWNTO 0));
	end component;
	component SCORE_NUMBERS_COUNTER is
		port(	CLK : IN STD_LOGIC;
				CE : IN STD_LOGIC;
				Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
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
	signal OUT_SCORE_TEXT : STD_LOGIC_VECTOR(23 downto 0);
	signal EN_SCORE_TEXT : STD_LOGIC;
	signal DRAW_SCORE_TEXT : BOOLEAN;
	
	-- signals for the score --TODO betere namen
	signal ADR_SCORE : STD_LOGIC_VECTOR(7 downto 0);
	signal OUT_SCORE : STD_LOGIC_VECTOR(239 downto 0);
	signal EN_SCORE : STD_LOGIC;
	signal DRAW_SCORE : BOOLEAN;
	
	-- signals for updating the score
	signal RED_SCORE1 : STD_LOGIC_VECTOR(7 downto 0);
	signal GREEN_SCORE1 : STD_LOGIC_VECTOR(7 downto 0);
	signal BLUE_SCORE1 : STD_LOGIC_VECTOR(7 downto 0);
	
begin
-- draws boundary lines on the screen
line1: DRAW_BLOCK port map(CLK => CLK, RST => RST, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 0, X_2 => 479,
								Y_1 => 0, Y_2 => 4, DRAW => FIELD_LINE1);
line2: DRAW_BLOCK port map(CLK => CLK, RST => RST, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 0, X_2 => 479,
								Y_1 => 67, Y_2 => 72, DRAW => FIELD_LINE2);
line3: DRAW_BLOCK port map(CLK => CLK, RST => RST, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 0, X_2 => 479,
								Y_1 => 135, Y_2 => 140, DRAW => FIELD_LINE3);
line4: DRAW_BLOCK port map(CLK => CLK, RST => RST, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 0, X_2 => 479,
								Y_1 => 203, Y_2 => 218, DRAW => FIELD_LINE4);

-- draws gamebuttons on the screen
button1: DRAW_BLOCK port map(CLK => CLK, RST => RST, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 0, X_2 => 51,
								Y_1 => 219, Y_2 => 271, DRAW => FIELD_BUTTON1);
button2: DRAW_BLOCK port map(CLK => CLK, RST => RST, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 81, X_2 => 133,
								Y_1 => 219, Y_2 => 271, DRAW => FIELD_BUTTON2);
button3: DRAW_BLOCK port map(CLK => CLK, RST => RST, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 163, X_2 => 215,
								Y_1 => 219, Y_2 => 271, DRAW => FIELD_BUTTON3);
button4: DRAW_BLOCK port map(CLK => CLK, RST => RST, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 245, X_2 => 297,
								Y_1 => 219, Y_2 => 271, DRAW => FIELD_BUTTON4);

-- writes 'SCORE' on the screen
score_text_draw: DRAW_BLOCK port map(CLK => CLK, RST => RST, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 399, X_2 => 470,
								Y_1 => 225, Y_2 => 242, DRAW => DRAW_SCORE_TEXT);
score_text_rom: SCORE_TEXT port map(a => ADR_SCORE_TEXT, spo => OUT_SCORE_TEXT);
score_text_count: SCORE_TEXT_COUNTER port map(CLK => DCLK, CE => EN_SCORE_TEXT, Q => ADR_SCORE_TEXT);

score_1_draw: DRAW_BLOCK port map(CLK => CLK, RST => RST, X_POS_CURRENT => XPOS, Y_POS_CURRENT => YPOS, X_1 => 459, X_2 => 470,
								Y_1 => 247, Y_2 => 266, DRAW => DRAW_SCORE);
score_rom: SCORE_NUMBERS port map(a => ADR_SCORE, spo => OUT_SCORE);
score_counter: SCORE_NUMBERS_COUNTER port map(CLK => DCLK, CE => EN_SCORE, Q => ADR_SCORE);

-- process that generates DRAW_BG signal for the top module
process(CLK)
	begin
	if (CLK'event and CLK = '1') then
		if (FIELD_LINE1 = true) or (FIELD_LINE2 = true) or (FIELD_LINE3 = true) or (FIELD_LINE4 = true) then
			RED_BG <=   "00000000";
			GREEN_BG <= "00000000";
			BLUE_BG <=  "00000000";
			DRAW_BG <= true;
		elsif FIELD_BUTTON1 = true then
			RED_BG <=   "11111111";
			GREEN_BG <= "00000000";
			BLUE_BG <=  "00000000";
			DRAW_BG <= true;
		elsif FIELD_BUTTON2 = true then
			RED_BG <=   "11111111";
			GREEN_BG <= "00000000";
			BLUE_BG <=  "11111111";
			DRAW_BG <= true;
		elsif FIELD_BUTTON3 = true then
			RED_BG <=   "00000000";
			GREEN_BG <= "11111111";
			BLUE_BG <=  "00000000";
			DRAW_BG <= true;
		elsif FIELD_BUTTON4 = true then
			RED_BG <=   "00000000";
			GREEN_BG <= "11111111";
			BLUE_BG <=  "11111111";
			DRAW_BG <= true;
		elsif DRAW_SCORE_TEXT = true then
			EN_SCORE_TEXT <= '1';
			RED_BG <=   OUT_SCORE_TEXT(23 downto 16);
			GREEN_BG <= OUT_SCORE_TEXT(15 downto 8);
			BLUE_BG <=  OUT_SCORE_TEXT(7 downto 0);
			DRAW_BG <= true;
		elsif DRAW_SCORE = true then
			EN_SCORE <= '1';
			RED_BG <=   RED_SCORE1;
			GREEN_BG <= GREEN_SCORE1;
			BLUE_BG <=  BLUE_SCORE1;
			DRAW_BG <= true;
		else
			EN_SCORE_TEXT <= '0';
			EN_SCORE <= '0';
			DRAW_BG <= false;
		end if;
	end if;
end process;

-- process to update the score
process(CLK)
	variable SCORE : INTEGER range 0 to 9;
	
	begin
	if (CLK'event and CLK = '1') then
		if SCORE_UP = '1' then
			if SCORE < 9 then
				SCORE := SCORE + 1;
			else
				SCORE := 0;
			end if;
		end if;
		
		if DRAW_SCORE = true then
			case SCORE is
				when 0 =>
					RED_SCORE1 <=   OUT_SCORE(239 downto 232);
					GREEN_SCORE1 <= OUT_SCORE(231 downto 224);
					BLUE_SCORE1 <=  OUT_SCORE(223 downto 216);
				when 1 =>
					RED_SCORE1 <=   OUT_SCORE(215 downto 208);
					GREEN_SCORE1 <= OUT_SCORE(207 downto 200);
					BLUE_SCORE1 <=  OUT_SCORE(199 downto 192);
				when 2 =>
					RED_SCORE1 <=   OUT_SCORE(191 downto 184);
					GREEN_SCORE1 <= OUT_SCORE(183 downto 176);
					BLUE_SCORE1 <=  OUT_SCORE(175 downto 168);
				when 3 =>
					RED_SCORE1 <=   OUT_SCORE(167 downto 160);
					GREEN_SCORE1 <= OUT_SCORE(159 downto 152);
					BLUE_SCORE1 <=  OUT_SCORE(151 downto 144);
				when 4 =>
					RED_SCORE1 <=   OUT_SCORE(143 downto 136);
					GREEN_SCORE1 <= OUT_SCORE(135 downto 128);
					BLUE_SCORE1 <=  OUT_SCORE(127 downto 120);
				when 5 =>
					RED_SCORE1 <=   OUT_SCORE(119 downto 112);
					GREEN_SCORE1 <= OUT_SCORE(111 downto 104);
					BLUE_SCORE1 <=  OUT_SCORE(103 downto 96);
				when 6 =>
					RED_SCORE1 <=   OUT_SCORE(95 downto 88);
					GREEN_SCORE1 <= OUT_SCORE(87 downto 80);
					BLUE_SCORE1 <=  OUT_SCORE(79 downto 72);
				when 7 =>
					RED_SCORE1 <=   OUT_SCORE(71 downto 64);
					GREEN_SCORE1 <= OUT_SCORE(63 downto 56);
					BLUE_SCORE1 <=  OUT_SCORE(55 downto 48);	
				when 8 =>
					RED_SCORE1 <=   OUT_SCORE(47 downto 40);
					GREEN_SCORE1 <= OUT_SCORE(39 downto 32);
					BLUE_SCORE1 <=  OUT_SCORE(31 downto 24);
				when 9 =>
					RED_SCORE1 <=   OUT_SCORE(23 downto 16);
					GREEN_SCORE1 <= OUT_SCORE(15 downto 8);
					BLUE_SCORE1 <=  OUT_SCORE(7 downto 0);
					
				when OTHERS =>
					RED_SCORE1 <=   OUT_SCORE(23 downto 16);
					GREEN_SCORE1 <= OUT_SCORE(15 downto 8);
					BLUE_SCORE1 <=  OUT_SCORE(7 downto 0);
			end case;
		end if;
	end if;
end process;


end Behavioral;

