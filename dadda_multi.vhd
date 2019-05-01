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

--Step 1 in Dadda reduction to 13 wires
signal s1_1: std_logic_vector(32 downto 0);	
signal s1_2: std_logic_vector(31 downto 1);
signal s1_3: std_logic_vector(30 downto 2);
signal s1_4: std_logic_vector(29 downto 3);
signal s1_5: std_logic_vector(28 downto 4);
signal s1_6: std_logic_vector(27 downto 5);
signal s1_7: std_logic_vector(26 downto 6);	
signal s1_8: std_logic_vector(25 downto 7);
signal s1_9: std_logic_vector(24 downto 8);
signal s1_10: std_logic_vector(23 downto 9);
signal s1_11: std_logic_vector(22 downto 10);
signal s1_12: std_logic_vector(21 downto 11);
signal s1_13: std_logic_vector(21 downto 12);

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

	extra_pp(0) <= a(16) xor b(16);
	extra_pp(1) <= a(16) and b(16);

	--Step 1 Dadda Reduction 

	--Line 1 in 13 wires after 1st reduction

	s1_1(12 downto 0) <= l1(12 downto 0);
	s1_1(13) <= sum_2b(l1(13),l2(12));
	s1_1(14) <= sum_3b(l1(14),l2(13),l3(12));
	s1_1(15) <= sum_3b(l1(15),l2(14),l3(13));
	s1_1(16) <= sum_3b(extra_pp(0),l1(16),l2(15));
	s1_1(17) <= sum_3b(extra_pp(1),l2(16),l3(15));
	s1_1(18) <= sum_3b(l3(16),l4(15),l5(14));
	s1_1(19) <= sum_3b(l4(16),l5(15),l6(14));
	s1_1(20) <= sum_3b(l5(16),l6(15),l7(14));
	s1_1(21) <= l6(16);
	s1_1(22) <= l7(16);
	s1_1(23) <= l8(16);
	s1_1(24) <= l9(16);
	s1_1(25) <= l10(16);
	s1_1(26) <= l11(16);
	s1_1(27) <= l12(16);
	s1_1(28) <= l13(16);
	s1_1(29) <= l14(16);
	s1_1(30) <= l15(16);
	s1_1(31) <= l16(16);
	s1_1(32) <= l17(16);

	--Line 2 in 13 wires after 1st reduction

	s1_2(12 downto 1) <= l2(11 downto 0);
	s1_2(13) <= l3(11);
	s1_2(14) <= carry_2b(l1(13),l2(12));
	s1_2(15) <= carry_3b(l1(14),l2(13),l3(12));
	s1_2(16) <= carry_3b(l1(15),l2(14),l3(13));
	s1_2(17) <= carry_3b(extra_pp(0),l1(16),l2(15));
	s1_2(18) <= carry_3b(extra_pp(1),l2(16),l3(15));
	s1_2(19) <= carry_3b(l3(16),l4(15),l5(14));
	s1_2(20) <= carry_3b(l4(16),l5(15),l6(14));
	s1_2(21) <= carry_3b(l5(16),l6(15),l7(14));
	s1_2(22) <= l8(15);
	s1_2(23) <= l9(15);
	s1_2(24) <= l10(15);
	s1_2(25) <= l11(15);
	s1_2(26) <= l12(15);
	s1_2(27) <= l13(15);
	s1_2(28) <= l14(15);
	s1_2(29) <= l15(15);
	s1_2(30) <= l16(15);
	s1_2(31) <= l17(15);

	--Line 3 in 13 wires after 1st reduction

	s1_3(12 downto 2) <= l3(10 downto 0);
	s1_3(13) <= l4(10);
	s1_3(14) <= sum_2b(l4(11),l5(10));
	s1_3(15) <= sum_3b(l4(12),l5(11),l6(10));
	s1_3(16) <= sum_3b(l3(14),l4(13),l5(12));
	s1_3(17) <= sum_3b(l4(14),l5(13),l6(12));
	s1_3(18) <= sum_3b(l6(13),l7(12),l8(11));
	s1_3(19) <= sum_3b(l7(13),l8(12),l9(11));
	s1_3(20) <= l8(13);
	s1_3(21) <= l7(15);
	s1_3(22) <= l9(14); 
	s1_3(23) <= l10(14);
	s1_3(24) <= l11(14);
	s1_3(25) <= l12(14);
	s1_3(26) <= l13(14);
	s1_3(27) <= l14(14);
	s1_3(28) <= l15(14);
	s1_3(29) <= l16(14);
	s1_3(30) <= l17(14);

	--Line 4 in 13 wires after 1st reduction

	s1_4(12 downto 3) <= l4(9 downto 0);
	s1_4(13) <= l5(9);
	s1_4(14) <= l6(9);
	s1_4(15) <= carry_2b(l4(11),l5(10));
	s1_4(16) <= carry_3b(l4(12),l5(11),l6(10));
	s1_4(17) <= carry_3b(l3(14),l4(13),l5(12));
	s1_3(18) <= carry_3b(l4(14),l5(13),l6(12));
	s1_3(19) <= carry_3b(l6(13),l7(12),l8(11));
	s1_3(20) <= carry_3b(l7(13),l8(12),l9(11));
	s1_4(21) <= l8(14);
	s1_4(22) <= l10(13); 
	s1_4(23) <= l11(13);
	s1_4(24) <= l12(13);
	s1_4(25) <= l13(13);
	s1_4(26) <= l14(13)
	s1_4(27) <= l15(13);
	s1_4(28) <= l16(13);
	s1_4(29) <= l17(13);

		--Line 5 in 13 wires after 1st reduction

	s1_4(12 downto 4) <= l5(8 downto 0);
	s1_4(13) <= l6(8);
	s1_4(14) <= l7(8);
	s1_4(15) <= sum_2b(l7(9),l8(8));
	s1_4(16) <= sum_3b(l6(11),l(),l());
	s1_4(17) <= sum_3b(l(),l(),l());
	s1_3(18) <= sum_3b(l(),l(),l());
	s1_3(19) <= sum_3b(l(),l(),l());
	s1_3(20) <= sum_3b(l(),l(),l());
	s1_4(21) <= l8(14);
	s1_4(22) <= l10(13); 
	s1_4(23) <= l11(13);
	s1_4(24) <= l12(13);
	s1_4(25) <= l13(13);
	s1_4(26) <= l14(13)
	s1_4(27) <= l15(13);
	s1_4(28) <= l16(13);
	s1_4(29) <= l17(13);


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