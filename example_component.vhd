library ieee;
use ieee.std_logic_1164.all;
-- use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity example_component is
   port (
      clk, reset    : in  std_logic;
      reset_gcd			: in std_logic;
      address       : in  std_logic_vector (1 downto 0);
      read          : in  std_logic;
      readdata      : out std_logic_vector (31 downto 0);
      write         : in  std_logic;
      writedata     : in  std_logic_vector (31 downto 0)
   );
end example_component;

architecture simple of example_component is

component RAU is
	port (
		a, b   : in  std_logic_vector(15 downto 0);
		c, d   : in  std_logic_vector(15 downto 0);
		op : in  std_logic_vector(1 downto 0);
		clk,reset : in std_logic;
		y_n,y_d : out std_logic_vector(15 downto 0);
		overflow_num,overflow_den,ready : out std_logic
	);
end component;

   signal inreg1,inreg2,inreg3, outreg1,outreg2 		 : std_logic_vector (31 downto 0):= (others => '0');
   --signal inreg_in,outreg_in     : std_logic_vector (31 downto 0):= (others => '0');


begin

    reg:process(reset,clk) is
	begin
	if reset = '1' then
		--inreg <= (others => '0');
		readdata <= (others => '0');
	elsif (rising_edge(clk)) then
		if (write = '1') then
			if address = "00" then
				inreg1 <= writedata;
			elsif (address = "01") then
				inreg2 <= writedata;
			else
				inreg3 <= writedata;
			end if;
				
				
		end if;
		if (read = '1') then
			if address = "00" then
				readdata <= outreg1;
			elsif (address = "01") then
				readdata <= outreg2;
			else
				readdata <= (others => '0');
			end if;
		end if;
	end if;
	end process reg;

	C:RAU port map(inreg1(31 downto 16),inreg1(15 downto 0),
					inreg2(31 downto 16),inreg2(15 downto 0), inreg3(1 downto 0),
						clk,reset_gcd, outreg1(31 downto 16), outreg1(15 downto 0),
						outreg2(2),outreg2(1),outreg2(0));
	
	--rd_wr:process(read,write,writedata) is
	--begin
	--if (write ='1') then
	--	inreg_in <= writedata;
	--end if;
	--if (read = '1') then 
	--	readdata <= outreg;
	--end if;
	--end process rd_wr;
	

end simple;