library ieee;
use ieee.std_logic_1164.all;
entity alu2 is
   port(A,B: in std_logic_vector(15 downto 0);
        Z: out std_logic_vector(15 downto 0));
end entity;
architecture Formulas of alu2 is

component SixteenBitAdder is
   port(x,y: in std_logic_vector(15 downto 0);
        sum: out std_logic_vector(15 downto 0);cout: out std_logic);
end component;
	signal c_out : std_logic:='0';
begin
add: SixteenBitAdder 
	port map (x=>A, y=>B,sum=>Z,cout=>c_out);
end Formulas;
