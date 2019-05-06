
library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use WORK.rationals.all;

entity RAU is
	port (
		a, b   : in  std_logic_vector(15 downto 0);
		c, d   : in  std_logic_vector(15 downto 0);
		op : in  std_logic_vector(1 downto 0);
		clk,reset : in std_logic;
		y_n,y_d : out std_logic_vector(15 downto 0);
		overflow_num,overflow_den,ready : out std_logic
	);
end RAU;

architecture rtl of RAU is
	signal num1,num2 : rational;
	signal temp : rational34;
	signal gcd_out,gcd : std_logic_vector(33 downto 0);
	constant OP_ADD : std_logic_vector(1 downto 0) := "00";
	constant OP_SUB : std_logic_vector(1 downto 0) := "01";
	constant OP_MUL : std_logic_vector(1 downto 0) := "10";
	constant OP_DIV : std_logic_vector(1 downto 0) := "11"; 
	signal y_num, y_den   : std_logic_vector(33 downto 0);
	signal rst,reset_1,rdy,start,gcd_ready,ready_1,ready_2 : std_logic := '0';
	signal op1 :  std_logic_vector(1 downto 0);
	signal x,y : integer;
	signal start_gcd: std_logic := '0'; 
	signal sign_bit:std_logic;
	signal gcd_in_a, gcd_in_b : std_logic_vector(33 downto 0);
	signal y_n_out, y_d_out :std_logic_vector(33 downto 0);
begin
	process(clk)
	begin
	if(rising_edge(clk)) then
		start_gcd <= reset;
	end if;
	end process;

	--For calculating GCD
	GCD1: gcd_1
	port map(
			clk => clk, reset => reset_1 ,
	      start => start_gcd,
	      a_in => gcd_in_a, b_in => gcd_in_b,
	      ready => rdy,
	      r => gcd_out);
	--For dividinng the numerator by the GCD calculated
	GCD2: gcd_iter1
	port map(
			clk => clk, reset => reset_1 ,
	      start => rdy,
	      a_in => gcd_in_a, b_in => gcd,
	      ready => ready_1,
	      count => y_n_out);
	-- For dividing the denominator by the GCD calculated
	GCD3: gcd_iter1
	port map(
			clk => clk, reset => reset_1 ,
	      start => rdy,
	      a_in => gcd_in_b, b_in => gcd,
	      ready => ready_2,
	      count => y_d_out);



		
	reset_1 <= reset or rst;

	op1 <= op;
	--Final ready is 1 when both the numerator and denominator are completely reduced.
	ready <= ready_1 and ready_2;

	--Convertering inputs to rational data type
	num1(numer) <= a;
	num1(denom) <= b;
	num2(numer) <= c;
	num2(denom) <= d;

	--Selecting the operation to be performed on the two rationals

	temp <=  num1 + num2 when op = OP_ADD else 
			 num1 - num2 when op = OP_SUB else
			 num1 * num2 when op = OP_MUL else 
			 num1 / num2 when op = OP_DIV;

	--Convetering from signed to unsigned numbers for GCD calculation
	sign_bit <= temp(numer)(33) xor temp(denom)(33);
	gcd_in_a <= twoscomp(temp(numer)) when sign_bit = '1' else temp(numer);
	gcd_in_b <= temp(denom);


	--Process for converting the unsigned outputs from GCD and reduced outputs. It also generates the overflow bits for numerator and denominator
	process(gcd_in_a,gcd_in_b,y_n_out,y_d_out)
	begin
		if (gcd_in_a(33 downto 16) /= "000000000000000000") then
			overflow_num <= '1';
		else
			overflow_num <= '0';
		end if;
		if (gcd_in_b(33 downto 16) /= "000000000000000000") then
			overflow_den <= '1';
		else
			overflow_den <= '0';
		end if;
		if (sign_bit = '1') then
			y_n <= twoscomp(y_n_out(33 downto 0))(15 downto 0);
		else
			y_n <= y_n_out(15 downto 0);
		end if;
			
			y_d <= y_d_out(15 downto 0);
	end process;



	--Process for freezing GCD after gcd is completed
	process(rdy,clk)
	begin 
		if(rdy = '1') then 
			gcd <= gcd_out;
		end if;
	end process;

	y_num <= temp(numer);
	y_den <= temp(denom);
end rtl;
