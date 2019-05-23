

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

BEGIN
id0: basic_block PORT MAP (clock, "00100101", charIn, id0_i, id0_o);

id1: basic_block PORT MAP (clock, "01000100", charIn, id1_i, id1_o);

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
id3: basic_block PORT MAP (clock, "00110000", charIn, id3_i, id3_o);

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
id5: basic_block PORT MAP (clock, "00100101", charIn, id5_i, id5_o);

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
id7: basic_block PORT MAP (clock, "00111000", charIn, id7_i, id7_o);

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
id9: basic_block PORT MAP (clock, "01000010", charIn, id9_i, id9_o);

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
id11: basic_block PORT MAP (clock, "01010100", charIn, id11_i, id11_o);

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
id13: basic_block PORT MAP (clock, "01101100", charIn, id13_i, id13_o);

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
id15: basic_block PORT MAP (clock, "00100101", charIn, id15_i, id15_o);

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
id17: basic_block PORT MAP (clock, "01000100", charIn, id17_i, id17_o);

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
id19: basic_block PORT MAP (clock, "01000011", charIn, id19_i, id19_o);

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

PROCESS(id20_o)
BEGIN
id20_i <= '1';
output <= id20_o;
END PROCESS;

o_subExp0 <= id20_o;

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
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); i_subExpE1id20_o: IN std_logic; output: OUT std_logic);
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

output <= i_subExpE1id20_o;


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
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); i_subExpE1id20_o: IN std_logic; output: OUT std_logic);
END COMPONENT;
SIGNAL s0: std_logic;
SIGNAL subExpE0id0_o: std_logic;
SIGNAL s1: std_logic;
SIGNAL subExpE1id20_o: std_logic;
SIGNAL s2: std_logic;
SIGNAL s3: std_logic;

BEGIN
e0: engine0 PORT MAP(clock, charIn, subExpE0id0_o, s0);
e1: engine1 PORT MAP(clock, charIn, subExpE1id20_o, s1);
e2: engine2 PORT MAP(clock, charIn, subExpE0id0_o, s2);
e3: engine3 PORT MAP(clock, charIn, subExpE1id20_o, s3);

PROCESS(s0, s1, s2, s3)
BEGIN
output1 <= s0 OR s1;
output2 <= s2 OR s3;
END PROCESS;
END structuralRegExpMatching;
