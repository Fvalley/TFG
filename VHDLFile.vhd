

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
SIGNAL id1_i: std_logic;
SIGNAL id1_i1: std_logic;
SIGNAL id1_o: std_logic;
SIGNAL id1_o1: std_logic;
SIGNAL id2_i: std_logic;
SIGNAL id2_i1: std_logic;
SIGNAL id2_o: std_logic;
SIGNAL id2_o1: std_logic;
SIGNAL id3_i: std_logic;
SIGNAL id3_i1: std_logic;
SIGNAL id3_i2: std_logic;
SIGNAL id3_o: std_logic;
SIGNAL id3_o1: std_logic;
SIGNAL id3_o2: std_logic;
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
SIGNAL id6_o: std_logic;
SIGNAL id6_o1: std_logic;
SIGNAL id7_i: std_logic;
SIGNAL id7_i1: std_logic;
SIGNAL id7_i2: std_logic;
SIGNAL id7_o: std_logic;
SIGNAL id7_o1: std_logic;
SIGNAL id7_o2: std_logic;
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
SIGNAL id10_o: std_logic;
SIGNAL id10_o1: std_logic;
SIGNAL id11_i: std_logic;
SIGNAL id11_i1: std_logic;
SIGNAL id11_i2: std_logic;
SIGNAL id11_o: std_logic;
SIGNAL id11_o1: std_logic;
SIGNAL id11_o2: std_logic;
SIGNAL id12_i: std_logic;
SIGNAL id12_i1: std_logic;
SIGNAL id12_o: std_logic;
SIGNAL id12_o1: std_logic;
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

BEGIN
id0: basic_block PORT MAP (clock, "01011110", charIn, id0_i, id0_o);

id1: basic_block PORT MAP (clock, "00111111", charIn, id1_i, id1_o);

id2: basic_block PORT MAP (clock, "00100001", charIn, id2_i, id2_o);

id3: andBlock PORT MAP(id3_i, id3_i1, id3_i2, id3_o, id3_o1, id3_o2);



PROCESS(id2_o, id3_o2)
BEGIN
id3_i2 <= id2_o;
id2_i <= id3_o2;
END PROCESS;


PROCESS(id1_o, id3_o1)
BEGIN
id3_i1 <= id1_o;
id1_i <= id3_o1;
END PROCESS;
id4: basic_block PORT MAP (clock, "01000111", charIn, id4_i, id4_o);

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
id6: basic_block PORT MAP (clock, "01000101", charIn, id6_i, id6_o);

id7: andBlock PORT MAP(id7_i, id7_i1, id7_i2, id7_o, id7_o1, id7_o2);



PROCESS(id6_o, id7_o2)
BEGIN
id7_i2 <= id6_o;
id6_i <= id7_o2;
END PROCESS;


PROCESS(id5_o, id7_o1)
BEGIN
id7_i1 <= id5_o;
id5_i <= id7_o1;
END PROCESS;
id8: basic_block PORT MAP (clock, "01010100", charIn, id8_i, id8_o);

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
id10: basic_block PORT MAP (clock, "00101110", charIn, id10_i, id10_o);

id11: andBlock PORT MAP(id11_i, id11_i1, id11_i2, id11_o, id11_o1, id11_o2);



PROCESS(id10_o, id11_o2)
BEGIN
id11_i2 <= id10_o;
id10_i <= id11_o2;
END PROCESS;


PROCESS(id9_o, id11_o1)
BEGIN
id11_i1 <= id9_o;
id9_i <= id11_o1;
END PROCESS;
id12: basic_block PORT MAP (clock, "00100100", charIn, id12_i, id12_o);

id13: starBlock PORT MAP(id13_i, id13_i1, id13_o, id13_o1);



PROCESS(id12_o, id13_o1)
BEGIN
id13_i1 <= id12_o;
id12_i <= id13_o1;
END PROCESS;
id14: andBlock PORT MAP(id14_i, id14_i1, id14_i2, id14_o, id14_o1, id14_o2);



PROCESS(id13_o, id14_o2)
BEGIN
id14_i2 <= id13_o;
id13_i <= id14_o2;
END PROCESS;


PROCESS(id11_o, id14_o1)
BEGIN
id14_i1 <= id11_o;
id11_i <= id14_o1;
END PROCESS;

PROCESS(id14_o)
BEGIN
id14_i <= '1';
output <= id14_o;
END PROCESS;

o_subExp0 <= id1_o;

END structuralEngine;


library ieee;
use ieee.std_logic_1164.all;


ENTITY engine1 IS
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); i_subExpE0id1_o: IN std_logic; output: OUT std_logic);
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
SIGNAL id2_i: std_logic;
SIGNAL id2_i1: std_logic;
SIGNAL id2_o: std_logic;
SIGNAL id2_o1: std_logic;
SIGNAL id3_i: std_logic;
SIGNAL id3_i1: std_logic;
SIGNAL id3_i2: std_logic;
SIGNAL id3_o: std_logic;
SIGNAL id3_o1: std_logic;
SIGNAL id3_o2: std_logic;
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
SIGNAL id6_o: std_logic;
SIGNAL id6_o1: std_logic;
SIGNAL id7_i: std_logic;
SIGNAL id7_i1: std_logic;
SIGNAL id7_i2: std_logic;
SIGNAL id7_o: std_logic;
SIGNAL id7_o1: std_logic;
SIGNAL id7_o2: std_logic;
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
SIGNAL id10_o: std_logic;
SIGNAL id10_o1: std_logic;
SIGNAL id11_i: std_logic;
SIGNAL id11_i1: std_logic;
SIGNAL id11_i2: std_logic;
SIGNAL id11_o: std_logic;
SIGNAL id11_o1: std_logic;
SIGNAL id11_o2: std_logic;
SIGNAL id12_i: std_logic;
SIGNAL id12_i1: std_logic;
SIGNAL id12_o: std_logic;
SIGNAL id12_o1: std_logic;
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

BEGIN
id0: basic_block PORT MAP (clock, "01011110", charIn, id0_i, id0_o);

id2: basic_block PORT MAP (clock, "00111101", charIn, id2_i, id2_o);

id3: andBlock PORT MAP(id3_i, id3_i1, id3_i2, id3_o, id3_o1, id3_o2);



PROCESS(id2_o, id3_o2)
BEGIN
id3_i2 <= id2_o;
id2_i <= id3_o2;
END PROCESS;

id3_i1 <= i_subExpE0id1_o;
id4: basic_block PORT MAP (clock, "01000111", charIn, id4_i, id4_o);

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
id6: basic_block PORT MAP (clock, "01000101", charIn, id6_i, id6_o);

id7: andBlock PORT MAP(id7_i, id7_i1, id7_i2, id7_o, id7_o1, id7_o2);



PROCESS(id6_o, id7_o2)
BEGIN
id7_i2 <= id6_o;
id6_i <= id7_o2;
END PROCESS;


PROCESS(id5_o, id7_o1)
BEGIN
id7_i1 <= id5_o;
id5_i <= id7_o1;
END PROCESS;
id8: basic_block PORT MAP (clock, "01010100", charIn, id8_i, id8_o);

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
id10: basic_block PORT MAP (clock, "00101110", charIn, id10_i, id10_o);

id11: andBlock PORT MAP(id11_i, id11_i1, id11_i2, id11_o, id11_o1, id11_o2);



PROCESS(id10_o, id11_o2)
BEGIN
id11_i2 <= id10_o;
id10_i <= id11_o2;
END PROCESS;


PROCESS(id9_o, id11_o1)
BEGIN
id11_i1 <= id9_o;
id9_i <= id11_o1;
END PROCESS;
id12: basic_block PORT MAP (clock, "00100100", charIn, id12_i, id12_o);

id13: starBlock PORT MAP(id13_i, id13_i1, id13_o, id13_o1);



PROCESS(id12_o, id13_o1)
BEGIN
id13_i1 <= id12_o;
id12_i <= id13_o1;
END PROCESS;
id14: andBlock PORT MAP(id14_i, id14_i1, id14_i2, id14_o, id14_o1, id14_o2);



PROCESS(id13_o, id14_o2)
BEGIN
id14_i2 <= id13_o;
id13_i <= id14_o2;
END PROCESS;


PROCESS(id11_o, id14_o1)
BEGIN
id14_i1 <= id11_o;
id11_i <= id14_o1;
END PROCESS;

PROCESS(id14_o)
BEGIN
id14_i <= '1';
output <= id14_o;
END PROCESS;


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
PORT (clock: IN std_logic; charIn: IN std_logic_vector(7 downto 0); i_subExpE0id1_o: IN std_logic; output: OUT std_logic);
END COMPONENT;
SIGNAL s0: std_logic;
SIGNAL subExpE0id1_o: std_logic;
SIGNAL s1: std_logic;

BEGIN
e0: engine0 PORT MAP(clock, charIn, subExpE0id1_o, s0);
e1: engine1 PORT MAP(clock, charIn, subExpE0id1_o, s1);

PROCESS(s0, s1)
BEGIN
output1 <= s0;
output2 <= s1;
END PROCESS;
END structuralRegExpMatching;
