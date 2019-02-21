

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
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); output: OUT std_logic);
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
SIGNAL id4_o: std_logic;
SIGNAL id4_o1: std_logic;
SIGNAL id5_i: std_logic;
SIGNAL id5_i1: std_logic;
SIGNAL id5_i2: std_logic;
SIGNAL id5_o: std_logic;
SIGNAL id5_o1: std_logic;
SIGNAL id5_o2: std_logic;
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
SIGNAL id8_o: std_logic;
SIGNAL id8_o1: std_logic;
SIGNAL id9_i: std_logic;
SIGNAL id9_i1: std_logic;
SIGNAL id9_i2: std_logic;
SIGNAL id9_o: std_logic;
SIGNAL id9_o1: std_logic;
SIGNAL id9_o2: std_logic;
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
SIGNAL id12_o: std_logic;
SIGNAL id12_o1: std_logic;
SIGNAL id13_i: std_logic;
SIGNAL id13_i1: std_logic;
SIGNAL id13_i2: std_logic;
SIGNAL id13_o: std_logic;
SIGNAL id13_o1: std_logic;
SIGNAL id13_o2: std_logic;
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
SIGNAL id16_o: std_logic;
SIGNAL id16_o1: std_logic;
SIGNAL id17_i: std_logic;
SIGNAL id17_i1: std_logic;
SIGNAL id17_i2: std_logic;
SIGNAL id17_o: std_logic;
SIGNAL id17_o1: std_logic;
SIGNAL id17_o2: std_logic;
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
SIGNAL id20_o: std_logic;
SIGNAL id20_o1: std_logic;
SIGNAL id21_i: std_logic;
SIGNAL id21_i1: std_logic;
SIGNAL id21_i2: std_logic;
SIGNAL id21_o: std_logic;
SIGNAL id21_o1: std_logic;
SIGNAL id21_o2: std_logic;
SIGNAL id22_i: std_logic;
SIGNAL id22_i1: std_logic;
SIGNAL id22_o: std_logic;
SIGNAL id22_o1: std_logic;
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
SIGNAL id25_i2: std_logic;
SIGNAL id25_o: std_logic;
SIGNAL id25_o1: std_logic;
SIGNAL id25_o2: std_logic;
SIGNAL id26_i: std_logic;
SIGNAL id26_i1: std_logic;
SIGNAL id26_o: std_logic;
SIGNAL id26_o1: std_logic;
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
SIGNAL id29_i2: std_logic;
SIGNAL id29_o: std_logic;
SIGNAL id29_o1: std_logic;
SIGNAL id29_o2: std_logic;
SIGNAL id30_i: std_logic;
SIGNAL id30_i1: std_logic;
SIGNAL id30_o: std_logic;
SIGNAL id30_o1: std_logic;
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
SIGNAL id33_i2: std_logic;
SIGNAL id33_o: std_logic;
SIGNAL id33_o1: std_logic;
SIGNAL id33_o2: std_logic;
SIGNAL id34_i: std_logic;
SIGNAL id34_i1: std_logic;
SIGNAL id34_o: std_logic;
SIGNAL id34_o1: std_logic;
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
SIGNAL id37_i2: std_logic;
SIGNAL id37_o: std_logic;
SIGNAL id37_o1: std_logic;
SIGNAL id37_o2: std_logic;
SIGNAL id38_i: std_logic;
SIGNAL id38_i1: std_logic;
SIGNAL id38_o: std_logic;
SIGNAL id38_o1: std_logic;
SIGNAL id39_i: std_logic;
SIGNAL id39_i1: std_logic;
SIGNAL id39_i2: std_logic;
SIGNAL id39_o: std_logic;
SIGNAL id39_o1: std_logic;
SIGNAL id39_o2: std_logic;
SIGNAL id40_i: std_logic;
SIGNAL id40_i1: std_logic;
SIGNAL id40_o: std_logic;
SIGNAL id40_o1: std_logic;
SIGNAL id41_i: std_logic;
SIGNAL id41_i1: std_logic;
SIGNAL id41_i2: std_logic;
SIGNAL id41_o: std_logic;
SIGNAL id41_o1: std_logic;
SIGNAL id41_o2: std_logic;
SIGNAL id42_i: std_logic;
SIGNAL id42_i1: std_logic;
SIGNAL id42_o: std_logic;
SIGNAL id42_o1: std_logic;
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
SIGNAL id56_o: std_logic;
SIGNAL id56_o1: std_logic;
SIGNAL id57_i: std_logic;
SIGNAL id57_i1: std_logic;
SIGNAL id57_i2: std_logic;
SIGNAL id57_o: std_logic;
SIGNAL id57_o1: std_logic;
SIGNAL id57_o2: std_logic;
SIGNAL id58_i: std_logic;
SIGNAL id58_i1: std_logic;
SIGNAL id58_o: std_logic;
SIGNAL id58_o1: std_logic;
SIGNAL id59_i: std_logic;
SIGNAL id59_i1: std_logic;
SIGNAL id59_i2: std_logic;
SIGNAL id59_o: std_logic;
SIGNAL id59_o1: std_logic;
SIGNAL id59_o2: std_logic;
SIGNAL id60_i: std_logic;
SIGNAL id60_i1: std_logic;
SIGNAL id60_o: std_logic;
SIGNAL id60_o1: std_logic;
SIGNAL id61_i: std_logic;
SIGNAL id61_i1: std_logic;
SIGNAL id61_i2: std_logic;
SIGNAL id61_o: std_logic;
SIGNAL id61_o1: std_logic;
SIGNAL id61_o2: std_logic;
SIGNAL id62_i: std_logic;
SIGNAL id62_i1: std_logic;
SIGNAL id62_o: std_logic;
SIGNAL id62_o1: std_logic;
SIGNAL id63_i: std_logic;
SIGNAL id63_i1: std_logic;
SIGNAL id63_i2: std_logic;
SIGNAL id63_o: std_logic;
SIGNAL id63_o1: std_logic;
SIGNAL id63_o2: std_logic;
SIGNAL id64_i: std_logic;
SIGNAL id64_i1: std_logic;
SIGNAL id64_o: std_logic;
SIGNAL id64_o1: std_logic;
SIGNAL id65_i: std_logic;
SIGNAL id65_i1: std_logic;
SIGNAL id65_i2: std_logic;
SIGNAL id65_o: std_logic;
SIGNAL id65_o1: std_logic;
SIGNAL id65_o2: std_logic;
SIGNAL id66_i: std_logic;
SIGNAL id66_i1: std_logic;
SIGNAL id66_o: std_logic;
SIGNAL id66_o1: std_logic;
SIGNAL id67_i: std_logic;
SIGNAL id67_i1: std_logic;
SIGNAL id67_i2: std_logic;
SIGNAL id67_o: std_logic;
SIGNAL id67_o1: std_logic;
SIGNAL id67_o2: std_logic;
SIGNAL id68_i: std_logic;
SIGNAL id68_i1: std_logic;
SIGNAL id68_o: std_logic;
SIGNAL id68_o1: std_logic;
SIGNAL id69_i: std_logic;
SIGNAL id69_i1: std_logic;
SIGNAL id69_i2: std_logic;
SIGNAL id69_o: std_logic;
SIGNAL id69_o1: std_logic;
SIGNAL id69_o2: std_logic;
SIGNAL id70_i: std_logic;
SIGNAL id70_i1: std_logic;
SIGNAL id70_i2: std_logic;
SIGNAL id70_o: std_logic;
SIGNAL id70_o1: std_logic;
SIGNAL id70_o2: std_logic;
SIGNAL id71_i: std_logic;
SIGNAL id71_i1: std_logic;
SIGNAL id71_i2: std_logic;
SIGNAL id71_o: std_logic;
SIGNAL id71_o1: std_logic;
SIGNAL id71_o2: std_logic;
SIGNAL id72_i: std_logic;
SIGNAL id72_i1: std_logic;
SIGNAL id72_o: std_logic;
SIGNAL id72_o1: std_logic;
SIGNAL id73_i: std_logic;
SIGNAL id73_i1: std_logic;
SIGNAL id73_o: std_logic;
SIGNAL id73_o1: std_logic;
SIGNAL id74_i: std_logic;
SIGNAL id74_i1: std_logic;
SIGNAL id74_i2: std_logic;
SIGNAL id74_o: std_logic;
SIGNAL id74_o1: std_logic;
SIGNAL id74_o2: std_logic;
SIGNAL id75_i: std_logic;
SIGNAL id75_i1: std_logic;
SIGNAL id75_o: std_logic;
SIGNAL id75_o1: std_logic;
SIGNAL id76_i: std_logic;
SIGNAL id76_i1: std_logic;
SIGNAL id76_i2: std_logic;
SIGNAL id76_o: std_logic;
SIGNAL id76_o1: std_logic;
SIGNAL id76_o2: std_logic;
SIGNAL id77_i: std_logic;
SIGNAL id77_i1: std_logic;
SIGNAL id77_o: std_logic;
SIGNAL id77_o1: std_logic;
SIGNAL id78_i: std_logic;
SIGNAL id78_i1: std_logic;
SIGNAL id78_i2: std_logic;
SIGNAL id78_o: std_logic;
SIGNAL id78_o1: std_logic;
SIGNAL id78_o2: std_logic;
SIGNAL id79_i: std_logic;
SIGNAL id79_i1: std_logic;
SIGNAL id79_i2: std_logic;
SIGNAL id79_o: std_logic;
SIGNAL id79_o1: std_logic;
SIGNAL id79_o2: std_logic;

BEGIN
id0: basic_block PORT MAP (clock, "01100010", charIn, id0_i, id0_o);

id1: basic_block PORT MAP (clock, "01100001", charIn, id1_i, id1_o);

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
id3: basic_block PORT MAP (clock, "01100010", charIn, id3_i, id3_o);

id4: basic_block PORT MAP (clock, "01100101", charIn, id4_i, id4_o);

id5: andBlock PORT MAP(id5_i, id5_i1, id5_i2, id5_o, id5_o1, id5_o2);



PROCESS(id4_o, id5_o2)
BEGIN
id5_i2 <= id4_o;
id4_i <= id5_o2;
END PROCESS;


PROCESS(id3_o, id5_o1)
BEGIN
id5_i1 <= id3_o;
id3_i <= id5_o1;
END PROCESS;
id6: orBlock PORT MAP(id6_i, id6_i1, id6_i2, id6_o, id6_o1, id6_o2);



PROCESS(id5_o, id6_o2)
BEGIN
id6_i2 <= id5_o;
id5_i <= id6_o2;
END PROCESS;


PROCESS(id2_o, id6_o1)
BEGIN
id6_i1 <= id2_o;
id2_i <= id6_o1;
END PROCESS;
id7: basic_block PORT MAP (clock, "01100010", charIn, id7_i, id7_o);

id8: basic_block PORT MAP (clock, "01101001", charIn, id8_i, id8_o);

id9: andBlock PORT MAP(id9_i, id9_i1, id9_i2, id9_o, id9_o1, id9_o2);



PROCESS(id8_o, id9_o2)
BEGIN
id9_i2 <= id8_o;
id8_i <= id9_o2;
END PROCESS;


PROCESS(id7_o, id9_o1)
BEGIN
id9_i1 <= id7_o;
id7_i <= id9_o1;
END PROCESS;
id10: orBlock PORT MAP(id10_i, id10_i1, id10_i2, id10_o, id10_o1, id10_o2);



PROCESS(id9_o, id10_o2)
BEGIN
id10_i2 <= id9_o;
id9_i <= id10_o2;
END PROCESS;


PROCESS(id6_o, id10_o1)
BEGIN
id10_i1 <= id6_o;
id6_i <= id10_o1;
END PROCESS;
id11: basic_block PORT MAP (clock, "01100010", charIn, id11_i, id11_o);

id12: basic_block PORT MAP (clock, "01101111", charIn, id12_i, id12_o);

id13: andBlock PORT MAP(id13_i, id13_i1, id13_i2, id13_o, id13_o1, id13_o2);



PROCESS(id12_o, id13_o2)
BEGIN
id13_i2 <= id12_o;
id12_i <= id13_o2;
END PROCESS;


PROCESS(id11_o, id13_o1)
BEGIN
id13_i1 <= id11_o;
id11_i <= id13_o1;
END PROCESS;
id14: orBlock PORT MAP(id14_i, id14_i1, id14_i2, id14_o, id14_o1, id14_o2);



PROCESS(id13_o, id14_o2)
BEGIN
id14_i2 <= id13_o;
id13_i <= id14_o2;
END PROCESS;


PROCESS(id10_o, id14_o1)
BEGIN
id14_i1 <= id10_o;
id10_i <= id14_o1;
END PROCESS;
id15: basic_block PORT MAP (clock, "01100010", charIn, id15_i, id15_o);

id16: basic_block PORT MAP (clock, "01110101", charIn, id16_i, id16_o);

id17: andBlock PORT MAP(id17_i, id17_i1, id17_i2, id17_o, id17_o1, id17_o2);



PROCESS(id16_o, id17_o2)
BEGIN
id17_i2 <= id16_o;
id16_i <= id17_o2;
END PROCESS;


PROCESS(id15_o, id17_o1)
BEGIN
id17_i1 <= id15_o;
id15_i <= id17_o1;
END PROCESS;
id18: orBlock PORT MAP(id18_i, id18_i1, id18_i2, id18_o, id18_o1, id18_o2);



PROCESS(id17_o, id18_o2)
BEGIN
id18_i2 <= id17_o;
id17_i <= id18_o2;
END PROCESS;


PROCESS(id14_o, id18_o1)
BEGIN
id18_i1 <= id14_o;
id14_i <= id18_o1;
END PROCESS;
id19: basic_block PORT MAP (clock, "01100010", charIn, id19_i, id19_o);

id20: basic_block PORT MAP (clock, "01100001", charIn, id20_i, id20_o);

id21: andBlock PORT MAP(id21_i, id21_i1, id21_i2, id21_o, id21_o1, id21_o2);



PROCESS(id20_o, id21_o2)
BEGIN
id21_i2 <= id20_o;
id20_i <= id21_o2;
END PROCESS;


PROCESS(id19_o, id21_o1)
BEGIN
id21_i1 <= id19_o;
id19_i <= id21_o1;
END PROCESS;
id22: basic_block PORT MAP (clock, "01100010", charIn, id22_i, id22_o);

id23: basic_block PORT MAP (clock, "01100101", charIn, id23_i, id23_o);

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
id25: orBlock PORT MAP(id25_i, id25_i1, id25_i2, id25_o, id25_o1, id25_o2);



PROCESS(id24_o, id25_o2)
BEGIN
id25_i2 <= id24_o;
id24_i <= id25_o2;
END PROCESS;


PROCESS(id21_o, id25_o1)
BEGIN
id25_i1 <= id21_o;
id21_i <= id25_o1;
END PROCESS;
id26: basic_block PORT MAP (clock, "01100010", charIn, id26_i, id26_o);

id27: basic_block PORT MAP (clock, "01101001", charIn, id27_i, id27_o);

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
id29: orBlock PORT MAP(id29_i, id29_i1, id29_i2, id29_o, id29_o1, id29_o2);



PROCESS(id28_o, id29_o2)
BEGIN
id29_i2 <= id28_o;
id28_i <= id29_o2;
END PROCESS;


PROCESS(id25_o, id29_o1)
BEGIN
id29_i1 <= id25_o;
id25_i <= id29_o1;
END PROCESS;
id30: basic_block PORT MAP (clock, "01100010", charIn, id30_i, id30_o);

id31: basic_block PORT MAP (clock, "01101111", charIn, id31_i, id31_o);

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
id33: orBlock PORT MAP(id33_i, id33_i1, id33_i2, id33_o, id33_o1, id33_o2);



PROCESS(id32_o, id33_o2)
BEGIN
id33_i2 <= id32_o;
id32_i <= id33_o2;
END PROCESS;


PROCESS(id29_o, id33_o1)
BEGIN
id33_i1 <= id29_o;
id29_i <= id33_o1;
END PROCESS;
id34: basic_block PORT MAP (clock, "01100010", charIn, id34_i, id34_o);

id35: basic_block PORT MAP (clock, "01110101", charIn, id35_i, id35_o);

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
id37: orBlock PORT MAP(id37_i, id37_i1, id37_i2, id37_o, id37_o1, id37_o2);



PROCESS(id36_o, id37_o2)
BEGIN
id37_i2 <= id36_o;
id36_i <= id37_o2;
END PROCESS;


PROCESS(id33_o, id37_o1)
BEGIN
id37_i1 <= id33_o;
id33_i <= id37_o1;
END PROCESS;
id38: starBlock PORT MAP(id38_i, id38_i1, id38_o, id38_o1);



PROCESS(id37_o, id38_o1)
BEGIN
id38_i1 <= id37_o;
id37_i <= id38_o1;
END PROCESS;
id39: andBlock PORT MAP(id39_i, id39_i1, id39_i2, id39_o, id39_o1, id39_o2);



PROCESS(id38_o, id39_o2)
BEGIN
id39_i2 <= id38_o;
id38_i <= id39_o2;
END PROCESS;


PROCESS(id18_o, id39_o1)
BEGIN
id39_i1 <= id18_o;
id18_i <= id39_o1;
END PROCESS;
id40: basic_block PORT MAP (clock, "01000000", charIn, id40_i, id40_o);

id41: andBlock PORT MAP(id41_i, id41_i1, id41_i2, id41_o, id41_o1, id41_o2);



PROCESS(id40_o, id41_o2)
BEGIN
id41_i2 <= id40_o;
id40_i <= id41_o2;
END PROCESS;


PROCESS(id39_o, id41_o1)
BEGIN
id41_i1 <= id39_o;
id39_i <= id41_o1;
END PROCESS;
id42: basic_block PORT MAP (clock, "01100101", charIn, id42_i, id42_o);

id43: basic_block PORT MAP (clock, "01110010", charIn, id43_i, id43_o);

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
id45: basic_block PORT MAP (clock, "01101001", charIn, id45_i, id45_o);

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
id47: basic_block PORT MAP (clock, "01110100", charIn, id47_i, id47_o);

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
id49: basic_block PORT MAP (clock, "01100001", charIn, id49_i, id49_o);

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
id51: basic_block PORT MAP (clock, "01101100", charIn, id51_i, id51_o);

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
id53: basic_block PORT MAP (clock, "01101011", charIn, id53_i, id53_o);

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
id55: basic_block PORT MAP (clock, "01100101", charIn, id55_i, id55_o);

id56: basic_block PORT MAP (clock, "01110010", charIn, id56_i, id56_o);

id57: andBlock PORT MAP(id57_i, id57_i1, id57_i2, id57_o, id57_o1, id57_o2);



PROCESS(id56_o, id57_o2)
BEGIN
id57_i2 <= id56_o;
id56_i <= id57_o2;
END PROCESS;


PROCESS(id55_o, id57_o1)
BEGIN
id57_i1 <= id55_o;
id55_i <= id57_o1;
END PROCESS;
id58: basic_block PORT MAP (clock, "01101001", charIn, id58_i, id58_o);

id59: andBlock PORT MAP(id59_i, id59_i1, id59_i2, id59_o, id59_o1, id59_o2);



PROCESS(id58_o, id59_o2)
BEGIN
id59_i2 <= id58_o;
id58_i <= id59_o2;
END PROCESS;


PROCESS(id57_o, id59_o1)
BEGIN
id59_i1 <= id57_o;
id57_i <= id59_o1;
END PROCESS;
id60: basic_block PORT MAP (clock, "01100011", charIn, id60_i, id60_o);

id61: andBlock PORT MAP(id61_i, id61_i1, id61_i2, id61_o, id61_o1, id61_o2);



PROCESS(id60_o, id61_o2)
BEGIN
id61_i2 <= id60_o;
id60_i <= id61_o2;
END PROCESS;


PROCESS(id59_o, id61_o1)
BEGIN
id61_i1 <= id59_o;
id59_i <= id61_o1;
END PROCESS;
id62: basic_block PORT MAP (clock, "01110011", charIn, id62_i, id62_o);

id63: andBlock PORT MAP(id63_i, id63_i1, id63_i2, id63_o, id63_o1, id63_o2);



PROCESS(id62_o, id63_o2)
BEGIN
id63_i2 <= id62_o;
id62_i <= id63_o2;
END PROCESS;


PROCESS(id61_o, id63_o1)
BEGIN
id63_i1 <= id61_o;
id61_i <= id63_o1;
END PROCESS;
id64: basic_block PORT MAP (clock, "01110011", charIn, id64_i, id64_o);

id65: andBlock PORT MAP(id65_i, id65_i1, id65_i2, id65_o, id65_o1, id65_o2);



PROCESS(id64_o, id65_o2)
BEGIN
id65_i2 <= id64_o;
id64_i <= id65_o2;
END PROCESS;


PROCESS(id63_o, id65_o1)
BEGIN
id65_i1 <= id63_o;
id63_i <= id65_o1;
END PROCESS;
id66: basic_block PORT MAP (clock, "01101111", charIn, id66_i, id66_o);

id67: andBlock PORT MAP(id67_i, id67_i1, id67_i2, id67_o, id67_o1, id67_o2);



PROCESS(id66_o, id67_o2)
BEGIN
id67_i2 <= id66_o;
id66_i <= id67_o2;
END PROCESS;


PROCESS(id65_o, id67_o1)
BEGIN
id67_i1 <= id65_o;
id65_i <= id67_o1;
END PROCESS;
id68: basic_block PORT MAP (clock, "01101110", charIn, id68_i, id68_o);

id69: andBlock PORT MAP(id69_i, id69_i1, id69_i2, id69_o, id69_o1, id69_o2);



PROCESS(id68_o, id69_o2)
BEGIN
id69_i2 <= id68_o;
id68_i <= id69_o2;
END PROCESS;


PROCESS(id67_o, id69_o1)
BEGIN
id69_i1 <= id67_o;
id67_i <= id69_o1;
END PROCESS;
id70: orBlock PORT MAP(id70_i, id70_i1, id70_i2, id70_o, id70_o1, id70_o2);



PROCESS(id69_o, id70_o2)
BEGIN
id70_i2 <= id69_o;
id69_i <= id70_o2;
END PROCESS;


PROCESS(id54_o, id70_o1)
BEGIN
id70_i1 <= id54_o;
id54_i <= id70_o1;
END PROCESS;
id71: andBlock PORT MAP(id71_i, id71_i1, id71_i2, id71_o, id71_o1, id71_o2);



PROCESS(id70_o, id71_o2)
BEGIN
id71_i2 <= id70_o;
id70_i <= id71_o2;
END PROCESS;


PROCESS(id41_o, id71_o1)
BEGIN
id71_i1 <= id41_o;
id41_i <= id71_o1;
END PROCESS;
id72: basic_block PORT MAP (clock, "00101110", charIn, id72_i, id72_o);

id73: basic_block PORT MAP (clock, "01100011", charIn, id73_i, id73_o);

id74: andBlock PORT MAP(id74_i, id74_i1, id74_i2, id74_o, id74_o1, id74_o2);



PROCESS(id73_o, id74_o2)
BEGIN
id74_i2 <= id73_o;
id73_i <= id74_o2;
END PROCESS;


PROCESS(id72_o, id74_o1)
BEGIN
id74_i1 <= id72_o;
id72_i <= id74_o1;
END PROCESS;
id75: basic_block PORT MAP (clock, "01101111", charIn, id75_i, id75_o);

id76: andBlock PORT MAP(id76_i, id76_i1, id76_i2, id76_o, id76_o1, id76_o2);



PROCESS(id75_o, id76_o2)
BEGIN
id76_i2 <= id75_o;
id75_i <= id76_o2;
END PROCESS;


PROCESS(id74_o, id76_o1)
BEGIN
id76_i1 <= id74_o;
id74_i <= id76_o1;
END PROCESS;
id77: basic_block PORT MAP (clock, "01101101", charIn, id77_i, id77_o);

id78: andBlock PORT MAP(id78_i, id78_i1, id78_i2, id78_o, id78_o1, id78_o2);



PROCESS(id77_o, id78_o2)
BEGIN
id78_i2 <= id77_o;
id77_i <= id78_o2;
END PROCESS;


PROCESS(id76_o, id78_o1)
BEGIN
id78_i1 <= id76_o;
id76_i <= id78_o1;
END PROCESS;
id79: andBlock PORT MAP(id79_i, id79_i1, id79_i2, id79_o, id79_o1, id79_o2);



PROCESS(id78_o, id79_o2)
BEGIN
id79_i2 <= id78_o;
id78_i <= id79_o2;
END PROCESS;


PROCESS(id71_o, id79_o1)
BEGIN
id79_i1 <= id71_o;
id71_i <= id79_o1;
END PROCESS;

PROCESS(id79_o)
BEGIN
id79_i <= '1';
output <= id79_o;
END PROCESS;


END structuralEngine;


library ieee;
use ieee.std_logic_1164.all;


ENTITY engine1 IS
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); output: OUT std_logic);
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

BEGIN
id0: basic_block PORT MAP (clock, "01100110", charIn, id0_i, id0_o);

id1: basic_block PORT MAP (clock, "01110100", charIn, id1_i, id1_o);

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
id3: basic_block PORT MAP (clock, "01110000", charIn, id3_i, id3_o);

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

PROCESS(id4_o)
BEGIN
id4_i <= '1';
output <= id4_o;
END PROCESS;


END structuralEngine;


library ieee;
use ieee.std_logic_1164.all;


ENTITY regExpMatching IS
PORT(clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); output1: OUT std_logic; output2: OUT std_logic);
END;

ARCHITECTURE structuralRegExpMatching OF regExpMatching IS
COMPONENT engine0
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); output: OUT std_logic);
END COMPONENT;
COMPONENT engine1
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); output: OUT std_logic);
END COMPONENT;
SIGNAL s0: std_logic;
SIGNAL s1: std_logic;

BEGIN
e0: engine0 PORT MAP(clock, charIn, s0);
e1: engine1 PORT MAP(clock, charIn, s1);

PROCESS(s0, s1)
BEGIN
output1 <= s0;
output2 <= s1;
END PROCESS;
END structuralRegExpMatching;
