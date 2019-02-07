library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity reconocedorERS_FPGA is
	port(	
		clk: in std_logic;
		reset: in std_logic;
		output1: OUT std_logic; 
		output2: OUT std_logic);
end reconocedorERS_FPGA;

architecture reconocedorERS_FPGA_arch of reconocedorERS_FPGA is
component regExpMatching is
	PORT(
		clock: IN std_logic; 
		charIn: IN std_logic_vector(7 downto 0); 
		output1: OUT std_logic; 
		output2: OUT std_logic);
end component;

component divisor is
	PORT(
		clk: IN std_logic; 
		q: OUT std_logic_vector(23 downto 0));
end component;

signal salida1: STD_LOGIC;
signal salida2: STD_LOGIC;
signal caracter: STD_LOGIC_VECTOR(7 downto 0);
signal indice: STD_LOGIC_VECTOR(7 downto 0);
type string_type is array (0 to 149) of CHARACTER;
constant cadena_entrada : string_type :=("--aabd--jk--bb--aacc--bba--ccbbapk--ftp://--pepemartin--bb--ccca--ba--aa--abc--abcd--ftp--aaa--bb--http://bbwww.bbacjwdftpcjwd--vlc--be@ericsson.com--");

signal charaux: CHARACTER;
signal clkAux: std_logic_vector(23 downto 0);
signal clkDiv: std_logic;

begin

process(indice,charaux)
begin
	charaux <= cadena_entrada(conv_integer(indice));
	caracter <= CONV_STD_LOGIC_VECTOR(character'pos(charaux),8);
end process;

contador: process (clkDiv,reset)
begin
	if (reset = '1') then
		indice <= (others => '0');
	elsif clkDiv'event and clkDiv='1' then 
		if indice = 149 then
			indice <= (others => '0');
		else
			indice <= indice + 1;
		end if;
	end if;
end process;

div: divisor port map (clk, clkAux);
reconocedor: regExpMatching port map (clkDiv, caracter, salida1, salida2);
clkDiv <= clkAux(23);
output1 <= salida1;
output2 <= salida2;

end reconocedorERS_FPGA_arch;
