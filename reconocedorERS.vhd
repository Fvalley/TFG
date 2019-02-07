library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity reconocedorERS is
	port(	
		clk: in std_logic;
		reset: in std_logic;
		output1: OUT std_logic; 
		output2: OUT std_logic);
end reconocedorERS;

architecture reconocedorERS_arch of reconocedorERS is
component regExpMatching is
	PORT(
		clock: IN std_logic; 
		charIn: IN std_logic_vector(7 downto 0); 
		output1: OUT std_logic; 
		output2: OUT std_logic);
end component;

signal salida1: STD_LOGIC;
signal salida2: STD_LOGIC;
signal caracter: STD_LOGIC_VECTOR(7 downto 0);
signal indice: STD_LOGIC_VECTOR(7 downto 0);
type string_type is array (0 to 149) of CHARACTER;
constant cadena_entrada : string_type :=("--aabd--jk--bb--aacc--bba--ccbbapk--ftp://--pepemartin--bb--ccca--ba--aa--abc--abcd--ftp--aaa--bb--http://bbwww.bbacjwdftpcjwd--vlc--be@ericsson.com--");

signal charaux: CHARACTER;

begin

process(indice,charaux)
begin
	charaux <= cadena_entrada(conv_integer(indice));
	caracter <= CONV_STD_LOGIC_VECTOR(character'pos(charaux),8);
end process;

contador: process (clk,reset)
begin
	if (reset = '1') then
		indice <= (others => '0');
	elsif clk'event and clk='1' then 
		if indice = 149 then
			indice <= (others => '0');
		else
			indice <= indice + 1;
		end if;
	end if;
end process;

reconocedor: regExpMatching port map (clk, caracter, salida1, salida2);
output1 <= salida1;
output2 <= salida2;

end reconocedorERS_arch;
