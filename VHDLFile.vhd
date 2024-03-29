

library ieee;
use ieee.std_logic_1164.all;


ENTITY basic_block IS
PORT (clk: IN std_logic; matching_char : IN std_logic_vector(7 downto 0); char_in: IN std_logic_vector (7 downto 0); c_in: IN std_logic; c_out: OUT std_logic);
END;

ARCHITECTURE behavior OF basic_block IS
SIGNAL state: std_logic;
SIGNAL matching: std_logic;
BEGIN
PROCESS (state, matching)
BEGIN
IF (matching ='1' AND state='1') THEN
c_out <= '1';
ELSE
c_out <= '0';
END IF;
END PROCESS;
PROCESS(clk, c_in)
BEGIN
IF (clk'EVENT AND clk='1') THEN
state <= c_in;
END IF;
END PROCESS;
PROCESS(char_in, matching_char)
BEGIN
IF (matching_char = char_in) THEN
matching <= '1';
ELSE
matching <= '0';
END IF;
END PROCESS;
END behavior;



library ieee;
use ieee.std_logic_1164.all;


ENTITY andBlock IS
PORT (i: IN std_logic; i1: IN std_logic; i2: IN std_logic; o: OUT std_logic; o1: OUT std_logic; o2: OUT std_logic);
END;

ARCHITECTURE structuralAnd OF andBlock IS
BEGIN

PROCESS(i, i1, i2)
BEGIN
o1 <= i;
o2 <= i1;
o <= i2;
END PROCESS;

END structuralAnd;


library ieee;
use ieee.std_logic_1164.all;

ENTITY orBlock IS
PORT (i: IN std_logic; i1: IN std_logic; i2: IN std_logic; o: OUT std_logic; o1: OUT std_logic; o2: OUT std_logic);
END;

ARCHITECTURE structuralOr OF orBlock IS
BEGIN

PROCESS(i, i1, i2)
BEGIN
o1 <= i;
o2 <= i;
o <= i1 OR i2;
END PROCESS;

END structuralOr;


library ieee;
use ieee.std_logic_1164.all;

ENTITY starBlock IS
PORT (i: IN std_logic; i1: IN std_logic; o: OUT std_logic; o1: OUT std_logic);
END;

ARCHITECTURE structuralStar OF starBlock IS
BEGIN

PROCESS(i, i1)
BEGIN
o1 <= i OR i1;
o <= i1 OR i;
END PROCESS;

END structuralStar;



library ieee;
use ieee.std_logic_1164.all;


ENTITY engine0 IS
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); o_subExp0: OUT std_logic; output: OUT std_logic);
END;

ARCHITECTURE structuralEngine OF engine0 IS

COMPONENT basic_block
PORT (clk: IN std_logic; matching_char : IN std_logic_vector(7 downto 0); char_in : IN std_logic_vector(7 downto 0); c_in: IN std_logic; c_out: OUT std_logic);
END COMPONENT;
COMPONENT andBlock
PORT (i: INOUT std_logic; i1: INOUT std_logic; i2: INOUT std_logic; o: INOUT std_logic; o1: INOUT std_logic; o2: INOUT std_logic);
END COMPONENT;
COMPONENT orBlock
PORT (i: INOUT std_logic; i1: INOUT std_logic; i2: INOUT std_logic; o: INOUT std_logic; o1: INOUT std_logic; o2: INOUT std_logic);
END COMPONENT;
COMPONENT starBlock
PORT (i: INOUT std_logic; i1: INOUT std_logic; o: INOUT std_logic; o1: INOUT std_logic);
END COMPONENT;

SIGNAL id0_i: std_logic;
SIGNAL id0_i1: std_logic;
SIGNAL id0_o: std_logic;
SIGNAL id0_o1: std_logic;

BEGIN
id0: basic_block PORT MAP (clock, "00000110", charIn, id0_i, id0_o);


PROCESS(id0_o)
BEGIN
id0_i <= '1';
output <= id0_o;
END PROCESS;

o_subExp0 <= id0_o;

END structuralEngine;


library ieee;
use ieee.std_logic_1164.all;


ENTITY engine1 IS
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); o_subExp0: OUT std_logic; output: OUT std_logic);
END;

ARCHITECTURE structuralEngine OF engine1 IS

COMPONENT basic_block
PORT (clk: IN std_logic; matching_char : IN std_logic_vector(7 downto 0); char_in : IN std_logic_vector(7 downto 0); c_in: IN std_logic; c_out: OUT std_logic);
END COMPONENT;
COMPONENT andBlock
PORT (i: INOUT std_logic; i1: INOUT std_logic; i2: INOUT std_logic; o: INOUT std_logic; o1: INOUT std_logic; o2: INOUT std_logic);
END COMPONENT;
COMPONENT orBlock
PORT (i: INOUT std_logic; i1: INOUT std_logic; i2: INOUT std_logic; o: INOUT std_logic; o1: INOUT std_logic; o2: INOUT std_logic);
END COMPONENT;
COMPONENT starBlock
PORT (i: INOUT std_logic; i1: INOUT std_logic; o: INOUT std_logic; o1: INOUT std_logic);
END COMPONENT;

SIGNAL id0_i: std_logic;
SIGNAL id0_i1: std_logic;
SIGNAL id0_o: std_logic;
SIGNAL id0_o1: std_logic;
SIGNAL id1_i: std_logic;
SIGNAL id1_i1: std_logic;
SIGNAL id1_o: std_logic;
SIGNAL id1_o1: std_logic;
SIGNAL id2_i: std_logic;
SIGNAL id2_i1: std_logic;
SIGNAL id2_i2: std_logic;
SIGNAL id2_o: std_logic;
SIGNAL id2_o1: std_logic;
SIGNAL id2_o2: std_logic;
SIGNAL id3_i: std_logic;
SIGNAL id3_i1: std_logic;
SIGNAL id3_o: std_logic;
SIGNAL id3_o1: std_logic;
SIGNAL id4_i: std_logic;
SIGNAL id4_i1: std_logic;
SIGNAL id4_i2: std_logic;
SIGNAL id4_o: std_logic;
SIGNAL id4_o1: std_logic;
SIGNAL id4_o2: std_logic;
SIGNAL id5_i: std_logic;
SIGNAL id5_i1: std_logic;
SIGNAL id5_o: std_logic;
SIGNAL id5_o1: std_logic;
SIGNAL id6_i: std_logic;
SIGNAL id6_i1: std_logic;
SIGNAL id6_i2: std_logic;
SIGNAL id6_o: std_logic;
SIGNAL id6_o1: std_logic;
SIGNAL id6_o2: std_logic;
SIGNAL id7_i: std_logic;
SIGNAL id7_i1: std_logic;
SIGNAL id7_o: std_logic;
SIGNAL id7_o1: std_logic;
SIGNAL id8_i: std_logic;
SIGNAL id8_i1: std_logic;
SIGNAL id8_i2: std_logic;
SIGNAL id8_o: std_logic;
SIGNAL id8_o1: std_logic;
SIGNAL id8_o2: std_logic;
SIGNAL id9_i: std_logic;
SIGNAL id9_i1: std_logic;
SIGNAL id9_o: std_logic;
SIGNAL id9_o1: std_logic;
SIGNAL id10_i: std_logic;
SIGNAL id10_i1: std_logic;
SIGNAL id10_i2: std_logic;
SIGNAL id10_o: std_logic;
SIGNAL id10_o1: std_logic;
SIGNAL id10_o2: std_logic;
SIGNAL id11_i: std_logic;
SIGNAL id11_i1: std_logic;
SIGNAL id11_o: std_logic;
SIGNAL id11_o1: std_logic;
SIGNAL id12_i: std_logic;
SIGNAL id12_i1: std_logic;
SIGNAL id12_i2: std_logic;
SIGNAL id12_o: std_logic;
SIGNAL id12_o1: std_logic;
SIGNAL id12_o2: std_logic;
SIGNAL id13_i: std_logic;
SIGNAL id13_i1: std_logic;
SIGNAL id13_o: std_logic;
SIGNAL id13_o1: std_logic;
SIGNAL id14_i: std_logic;
SIGNAL id14_i1: std_logic;
SIGNAL id14_i2: std_logic;
SIGNAL id14_o: std_logic;
SIGNAL id14_o1: std_logic;
SIGNAL id14_o2: std_logic;
SIGNAL id15_i: std_logic;
SIGNAL id15_i1: std_logic;
SIGNAL id15_o: std_logic;
SIGNAL id15_o1: std_logic;
SIGNAL id16_i: std_logic;
SIGNAL id16_i1: std_logic;
SIGNAL id16_i2: std_logic;
SIGNAL id16_o: std_logic;
SIGNAL id16_o1: std_logic;
SIGNAL id16_o2: std_logic;
SIGNAL id17_i: std_logic;
SIGNAL id17_i1: std_logic;
SIGNAL id17_o: std_logic;
SIGNAL id17_o1: std_logic;
SIGNAL id18_i: std_logic;
SIGNAL id18_i1: std_logic;
SIGNAL id18_i2: std_logic;
SIGNAL id18_o: std_logic;
SIGNAL id18_o1: std_logic;
SIGNAL id18_o2: std_logic;
SIGNAL id19_i: std_logic;
SIGNAL id19_i1: std_logic;
SIGNAL id19_o: std_logic;
SIGNAL id19_o1: std_logic;
SIGNAL id20_i: std_logic;
SIGNAL id20_i1: std_logic;
SIGNAL id20_i2: std_logic;
SIGNAL id20_o: std_logic;
SIGNAL id20_o1: std_logic;
SIGNAL id20_o2: std_logic;
SIGNAL id21_i: std_logic;
SIGNAL id21_i1: std_logic;
SIGNAL id21_o: std_logic;
SIGNAL id21_o1: std_logic;
SIGNAL id22_i: std_logic;
SIGNAL id22_i1: std_logic;
SIGNAL id22_i2: std_logic;
SIGNAL id22_o: std_logic;
SIGNAL id22_o1: std_logic;
SIGNAL id22_o2: std_logic;
SIGNAL id23_i: std_logic;
SIGNAL id23_i1: std_logic;
SIGNAL id23_o: std_logic;
SIGNAL id23_o1: std_logic;
SIGNAL id24_i: std_logic;
SIGNAL id24_i1: std_logic;
SIGNAL id24_i2: std_logic;
SIGNAL id24_o: std_logic;
SIGNAL id24_o1: std_logic;
SIGNAL id24_o2: std_logic;
SIGNAL id25_i: std_logic;
SIGNAL id25_i1: std_logic;
SIGNAL id25_o: std_logic;
SIGNAL id25_o1: std_logic;
SIGNAL id26_i: std_logic;
SIGNAL id26_i1: std_logic;
SIGNAL id26_i2: std_logic;
SIGNAL id26_o: std_logic;
SIGNAL id26_o1: std_logic;
SIGNAL id26_o2: std_logic;
SIGNAL id27_i: std_logic;
SIGNAL id27_i1: std_logic;
SIGNAL id27_o: std_logic;
SIGNAL id27_o1: std_logic;
SIGNAL id28_i: std_logic;
SIGNAL id28_i1: std_logic;
SIGNAL id28_i2: std_logic;
SIGNAL id28_o: std_logic;
SIGNAL id28_o1: std_logic;
SIGNAL id28_o2: std_logic;
SIGNAL id29_i: std_logic;
SIGNAL id29_i1: std_logic;
SIGNAL id29_o: std_logic;
SIGNAL id29_o1: std_logic;
SIGNAL id30_i: std_logic;
SIGNAL id30_i1: std_logic;
SIGNAL id30_i2: std_logic;
SIGNAL id30_o: std_logic;
SIGNAL id30_o1: std_logic;
SIGNAL id30_o2: std_logic;
SIGNAL id31_i: std_logic;
SIGNAL id31_i1: std_logic;
SIGNAL id31_o: std_logic;
SIGNAL id31_o1: std_logic;
SIGNAL id32_i: std_logic;
SIGNAL id32_i1: std_logic;
SIGNAL id32_i2: std_logic;
SIGNAL id32_o: std_logic;
SIGNAL id32_o1: std_logic;
SIGNAL id32_o2: std_logic;
SIGNAL id33_i: std_logic;
SIGNAL id33_i1: std_logic;
SIGNAL id33_o: std_logic;
SIGNAL id33_o1: std_logic;
SIGNAL id34_i: std_logic;
SIGNAL id34_i1: std_logic;
SIGNAL id34_i2: std_logic;
SIGNAL id34_o: std_logic;
SIGNAL id34_o1: std_logic;
SIGNAL id34_o2: std_logic;
SIGNAL id35_i: std_logic;
SIGNAL id35_i1: std_logic;
SIGNAL id35_o: std_logic;
SIGNAL id35_o1: std_logic;
SIGNAL id36_i: std_logic;
SIGNAL id36_i1: std_logic;
SIGNAL id36_i2: std_logic;
SIGNAL id36_o: std_logic;
SIGNAL id36_o1: std_logic;
SIGNAL id36_o2: std_logic;
SIGNAL id37_i: std_logic;
SIGNAL id37_i1: std_logic;
SIGNAL id37_o: std_logic;
SIGNAL id37_o1: std_logic;
SIGNAL id38_i: std_logic;
SIGNAL id38_i1: std_logic;
SIGNAL id38_i2: std_logic;
SIGNAL id38_o: std_logic;
SIGNAL id38_o1: std_logic;
SIGNAL id38_o2: std_logic;
SIGNAL id39_i: std_logic;
SIGNAL id39_i1: std_logic;
SIGNAL id39_o: std_logic;
SIGNAL id39_o1: std_logic;
SIGNAL id40_i: std_logic;
SIGNAL id40_i1: std_logic;
SIGNAL id40_i2: std_logic;
SIGNAL id40_o: std_logic;
SIGNAL id40_o1: std_logic;
SIGNAL id40_o2: std_logic;
SIGNAL id41_i: std_logic;
SIGNAL id41_i1: std_logic;
SIGNAL id41_o: std_logic;
SIGNAL id41_o1: std_logic;
SIGNAL id42_i: std_logic;
SIGNAL id42_i1: std_logic;
SIGNAL id42_i2: std_logic;
SIGNAL id42_o: std_logic;
SIGNAL id42_o1: std_logic;
SIGNAL id42_o2: std_logic;
SIGNAL id43_i: std_logic;
SIGNAL id43_i1: std_logic;
SIGNAL id43_o: std_logic;
SIGNAL id43_o1: std_logic;
SIGNAL id44_i: std_logic;
SIGNAL id44_i1: std_logic;
SIGNAL id44_i2: std_logic;
SIGNAL id44_o: std_logic;
SIGNAL id44_o1: std_logic;
SIGNAL id44_o2: std_logic;
SIGNAL id45_i: std_logic;
SIGNAL id45_i1: std_logic;
SIGNAL id45_o: std_logic;
SIGNAL id45_o1: std_logic;
SIGNAL id46_i: std_logic;
SIGNAL id46_i1: std_logic;
SIGNAL id46_i2: std_logic;
SIGNAL id46_o: std_logic;
SIGNAL id46_o1: std_logic;
SIGNAL id46_o2: std_logic;
SIGNAL id47_i: std_logic;
SIGNAL id47_i1: std_logic;
SIGNAL id47_o: std_logic;
SIGNAL id47_o1: std_logic;
SIGNAL id48_i: std_logic;
SIGNAL id48_i1: std_logic;
SIGNAL id48_i2: std_logic;
SIGNAL id48_o: std_logic;
SIGNAL id48_o1: std_logic;
SIGNAL id48_o2: std_logic;
SIGNAL id49_i: std_logic;
SIGNAL id49_i1: std_logic;
SIGNAL id49_o: std_logic;
SIGNAL id49_o1: std_logic;
SIGNAL id50_i: std_logic;
SIGNAL id50_i1: std_logic;
SIGNAL id50_i2: std_logic;
SIGNAL id50_o: std_logic;
SIGNAL id50_o1: std_logic;
SIGNAL id50_o2: std_logic;
SIGNAL id51_i: std_logic;
SIGNAL id51_i1: std_logic;
SIGNAL id51_o: std_logic;
SIGNAL id51_o1: std_logic;
SIGNAL id52_i: std_logic;
SIGNAL id52_i1: std_logic;
SIGNAL id52_i2: std_logic;
SIGNAL id52_o: std_logic;
SIGNAL id52_o1: std_logic;
SIGNAL id52_o2: std_logic;
SIGNAL id53_i: std_logic;
SIGNAL id53_i1: std_logic;
SIGNAL id53_o: std_logic;
SIGNAL id53_o1: std_logic;
SIGNAL id54_i: std_logic;
SIGNAL id54_i1: std_logic;
SIGNAL id54_i2: std_logic;
SIGNAL id54_o: std_logic;
SIGNAL id54_o1: std_logic;
SIGNAL id54_o2: std_logic;
SIGNAL id55_i: std_logic;
SIGNAL id55_i1: std_logic;
SIGNAL id55_o: std_logic;
SIGNAL id55_o1: std_logic;
SIGNAL id56_i: std_logic;
SIGNAL id56_i1: std_logic;
SIGNAL id56_i2: std_logic;
SIGNAL id56_o: std_logic;
SIGNAL id56_o1: std_logic;
SIGNAL id56_o2: std_logic;
SIGNAL id57_i: std_logic;
SIGNAL id57_i1: std_logic;
SIGNAL id57_o: std_logic;
SIGNAL id57_o1: std_logic;
SIGNAL id58_i: std_logic;
SIGNAL id58_i1: std_logic;
SIGNAL id58_i2: std_logic;
SIGNAL id58_o: std_logic;
SIGNAL id58_o1: std_logic;
SIGNAL id58_o2: std_logic;
SIGNAL id59_i: std_logic;
SIGNAL id59_i1: std_logic;
SIGNAL id59_o: std_logic;
SIGNAL id59_o1: std_logic;
SIGNAL id60_i: std_logic;
SIGNAL id60_i1: std_logic;
SIGNAL id60_i2: std_logic;
SIGNAL id60_o: std_logic;
SIGNAL id60_o1: std_logic;
SIGNAL id60_o2: std_logic;
SIGNAL id61_i: std_logic;
SIGNAL id61_i1: std_logic;
SIGNAL id61_o: std_logic;
SIGNAL id61_o1: std_logic;
SIGNAL id62_i: std_logic;
SIGNAL id62_i1: std_logic;
SIGNAL id62_i2: std_logic;
SIGNAL id62_o: std_logic;
SIGNAL id62_o1: std_logic;
SIGNAL id62_o2: std_logic;

BEGIN
id0: basic_block PORT MAP (clock, "01000011", charIn, id0_i, id0_o);

id1: basic_block PORT MAP (clock, "01000111", charIn, id1_i, id1_o);

id2: andBlock PORT MAP(id2_i, id2_i1, id2_i2, id2_o, id2_o1, id2_o2);



PROCESS(id1_o, id2_o2)
BEGIN
id2_i2 <= id1_o;
id1_i <= id2_o2;
END PROCESS;


PROCESS(id0_o, id2_o1)
BEGIN
id2_i1 <= id0_o;
id0_i <= id2_o1;
END PROCESS;
id3: basic_block PORT MAP (clock, "01000111", charIn, id3_i, id3_o);

id4: andBlock PORT MAP(id4_i, id4_i1, id4_i2, id4_o, id4_o1, id4_o2);



PROCESS(id3_o, id4_o2)
BEGIN
id4_i2 <= id3_o;
id3_i <= id4_o2;
END PROCESS;


PROCESS(id2_o, id4_o1)
BEGIN
id4_i1 <= id2_o;
id2_i <= id4_o1;
END PROCESS;
id5: basic_block PORT MAP (clock, "01000111", charIn, id5_i, id5_o);

id6: andBlock PORT MAP(id6_i, id6_i1, id6_i2, id6_o, id6_o1, id6_o2);



PROCESS(id5_o, id6_o2)
BEGIN
id6_i2 <= id5_o;
id5_i <= id6_o2;
END PROCESS;


PROCESS(id4_o, id6_o1)
BEGIN
id6_i1 <= id4_o;
id4_i <= id6_o1;
END PROCESS;
id7: basic_block PORT MAP (clock, "01000010", charIn, id7_i, id7_o);

id8: andBlock PORT MAP(id8_i, id8_i1, id8_i2, id8_o, id8_o1, id8_o2);



PROCESS(id7_o, id8_o2)
BEGIN
id8_i2 <= id7_o;
id7_i <= id8_o2;
END PROCESS;


PROCESS(id6_o, id8_o1)
BEGIN
id8_i1 <= id6_o;
id6_i <= id8_o1;
END PROCESS;
id9: basic_block PORT MAP (clock, "01100111", charIn, id9_i, id9_o);

id10: andBlock PORT MAP(id10_i, id10_i1, id10_i2, id10_o, id10_o1, id10_o2);



PROCESS(id9_o, id10_o2)
BEGIN
id10_i2 <= id9_o;
id9_i <= id10_o2;
END PROCESS;


PROCESS(id8_o, id10_o1)
BEGIN
id10_i1 <= id8_o;
id8_i <= id10_o1;
END PROCESS;
id11: basic_block PORT MAP (clock, "01000111", charIn, id11_i, id11_o);

id12: andBlock PORT MAP(id12_i, id12_i1, id12_i2, id12_o, id12_o1, id12_o2);



PROCESS(id11_o, id12_o2)
BEGIN
id12_i2 <= id11_o;
id11_i <= id12_o2;
END PROCESS;


PROCESS(id10_o, id12_o1)
BEGIN
id12_i1 <= id10_o;
id10_i <= id12_o1;
END PROCESS;
id13: basic_block PORT MAP (clock, "01000111", charIn, id13_i, id13_o);

id14: andBlock PORT MAP(id14_i, id14_i1, id14_i2, id14_o, id14_o1, id14_o2);



PROCESS(id13_o, id14_o2)
BEGIN
id14_i2 <= id13_o;
id13_i <= id14_o2;
END PROCESS;


PROCESS(id12_o, id14_o1)
BEGIN
id14_i1 <= id12_o;
id12_i <= id14_o1;
END PROCESS;
id15: basic_block PORT MAP (clock, "01000011", charIn, id15_i, id15_o);

id16: andBlock PORT MAP(id16_i, id16_i1, id16_i2, id16_o, id16_o1, id16_o2);



PROCESS(id15_o, id16_o2)
BEGIN
id16_i2 <= id15_o;
id15_i <= id16_o2;
END PROCESS;


PROCESS(id14_o, id16_o1)
BEGIN
id16_i1 <= id14_o;
id14_i <= id16_o1;
END PROCESS;
id17: basic_block PORT MAP (clock, "01000111", charIn, id17_i, id17_o);

id18: andBlock PORT MAP(id18_i, id18_i1, id18_i2, id18_o, id18_o1, id18_o2);



PROCESS(id17_o, id18_o2)
BEGIN
id18_i2 <= id17_o;
id17_i <= id18_o2;
END PROCESS;


PROCESS(id16_o, id18_o1)
BEGIN
id18_i1 <= id16_o;
id16_i <= id18_o1;
END PROCESS;
id19: basic_block PORT MAP (clock, "01000111", charIn, id19_i, id19_o);

id20: andBlock PORT MAP(id20_i, id20_i1, id20_i2, id20_o, id20_o1, id20_o2);



PROCESS(id19_o, id20_o2)
BEGIN
id20_i2 <= id19_o;
id19_i <= id20_o2;
END PROCESS;


PROCESS(id18_o, id20_o1)
BEGIN
id20_i1 <= id18_o;
id18_i <= id20_o1;
END PROCESS;
id21: basic_block PORT MAP (clock, "01000111", charIn, id21_i, id21_o);

id22: andBlock PORT MAP(id22_i, id22_i1, id22_i2, id22_o, id22_o1, id22_o2);



PROCESS(id21_o, id22_o2)
BEGIN
id22_i2 <= id21_o;
id21_i <= id22_o2;
END PROCESS;


PROCESS(id20_o, id22_o1)
BEGIN
id22_i1 <= id20_o;
id20_i <= id22_o1;
END PROCESS;
id23: basic_block PORT MAP (clock, "01001111", charIn, id23_i, id23_o);

id24: andBlock PORT MAP(id24_i, id24_i1, id24_i2, id24_o, id24_o1, id24_o2);



PROCESS(id23_o, id24_o2)
BEGIN
id24_i2 <= id23_o;
id23_i <= id24_o2;
END PROCESS;


PROCESS(id22_o, id24_o1)
BEGIN
id24_i1 <= id22_o;
id22_i <= id24_o1;
END PROCESS;
id25: basic_block PORT MAP (clock, "01100111", charIn, id25_i, id25_o);

id26: andBlock PORT MAP(id26_i, id26_i1, id26_i2, id26_o, id26_o1, id26_o2);



PROCESS(id25_o, id26_o2)
BEGIN
id26_i2 <= id25_o;
id25_i <= id26_o2;
END PROCESS;


PROCESS(id24_o, id26_o1)
BEGIN
id26_i1 <= id24_o;
id24_i <= id26_o1;
END PROCESS;
id27: basic_block PORT MAP (clock, "01000111", charIn, id27_i, id27_o);

id28: andBlock PORT MAP(id28_i, id28_i1, id28_i2, id28_o, id28_o1, id28_o2);



PROCESS(id27_o, id28_o2)
BEGIN
id28_i2 <= id27_o;
id27_i <= id28_o2;
END PROCESS;


PROCESS(id26_o, id28_o1)
BEGIN
id28_i1 <= id26_o;
id26_i <= id28_o1;
END PROCESS;
id29: basic_block PORT MAP (clock, "01000111", charIn, id29_i, id29_o);

id30: andBlock PORT MAP(id30_i, id30_i1, id30_i2, id30_o, id30_o1, id30_o2);



PROCESS(id29_o, id30_o2)
BEGIN
id30_i2 <= id29_o;
id29_i <= id30_o2;
END PROCESS;


PROCESS(id28_o, id30_o1)
BEGIN
id30_i1 <= id28_o;
id28_i <= id30_o1;
END PROCESS;
id31: basic_block PORT MAP (clock, "01000011", charIn, id31_i, id31_o);

id32: andBlock PORT MAP(id32_i, id32_i1, id32_i2, id32_o, id32_o1, id32_o2);



PROCESS(id31_o, id32_o2)
BEGIN
id32_i2 <= id31_o;
id31_i <= id32_o2;
END PROCESS;


PROCESS(id30_o, id32_o1)
BEGIN
id32_i1 <= id30_o;
id30_i <= id32_o1;
END PROCESS;
id33: basic_block PORT MAP (clock, "01000111", charIn, id33_i, id33_o);

id34: andBlock PORT MAP(id34_i, id34_i1, id34_i2, id34_o, id34_o1, id34_o2);



PROCESS(id33_o, id34_o2)
BEGIN
id34_i2 <= id33_o;
id33_i <= id34_o2;
END PROCESS;


PROCESS(id32_o, id34_o1)
BEGIN
id34_i1 <= id32_o;
id32_i <= id34_o1;
END PROCESS;
id35: basic_block PORT MAP (clock, "01000111", charIn, id35_i, id35_o);

id36: andBlock PORT MAP(id36_i, id36_i1, id36_i2, id36_o, id36_o1, id36_o2);



PROCESS(id35_o, id36_o2)
BEGIN
id36_i2 <= id35_o;
id35_i <= id36_o2;
END PROCESS;


PROCESS(id34_o, id36_o1)
BEGIN
id36_i1 <= id34_o;
id34_i <= id36_o1;
END PROCESS;
id37: basic_block PORT MAP (clock, "01000111", charIn, id37_i, id37_o);

id38: andBlock PORT MAP(id38_i, id38_i1, id38_i2, id38_o, id38_o1, id38_o2);



PROCESS(id37_o, id38_o2)
BEGIN
id38_i2 <= id37_o;
id37_i <= id38_o2;
END PROCESS;


PROCESS(id36_o, id38_o1)
BEGIN
id38_i1 <= id36_o;
id36_i <= id38_o1;
END PROCESS;
id39: basic_block PORT MAP (clock, "01000011", charIn, id39_i, id39_o);

id40: andBlock PORT MAP(id40_i, id40_i1, id40_i2, id40_o, id40_o1, id40_o2);



PROCESS(id39_o, id40_o2)
BEGIN
id40_i2 <= id39_o;
id39_i <= id40_o2;
END PROCESS;


PROCESS(id38_o, id40_o1)
BEGIN
id40_i1 <= id38_o;
id38_i <= id40_o1;
END PROCESS;
id41: basic_block PORT MAP (clock, "01100111", charIn, id41_i, id41_o);

id42: andBlock PORT MAP(id42_i, id42_i1, id42_i2, id42_o, id42_o1, id42_o2);



PROCESS(id41_o, id42_o2)
BEGIN
id42_i2 <= id41_o;
id41_i <= id42_o2;
END PROCESS;


PROCESS(id40_o, id42_o1)
BEGIN
id42_i1 <= id40_o;
id40_i <= id42_o1;
END PROCESS;
id43: basic_block PORT MAP (clock, "01000111", charIn, id43_i, id43_o);

id44: andBlock PORT MAP(id44_i, id44_i1, id44_i2, id44_o, id44_o1, id44_o2);



PROCESS(id43_o, id44_o2)
BEGIN
id44_i2 <= id43_o;
id43_i <= id44_o2;
END PROCESS;


PROCESS(id42_o, id44_o1)
BEGIN
id44_i1 <= id42_o;
id42_i <= id44_o1;
END PROCESS;
id45: basic_block PORT MAP (clock, "01000111", charIn, id45_i, id45_o);

id46: andBlock PORT MAP(id46_i, id46_i1, id46_i2, id46_o, id46_o1, id46_o2);



PROCESS(id45_o, id46_o2)
BEGIN
id46_i2 <= id45_o;
id45_i <= id46_o2;
END PROCESS;


PROCESS(id44_o, id46_o1)
BEGIN
id46_i1 <= id44_o;
id44_i <= id46_o1;
END PROCESS;
id47: basic_block PORT MAP (clock, "01000011", charIn, id47_i, id47_o);

id48: andBlock PORT MAP(id48_i, id48_i1, id48_i2, id48_o, id48_o1, id48_o2);



PROCESS(id47_o, id48_o2)
BEGIN
id48_i2 <= id47_o;
id47_i <= id48_o2;
END PROCESS;


PROCESS(id46_o, id48_o1)
BEGIN
id48_i1 <= id46_o;
id46_i <= id48_o1;
END PROCESS;
id49: basic_block PORT MAP (clock, "01000111", charIn, id49_i, id49_o);

id50: andBlock PORT MAP(id50_i, id50_i1, id50_i2, id50_o, id50_o1, id50_o2);



PROCESS(id49_o, id50_o2)
BEGIN
id50_i2 <= id49_o;
id49_i <= id50_o2;
END PROCESS;


PROCESS(id48_o, id50_o1)
BEGIN
id50_i1 <= id48_o;
id48_i <= id50_o1;
END PROCESS;
id51: basic_block PORT MAP (clock, "01000111", charIn, id51_i, id51_o);

id52: andBlock PORT MAP(id52_i, id52_i1, id52_i2, id52_o, id52_o1, id52_o2);



PROCESS(id51_o, id52_o2)
BEGIN
id52_i2 <= id51_o;
id51_i <= id52_o2;
END PROCESS;


PROCESS(id50_o, id52_o1)
BEGIN
id52_i1 <= id50_o;
id50_i <= id52_o1;
END PROCESS;
id53: basic_block PORT MAP (clock, "01000111", charIn, id53_i, id53_o);

id54: andBlock PORT MAP(id54_i, id54_i1, id54_i2, id54_o, id54_o1, id54_o2);



PROCESS(id53_o, id54_o2)
BEGIN
id54_i2 <= id53_o;
id53_i <= id54_o2;
END PROCESS;


PROCESS(id52_o, id54_o1)
BEGIN
id54_i1 <= id52_o;
id52_i <= id54_o1;
END PROCESS;
id55: basic_block PORT MAP (clock, "01001110", charIn, id55_i, id55_o);

id56: andBlock PORT MAP(id56_i, id56_i1, id56_i2, id56_o, id56_o1, id56_o2);



PROCESS(id55_o, id56_o2)
BEGIN
id56_i2 <= id55_o;
id55_i <= id56_o2;
END PROCESS;


PROCESS(id54_o, id56_o1)
BEGIN
id56_i1 <= id54_o;
id54_i <= id56_o1;
END PROCESS;
id57: basic_block PORT MAP (clock, "01100111", charIn, id57_i, id57_o);

id58: andBlock PORT MAP(id58_i, id58_i1, id58_i2, id58_o, id58_o1, id58_o2);



PROCESS(id57_o, id58_o2)
BEGIN
id58_i2 <= id57_o;
id57_i <= id58_o2;
END PROCESS;


PROCESS(id56_o, id58_o1)
BEGIN
id58_i1 <= id56_o;
id56_i <= id58_o1;
END PROCESS;
id59: basic_block PORT MAP (clock, "01000111", charIn, id59_i, id59_o);

id60: andBlock PORT MAP(id60_i, id60_i1, id60_i2, id60_o, id60_o1, id60_o2);



PROCESS(id59_o, id60_o2)
BEGIN
id60_i2 <= id59_o;
id59_i <= id60_o2;
END PROCESS;


PROCESS(id58_o, id60_o1)
BEGIN
id60_i1 <= id58_o;
id58_i <= id60_o1;
END PROCESS;
id61: basic_block PORT MAP (clock, "01000111", charIn, id61_i, id61_o);

id62: andBlock PORT MAP(id62_i, id62_i1, id62_i2, id62_o, id62_o1, id62_o2);



PROCESS(id61_o, id62_o2)
BEGIN
id62_i2 <= id61_o;
id61_i <= id62_o2;
END PROCESS;


PROCESS(id60_o, id62_o1)
BEGIN
id62_i1 <= id60_o;
id60_i <= id62_o1;
END PROCESS;

PROCESS(id62_o)
BEGIN
id62_i <= '1';
output <= id62_o;
END PROCESS;

o_subExp0 <= id62_o;

END structuralEngine;


library ieee;
use ieee.std_logic_1164.all;


ENTITY engine2 IS
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); i_subExpE0id0_o: IN std_logic; output: OUT std_logic);
END;

ARCHITECTURE structuralEngine OF engine2 IS

COMPONENT basic_block
PORT (clk: IN std_logic; matching_char : IN std_logic_vector(7 downto 0); char_in : IN std_logic_vector(7 downto 0); c_in: IN std_logic; c_out: OUT std_logic);
END COMPONENT;
COMPONENT andBlock
PORT (i: INOUT std_logic; i1: INOUT std_logic; i2: INOUT std_logic; o: INOUT std_logic; o1: INOUT std_logic; o2: INOUT std_logic);
END COMPONENT;
COMPONENT orBlock
PORT (i: INOUT std_logic; i1: INOUT std_logic; i2: INOUT std_logic; o: INOUT std_logic; o1: INOUT std_logic; o2: INOUT std_logic);
END COMPONENT;
COMPONENT starBlock
PORT (i: INOUT std_logic; i1: INOUT std_logic; o: INOUT std_logic; o1: INOUT std_logic);
END COMPONENT;


BEGIN

output <= i_subExpE0id0_o;


END structuralEngine;


library ieee;
use ieee.std_logic_1164.all;


ENTITY engine3 IS
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); i_subExpE1id62_o: IN std_logic; output: OUT std_logic);
END;

ARCHITECTURE structuralEngine OF engine3 IS

COMPONENT basic_block
PORT (clk: IN std_logic; matching_char : IN std_logic_vector(7 downto 0); char_in : IN std_logic_vector(7 downto 0); c_in: IN std_logic; c_out: OUT std_logic);
END COMPONENT;
COMPONENT andBlock
PORT (i: INOUT std_logic; i1: INOUT std_logic; i2: INOUT std_logic; o: INOUT std_logic; o1: INOUT std_logic; o2: INOUT std_logic);
END COMPONENT;
COMPONENT orBlock
PORT (i: INOUT std_logic; i1: INOUT std_logic; i2: INOUT std_logic; o: INOUT std_logic; o1: INOUT std_logic; o2: INOUT std_logic);
END COMPONENT;
COMPONENT starBlock
PORT (i: INOUT std_logic; i1: INOUT std_logic; o: INOUT std_logic; o1: INOUT std_logic);
END COMPONENT;


BEGIN

output <= i_subExpE1id62_o;


END structuralEngine;


library ieee;
use ieee.std_logic_1164.all;


ENTITY regExpMatching IS
PORT(clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); output1: OUT std_logic; output2: OUT std_logic);
END;

ARCHITECTURE structuralRegExpMatching OF regExpMatching IS
COMPONENT engine0
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); o_subExp0: OUT std_logic; output: OUT std_logic);
END COMPONENT;
COMPONENT engine1
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); o_subExp0: OUT std_logic; output: OUT std_logic);
END COMPONENT;
COMPONENT engine2
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); i_subExpE0id0_o: IN std_logic; output: OUT std_logic);
END COMPONENT;
COMPONENT engine3
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); i_subExpE1id62_o: IN std_logic; output: OUT std_logic);
END COMPONENT;
SIGNAL s0: std_logic;
SIGNAL subExpE0id0_o: std_logic;
SIGNAL s1: std_logic;
SIGNAL subExpE1id62_o: std_logic;
SIGNAL s2: std_logic;
SIGNAL s3: std_logic;

BEGIN
e0: engine0 PORT MAP(clock, charIn, subExpE0id0_o, s0);
e1: engine1 PORT MAP(clock, charIn, subExpE1id62_o, s1);
e2: engine2 PORT MAP(clock, charIn, subExpE0id0_o, s2);
e3: engine3 PORT MAP(clock, charIn, subExpE1id62_o, s3);

PROCESS(s0, s1, s2, s3)
BEGIN
output1 <= s0 OR s1;
output2 <= s2 OR s3;
END PROCESS;
END structuralRegExpMatching;
