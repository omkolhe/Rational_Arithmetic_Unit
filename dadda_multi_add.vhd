library ieee;
use ieee.std_logic_1164.all;
use work.dadda_utils.all;
use ieee.numeric_std.all;

entity dadda_multi is
  port(
    a,b: in std_logic_vector(16 downto 0);
    c,d: in std_logic_vector(16 downto 0);
    p: out std_logic_vector(33 downto 0)
  );
end dadda_multi;

architecture dadda_multi_arch of dadda_multi is
-- Signals having all the parital products
signal l0: std_logic_vector(17 downto 16);
-- ^Contains the extra partial products which arise due to change to signed dadda multipler
signal l1: std_logic_vector(16 downto 0);
signal l2: std_logic_vector(17 downto 1);
signal l3: std_logic_vector(18 downto 2);
signal l4: std_logic_vector(19 downto 3);
signal l5: std_logic_vector(20 downto 4);
signal l6: std_logic_vector(21 downto 5);
signal l7: std_logic_vector(22 downto 6);
signal l8: std_logic_vector(23 downto 7);
signal l9: std_logic_vector(24 downto 8);
signal l10: std_logic_vector(25 downto 9);
signal l11: std_logic_vector(26 downto 10);
signal l12: std_logic_vector(27 downto 11);
signal l13: std_logic_vector(28 downto 12);
signal l14: std_logic_vector(29 downto 13);
signal l15: std_logic_vector(30 downto 14);
signal l16: std_logic_vector(31 downto 15);
signal l17: std_logic_vector(32 downto 16);

-- Next Pairs Partial Product
signal l18: std_logic_vector(17 downto 16);
-- ^Contains the extra partial products which arise due to change to signed dadda multipler
signal l19: std_logic_vector(16 downto 0);
signal l20: std_logic_vector(17 downto 1);
signal l21: std_logic_vector(18 downto 2);
signal l22: std_logic_vector(19 downto 3);
signal l23: std_logic_vector(20 downto 4);
signal l24: std_logic_vector(21 downto 5);
signal l25: std_logic_vector(22 downto 6);
signal l26: std_logic_vector(23 downto 7);
signal l27: std_logic_vector(24 downto 8);
signal l28: std_logic_vector(25 downto 9);
signal l29: std_logic_vector(26 downto 10);
signal l30: std_logic_vector(27 downto 11);
signal l31: std_logic_vector(28 downto 12);
signal l32: std_logic_vector(29 downto 13);
signal l33: std_logic_vector(30 downto 14);
signal l34: std_logic_vector(31 downto 15);
signal l35: std_logic_vector(32 downto 16);

--Step 1 in Dadda reduction to 28 wires
signal s1_1: std_logic_vector(32 downto 0);	
signal s1_2: std_logic_vector(32 downto 0);
signal s1_3: std_logic_vector(31 downto 1);
signal s1_4: std_logic_vector(31 downto 1);
signal s1_5: std_logic_vector(30 downto 2);
signal s1_6: std_logic_vector(30 downto 2);
signal s1_7: std_logic_vector(29 downto 3);	
signal s1_8: std_logic_vector(29 downto 3);
signal s1_9: std_logic_vector(28 downto 4);
signal s1_10: std_logic_vector(28 downto 4);
signal s1_11: std_logic_vector(27 downto 5);
signal s1_12: std_logic_vector(27 downto 5);
signal s1_13: std_logic_vector(26 downto 6);
signal s1_14: std_logic_vector(26 downto 6);	
signal s1_15: std_logic_vector(25 downto 7);
signal s1_16: std_logic_vector(25 downto 7);
signal s1_17: std_logic_vector(24 downto 8);
signal s1_18: std_logic_vector(24 downto 8);
signal s1_19: std_logic_vector(23 downto 9);
signal s1_20: std_logic_vector(23 downto 9);	
signal s1_21: std_logic_vector(22 downto 10);
signal s1_22: std_logic_vector(22 downto 10);
signal s1_23: std_logic_vector(21 downto 11);
signal s1_24: std_logic_vector(21 downto 11);
signal s1_25: std_logic_vector(20 downto 12);
signal s1_26: std_logic_vector(20 downto 12);
signal s1_27: std_logic_vector(20 downto 13);
signal s1_28: std_logic_vector(20 downto 13);

--Step 2 in Dadda reduction to 19 wires
signal s2_1: std_logic_vector(32 downto 0);	
signal s2_2: std_logic_vector(32 downto 0);
signal s2_3: std_logic_vector(31 downto 1);
signal s2_4: std_logic_vector(31 downto 1);
signal s2_5: std_logic_vector(30 downto 2);
signal s2_6: std_logic_vector(30 downto 2);
signal s2_7: std_logic_vector(29 downto 3);	
signal s2_8: std_logic_vector(29 downto 3);
signal s2_9: std_logic_vector(28 downto 4);
signal s2_10: std_logic_vector(28 downto 4);
signal s2_11: std_logic_vector(27 downto 5);
signal s2_12: std_logic_vector(27 downto 5);
signal s2_13: std_logic_vector(26 downto 6);
signal s2_14: std_logic_vector(26 downto 6);	
signal s2_15: std_logic_vector(25 downto 7);
signal s2_16: std_logic_vector(25 downto 7);
signal s2_17: std_logic_vector(25 downto 8);
signal s2_18: std_logic_vector(24 downto 8);
signal s2_19: std_logic_vector(24 downto 9);

--Step 3 in Dadda reduction to 13 wires
signal s3_1: std_logic_vector(32 downto 0);	
signal s3_2: std_logic_vector(32 downto 0);
signal s3_3: std_logic_vector(31 downto 1);
signal s3_4: std_logic_vector(31 downto 1);
signal s3_5: std_logic_vector(30 downto 2);
signal s3_6: std_logic_vector(30 downto 2);
signal s3_7: std_logic_vector(29 downto 3);	
signal s3_8: std_logic_vector(29 downto 3);
signal s3_9: std_logic_vector(28 downto 4);
signal s3_10: std_logic_vector(28 downto 4);
signal s3_11: std_logic_vector(28 downto 5);
signal s3_12: std_logic_vector(27 downto 5);
signal s3_13: std_logic_vector(27 downto 6);

--Step 4 in Dadda reduction to 9 wires
signal s4_1: std_logic_vector(32 downto 0);	
signal s4_2: std_logic_vector(32 downto 0);
signal s4_3: std_logic_vector(31 downto 1);
signal s4_4: std_logic_vector(31 downto 1);
signal s4_5: std_logic_vector(30 downto 2);
signal s4_6: std_logic_vector(30 downto 2);
signal s4_7: std_logic_vector(30 downto 3);	
signal s4_8: std_logic_vector(29 downto 3);
signal s4_9: std_logic_vector(29 downto 4);

--Step 5 in Dadda reduction to 6 wires
signal s5_1: std_logic_vector(32 downto 0);	
signal s5_2: std_logic_vector(32 downto 0);
signal s5_3: std_logic_vector(31 downto 1);
signal s5_4: std_logic_vector(31 downto 1);
signal s5_5: std_logic_vector(31 downto 2);
signal s5_6: std_logic_vector(31 downto 2);

--Step 6 in Dadda reduction to 4 wires
signal s6_1: std_logic_vector(32 downto 0);	
signal s6_2: std_logic_vector(32 downto 0);
signal s6_3: std_logic_vector(32 downto 1);
signal s6_4: std_logic_vector(32 downto 1);

--Step 7 in Dadda reduction to 3 wires
					--Include the MSBs of both pairs here
signal s7_1: std_logic_vector(33 downto 0);	
signal s7_2: std_logic_vector(33 downto 0);
signal s7_3: std_logic_vector(33 downto 1);

--Step 8 in Dadda reduction to 2 wires
signal s8_1: std_logic_vector(33 downto 0);	
signal s8_2: std_logic_vector(33 downto 0);

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
	s1_4(18) <= carry_3b(l4(14),l5(13),l6(12));
	s1_4(19) <= carry_3b(l6(13),l7(12),l8(11));
	s1_4(20) <= carry_3b(l7(13),l8(12),l9(11));
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

	s1_5(12 downto 4) <= l5(8 downto 0);
	s1_5(13) <= l6(8);
	s1_5(14) <= l7(8);
	s1_5(15) <= sum_2b(l7(9),l8(8));
	s1_5(16) <= sum_3b(l6(11),l7(10),l8(9));
	s1_5(17) <= sum_3b(l7(11),l8(10),l9(9));
	s1_5(18) <= sum_3b(l9(10),l10(9),l11(8));
	s1_5(19) <= l10(10);
	s1_5(20) <= l9(12);
	s1_5(21) <= l9(13);
	s1_5(22) <= l11(12); 
	s1_5(23) <= l12(12);
	s1_5(24) <= l13(12);
	s1_5(25) <= l14(12);
	s1_5(26) <= l15(12);
	s1_5(27) <= l16(12);
	s1_5(28) <= l17(12);


	--Line 6 in 13 wires after 1st reduction

	s1_6(12 downto 5) <= l6(7 downto 0);
	s1_6(13) <= l7(7);
	s1_6(14) <= l8(7);
	s1_6(15) <= l9(7);
	s1_6(16) <= carry_2b(l7(9),l8(8));
	s1_6(17) <= carry_3b(l6(11),l7(10),l8(9));
	s1_6(18) <= carry_3b(l7(11),l8(10),l9(9));
	s1_6(19) <= carry_3b(l9(10),l10(9),l11(8));
	s1_5(20) <= l10(11);
	s1_6(21) <= l10(12);
	s1_6(22) <= l12(11);
	s1_6(23) <= l13(11); 
	s1_6(24) <= l14(12);
	s1_6(25) <= l15(11);
	s1_6(26) <= l16(11);
	s1_6(27) <= l17(11);

	--Line 7 in 13 wires after 1st reduction

	s1_7(12 downto 6) <= l7(6 downto 0);
	s1_7(13) <= l8(6);
	s1_7(14) <= l9(6);
	s1_7(15) <= l10(6);
	s1_7(16) <= sum_3b(l9(8),l10(7),l11(6));
	s1_7(17) <= sum_3b(l10(8),l11(7),l12(6));
	s1_7(18) <= l12(7);
	s1_5(19) <= l11(9);
	s1_7(20) <= l11(10);
	s1_7(21) <= l11(11);
	s1_7(22) <= l13(10);
	s1_7(23) <= l14(10); 
	s1_7(24) <= l15(10);
	s1_7(25) <= l16(10);
	s1_7(26) <= l17(10);


	--Line 8 in 13 wires after 1st reduction

	s1_8(12 downto 7) <= l8(5 downto 0);
	s1_8(13) <= l9(5);
	s1_8(14) <= l10(5);
	s1_8(15) <= l11(5);
	s1_8(16) <= l12(5);
	s1_8(17) <= carry_3b(l9(8),l10(7),l11(6));
	s1_8(18) <= carry_3b(l10(8),l11(7),l12(6));
	s1_8(19) <= l12(8);
	s1_8(20) <= l12(9);
	s1_8(21) <= l12(10);
	s1_8(22) <= l14(9);
	s1_8(23) <= l15(9); 
	s1_8(24) <= l16(9);
	s1_8(25) <= l17(9);	

	--Line 9 in 13 wires after 1st reduction

	s1_9(12 downto 8) <= l9(4 downto 0);
	s1_9(13) <= l10(4);
	s1_9(14) <= l11(4);
	s1_9(15) <= l12(4);
	s1_9(16) <= l13(4);
	s1_9(17) <= l13(5);
	s1_9(18) <= l13(6);
	s1_9(19) <= l13(7);
	s1_9(20) <= l13(8);
	s1_9(21) <= l13(9);
	s1_9(22) <= l15(8);
	s1_9(23) <= l16(8); 
	s1_9(24) <= l17(8);	


	--Line 10 in 13 wires after 1st reduction

	s1_10(12 downto 9) <= l10(3 downto 0);
	s1_10(13) <= l11(3);
	s1_10(14) <= l12(3);
	s1_10(15) <= l13(3);
	s1_10(16) <= l14(3);
	s1_10(17) <= l14(4);
	s1_10(18) <= l14(5);
	s1_10(19) <= l14(6);
	s1_10(20) <= l14(7);
	s1_10(21) <= l14(8);
	s1_10(22) <= l16(7);
	s1_10(23) <= l17(7); 	

	--Line 11 in 13 wires after 1st reduction

	s1_11(12 downto 10) <= l11(2 downto 0);
	s1_11(13) <= l12(2);
	s1_11(14) <= l13(2);
	s1_11(15) <= l14(2);
	s1_11(16) <= l15(2);
	s1_11(17) <= l15(3);
	s1_11(18) <= l15(4);
	s1_11(19) <= l15(5);
	s1_11(20) <= l15(6);
	s1_11(21) <= l15(7);
	s1_11(22) <= l17(6);

	--Line 12 in 13 wires after 1st reduction

	s1_12(12 downto 11) <= l12(1 downto 0);
	s1_12(13) <= l13(1);
	s1_12(14) <= l14(1);
	s1_12(15) <= l15(1);
	s1_12(16) <= l16(1);
	s1_12(17) <= l16(2);
	s1_12(18) <= l16(3);
	s1_12(19) <= l16(4);
	s1_12(20) <= l16(5);
	s1_12(21) <= l16(6);

--Line 13 in 13 wires after 1st reduction

	s1_13(12) <= l13(0);
	s1_13(13) <= l14(0);
	s1_13(14) <= l15(0);
	s1_13(15) <= l15(0);
	s1_13(16) <= l17(0);
	s1_13(17) <= l17(1);
	s1_13(18) <= l17(2);
	s1_13(19) <= l17(3);
	s1_13(20) <= l17(4);
	s1_13(21) <= l17(5);

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
