library ieee;
use ieee.std_logic_1164.all;
use work.dadda_utils.all;
use ieee.numeric_std.all;

entity dadda_multi is
  port(
    a: in std_logic_vector(16 downto 0);
    b: in std_logic_vector(16 downto 0);
    p: out std_logic_vector(34 downto 0)
  );
end dadda_multi;

architecture dadda_multi_arch of dadda_multi is
-- Signals having all the parital products
signal l1: std_logic_vector(16 downto 0);
signal l2: std_logic_vector(16 downto 0);
signal l3: std_logic_vector(16 downto 0);
signal l4: std_logic_vector(16 downto 0);
signal l5: std_logic_vector(16 downto 0);
signal l6: std_logic_vector(16 downto 0);
signal l7: std_logic_vector(16 downto 0);
signal l8: std_logic_vector(16 downto 0);
signal l9: std_logic_vector(16 downto 0);
signal l10: std_logic_vector(16 downto 0);
signal l12: std_logic_vector(16 downto 0);
signal l13: std_logic_vector(16 downto 0);
signal l14: std_logic_vector(16 downto 0);
signal l15: std_logic_vector(16 downto 0);
signal l16: std_logic_vector(16 downto 0);
signal l17: std_logic_vector(16 downto 0);
-- Contains the extra partial products which arise due to change to signed dadda multipler
signal extra_pp: std_logic_vector(1 downto 0); 

begin
	-- Partial products in terms of inputs a and b
	l1(15 downto 0) <= and_16b(b(0),a(15 downto 0));
	l1(16) <= a(16) and (not b(0));
	l2(15 downto 0) <= and_16b(b(1),a(15 downto 0));
	l2(16) <= a(16) and (not b(1));
	l3(15 downto 0) <= and_16b(b(2),a(15 downto 0));
	l3(16) <= a(16) and (not b(2));
	l4(15 downto 0) <= and_16b(b(3),a(15 downto 0));
	l4(16) <= a(16) and (not b(3));
	l5(15 downto 0) <= and_16b(b(4),a(15 downto 0));
	l5(16) <= a(16) and (not b(4));
	l6(15 downto 0) <= and_16b(b(5),a(15 downto 0));
	l6(16) <= a(16) and (not b(5));
	l7(15 downto 0) <= and_16b(b(6),a(15 downto 0));
	l7(16) <= a(16) and (not b(6));
	l8(15 downto 0) <= and_16b(b(7),a(15 downto 0));
	l8(16) <= a(16) and (not b(7));
	l9(15 downto 0) <= and_16b(b(8),a(15 downto 0));
	l9(16) <= a(16) and (not b(8));
	l10(15 downto 0) <= and_16b(b(9),a(15 downto 0));
	l10(16) <= a(16) and (not b(9));
	l11(15 downto 0) <= and_16b(b(10),a(15 downto 0));
	l11(16) <= a(16) and (not b(10));
	l12(15 downto 0) <= and_16b(b(11),a(15 downto 0));
	l12(16) <= a(16) and (not b(11));
	l13(15 downto 0) <= and_16b(b(12),a(15 downto 0));
	l13(16) <= a(16) and (not b(12));
	l14(15 downto 0) <= and_16b(b(13),a(15 downto 0));
	l14(16) <= a(16) and (not b(13));
	l15(15 downto 0) <= and_16b(b(14),a(15 downto 0));
	l15(16) <= a(16) and (not b(14));
	l16(15 downto 0) <= and_16b(b(15),a(15 downto 0));
	l16(16) <= a(16) and (not b(15));
	l17(15 downto 0) <= and_16b(b(16),not a(15 downto 0);
	l17(16) <= a(16) or b(16);
	

	--   Segunda fase: reducao da matriz de produtos parciais
    --   Primeiro passo:
    --                    7 6   5 4 3 2 1 0
    ---------------------------------------
	-- l1                 3 2 | * * * * * *
	-- l2               3 3 2 | * * * * * 
	-- l3             3 3 3 * | * * * *
	-- l4           * 3 3 2 * | * * *
	-- l5       * | * 3 2 2 * | * *
	-- l6     * * | * * 2 * * | *
	-- l7   * * * | * * * * *
	-- l8 * * * * | * * * *
end architecture;