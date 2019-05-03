library ieee;
use ieee.std_logic_1164.all;
use work.dadda_utils.all;
use ieee.numeric_std.all;

entity dadda_multi_add is
  port(
    a,b: in std_logic_vector(16 downto 0);
    c,d: in std_logic_vector(16 downto 0);
    outp: out std_logic_vector(33 downto 0)
  );
end dadda_multi_add;

architecture dadda_multi_add_arch of dadda_multi_add is
signal abar,cbar : std_logic_vector(16 downto 0);
signal temp_out : std_logic_vector(33 downto 0);
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
	l0(16) <= a(16) xor b(16);
	l0(17) <= a(16) and b(16);

	l1(15 downto 0) <= and_16b(b(0),a(15 downto 0));
	l1(16) <= a(16) and (not b(0));
	l2(16 downto 1) <= and_16b(b(1),a(15 downto 0));
	l2(17) <= a(16) and (not b(1));
	l3(17 downto 2) <= and_16b(b(2),a(15 downto 0));
	l3(18) <= a(16) and (not b(2));
	l4(18 downto 3) <= and_16b(b(3),a(15 downto 0));
	l4(19) <= a(16) and (not b(3));
	l5(19 downto 4) <= and_16b(b(4),a(15 downto 0));
	l5(20) <= a(16) and (not b(4));
	l6(20 downto 5) <= and_16b(b(5),a(15 downto 0));
	l6(21) <= a(16) and (not b(5));
	l7(21 downto 6) <= and_16b(b(6),a(15 downto 0));
	l7(22) <= a(16) and (not b(6));
	l8(22 downto 7) <= and_16b(b(7),a(15 downto 0));
	l8(23) <= a(16) and (not b(7));
	l9(23 downto 8) <= and_16b(b(8),a(15 downto 0));
	l9(24) <= a(16) and (not b(8));
	l10(24 downto 9) <= and_16b(b(9),a(15 downto 0));
	l10(25) <= a(16) and (not b(9));
	l11(25 downto 10) <= and_16b(b(10),a(15 downto 0));
	l11(26) <= a(16) and (not b(10));
	l12(26 downto 11) <= and_16b(b(11),a(15 downto 0));
	l12(27) <= a(16) and (not b(11));
	l13(27 downto 12) <= and_16b(b(12),a(15 downto 0));
	l13(28) <= a(16) and (not b(12));
	l14(28 downto 13) <= and_16b(b(13),a(15 downto 0));
	l14(29) <= a(16) and (not b(13));
	l15(29 downto 14) <= and_16b(b(14),a(15 downto 0));
	l15(30) <= a(16) and (not b(14));
	l16(30 downto 15) <= and_16b(b(15),a(15 downto 0));
	l16(31) <= a(16) and (not b(15));
	abar <= not a;
	l17(31 downto 16) <= and_16b(b(16),abar(15 downto 0));
	l17(32) <= a(16) or b(16);
	
	l18(16) <= c(16) xor d(16);
	l18(17) <= c(16) and d(16);

	-- Partial products in terms of inputs c and d

	l19(15 downto 0) <= and_16b(d(0),c(15 downto 0));
	l19(16) <= c(16) and (not d(0));
	l20(16 downto 1) <= and_16b(d(1),c(15 downto 0));
	l20(17) <= c(16) and (not d(1));
	l21(17 downto 2) <= and_16b(d(2),c(15 downto 0));
	l21(18) <= c(16) and (not d(2));
	l22(18 downto 3) <= and_16b(d(3),c(15 downto 0));
	l22(19) <= c(16) and (not d(3));
	l23(19 downto 4) <= and_16b(d(4),c(15 downto 0));
	l23(20) <= c(16) and (not d(4));
	l24(20 downto 5) <= and_16b(d(5),c(15 downto 0));
	l24(21) <= c(16) and (not d(5));
	l25(21 downto 6) <= and_16b(d(6),c(15 downto 0));
	l25(22) <= c(16) and (not d(6));
	l26(22 downto 7) <= and_16b(d(7),c(15 downto 0));
	l26(23) <= c(16) and (not d(7));
	l27(23 downto 8) <= and_16b(d(8),c(15 downto 0));
	l27(24) <= c(16) and (not d(8));
	l28(24 downto 9) <= and_16b(d(9),c(15 downto 0));
	l28(25) <= c(16) and (not d(9));
	l29(25 downto 10) <= and_16b(d(10),c(15 downto 0));
	l29(26) <= c(16) and (not d(10));
	l30(26 downto 11) <= and_16b(d(11),c(15 downto 0));
	l30(27) <= c(16) and (not d(11));
	l31(27 downto 12) <= and_16b(d(12),c(15 downto 0));
	l31(28) <= c(16) and (not d(12));
	l32(28 downto 13) <= and_16b(d(13),c(15 downto 0));
	l32(29) <= c(16) and (not d(13));
	l33(29 downto 14) <= and_16b(d(14),c(15 downto 0));
	l33(30) <= c(16) and (not d(14));
	l34(30 downto 15) <= and_16b(d(15),c(15 downto 0));
	l34(31) <= c(16) and (not d(15));
	cbar <= not c;
	l35(31 downto 16) <= and_16b(d(16),cbar(15 downto 0));
	l35(32) <= c(16) or d(16);

----------------------------------------------------------------
-----------------------------STEP 1-----------------------------
----------------------------------------------------------------
	--Line 1 in 28 wires after 1st reduction
	s1_1(13 downto 0) <= l1(13 downto 0);
	s1_1(14) <= sum_3b(l1(14),l2(14),l3(14));
	s1_1(15) <= sum_3b(l1(15),l2(15),l3(15));
	s1_1(16) <= sum_3b(l0(16),l1(16),l2(16));
	s1_1(17) <= sum_3b(l0(17),l2(17),l3(17));
	s1_1(18) <= sum_3b(l3(18),l4(18),l5(18));
	s1_1(19) <= sum_3b(l4(19),l5(19),l6(19));
	s1_1(20) <= l5(20);
	s1_1(21) <= l6(21);
	s1_1(22) <= l7(22);
	s1_1(23) <= l8(23);
	s1_1(24) <= l9(24);
	s1_1(25) <= l10(25);
	s1_1(26) <= l11(26);
	s1_1(27) <= l12(27);
	s1_1(28) <= l13(28);
	s1_1(29) <= l14(29);
	s1_1(30) <= l15(30);
	s1_1(31) <= l16(31);
	s1_1(32) <= l17(32);

	--Line 2 in 28 wires after 1st reduction
	s1_2(0) <= l19(0);
	s1_2(13 downto 1) <= l2(13 downto 1);
	s1_2(14) <= l4(14);
	s1_2(15) <= carry_3b(l1(14),l2(14),l3(14));
	s1_2(16) <= carry_3b(l1(15),l2(15),l3(15));
	s1_2(17) <= carry_3b(l0(16),l1(16),l2(16));
	s1_2(18) <= carry_3b(l0(17),l2(17),l3(17));
	s1_2(19) <= carry_3b(l3(18),l4(18),l5(18));
	s1_2(20) <= carry_3b(l4(19),l5(19),l6(19));
	s1_2(21) <= l7(21);
	s1_2(22) <= l8(22);
	s1_2(23) <= l9(23);
	s1_2(24) <= l10(24);
	s1_2(25) <= l11(25);
	s1_2(26) <= l12(26);
	s1_2(27) <= l13(27);
	s1_2(28) <= l14(28);
	s1_2(29) <= l15(29);
	s1_2(30) <= l16(30);
	s1_2(31) <= l17(31);
	s1_2(32) <= l35(32);

	--Line 3 in 28 wires after 1st reduction
	s1_3(1) <= l19(1);
	s1_3(13 downto 2) <= l3(13 downto 2);
	s1_3(14) <= l5(14);
	s1_3(15) <= sum_3b(l4(15),l5(15),l6(15));
	s1_3(16) <= sum_3b(l3(16),l4(16),l5(16));
	s1_3(17) <= sum_3b(l4(17),l5(17),l6(17));
	s1_3(18) <= sum_3b(l6(18),l7(18),l8(18));
	s1_3(19) <= sum_3b(l7(19),l8(19),l9(19));
	s1_3(20) <= l6(20);
	s1_3(21) <= l8(21);
	s1_3(22) <= l9(22); 
	s1_3(23) <= l10(23);
	s1_3(24) <= l11(24);
	s1_3(25) <= l12(25);
	s1_3(26) <= l13(26);
	s1_3(27) <= l14(27);
	s1_3(28) <= l15(28);
	s1_3(29) <= l16(29);
	s1_3(30) <= l17(30);
	s1_3(31) <= l34(31);

	--Line 4 in 28 wires after 1st reduction
	
	s1_4(1) <= l20(1);
	s1_4(2) <= l19(2);
	s1_4(13 downto 3) <= l4(13 downto 3);
	s1_4(14) <= l6(14);
	s1_4(15) <= sum_2b(l7(15),l8(15));
	s1_4(16) <= carry_3b(l4(15),l5(15),l6(15));
	s1_4(17) <= carry_3b(l3(16),l4(16),l5(16));
	s1_4(18) <= carry_3b(l4(17),l5(17),l6(17));
	s1_4(19) <= carry_3b(l6(18),l7(18),l8(18));
	s1_4(20) <= carry_3b(l7(19),l8(19),l9(19));
	s1_4(21) <= l9(21);
	s1_4(22) <= l10(22); 
	s1_4(23) <= l11(23);
	s1_4(24) <= l12(24);
	s1_4(25) <= l13(25);
	s1_4(26) <= l14(26);
	s1_4(27) <= l15(27);
	s1_4(28) <= l16(28);
	s1_4(29) <= l17(29);
	s1_4(30) <= l33(30);
	s1_4(31) <= l35(31);

	--Line 5 in 28 wires after 1st reduction
	s1_5(2) <= l20(2);
	s1_5(3) <= l19(3);
	s1_5(13 downto 4) <= l5(13 downto 4);
	s1_5(14) <= l7(14);
	s1_5(15) <= l9(15);
	s1_5(16) <= carry_2b(l7(15),l8(15));
	s1_5(17) <= sum_3b(l7(17),l8(17),l9(17));
	s1_5(18) <= sum_3b(l9(18),l10(18),l11(18));
	s1_5(19) <= l10(19);
	s1_5(20) <= l7(20);
	s1_5(21) <= l10(21);
	s1_5(22) <= l11(22); 
	s1_5(23) <= l12(23);
	s1_5(24) <= l13(24);
	s1_5(25) <= l14(25);
	s1_5(26) <= l15(26);
	s1_5(27) <= l16(27);
	s1_5(28) <= l17(28);
	s1_5(29) <= l32(29);
	s1_5(30) <= l34(30);

	--Line 6 in 28 wires after 1st reduction
	s1_6(2) <= l21(2);
	s1_6(3) <= l20(3);
	s1_6(4) <= l19(4);
	s1_6(13 downto 5) <= l6(13 downto 5);
	s1_6(14) <= l8(14);
	s1_6(15) <= l10(15);
	s1_6(16) <= sum_3b(l6(16),l7(16),l8(16));
	s1_6(17) <= sum_3b(l10(17),l11(17),l12(17));
	s1_6(18) <= carry_3b(l7(17),l8(17),l9(17));
	s1_6(19) <= carry_3b(l9(18),l10(18),l11(18));
	s1_6(20) <= l8(20);
	s1_6(21) <= l11(21);
	s1_6(22) <= l12(22);
	s1_6(23) <= l13(23); 
	s1_6(24) <= l14(24);
	s1_6(25) <= l15(25);
	s1_6(26) <= l16(26);
	s1_6(27) <= l17(27);
	s1_6(28) <= l31(28);
	s1_6(29) <= l33(29);
	s1_6(30) <= l35(30);

	--Line 7 in 28 wires after 1st reduction
	s1_7(3) <= l21(3);
	s1_7(4) <= l20(4);
	s1_7(5) <= l19(5);
	s1_7(13 downto 6) <= l7(13 downto 6);
	s1_7(14) <= l9(14);
	s1_7(15) <= l11(15);
	s1_7(16) <= sum_3b(l9(16),l10(16),l11(16));
	s1_7(17) <= carry_3b(l6(16),l7(16),l8(16));
	s1_7(18) <= carry_3b(l10(17),l11(17),l12(17));
	s1_7(19) <= l11(19);
	s1_7(20) <= l9(20);
	s1_7(21) <= l12(21);
	s1_7(22) <= l13(22);
	s1_7(23) <= l14(23); 
	s1_7(24) <= l15(24);
	s1_7(25) <= l16(25);
	s1_7(26) <= l17(26);
	s1_7(27) <= l30(27);
	s1_7(28) <= l32(28);
	s1_7(29) <= l34(29);


	--Line 8 in 28 wires after 1st reduction
	s1_8(3) <= l22(3);
	s1_8(4) <= l21(4);
	s1_8(5) <= l20(5);
	s1_8(6) <= l19(6);
	s1_8(13 downto 7) <= l8(13 downto 7);
	s1_8(14) <= l10(14);
	s1_8(15) <= l12(15);
	s1_8(16) <= sum_3b(l12(16),l13(16),l14(16));
	s1_8(17) <= carry_3b(l9(16),l10(16),l11(16));
	s1_8(18) <= sum_3b(l12(18),l13(18),l14(18));
	s1_8(19) <= l12(19);
	s1_8(20) <= l10(20);
	s1_8(21) <= l13(21);
	s1_8(22) <= l14(22);
	s1_8(23) <= l15(23);
	s1_8(24) <= l16(24); 
	s1_8(25) <= l17(25);
	s1_8(26) <= l29(26);	
	s1_8(27) <= l31(27); 
	s1_8(28) <= l33(28);
	s1_8(29) <= l35(29);

	--Line 9 in 28 wires after 1st reduction
	s1_9(4) <= l22(4);
	s1_9(5) <= l21(5);
	s1_9(6) <= l20(6);
	s1_9(7) <= l19(7);
	s1_9(13 downto 8) <= l9(13 downto 8);
	s1_9(14) <= l11(14);
	s1_9(15) <= l13(15);
	s1_9(16) <= sum_2b(l15(16),l16(16));
	s1_9(17) <= carry_3b(l12(16),l13(16),l14(16));
	s1_9(18) <= l15(18);
	s1_9(19) <= carry_3b(l12(18),l13(18),l14(18));
	s1_9(20) <= l11(20);
	s1_9(21) <= l14(21);
	s1_9(22) <= l15(22);
	s1_9(23) <= l16(23); 
	s1_9(24) <= l17(24);
	s1_9(25) <= l28(25);
	s1_9(26) <= l30(26);	
	s1_9(27) <= l32(27); 
	s1_9(28) <= l34(28);

	--Line 10 in 28 wires after 1st reduction
	s1_10(4) <= l23(4);
	s1_10(5) <= l22(5);
	s1_10(6) <= l21(6);
	s1_10(7) <= l20(7);
	s1_10(8) <= l19(8);
	s1_10(13 downto 9) <= l10(13 downto 9);
	s1_10(14) <= l12(14);
	s1_10(15) <= l14(15);
	s1_10(16) <= l17(16);
	s1_10(17) <= carry_2b(l15(16),l16(16));
	s1_10(18) <= l16(18);
	s1_10(19) <= l13(19);
	s1_10(20) <= l12(20);
	s1_10(21) <= l15(21);
	s1_10(22) <= l16(22);
	s1_10(23) <= l17(23);
	s1_10(24) <= l27(24);
	s1_10(25) <= l29(25);
	s1_10(26) <= l31(26);
	s1_10(27) <= l33(27);
	s1_10(28) <= l35(28); 	

	--Line 11 in 28 wires after 1st reduction
	s1_11(5) <= l23(5);
	s1_11(6) <= l22(6);
	s1_11(7) <= l21(7);
	s1_11(8) <= l20(8);
	s1_11(9) <= l19(9);
	s1_11(13 downto 10) <= l11(13 downto 10);
	s1_11(14) <= l13(14);
	s1_11(15) <= l15(15);
	s1_11(16) <= l18(16);
	s1_11(17) <= sum_3b(l13(17),l14(17),l15(17));
	s1_11(18) <= l17(18);
	s1_11(19) <= l14(19);
	s1_11(20) <= l13(20);
	s1_11(21) <= l16(21);
	s1_11(22) <= l17(22);
	s1_11(23) <= l26(23);
	s1_11(24) <= l28(24);
	s1_11(25) <= l30(25);
	s1_11(26) <= l32(26);
	s1_11(27) <= l34(27);

	--Line 12 in 28 wires after 1st reduction
	s1_12(5) <= l24(5);
	s1_12(6) <= l23(6);
	s1_12(7) <= l22(7);
	s1_12(8) <= l21(8);
	s1_12(9) <= l20(9);
	s1_12(10) <= l19(10);
	s1_12(13 downto 11) <= l12(13 downto 11);
	s1_12(14) <= l14(14);
	s1_12(15) <= l16(15);
	s1_12(16) <= l19(16);
	s1_12(17) <= sum_3b(l16(17),l17(17),l18(17));
	s1_12(18) <= carry_3b(l13(17),l14(17),l15(17));
	s1_12(19) <= l15(19);
	s1_12(20) <= l14(20);
	s1_12(21) <= l17(21);
	s1_12(22) <= l25(22);
	s1_12(23) <= l27(23);
	s1_12(24) <= l29(24);
	s1_12(25) <= l31(25);
	s1_12(26) <= l33(26);
	s1_12(27) <= l35(27);

	-- Line 13 in 28 wires after 1st reduction
	s1_13(6) <= l24(6);
	s1_13(7) <= l23(7);
	s1_13(8) <= l22(8);
	s1_13(9) <= l21(9);
	s1_13(10) <= l20(10);
	s1_13(11) <= l19(11);
	s1_13(12) <= l13(12);
	s1_13(13) <= l13(13);
	s1_13(14) <= l15(14);
	s1_13(15) <= l19(15);
	s1_13(16) <= l20(16);
	s1_13(17) <= l20(17);
	s1_13(18) <= carry_3b(l16(17),l17(17),l18(17));
	s1_13(19) <= l16(19);
	s1_13(20) <= l15(20);
	s1_13(21) <= l24(21);
	s1_13(22) <= l26(22);
	s1_13(23) <= l28(23);
	s1_13(24) <= l30(24);
	s1_13(25) <= l32(25);
	s1_13(26) <= l34(26);

	-- Line 14 in 28 wires after 1st reduction
	s1_14(6) <= l25(6);
	s1_14(7) <= l24(7);
	s1_14(8) <= l23(8);
	s1_14(9) <= l22(9);
	s1_14(10) <= l21(10);
	s1_14(11) <= l20(11);
	s1_14(12) <= l19(12);
	s1_14(13) <= l14(13);
	s1_14(14) <= l19(14);
	s1_14(15) <= l20(15);
	s1_14(16) <= l21(16);
	s1_14(17) <= l21(17);
	s1_14(18) <= l21(18);
	s1_14(19) <= l17(19);
	s1_14(20) <= l16(20);
	s1_14(21) <= l25(21);
	s1_14(22) <= l27(22);
	s1_14(23) <= l29(23);
	s1_14(24) <= l31(24);
	s1_14(25) <= l33(25);
	s1_14(26) <= l35(26);

	-- Line 15 in 28 wires after 1st reduction
	s1_15(7) <= l25(7);
	s1_15(8) <= l24(8);
	s1_15(9) <= l23(9);
	s1_15(10) <= l22(10);
	s1_15(11) <= l21(11);
	s1_15(12) <= l20(12);
	s1_15(13) <= l19(13);
	s1_15(14) <= l20(14);
	s1_15(15) <= l21(15);
	s1_15(16) <= l22(16);
	s1_15(17) <= l22(17);
	s1_15(18) <= l22(18);
	s1_15(19) <= l22(19);
	s1_15(20) <= l17(20);
	s1_15(21) <= l26(21);
	s1_15(22) <= l28(22);
	s1_15(23) <= l30(23);
	s1_15(24) <= l32(24);
	s1_15(25) <= l34(25);

	-- Line 16 in 28 wires after 1st reduction
	s1_16(7) <= l26(7);
	s1_16(8) <= l25(8);
	s1_16(9) <= l24(9);
	s1_16(10) <= l23(10);
	s1_16(11) <= l22(11);
	s1_16(12) <= l21(12);
	s1_16(13) <= l20(13);
	s1_16(14) <= l21(14);
	s1_16(15) <= l22(15);
	s1_16(20 downto 16) <= l23(20 downto 16);
	s1_16(21) <= l27(21);
	s1_16(22) <= l29(22);
	s1_16(23) <= l31(23);
	s1_16(24) <= l33(24);
	s1_16(25) <= l35(25);

	-- Line 17 in 28 wires after 1st reduction
	s1_17(8) <= l26(8);
	s1_17(9) <= l25(9);
	s1_17(10) <= l24(10);
	s1_17(11) <= l23(11);
	s1_17(12) <= l22(12);
	s1_17(13) <= l21(13);
	s1_17(14) <= l22(14);
	s1_17(15) <= l23(15);
	s1_17(20 downto 16) <= l24(20 downto 16);
	s1_17(21) <= l28(21);
	s1_17(22) <= l30(22);
	s1_17(23) <= l32(23);
	s1_17(24) <= l34(24);

	-- Line 18 in 28 wires after 1st reduction
	s1_18(8) <= l27(8);
	s1_18(9) <= l26(9);
	s1_18(10) <= l25(10);
	s1_18(11) <= l24(11);
	s1_18(12) <= l23(12);
	s1_18(13) <= l22(13);
	s1_18(14) <= l23(14);
	s1_18(15) <= l24(15);
	s1_18(20 downto 16) <= l25(20 downto 16);
	s1_18(21) <= l29(21);
	s1_18(22) <= l31(22);
	s1_18(23) <= l33(23);
	s1_18(24) <= l35(24);

	-- Line 19 in 28 wires after 1st reduction
	s1_19(9) <= l27(9);
	s1_19(10) <= l26(10);
	s1_19(11) <= l25(11);
	s1_19(12) <= l24(12);
	s1_19(13) <= l23(13);
	s1_19(14) <= l24(14);
	s1_19(15) <= l25(15);
	s1_19(20 downto 16) <= l26(20 downto 16);
	s1_19(21) <= l30(21);
	s1_19(22) <= l32(22);
	s1_19(23) <= l34(23);

	-- Line 20 in 28 wires after 1st reduction
	s1_20(9) <= l28(9);
	s1_20(10) <= l27(10);
	s1_20(11) <= l26(11);
	s1_20(12) <= l25(12);
	s1_20(13) <= l24(13);
	s1_20(14) <= l25(14);
	s1_20(15) <= l26(15);
	s1_20(20 downto 16) <= l27(20 downto 16);
	s1_20(21) <= l31(21);
	s1_20(22) <= l33(22);
	s1_20(23) <= l35(23);

	--Line 21 in 28 wires after 1st reduction
	s1_21(10) <= l28(10);
	s1_21(11) <= l27(11);
	s1_21(12) <= l26(12);
	s1_21(13) <= l25(13);
	s1_21(14) <= l26(14);
	s1_21(15) <= l27(15);
	s1_21(20 downto 16) <= l28(20 downto 16);
	s1_21(21) <= l32(21);
	s1_21(22) <= l34(22);

	-- Line 22 in 28 wires after 1st reduction
	s1_22(10) <= l29(10);
	s1_22(11) <= l28(11);
	s1_22(12) <= l27(12);
	s1_22(13) <= l26(13);
	s1_22(14) <= l27(14);
	s1_22(15) <= l28(15);
	s1_22(20 downto 16) <= l29(20 downto 16);
	s1_22(21) <= l33(21);
	s1_22(22) <= l35(22);

	-- Line 23 in 28 wires after 1st reduction
	s1_23(11) <= l29(11);
	s1_23(12) <= l28(12);
	s1_23(13) <= l27(13);
	s1_23(14) <= l28(14);
	s1_23(15) <= l29(15);
	s1_23(20 downto 16) <= l30(20 downto 16);
	s1_23(21) <= l34(21);

	-- Line 24 in 28 wires after 1st reduction
	s1_24(11) <= l30(11);
	s1_24(12) <= l29(12);
	s1_24(13) <= l28(13);
	s1_24(14) <= l29(14);
	s1_24(15) <= l30(15);
	s1_24(20 downto 16) <= l31(20 downto 16);
	s1_24(21) <= l35(21);

	--Line 25 in 28 wires after 1st reduction
	s1_25(12) <= l30(12);
	s1_25(13) <= l29(13);
	s1_25(14) <= l30(14);
	s1_25(15) <= l31(15);
	s1_25(20 downto 16) <= l32(20 downto 16);

	--Line 26 in 28 wires after 1st reduction
	s1_26(12) <= l31(12);
	s1_26(13) <= l30(13);
	s1_26(14) <= l31(14);
	s1_26(15) <= l32(15);
	s1_26(20 downto 16) <= l33(20 downto 16);

	--Line 27 in 28 wires after 1st reduction
	s1_27(13) <= l31(13);
	s1_27(14) <= l32(14);
	s1_27(15) <= l33(15);
	s1_27(20 downto 16) <= l34(20 downto 16);

	--Line 28 in 28 wires after 1st reduction
	s1_28(13) <= l32(13);
	s1_28(14) <= l33(14);
	s1_28(15) <= l34(15);
	s1_28(20 downto 16) <= l35(20 downto 16);

----------------------------------------------------------------
-----------------------------STEP 2-----------------------------
----------------------------------------------------------------
	--Line 1 in 19 wires after 2nd reduction
	s2_1(8 downto 0) <= s1_1(8 downto 0);
	s2_1(9) <= sum_2b(s1_1(9),s1_2(9));
	s2_1(10) <= sum_3b(s1_1(10),s1_2(10),s1_3(10));
	s2_1(11) <= sum_3b(s1_1(11),s1_2(11),s1_3(11));
	s2_1(12) <= sum_3b(s1_1(12),s1_2(12),s1_3(12));
	s2_1(13) <= sum_3b(s1_1(13),s1_2(13),s1_3(13));
	s2_1(14) <= sum_3b(s1_1(14),s1_2(14),s1_3(14));
	s2_1(15) <= sum_3b(s1_1(15),s1_2(15),s1_3(15));
	s2_1(16) <= sum_3b(s1_1(16),s1_2(16),s1_3(16));
	s2_1(17) <= sum_3b(s1_1(17),s1_2(17),s1_3(17));
	s2_1(18) <= sum_3b(s1_1(18),s1_2(18),s1_3(18));
	s2_1(19) <= sum_3b(s1_1(19),s1_2(19),s1_3(19));
	s2_1(20) <= sum_3b(s1_1(20),s1_2(20),s1_3(20));
	s2_1(21) <= sum_3b(s1_1(21),s1_2(21),s1_3(21));
	s2_1(22) <= sum_3b(s1_1(22),s1_2(22),s1_3(22));
	s2_1(23) <= sum_3b(s1_1(23),s1_2(23),s1_3(23));
	s2_1(24) <= sum_3b(s1_1(24),s1_2(24),s1_3(24));
	s2_1(32 downto 25) <= s1_1(32 downto 25);

	--Line 2 in 19 wires after 2nd reduction
	s2_2(8 downto 0) <= s1_2(8 downto 0);
	s2_2(9) <= s1_3(9);
	s2_2(10) <= carry_2b(s1_1(9),s1_2(9));
	s2_2(11) <= carry_3b(s1_1(10),s1_2(10),s1_3(10));
	s2_2(12) <= carry_3b(s1_1(11),s1_2(11),s1_3(11));
	s2_2(13) <= carry_3b(s1_1(12),s1_2(12),s1_3(12));
	s2_2(14) <= carry_3b(s1_1(13),s1_2(13),s1_3(13));
	s2_2(15) <= carry_3b(s1_1(14),s1_2(14),s1_3(14));
	s2_2(16) <= carry_3b(s1_1(15),s1_2(15),s1_3(15));
	s2_2(17) <= carry_3b(s1_1(16),s1_2(16),s1_3(16));
	s2_2(18) <= carry_3b(s1_1(17),s1_2(17),s1_3(17));
	s2_2(19) <= carry_3b(s1_1(18),s1_2(18),s1_3(18));
	s2_2(20) <= carry_3b(s1_1(19),s1_2(19),s1_3(19));
	s2_2(21) <= carry_3b(s1_1(20),s1_2(20),s1_3(20));
	s2_2(22) <= carry_3b(s1_1(21),s1_2(21),s1_3(21));
	s2_2(23) <= carry_3b(s1_1(22),s1_2(22),s1_3(22));
	s2_2(24) <= carry_3b(s1_1(23),s1_2(23),s1_3(23));
	s2_2(25) <= carry_3b(s1_1(24),s1_2(24),s1_3(24));
	s2_2(32 downto 26) <= s1_2(32 downto 26);

	--Line 3 in 19 wires after 2nd reduction
	s2_3(8 downto 1) <= s1_3(8 downto 1);
	s2_3(9) <= s1_4(9);
	s2_3(10) <= sum_3b(s1_4(10),s1_5(10),s1_6(10));
	s2_3(11) <= sum_3b(s1_4(11),s1_5(11),s1_6(11));
	s2_3(12) <= sum_3b(s1_4(12),s1_5(12),s1_6(12));
	s2_3(13) <= sum_3b(s1_4(13),s1_5(13),s1_6(13));
	s2_3(14) <= sum_3b(s1_4(14),s1_5(14),s1_6(14));
	s2_3(15) <= sum_3b(s1_4(15),s1_5(15),s1_6(15));
	s2_3(16) <= sum_3b(s1_4(16),s1_5(16),s1_6(16));
	s2_3(17) <= sum_3b(s1_4(17),s1_5(17),s1_6(17));
	s2_3(18) <= sum_3b(s1_4(18),s1_5(18),s1_6(18));
	s2_3(19) <= sum_3b(s1_4(19),s1_5(19),s1_6(19));
	s2_3(20) <= sum_3b(s1_4(20),s1_5(20),s1_6(20));
	s2_3(21) <= sum_3b(s1_4(21),s1_5(21),s1_6(21));
	s2_3(22) <= sum_3b(s1_4(22),s1_5(22),s1_6(22));
	s2_3(23) <= sum_3b(s1_4(23),s1_5(23),s1_6(23));
	s2_3(24) <= s1_4(24);
	s2_3(25) <= s1_2(25);
	s2_3(31 downto 26) <= s1_3(31 downto 26);

	--Line 4 in 19 wires after 2nd reduction
	s2_4(8 downto 1) <= s1_4(8 downto 1);
	s2_4(9) <= s1_5(9);
	s2_4(10) <= s1_7(10);
	s2_4(11) <= carry_3b(s1_4(10),s1_5(10),s1_6(10));
	s2_4(12) <= carry_3b(s1_4(11),s1_5(11),s1_6(11));
	s2_4(13) <= carry_3b(s1_4(12),s1_5(12),s1_6(12));
	s2_4(14) <= carry_3b(s1_4(13),s1_5(13),s1_6(13));
	s2_4(15) <= carry_3b(s1_4(14),s1_5(14),s1_6(14));
	s2_4(16) <= carry_3b(s1_4(15),s1_5(15),s1_6(15));
	s2_4(17) <= carry_3b(s1_4(16),s1_5(16),s1_6(16));
	s2_4(18) <= carry_3b(s1_4(17),s1_5(17),s1_6(17));
	s2_4(19) <= carry_3b(s1_4(18),s1_5(18),s1_6(18));
	s2_4(20) <= carry_3b(s1_4(19),s1_5(19),s1_6(19));
	s2_4(21) <= carry_3b(s1_4(20),s1_5(20),s1_6(20));
	s2_4(22) <= carry_3b(s1_4(21),s1_5(21),s1_6(21));
	s2_4(23) <= carry_3b(s1_4(22),s1_5(22),s1_6(22));
	s2_4(24) <= carry_3b(s1_4(23),s1_5(23),s1_6(23));
	s2_4(25) <= s1_3(25);
	s2_4(31 downto 26) <= s1_4(31 downto 26);

	--Line 5 in 19 wires after 2nd reduction
	s2_5(8 downto 2) <= s1_5(8 downto 2);
	s2_5(9) <= s1_6(9);
	s2_5(10) <= s1_8(10);
	s2_5(11) <= sum_3b(s1_7(11),s1_8(11),s1_9(11));
	s2_5(12) <= sum_3b(s1_7(12),s1_8(12),s1_9(12));
	s2_5(13) <= sum_3b(s1_7(13),s1_8(13),s1_9(13));
	s2_5(14) <= sum_3b(s1_7(14),s1_8(14),s1_9(14));
	s2_5(15) <= sum_3b(s1_7(15),s1_8(15),s1_9(15));
	s2_5(16) <= sum_3b(s1_7(16),s1_8(16),s1_9(16));
	s2_5(17) <= sum_3b(s1_7(17),s1_8(17),s1_9(17));
	s2_5(18) <= sum_3b(s1_7(18),s1_8(18),s1_9(18));
	s2_5(19) <= sum_3b(s1_7(19),s1_8(19),s1_9(19));
	s2_5(20) <= sum_3b(s1_7(20),s1_8(20),s1_9(20));
	s2_5(21) <= sum_3b(s1_7(21),s1_8(21),s1_9(21));
	s2_5(22) <= sum_3b(s1_7(22),s1_8(22),s1_9(22));
	s2_5(23) <= sum_3b(s1_7(23),s1_8(23),s1_9(23));
	s2_5(24) <= s1_5(24);
	s2_5(25) <= s1_4(25);
	s2_5(30 downto 26) <= s1_5(30 downto 26);

	--Line 6 in 19 wires after 2nd reduction
	s2_6(8 downto 2) <= s1_6(8 downto 2);
	s2_6(9) <= s1_7(9);
	s2_6(10) <= s1_9(10);
	s2_6(11) <= sum_2b(s1_10(11),s1_11(11));
	s2_6(12) <= carry_3b(s1_7(11),s1_8(11),s1_9(11));
	s2_6(13) <= carry_3b(s1_7(12),s1_8(12),s1_9(12));
	s2_6(14) <= carry_3b(s1_7(13),s1_8(13),s1_9(13));
	s2_6(15) <= carry_3b(s1_7(14),s1_8(14),s1_9(14));
	s2_6(16) <= carry_3b(s1_7(15),s1_8(15),s1_9(15));
	s2_6(17) <= carry_3b(s1_7(16),s1_8(16),s1_9(16));
	s2_6(18) <= carry_3b(s1_7(17),s1_8(17),s1_9(17));
	s2_6(19) <= carry_3b(s1_7(18),s1_8(18),s1_9(18));
	s2_6(20) <= carry_3b(s1_7(19),s1_8(19),s1_9(19));
	s2_6(21) <= carry_3b(s1_7(20),s1_8(20),s1_9(20));
	s2_6(22) <= carry_3b(s1_7(21),s1_8(21),s1_9(21));
	s2_6(23) <= carry_3b(s1_7(22),s1_8(22),s1_9(22));
	s2_6(24) <= carry_3b(s1_7(23),s1_8(23),s1_9(23));
	s2_6(25) <= s1_5(25);
	s2_6(30 downto 26) <= s1_6(30 downto 26);

	--Line 7 in 19 wires after 2nd reduction
	s2_7(8 downto 3) <= s1_7(8 downto 3);
	s2_7(9) <= s1_8(9);
	s2_7(10) <= s1_10(10);
	s2_7(11) <= s1_12(11);
	s2_7(12) <= carry_2b(s1_10(11),s1_11(11));
	s2_7(13) <= sum_3b(s1_10(13),s1_11(13),s1_12(13));
	s2_7(14) <= sum_3b(s1_10(14),s1_11(14),s1_12(14));
	s2_7(15) <= sum_3b(s1_10(15),s1_11(15),s1_12(15));
	s2_7(16) <= sum_3b(s1_10(16),s1_11(16),s1_12(16));
	s2_7(17) <= sum_3b(s1_10(17),s1_11(17),s1_12(17));
	s2_7(18) <= sum_3b(s1_10(18),s1_11(18),s1_12(18));
	s2_7(19) <= sum_3b(s1_10(19),s1_11(19),s1_12(19));
	s2_7(20) <= sum_3b(s1_10(20),s1_11(20),s1_12(20));
	s2_7(21) <= sum_3b(s1_10(21),s1_11(21),s1_12(21));
	s2_7(22) <= sum_3b(s1_10(22),s1_11(22),s1_12(22));
	s2_7(23) <= s1_10(23);
	s2_7(24) <= s1_6(24);
	s2_7(25) <= s1_6(25);
	s2_7(29 downto 26) <= s1_7(29 downto 26);

	--Line 8 in 19 wires after 2nd reduction
	s2_8(8 downto 3) <= s1_8(8 downto 3);
	s2_8(9) <= s1_9(9);
	s2_8(10) <= s1_11(10);
	s2_8(11) <= s1_13(11);
	s2_8(12) <= sum_3b(s1_10(12),s1_11(12),s1_12(12));
	s2_8(13) <= sum_3b(s1_13(13),s1_14(13),s1_15(13));
	s2_8(14) <= carry_3b(s1_10(13),s1_11(13),s1_12(13));
	s2_8(15) <= carry_3b(s1_10(14),s1_11(14),s1_12(14));
	s2_8(16) <= carry_3b(s1_10(15),s1_11(15),s1_12(15));
	s2_8(17) <= carry_3b(s1_10(16),s1_11(16),s1_12(16));
	s2_8(18) <= carry_3b(s1_10(17),s1_11(17),s1_12(17));
	s2_8(19) <= carry_3b(s1_10(18),s1_11(18),s1_12(18));
	s2_8(20) <= carry_3b(s1_10(19),s1_11(19),s1_12(19));
	s2_8(21) <= carry_3b(s1_10(20),s1_11(20),s1_12(20));
	s2_8(22) <= carry_3b(s1_10(21),s1_11(21),s1_12(21));
	s2_8(23) <= carry_3b(s1_10(22),s1_11(22),s1_12(22));
	s2_8(24) <= s1_7(24);
	s2_8(25) <= s1_7(25);
	s2_8(29 downto 26) <= s1_8(29 downto 26);

	--Line 9 in 19 wires after 2nd reduction
	s2_9(8 downto 4) <= s1_9(8 downto 4);
	s2_9(9) <= s1_10(9);
	s2_9(10) <= s1_12(10);
	s2_9(11) <= s1_14(11);
	s2_9(12) <= sum_3b(s1_13(12),s1_14(12),s1_15(12));
	s2_9(13) <= carry_3b(s1_10(12),s1_11(12),s1_12(12));
	s2_9(14) <= carry_3b(s1_13(13),s1_14(13),s1_15(13));
	s2_9(15) <= sum_3b(s1_13(15),s1_14(15),s1_15(15));
	s2_9(16) <= sum_3b(s1_13(16),s1_14(16),s1_15(16));
	s2_9(17) <= sum_3b(s1_13(17),s1_14(17),s1_15(17));
	s2_9(18) <= sum_3b(s1_13(18),s1_14(18),s1_15(18));
	s2_9(19) <= sum_3b(s1_13(19),s1_14(19),s1_15(19));
	s2_9(20) <= sum_3b(s1_13(20),s1_14(20),s1_15(20));
	s2_9(21) <= sum_3b(s1_13(21),s1_14(21),s1_15(21));
	s2_9(22) <= sum_3b(s1_13(22),s1_14(22),s1_15(22));
	s2_9(23) <= s1_11(23);
	s2_9(24) <= s1_8(24);
	s2_9(25) <= s1_8(25);
	s2_9(28 downto 26) <= s1_9(28 downto 26);

	--Line 10 in 19 wires after 2nd reduction
	s2_10(8 downto 4) <= s1_10(8 downto 4);
	s2_10(9) <= s1_11(9);
	s2_10(10) <= s1_13(10);
	s2_10(11) <= s1_15(11);
	s2_10(12) <= sum_2b(s1_16(12),s1_17(12));
	s2_10(13) <= carry_3b(s1_13(12),s1_14(12),s1_15(12));
	s2_10(14) <= sum_3b(s1_13(14),s1_14(14),s1_15(14));
	s2_10(15) <= sum_3b(s1_16(15),s1_17(15),s1_18(15));
	s2_10(16) <= carry_3b(s1_13(15),s1_14(15),s1_15(15));
	s2_10(17) <= carry_3b(s1_13(16),s1_14(16),s1_15(16));
	s2_10(18) <= carry_3b(s1_13(17),s1_14(17),s1_15(17));
	s2_10(19) <= carry_3b(s1_13(18),s1_14(18),s1_15(18));
	s2_10(20) <= carry_3b(s1_13(19),s1_14(19),s1_15(19));
	s2_10(21) <= carry_3b(s1_13(20),s1_14(20),s1_15(20));
	s2_10(22) <= carry_3b(s1_13(21),s1_14(21),s1_15(21));
	s2_10(23) <= carry_3b(s1_13(22),s1_14(22),s1_15(22));
	s2_10(24) <= s1_9(24);
	s2_10(25) <= s1_9(25);
	s2_10(28 downto 26) <= s1_10(28 downto 26);

	--Line 11 in 19 wires after 2nd reduction
	s2_11(8 downto 5) <= s1_11(8 downto 5);
	s2_11(9) <= s1_12(9);
	s2_11(10) <= s1_14(10);
	s2_11(11) <= s1_16(11);
	s2_11(12) <= s1_18(12);
	s2_11(13) <= carry_2b(s1_16(12),s1_17(12));
	s2_11(14) <= sum_3b(s1_16(14),s1_17(14),s1_18(14));
	s2_11(15) <= carry_3b(s1_13(14),s1_14(14),s1_15(14));
	s2_11(16) <= carry_3b(s1_16(15),s1_17(15),s1_18(15));
	s2_11(17) <= sum_3b(s1_16(17),s1_17(17),s1_18(17));
	s2_11(18) <= sum_3b(s1_16(18),s1_17(18),s1_18(18));
	s2_11(19) <= sum_3b(s1_16(19),s1_17(19),s1_18(19));
	s2_11(20) <= sum_3b(s1_16(20),s1_17(20),s1_18(20));
	s2_11(21) <= sum_3b(s1_16(21),s1_17(21),s1_18(21));
	s2_11(22) <= s1_16(22);
	s2_11(23) <= s1_12(23);
	s2_11(24) <= s1_10(24);
	s2_11(25) <= s1_10(25);
	s2_11(27 downto 26) <= s1_11(27 downto 26);

	--Line 12 in 19 wires after 2nd reduction
	s2_12(8 downto 5) <= s1_12(8 downto 5);
	s2_12(9) <= s1_12(9);
	s2_12(10) <= s1_14(10);
	s2_12(11) <= s1_16(11);
	s2_12(12) <= s1_18(12);
	s2_12(13) <= sum_3b(s1_16(13),s1_17(13),s1_18(13));
	s2_12(14) <= sum_3b(s1_19(14),s1_20(14),s1_21(14));
	s2_12(15) <= carry_3b(s1_13(14),s1_14(14),s1_15(14));
	s2_12(16) <= sum_3b(s1_16(16),s1_17(16),s1_18(16));
	s2_12(17) <= sum_3b(s1_19(17),s1_20(17),s1_21(17));
	s2_12(18) <= carry_3b(s1_16(17),s1_17(17),s1_18(17));
	s2_12(19) <= carry_3b(s1_16(18),s1_17(18),s1_18(18));
	s2_12(20) <= carry_3b(s1_16(19),s1_17(19),s1_18(19));
	s2_12(21) <= carry_3b(s1_16(20),s1_17(20),s1_18(20));
	s2_12(22) <= carry_3b(s1_16(21),s1_17(21),s1_18(21));
	s2_12(23) <= s1_13(23);
	s2_12(24) <= s1_11(24);
	s2_12(25) <= s1_11(25);
	s2_12(27 downto 26) <= s1_12(27 downto 26);

	--Line 13 in 19 wires after 2nd reduction
	s2_13(8 downto 6) <= s1_13(8 downto 6);
	s2_13(9) <= s1_14(9);
	s2_13(10) <= s1_16(10);
	s2_13(11) <= s1_18(11);
	s2_13(12) <= s1_20(12);
	s2_13(13) <= sum_3b(s1_19(13),s1_20(13),s1_21(13));
	s2_13(14) <= carry_3b(s1_16(13),s1_17(13),s1_18(13));
	s2_13(15) <= carry_3b(s1_19(14),s1_20(14),s1_21(14));
	s2_13(16) <= sum_3b(s1_19(16),s1_20(16),s1_21(16));
	s2_13(17) <= carry_3b(s1_16(16),s1_17(16),s1_18(16));
	s2_13(18) <= carry_3b(s1_19(17),s1_20(17),s1_21(17));
	s2_13(19) <= sum_3b(s1_19(19),s1_20(19),s1_21(19));
	s2_13(20) <= sum_3b(s1_19(20),s1_20(20),s1_21(20));
	s2_13(21) <= sum_3b(s1_19(21),s1_20(21),s1_21(21));
	s2_13(22) <= s1_17(22);
	s2_13(23) <= s1_14(23);
	s2_13(24) <= s1_12(24);
	s2_13(25) <= s1_12(25);
	s2_13(26) <= s1_13(26);

	--Line 14 in 19 wires after 2nd reduction
	s2_14(8 downto 6) <= s1_14(8 downto 6);
	s2_14(9) <= s1_15(9);
	s2_14(10) <= s1_17(10);
	s2_14(11) <= s1_19(11);
	s2_14(12) <= s1_21(12);
	s2_14(13) <= sum_2b(s1_22(13),s1_23(13));
	s2_14(14) <= carry_3b(s1_19(13),s1_20(13),s1_21(13));
	s2_14(15) <= sum_3b(s1_19(15),s1_20(15),s1_21(15));
	s2_14(16) <= sum_3b(s1_22(16),s1_23(16),s1_24(16));
	s2_14(17) <= carry_3b(s1_19(16),s1_20(16),s1_21(16));
	s2_14(18) <= sum_3b(s1_19(18),s1_20(18),s1_21(18));
	s2_14(19) <= sum_3b(s1_22(19),s1_23(19),s1_24(19));
	s2_14(20) <= carry_3b(s1_19(19),s1_20(19),s1_21(19));
	s2_14(21) <= carry_3b(s1_19(20),s1_20(20),s1_21(20));
	s2_14(22) <= carry_3b(s1_19(21),s1_20(21),s1_21(21));
	s2_14(23) <= s1_15(23);
	s2_14(24) <= s1_13(24);
	s2_14(25) <= s1_13(25);
	s2_14(26) <= s1_14(26);

	--Line 15 in 19 wires after 2nd reduction
	s2_15(8 downto 7) <= s1_15(8 downto 7);
	s2_15(9) <= s1_16(9);
	s2_15(10) <= s1_18(10);
	s2_15(11) <= s1_20(11);
	s2_15(12) <= s1_22(12);
	s2_15(13) <= s1_24(13);
	s2_15(14) <= carry_2b(s1_22(13),s1_23(13));
	s2_15(15) <= sum_3b(s1_22(15),s1_23(15),s1_24(15));
	s2_15(16) <= carry_3b(s1_19(15),s1_20(15),s1_21(15));
	s2_15(17) <= carry_3b(s1_22(16),s1_23(16),s1_24(16));
	s2_15(18) <= sum_3b(s1_22(18),s1_23(18),s1_24(18));
	s2_15(19) <= carry_3b(s1_19(18),s1_20(18),s1_21(18));
	s2_15(20) <= carry_3b(s1_22(19),s1_23(19),s1_24(19));
	s2_15(21) <= s1_22(21);
	s2_15(22) <= s1_18(22);
	s2_15(23) <= s1_16(23);
	s2_15(24) <= s1_14(24);
	s2_15(25) <= s1_14(25);

	--Line 16 in 19 wires after 2nd reduction
	s2_16(8 downto 7) <= s1_16(8 downto 7);
	s2_16(9) <= s1_17(9);
	s2_16(10) <= s1_19(10);
	s2_16(11) <= s1_21(11);
	s2_16(12) <= s1_23(12);
	s2_16(13) <= s1_25(13);
	s2_16(14) <= sum_3b(s1_22(14),s1_23(14),s1_24(14));
	s2_16(15) <= sum_3b(s1_25(15),s1_26(15),s1_27(15));
	s2_16(16) <= carry_3b(s1_22(15),s1_23(15),s1_24(15));
	s2_16(17) <= sum_3b(s1_22(17),s1_23(17),s1_24(17));
	s2_16(18) <= sum_3b(s1_25(18),s1_26(18),s1_27(18));
	s2_16(19) <= carry_3b(s1_22(18),s1_23(18),s1_24(18));
	s2_16(20) <= sum_3b(s1_22(20),s1_23(20),s1_24(20));
	s2_16(21) <= s1_23(21);
	s2_16(22) <= s1_19(22);
	s2_16(23) <= s1_17(23);
	s2_16(24) <= s1_15(24);
	s2_16(25) <= s1_15(25);

	--Line 17 in 19 wires after 2nd reduction
	s2_17(8) <= s1_17(8);
	s2_17(9) <= s1_18(9);
	s2_17(10) <= s1_20(10);
	s2_17(11) <= s1_22(11);
	s2_17(12) <= s1_24(12);
	s2_17(13) <= s1_26(13);
	s2_17(14) <= sum_2b(s1_25(14),s1_26(14));
	s2_17(15) <= carry_3b(s1_22(14),s1_23(14),s1_24(14));
	s2_17(16) <= carry_3b(s1_25(15),s1_26(15),s1_27(15));
	s2_17(17) <= sum_3b(s1_25(17),s1_26(17),s1_27(17));
	s2_17(18) <= carry_3b(s1_22(17),s1_23(17),s1_24(17));
	s2_17(19) <= carry_3b(s1_25(18),s1_26(18),s1_27(18));
	s2_17(20) <= sum_3b(s1_25(20),s1_26(20),s1_27(20));
	s2_17(21) <= carry_3b(s1_22(20),s1_23(20),s1_24(20));
	s2_17(22) <= s1_20(22);
	s2_17(23) <= s1_18(23);
	s2_17(24) <= s1_16(24);
	s2_17(25) <= s1_16(25);

	--Line 18 in 19 wires after 2nd reduction
	s2_18(8) <= s1_18(8);
	s2_18(9) <= s1_19(9);
	s2_18(10) <= s1_21(10);
	s2_18(11) <= s1_23(11);
	s2_18(12) <= s1_25(12);
	s2_18(13) <= s1_27(13);
	s2_18(14) <= s1_27(14);
	s2_18(15) <= carry_2b(s1_25(14),s1_26(14));
	s2_18(16) <= sum_3b(s1_25(16),s1_26(16),s1_27(16));
	s2_18(17) <= s1_28(17);
	s2_18(18) <= carry_3b(s1_25(17),s1_26(17),s1_27(17));
	s2_18(19) <= sum_3b(s1_25(19),s1_26(19),s1_27(19));
	s2_18(20) <= s1_28(20);
	s2_18(21) <= carry_3b(s1_25(20),s1_26(20),s1_27(20));
	s2_18(22) <= s1_21(22);
	s2_18(23) <= s1_19(23);
	s2_18(24) <= s1_17(24);

	--Line 19 in 19 wires after 2nd reduction
	s2_19(9) <= s1_20(9);
	s2_19(10) <= s1_22(10);
	s2_19(11) <= s1_24(11);
	s2_19(12) <= s1_26(12);
	s2_19(13) <= s1_28(13);
	s2_19(14) <= s1_28(14);
	s2_19(15) <= s1_28(15);
	s2_19(16) <= s1_28(16);
	s2_19(17) <= carry_3b(s1_25(16),s1_26(16),s1_27(16));
	s2_19(18) <= s1_28(18);
	s2_19(19) <= s1_28(19);
	s2_19(20) <= carry_3b(s1_25(19),s1_26(19),s1_27(19));
	s2_19(21) <= s1_24(21);
	s2_19(22) <= s1_22(22);
	s2_19(23) <= s1_20(23);
	s2_19(24) <= s1_18(24);

----------------------------------------------------------------
-----------------------------STEP 3-----------------------------
----------------------------------------------------------------
	--Line 1 in 13 wires after 3rd reduction
	s3_1(5 downto 0) <= s2_1(5 downto 0);
	s3_1(6) <= sum_2b(s2_1(6),s2_2(6));
	s3_1(7) <= sum_3b(s2_1(7),s2_2(7),s2_3(7));
	s3_1(8) <= sum_3b(s2_1(8),s2_2(8),s2_3(8));
	s3_1(9) <= sum_3b(s2_1(9),s2_2(9),s2_3(9));
	s3_1(10) <= sum_3b(s2_1(10),s2_2(10),s2_3(10));
	s3_1(11) <= sum_3b(s2_1(11),s2_2(11),s2_3(11));
	s3_1(12) <= sum_3b(s2_1(12),s2_2(12),s2_3(12));
	s3_1(13) <= sum_3b(s2_1(13),s2_2(13),s2_3(13));
	s3_1(14) <= sum_3b(s2_1(14),s2_2(14),s2_3(14));
	s3_1(15) <= sum_3b(s2_1(15),s2_2(15),s2_3(15));
	s3_1(16) <= sum_3b(s2_1(16),s2_2(16),s2_3(16));
	s3_1(17) <= sum_3b(s2_1(17),s2_2(17),s2_3(17));
	s3_1(18) <= sum_3b(s2_1(18),s2_2(18),s2_3(18));
	s3_1(19) <= sum_3b(s2_1(19),s2_2(19),s2_3(19));
	s3_1(20) <= sum_3b(s2_1(20),s2_2(20),s2_3(20));
	s3_1(21) <= sum_3b(s2_1(21),s2_2(21),s2_3(21));
	s3_1(22) <= sum_3b(s2_1(22),s2_2(22),s2_3(22));
	s3_1(23) <= sum_3b(s2_1(23),s2_2(23),s2_3(23));
	s3_1(24) <= sum_3b(s2_1(24),s2_2(24),s2_3(24));
	s3_1(25) <= sum_3b(s2_1(25),s2_2(25),s2_3(25));
	s3_1(26) <= sum_3b(s2_1(26),s2_2(26),s2_3(26));
	s3_1(27) <= sum_3b(s2_1(27),s2_2(27),s2_3(27));
	s3_1(32 downto 28) <= s2_1(32 downto 28);

	--Line 2 in 13 wires after 3rd reduction
	s3_2(5 downto 0) <= s2_2(5 downto 0);
	s3_2(6) <= s2_3(6);
	s3_2(7) <= carry_2b(s2_1(6),s2_2(6));
	s3_2(8) <= carry_3b(s2_1(7),s2_2(7),s2_3(7));
	s3_2(9) <= carry_3b(s2_1(8),s2_2(8),s2_3(8));
	s3_2(10) <= carry_3b(s2_1(9),s2_2(9),s2_3(9));
	s3_2(11) <= carry_3b(s2_1(10),s2_2(10),s2_3(10));
	s3_2(12) <= carry_3b(s2_1(11),s2_2(11),s2_3(11));
	s3_2(13) <= carry_3b(s2_1(12),s2_2(12),s2_3(12));
	s3_2(14) <= carry_3b(s2_1(13),s2_2(13),s2_3(13));
	s3_2(15) <= carry_3b(s2_1(14),s2_2(14),s2_3(14));
	s3_2(16) <= carry_3b(s2_1(15),s2_2(15),s2_3(15));
	s3_2(17) <= carry_3b(s2_1(16),s2_2(16),s2_3(16));
	s3_2(18) <= carry_3b(s2_1(17),s2_2(17),s2_3(17));
	s3_2(19) <= carry_3b(s2_1(18),s2_2(18),s2_3(18));
	s3_2(20) <= carry_3b(s2_1(19),s2_2(19),s2_3(19));
	s3_2(21) <= carry_3b(s2_1(20),s2_2(20),s2_3(20));
	s3_2(22) <= carry_3b(s2_1(21),s2_2(21),s2_3(21));
	s3_2(23) <= carry_3b(s2_1(22),s2_2(22),s2_3(22));
	s3_2(24) <= carry_3b(s2_1(23),s2_2(23),s2_3(23));
	s3_2(25) <= carry_3b(s2_1(24),s2_2(24),s2_3(24));
	s3_2(26) <= carry_3b(s2_1(25),s2_2(25),s2_3(25));
	s3_2(27) <= carry_3b(s2_1(26),s2_2(26),s2_3(26));
	s3_2(28) <= carry_3b(s2_1(27),s2_2(27),s2_3(27));
	s3_2(32 downto 29) <= s2_2(32 downto 29);

	--Line 3 in 13 wires after 3rd reduction
	s3_3(5 downto 1) <= s2_3(5 downto 1);
	s3_3(6) <= s2_4(6);
	s3_3(7) <= sum_3b(s2_4(7),s2_5(7),s2_6(7));
	s3_3(8) <= sum_3b(s2_4(8),s2_5(8),s2_6(8));
	s3_3(9) <= sum_3b(s2_4(9),s2_5(9),s2_6(9));
	s3_3(10) <= sum_3b(s2_4(10),s2_5(10),s2_6(10));
	s3_3(11) <= sum_3b(s2_4(11),s2_5(11),s2_6(11));
	s3_3(12) <= sum_3b(s2_4(12),s2_5(12),s2_6(12));
	s3_3(13) <= sum_3b(s2_4(13),s2_5(13),s2_6(13));
	s3_3(14) <= sum_3b(s2_4(14),s2_5(14),s2_6(14));
	s3_3(15) <= sum_3b(s2_4(15),s2_5(15),s2_6(15));
	s3_3(16) <= sum_3b(s2_4(16),s2_5(16),s2_6(16));
	s3_3(17) <= sum_3b(s2_4(17),s2_5(17),s2_6(17));
	s3_3(18) <= sum_3b(s2_4(18),s2_5(18),s2_6(18));
	s3_3(19) <= sum_3b(s2_4(19),s2_5(19),s2_6(19));
	s3_3(20) <= sum_3b(s2_4(20),s2_5(20),s2_6(20));
	s3_3(21) <= sum_3b(s2_4(21),s2_5(21),s2_6(21));
	s3_3(22) <= sum_3b(s2_4(22),s2_5(22),s2_6(22));
	s3_3(23) <= sum_3b(s2_4(23),s2_5(23),s2_6(23));
	s3_3(24) <= sum_3b(s2_4(24),s2_5(24),s2_6(24));
	s3_3(25) <= sum_3b(s2_4(25),s2_5(25),s2_6(25));
	s3_3(26) <= sum_3b(s2_4(26),s2_5(26),s2_6(26));
	s3_3(27) <= s2_4(27);
	s3_3(28) <= s2_2(28);
	s3_3(31 downto 29) <= s2_3(31 downto 29);

	--Line 4 in 13 wires after 3rd reduction
	s3_4(5 downto 1) <= s2_4(5 downto 1);
	s3_4(6) <= s2_5(6);
	s3_4(7) <= s2_7(7);
	s3_4(8) <= carry_3b(s2_4(7),s2_5(7),s2_6(7));
	s3_4(9) <= carry_3b(s2_4(8),s2_5(8),s2_6(8));
	s3_4(10) <= carry_3b(s2_4(9),s2_5(9),s2_6(9));
	s3_4(11) <= carry_3b(s2_4(10),s2_5(10),s2_6(10));
	s3_4(12) <= carry_3b(s2_4(11),s2_5(11),s2_6(11));
	s3_4(13) <= carry_3b(s2_4(12),s2_5(12),s2_6(12));
	s3_4(14) <= carry_3b(s2_4(13),s2_5(13),s2_6(13));
	s3_4(15) <= carry_3b(s2_4(14),s2_5(14),s2_6(14));
	s3_4(16) <= carry_3b(s2_4(15),s2_5(15),s2_6(15));
	s3_4(17) <= carry_3b(s2_4(16),s2_5(16),s2_6(16));
	s3_4(18) <= carry_3b(s2_4(17),s2_5(17),s2_6(17));
	s3_4(19) <= carry_3b(s2_4(18),s2_5(18),s2_6(18));
	s3_4(20) <= carry_3b(s2_4(19),s2_5(19),s2_6(19));
	s3_4(21) <= carry_3b(s2_4(20),s2_5(20),s2_6(20));
	s3_4(22) <= carry_3b(s2_4(21),s2_5(21),s2_6(21));
	s3_4(23) <= carry_3b(s2_4(22),s2_5(22),s2_6(22));
	s3_4(24) <= carry_3b(s2_4(23),s2_5(23),s2_6(23));
	s3_4(25) <= carry_3b(s2_4(24),s2_5(24),s2_6(24));
	s3_4(26) <= carry_3b(s2_4(25),s2_5(25),s2_6(25));
	s3_4(27) <= carry_3b(s2_4(26),s2_5(26),s2_6(26));
	s3_4(28) <= s2_3(28);
	s3_4(31 downto 29) <= s2_4(31 downto 29);

	--Line 5 in 13 wires after 3rd reduction
	s3_5(5 downto 2) <= s2_5(5 downto 2);
	s3_5(6) <= s2_6(6);
	s3_5(7) <= s2_8(7);
	s3_5(8) <= sum_3b(s2_7(8),s2_8(8),s2_9(8));
	s3_5(9) <= sum_3b(s2_7(9),s2_8(9),s2_9(9));
	s3_5(10) <= sum_3b(s2_7(10),s2_8(10),s2_9(10));
	s3_5(11) <= sum_3b(s2_7(11),s2_8(11),s2_9(11));
	s3_5(12) <= sum_3b(s2_7(12),s2_8(12),s2_9(12));
	s3_5(13) <= sum_3b(s2_7(13),s2_8(13),s2_9(13));
	s3_5(14) <= sum_3b(s2_7(14),s2_8(14),s2_9(14));
	s3_5(15) <= sum_3b(s2_7(15),s2_8(15),s2_9(15));
	s3_5(16) <= sum_3b(s2_7(16),s2_8(16),s2_9(16));
	s3_5(17) <= sum_3b(s2_7(17),s2_8(17),s2_9(17));
	s3_5(18) <= sum_3b(s2_7(18),s2_8(18),s2_9(18));
	s3_5(19) <= sum_3b(s2_7(19),s2_8(19),s2_9(19));
	s3_5(20) <= sum_3b(s2_7(20),s2_8(20),s2_9(20));
	s3_5(21) <= sum_3b(s2_7(21),s2_8(21),s2_9(21));
	s3_5(22) <= sum_3b(s2_7(22),s2_8(22),s2_9(22));
	s3_5(23) <= sum_3b(s2_7(23),s2_8(23),s2_9(23));
	s3_5(24) <= sum_3b(s2_7(24),s2_8(24),s2_9(24));
	s3_5(25) <= sum_3b(s2_7(25),s2_8(25),s2_9(25));
	s3_5(26) <= sum_3b(s2_7(26),s2_8(26),s2_9(26));
	s3_5(27) <= s2_5(27);
	s3_5(28) <= s2_4(28);
	s3_5(30 downto 29) <= s2_5(30 downto 29);

	--Line 6 in 13 wires after 3rd reduction
	s3_6(5 downto 2) <= s2_6(5 downto 2);
	s3_6(6) <= s2_7(6);
	s3_6(7) <= s2_9(7);
	s3_6(8) <= sum_2b(s2_10(8),s2_11(8));
	s3_6(9) <= carry_3b(s2_7(8),s2_8(8),s2_9(8));
	s3_6(10) <= carry_3b(s2_7(9),s2_8(9),s2_9(9));
	s3_6(11) <= carry_3b(s2_7(10),s2_8(10),s2_9(10));
	s3_6(12) <= carry_3b(s2_7(11),s2_8(11),s2_9(11));
	s3_6(13) <= carry_3b(s2_7(12),s2_8(12),s2_9(12));
	s3_6(14) <= carry_3b(s2_7(13),s2_8(13),s2_9(13));
	s3_6(15) <= carry_3b(s2_7(14),s2_8(14),s2_9(14));
	s3_6(16) <= carry_3b(s2_7(15),s2_8(15),s2_9(15));
	s3_6(17) <= carry_3b(s2_7(16),s2_8(16),s2_9(16));
	s3_6(18) <= carry_3b(s2_7(17),s2_8(17),s2_9(17));
	s3_6(19) <= carry_3b(s2_7(18),s2_8(18),s2_9(18));
	s3_6(20) <= carry_3b(s2_7(19),s2_8(19),s2_9(19));
	s3_6(21) <= carry_3b(s2_7(20),s2_8(20),s2_9(20));
	s3_6(22) <= carry_3b(s2_7(21),s2_8(21),s2_9(21));
	s3_6(23) <= carry_3b(s2_7(22),s2_8(22),s2_9(22));
	s3_6(24) <= carry_3b(s2_7(23),s2_8(23),s2_9(23));
	s3_6(25) <= carry_3b(s2_7(24),s2_8(24),s2_9(24));
	s3_6(26) <= carry_3b(s2_7(25),s2_8(25),s2_9(25));
	s3_6(27) <= carry_3b(s2_7(26),s2_8(26),s2_9(26));
	s3_6(28) <= s2_5(28);
	s3_6(30 downto 29) <= s2_6(30 downto 29);

	--Line 7 in 13 wires after 3rd reduction
	s3_7(5 downto 3) <= s2_7(5 downto 3);
	s3_7(6) <= s2_8(6);
	s3_7(7) <= s2_10(7);
	s3_7(8) <= s2_12(8);
	s3_7(9) <= carry_2b(s2_10(8),s2_11(8));
	s3_7(10) <= sum_3b(s2_10(10),s2_11(10),s2_12(10));
	s3_7(11) <= sum_3b(s2_10(11),s2_11(11),s2_12(11));
	s3_7(12) <= sum_3b(s2_10(12),s2_11(12),s2_12(12));
	s3_7(13) <= sum_3b(s2_10(13),s2_11(13),s2_12(13));
	s3_7(14) <= sum_3b(s2_10(14),s2_11(14),s2_12(14));
	s3_7(15) <= sum_3b(s2_10(15),s2_11(15),s2_12(15));
	s3_7(16) <= sum_3b(s2_10(16),s2_11(16),s2_12(16));
	s3_7(17) <= sum_3b(s2_10(17),s2_11(17),s2_12(17));
	s3_7(18) <= sum_3b(s2_10(18),s2_11(18),s2_12(18));
	s3_7(19) <= sum_3b(s2_10(19),s2_11(19),s2_12(19));
	s3_7(20) <= sum_3b(s2_10(20),s2_11(20),s2_12(20));
	s3_7(21) <= sum_3b(s2_10(21),s2_11(21),s2_12(21));
	s3_7(22) <= sum_3b(s2_10(22),s2_11(22),s2_12(22));
	s3_7(23) <= sum_3b(s2_10(23),s2_11(23),s2_12(23));
	s3_7(24) <= sum_3b(s2_10(24),s2_11(24),s2_12(24));
	s3_7(25) <= sum_3b(s2_10(25),s2_11(25),s2_12(25));
	s3_7(26) <= s2_10(26);
	s3_7(28 downto 27) <= s2_6(28 downto 27);
	s3_7(29) <= s2_7(29);

	--Line 8 in 13 wires after 3rd reduction
	s3_8(5 downto 3) <= s2_8(5 downto 3);
	s3_8(6) <= s2_9(6);
	s3_8(7) <= s2_11(7);
	s3_8(8) <= s2_13(8);
	s3_8(9) <= sum_3b(s2_10(9),s2_11(9),s2_12(9));
	s3_8(10) <= sum_3b(s2_13(10),s2_14(10),s2_15(10));
	s3_8(11) <= carry_3b(s2_10(10),s2_11(10),s2_12(10));
	s3_8(12) <= carry_3b(s2_10(11),s2_11(11),s2_12(11));
	s3_8(13) <= carry_3b(s2_10(12),s2_11(12),s2_12(12));
	s3_8(14) <= carry_3b(s2_10(13),s2_11(13),s2_12(13));
	s3_8(15) <= carry_3b(s2_10(14),s2_11(14),s2_12(14));
	s3_8(16) <= carry_3b(s2_10(15),s2_11(15),s2_12(15));
	s3_8(17) <= carry_3b(s2_10(16),s2_11(16),s2_12(16));
	s3_8(18) <= carry_3b(s2_10(17),s2_11(17),s2_12(17));
	s3_8(19) <= carry_3b(s2_10(18),s2_11(18),s2_12(18));
	s3_8(20) <= carry_3b(s2_10(19),s2_11(19),s2_12(19));
	s3_8(21) <= carry_3b(s2_10(20),s2_11(20),s2_12(20));
	s3_8(22) <= carry_3b(s2_10(21),s2_11(21),s2_12(21));
	s3_8(23) <= carry_3b(s2_10(22),s2_11(22),s2_12(22));
	s3_8(24) <= carry_3b(s2_10(23),s2_11(23),s2_12(23));
	s3_8(25) <= carry_3b(s2_10(24),s2_11(24),s2_12(24));
	s3_8(26) <= carry_3b(s2_10(25),s2_11(25),s2_12(25));
	s3_8(28 downto 27) <= s2_6(28 downto 27);
	s3_8(29) <= s2_8(29);

	--Line 9 in 13 wires after 3rd reduction
	s3_9(5 downto 4) <= s2_9(5 downto 4);
	s3_9(6) <= s2_10(6);
	s3_9(7) <= s2_12(7);
	s3_9(8) <= s2_14(8);
	s3_9(9) <= sum_3b(s2_13(9),s2_14(9),s2_15(9));
	s3_9(10) <= carry_3b(s2_10(9),s2_11(9),s2_12(9));
	s3_9(11) <= carry_3b(s2_13(10),s2_14(10),s2_15(10));
	s3_9(12) <= sum_3b(s2_13(12),s2_14(12),s2_15(12));
	s3_9(13) <= sum_3b(s2_13(13),s2_14(13),s2_15(13));
	s3_9(14) <= sum_3b(s2_13(14),s2_14(14),s2_15(14));
	s3_9(15) <= sum_3b(s2_13(15),s2_14(15),s2_15(15));
	s3_9(16) <= sum_3b(s2_13(16),s2_14(16),s2_15(16));
	s3_9(17) <= sum_3b(s2_13(17),s2_14(17),s2_15(17));
	s3_9(18) <= sum_3b(s2_13(18),s2_14(18),s2_15(18));
	s3_9(19) <= sum_3b(s2_13(19),s2_14(19),s2_15(19));
	s3_9(20) <= sum_3b(s2_13(20),s2_14(20),s2_15(20));
	s3_9(21) <= sum_3b(s2_13(21),s2_14(21),s2_15(21));
	s3_9(22) <= sum_3b(s2_13(22),s2_14(22),s2_15(22));
	s3_9(23) <= sum_3b(s2_13(23),s2_14(23),s2_15(23));
	s3_9(24) <= sum_3b(s2_13(24),s2_14(24),s2_15(24));
	s3_9(25) <= sum_3b(s2_13(25),s2_14(25),s2_15(25));
	s3_9(26) <= s2_11(26);
	s3_9(28 downto 27) <= s2_8(28 downto 27);

	--Line 10 in 13 wires after 3rd reduction
	s3_10(5 downto 4) <= s2_10(5 downto 4);
	s3_10(6) <= s2_11(6);
	s3_10(7) <= s2_13(7);
	s3_10(8) <= s2_15(8);
	s3_10(9) <= s2_16(9);
	s3_10(10) <= carry_3b(s2_13(9),s2_14(9),s2_15(9));
	s3_10(11) <= sum_3b(s2_13(11),s2_14(11),s2_15(11));
	s3_10(12) <= sum_3b(s2_16(12),s2_17(12),s2_18(12));
	s3_10(13) <= carry_3b(s2_13(12),s2_14(12),s2_15(12));
	s3_10(14) <= carry_3b(s2_13(13),s2_14(13),s2_15(13));
	s3_10(15) <= carry_3b(s2_13(14),s2_14(14),s2_15(14));
	s3_10(16) <= carry_3b(s2_13(15),s2_14(15),s2_15(15));
	s3_10(17) <= carry_3b(s2_13(16),s2_14(16),s2_15(16));
	s3_10(18) <= carry_3b(s2_13(17),s2_14(17),s2_15(17));
	s3_10(19) <= carry_3b(s2_13(18),s2_14(18),s2_15(18));
	s3_10(20) <= carry_3b(s2_13(19),s2_14(19),s2_15(19));
	s3_10(21) <= carry_3b(s2_13(20),s2_14(20),s2_15(20));
	s3_10(22) <= carry_3b(s2_13(21),s2_14(21),s2_15(21));
	s3_10(23) <= carry_3b(s2_13(22),s2_14(22),s2_15(22));
	s3_10(24) <= carry_3b(s2_13(23),s2_14(23),s2_15(23));
	s3_10(25) <= carry_3b(s2_13(24),s2_14(24),s2_15(24));
	s3_10(26) <= carry_3b(s2_13(25),s2_14(25),s2_15(25));
	s3_10(28 downto 27) <= s2_9(28 downto 27);

	--Line 11 in 13 wires after 3rd reduction
	s3_11(5) <= s2_11(5);
	s3_11(6) <= s2_12(6);
	s3_11(7) <= s2_14(7);
	s3_11(8) <= s2_16(8);
	s3_11(9) <= s2_17(9);
	s3_11(10) <= sum_2b(s2_16(10),s2_17(10));
	s3_11(11) <= sum_3b(s2_16(11),s2_17(11),s2_18(11));
	s3_11(12) <= carry_3b(s2_13(11),s2_14(11),s2_15(11));
	s3_11(13) <= carry_3b(s2_16(12),s2_17(12),s2_18(12));
	s3_11(14) <= sum_3b(s2_16(14),s2_17(14),s2_18(14));
	s3_11(15) <= sum_3b(s2_16(15),s2_17(15),s2_18(15));
	s3_11(16) <= sum_3b(s2_16(16),s2_17(16),s2_18(16));
	s3_11(17) <= sum_3b(s2_16(17),s2_17(17),s2_18(17));
	s3_11(18) <= sum_3b(s2_16(18),s2_17(18),s2_18(18));
	s3_11(19) <= sum_3b(s2_16(19),s2_17(19),s2_18(19));
	s3_11(20) <= sum_3b(s2_16(20),s2_17(20),s2_18(20));
	s3_11(21) <= sum_3b(s2_16(21),s2_17(21),s2_18(21));
	s3_11(22) <= sum_3b(s2_16(22),s2_17(22),s2_18(22));
	s3_11(23) <= sum_3b(s2_16(23),s2_17(23),s2_18(23));
	s3_11(24) <= sum_3b(s2_16(24),s2_17(24),s2_18(24));
	s3_11(25) <= s2_16(25);
	s3_11(26) <= s2_12(26);
	s3_11(28 downto 27) <= s2_10(28 downto 27);

	--Line 12 in 13 wires after 3rd reduction
	s3_12(5) <= s2_12(5);
	s3_12(6) <= s2_13(6);
	s3_12(7) <= s2_15(7);
	s3_12(8) <= s2_17(8);
	s3_12(9) <= s2_18(9);
	s3_12(10) <= s2_18(10);
	s3_12(11) <= carry_2b(s2_16(10),s2_17(10));
	s3_12(12) <= carry_3b(s2_16(11),s2_17(11),s2_18(11));
	s3_12(13) <= sum_3b(s2_16(13),s2_17(13),s2_18(13));
	s3_12(14) <= s1_19(14);
	s3_12(15) <= carry_3b(s2_16(14),s2_17(14),s2_18(14));
	s3_12(16) <= carry_3b(s2_16(15),s2_17(15),s2_18(15));
	s3_12(17) <= carry_3b(s2_16(16),s2_17(16),s2_18(16));
	s3_12(18) <= carry_3b(s2_16(17),s2_17(17),s2_18(17));
	s3_12(19) <= carry_3b(s2_16(18),s2_17(18),s2_18(18));
	s3_12(20) <= carry_3b(s2_16(19),s2_17(19),s2_18(19));
	s3_12(21) <= carry_3b(s2_16(20),s2_17(20),s2_18(20));
	s3_12(22) <= carry_3b(s2_16(21),s2_17(21),s2_18(21));
	s3_12(23) <= carry_3b(s2_16(22),s2_17(22),s2_18(22));
	s3_12(24) <= carry_3b(s2_16(23),s2_17(23),s2_18(23));
	s3_12(25) <= carry_3b(s2_16(24),s2_17(24),s2_18(24));
	s3_12(26) <= s2_13(26);
	s3_12(27) <= s2_11(27);

	--Line 13 in 13 wires after 3rd reduction
	s3_13(6) <= s2_14(6);
	s3_13(7) <= s2_16(7);
	s3_13(8) <= s2_18(8);
	s3_13(13 downto 9) <= s2_19(13 downto 9);
	s3_13(14) <= carry_3b(s2_16(13),s2_17(13),s2_18(13));
	s3_13(24 downto 15) <= s2_19(24 downto 15);
	s3_13(25) <= s2_17(25);
	s3_13(26) <= s2_14(26);
	s3_13(27) <= s2_12(27);

----------------------------------------------------------------
-----------------------------STEP 4-----------------------------
----------------------------------------------------------------
	--Line 1 in 9 wires after 4th reduction
	s4_1(3 downto 0) <= s3_1(3 downto 0);
	s4_1(4) <= sum_2b(s3_1(4),s3_2(4));
	s4_1(5) <= sum_3b(s3_1(5),s3_2(5),s3_3(5));
	s4_1(6) <= sum_3b(s3_1(6),s3_2(6),s3_3(6));
	s4_1(7) <= sum_3b(s3_1(7),s3_2(7),s3_3(7));
	s4_1(8) <= sum_3b(s3_1(8),s3_2(8),s3_3(8));
	s4_1(9) <= sum_3b(s3_1(9),s3_2(9),s3_3(9));
	s4_1(10) <= sum_3b(s3_1(10),s3_2(10),s3_3(10));
	s4_1(11) <= sum_3b(s3_1(11),s3_2(11),s3_3(11));
	s4_1(12) <= sum_3b(s3_1(12),s3_2(12),s3_3(12));
	s4_1(13) <= sum_3b(s3_1(13),s3_2(13),s3_3(13));
	s4_1(14) <= sum_3b(s3_1(14),s3_2(14),s3_3(14));
	s4_1(15) <= sum_3b(s3_1(15),s3_2(15),s3_3(15));
	s4_1(16) <= sum_3b(s3_1(16),s3_2(16),s3_3(16));
	s4_1(17) <= sum_3b(s3_1(17),s3_2(17),s3_3(17));
	s4_1(18) <= sum_3b(s3_1(18),s3_2(18),s3_3(18));
	s4_1(19) <= sum_3b(s3_1(19),s3_2(19),s3_3(19));
	s4_1(20) <= sum_3b(s3_1(20),s3_2(20),s3_3(20));
	s4_1(21) <= sum_3b(s3_1(21),s3_2(21),s3_3(21));
	s4_1(22) <= sum_3b(s3_1(22),s3_2(22),s3_3(22));
	s4_1(23) <= sum_3b(s3_1(23),s3_2(23),s3_3(23));
	s4_1(24) <= sum_3b(s3_1(24),s3_2(24),s3_3(24));
	s4_1(25) <= sum_3b(s3_1(25),s3_2(25),s3_3(25));
	s4_1(26) <= sum_3b(s3_1(26),s3_2(26),s3_3(26));
	s4_1(27) <= sum_3b(s3_1(27),s3_2(27),s3_3(27));
	s4_1(28) <= sum_3b(s3_1(28),s3_2(28),s3_3(28));
	s4_1(29) <= sum_3b(s3_1(29),s3_2(29),s3_3(29));
	s4_1(32 downto 30) <= s3_1(32 downto 30);

	--Line 2 in 9 wires after 4th reduction
	s4_2(3 downto 0) <= s3_2(3 downto 0);
	s4_2(4) <= s3_3(4);
	s4_2(5) <= carry_2b(s3_1(4),s3_2(4));
	s4_2(6) <= carry_3b(s3_1(5),s3_2(5),s3_3(5));
	s4_2(7) <= carry_3b(s3_1(6),s3_2(6),s3_3(6));
	s4_2(8) <= carry_3b(s3_1(7),s3_2(7),s3_3(7));
	s4_2(9) <= carry_3b(s3_1(8),s3_2(8),s3_3(8));
	s4_2(10) <= carry_3b(s3_1(9),s3_2(9),s3_3(9));
	s4_2(11) <= carry_3b(s3_1(10),s3_2(10),s3_3(10));
	s4_2(12) <= carry_3b(s3_1(11),s3_2(11),s3_3(11));
	s4_2(13) <= carry_3b(s3_1(12),s3_2(12),s3_3(12));
	s4_2(14) <= carry_3b(s3_1(13),s3_2(13),s3_3(13));
	s4_2(15) <= carry_3b(s3_1(14),s3_2(14),s3_3(14));
	s4_2(16) <= carry_3b(s3_1(15),s3_2(15),s3_3(15));
	s4_2(17) <= carry_3b(s3_1(16),s3_2(16),s3_3(16));
	s4_2(18) <= carry_3b(s3_1(17),s3_2(17),s3_3(17));
	s4_2(19) <= carry_3b(s3_1(18),s3_2(18),s3_3(18));
	s4_2(20) <= carry_3b(s3_1(19),s3_2(19),s3_3(19));
	s4_2(21) <= carry_3b(s3_1(20),s3_2(20),s3_3(20));
	s4_2(22) <= carry_3b(s3_1(21),s3_2(21),s3_3(21));
	s4_2(23) <= carry_3b(s3_1(22),s3_2(22),s3_3(22));
	s4_2(24) <= carry_3b(s3_1(23),s3_2(23),s3_3(23));
	s4_2(25) <= carry_3b(s3_1(24),s3_2(24),s3_3(24));
	s4_2(26) <= carry_3b(s3_1(25),s3_2(25),s3_3(25));
	s4_2(27) <= carry_3b(s3_1(26),s3_2(26),s3_3(26));
	s4_2(28) <= carry_3b(s3_1(27),s3_2(27),s3_3(27));
	s4_2(29) <= carry_3b(s3_1(28),s3_2(28),s3_3(28));
	s4_2(30) <= carry_3b(s3_1(29),s3_2(29),s3_3(29));
	s4_2(32 downto 31) <= s3_2(32 downto 31);

	--Line 3 in 9 wires after 4th reduction
	s4_3(3 downto 1) <= s3_3(3 downto 1);
	s4_3(4) <= s3_4(4);
	s4_3(5) <= sum_3b(s3_4(5),s3_5(5),s3_6(5));
	s4_3(6) <= sum_3b(s3_4(6),s3_5(6),s3_6(6));
	s4_3(7) <= sum_3b(s3_4(7),s3_5(7),s3_6(7));
	s4_3(8) <= sum_3b(s3_4(8),s3_5(8),s3_6(8));
	s4_3(9) <= sum_3b(s3_4(9),s3_5(9),s3_6(9));
	s4_3(10) <= sum_3b(s3_4(10),s3_5(10),s3_6(10));
	s4_3(11) <= sum_3b(s3_4(11),s3_5(11),s3_6(11));
	s4_3(12) <= sum_3b(s3_4(12),s3_5(12),s3_6(12));
	s4_3(13) <= sum_3b(s3_4(13),s3_5(13),s3_6(13));
	s4_3(14) <= sum_3b(s3_4(14),s3_5(14),s3_6(14));
	s4_3(15) <= sum_3b(s3_4(15),s3_5(15),s3_6(15));
	s4_3(16) <= sum_3b(s3_4(16),s3_5(16),s3_6(16));
	s4_3(17) <= sum_3b(s3_4(17),s3_5(17),s3_6(17));
	s4_3(18) <= sum_3b(s3_4(18),s3_5(18),s3_6(18));
	s4_3(19) <= sum_3b(s3_4(19),s3_5(19),s3_6(19));
	s4_3(20) <= sum_3b(s3_4(20),s3_5(20),s3_6(20));
	s4_3(21) <= sum_3b(s3_4(21),s3_5(21),s3_6(21));
	s4_3(22) <= sum_3b(s3_4(22),s3_5(22),s3_6(22));
	s4_3(23) <= sum_3b(s3_4(23),s3_5(23),s3_6(23));
	s4_3(24) <= sum_3b(s3_4(24),s3_5(24),s3_6(24));
	s4_3(25) <= sum_3b(s3_4(25),s3_5(25),s3_6(25));
	s4_3(26) <= sum_3b(s3_4(26),s3_5(26),s3_6(26));
	s4_3(27) <= sum_3b(s3_4(27),s3_5(27),s3_6(27));
	s4_3(28) <= sum_3b(s3_4(28),s3_5(28),s3_6(28));
	s4_3(29) <= s3_4(29);
	s4_3(30) <= s3_2(30);
	s4_3(31) <= s3_3(31);

	--Line 4 in 9 wires after 4th reduction
	s4_4(3 downto 1) <= s3_4(3 downto 1);
	s4_4(4) <= s3_5(4);
	s4_4(5) <= s3_7(5);
	s4_4(6) <= carry_3b(s3_4(5),s3_5(5),s3_6(5));
	s4_4(7) <= carry_3b(s3_4(6),s3_5(6),s3_6(6));
	s4_4(8) <= carry_3b(s3_4(7),s3_5(7),s3_6(7));
	s4_4(9) <= carry_3b(s3_4(8),s3_5(8),s3_6(8));
	s4_4(10) <= carry_3b(s3_4(9),s3_5(9),s3_6(9));
	s4_4(11) <= carry_3b(s3_4(10),s3_5(10),s3_6(10));
	s4_4(12) <= carry_3b(s3_4(11),s3_5(11),s3_6(11));
	s4_4(13) <= carry_3b(s3_4(12),s3_5(12),s3_6(12));
	s4_4(14) <= carry_3b(s3_4(13),s3_5(13),s3_6(13));
	s4_4(15) <= carry_3b(s3_4(14),s3_5(14),s3_6(14));
	s4_4(16) <= carry_3b(s3_4(15),s3_5(15),s3_6(15));
	s4_4(17) <= carry_3b(s3_4(16),s3_5(16),s3_6(16));
	s4_4(18) <= carry_3b(s3_4(17),s3_5(17),s3_6(17));
	s4_4(19) <= carry_3b(s3_4(18),s3_5(18),s3_6(18));
	s4_4(20) <= carry_3b(s3_4(19),s3_5(19),s3_6(19));
	s4_4(21) <= carry_3b(s3_4(20),s3_5(20),s3_6(20));
	s4_4(22) <= carry_3b(s3_4(21),s3_5(21),s3_6(21));
	s4_4(23) <= carry_3b(s3_4(22),s3_5(22),s3_6(22));
	s4_4(24) <= carry_3b(s3_4(23),s3_5(23),s3_6(23));
	s4_4(25) <= carry_3b(s3_4(24),s3_5(24),s3_6(24));
	s4_4(26) <= carry_3b(s3_4(25),s3_5(25),s3_6(25));
	s4_4(27) <= carry_3b(s3_4(26),s3_5(26),s3_6(26));
	s4_4(28) <= carry_3b(s3_4(27),s3_5(27),s3_6(27));
	s4_4(29) <= carry_3b(s3_4(28),s3_5(28),s3_6(28));
	s4_4(30) <= s3_3(30);
	s4_4(31) <= s3_4(31);

	--Line 5 in 9 wires after 4th reduction
	s4_5(3 downto 2) <= s3_5(3 downto 2);
	s4_5(4) <= s3_6(4);
	s4_5(5) <= s3_8(5);
	s4_5(6) <= sum_3b(s3_7(6),s3_8(6),s3_9(6));
	s4_5(7) <= sum_3b(s3_7(7),s3_8(7),s3_9(7));
	s4_5(8) <= sum_3b(s3_7(8),s3_8(8),s3_9(8));
	s4_5(9) <= sum_3b(s3_7(9),s3_8(9),s3_9(9));
	s4_5(10) <= sum_3b(s3_7(10),s3_8(10),s3_9(10));
	s4_5(11) <= sum_3b(s3_7(11),s3_8(11),s3_9(11));
	s4_5(12) <= sum_3b(s3_7(12),s3_8(12),s3_9(12));
	s4_5(13) <= sum_3b(s3_7(13),s3_8(13),s3_9(13));
	s4_5(14) <= sum_3b(s3_7(14),s3_8(14),s3_9(14));
	s4_5(15) <= sum_3b(s3_7(15),s3_8(15),s3_9(15));
	s4_5(16) <= sum_3b(s3_7(16),s3_8(16),s3_9(16));
	s4_5(17) <= sum_3b(s3_7(17),s3_8(17),s3_9(17));
	s4_5(18) <= sum_3b(s3_7(18),s3_8(18),s3_9(18));
	s4_5(19) <= sum_3b(s3_7(19),s3_8(19),s3_9(19));
	s4_5(20) <= sum_3b(s3_7(20),s3_8(20),s3_9(20));
	s4_5(21) <= sum_3b(s3_7(21),s3_8(21),s3_9(21));
	s4_5(22) <= sum_3b(s3_7(22),s3_8(22),s3_9(22));
	s4_5(23) <= sum_3b(s3_7(23),s3_8(23),s3_9(23));
	s4_5(24) <= sum_3b(s3_7(24),s3_8(24),s3_9(24));
	s4_5(25) <= sum_3b(s3_7(25),s3_8(25),s3_9(25));
	s4_5(26) <= sum_3b(s3_7(26),s3_8(26),s3_9(26));
	s4_5(27) <= sum_3b(s3_7(27),s3_8(27),s3_9(27));
	s4_5(28) <= sum_3b(s3_7(28),s3_8(28),s3_9(28));
	s4_5(29) <= s3_5(29);
	s4_5(30) <= s3_4(30);

	--Line 6 in 9 wires after 4th reduction
	s4_6(3 downto 2) <= s3_6(3 downto 2);
	s4_6(4) <= s3_7(4);
	s4_6(5) <= s3_9(5);
	s4_6(6) <= s3_10(6);
	s4_6(7) <= carry_3b(s3_7(6),s3_8(6),s3_9(6));
	s4_6(8) <= carry_3b(s3_7(7),s3_8(7),s3_9(7));
	s4_6(9) <= carry_3b(s3_7(8),s3_8(8),s3_9(8));
	s4_6(10) <=carry_3b(s3_7(9),s3_8(9),s3_9(9)) ;
	s4_6(11) <= carry_3b(s3_7(10),s3_8(10),s3_9(10));
	s4_6(12) <= carry_3b(s3_7(11),s3_8(11),s3_9(11));
	s4_6(13) <= carry_3b(s3_7(12),s3_8(12),s3_9(12));
	s4_6(14) <= carry_3b(s3_7(13),s3_8(13),s3_9(13));
	s4_6(15) <= carry_3b(s3_7(14),s3_8(14),s3_9(14));
	s4_6(16) <= carry_3b(s3_7(15),s3_8(15),s3_9(15));
	s4_6(17) <= carry_3b(s3_7(16),s3_8(16),s3_9(16));
	s4_6(18) <= carry_3b(s3_7(17),s3_8(17),s3_9(17));
	s4_6(19) <= carry_3b(s3_7(18),s3_8(18),s3_9(18));
	s4_6(20) <= carry_3b(s3_7(19),s3_8(19),s3_9(19));
	s4_6(21) <= carry_3b(s3_7(20),s3_8(20),s3_9(20));
	s4_6(22) <= carry_3b(s3_7(21),s3_8(21),s3_9(21));
	s4_6(23) <= carry_3b(s3_7(22),s3_8(22),s3_9(22));
	s4_6(24) <= carry_3b(s3_7(23),s3_8(23),s3_9(23));
	s4_6(25) <= carry_3b(s3_7(24),s3_8(24),s3_9(24));
	s4_6(26) <= carry_3b(s3_7(25),s3_8(25),s3_9(25));
	s4_6(27) <= carry_3b(s3_7(26),s3_8(26),s3_9(26));
	s4_6(28) <= carry_3b(s3_7(27),s3_8(27),s3_9(27));
	s4_6(29) <= carry_3b(s3_7(28),s3_8(28),s3_9(28));
	s4_6(30) <= s3_5(30);

	--Line 7 in 9 wires after 4th reduction
	s4_7(3) <= s3_7(3);
	s4_7(4) <= s3_8(4);
	s4_7(5) <= s3_10(5);
	s4_7(6) <= s3_11(6);
	s4_7(7) <= sum_2b(s3_10(7),s3_11(7));
	s4_7(8) <= sum_3b(s3_10(8),s3_11(8),s3_12(8));
	s4_7(9) <= sum_3b(s3_10(9),s3_11(9),s3_12(9));
	s4_7(10) <= sum_3b(s3_10(10),s3_11(10),s3_12(10));
	s4_7(11) <= sum_3b(s3_10(11),s3_11(11),s3_12(11));
	s4_7(12) <= sum_3b(s3_10(12),s3_11(12),s3_12(12));
	s4_7(13) <= sum_3b(s3_10(13),s3_11(13),s3_12(13));
	s4_7(14) <= sum_3b(s3_10(14),s3_11(14),s3_12(14));
	s4_7(15) <= sum_3b(s3_10(15),s3_11(15),s3_12(15));
	s4_7(16) <= sum_3b(s3_10(16),s3_11(16),s3_12(16));
	s4_7(17) <= sum_3b(s3_10(17),s3_11(17),s3_12(17));
	s4_7(18) <= sum_3b(s3_10(18),s3_11(18),s3_12(18));
	s4_7(19) <= sum_3b(s3_10(19),s3_11(19),s3_12(19));
	s4_7(20) <= sum_3b(s3_10(20),s3_11(20),s3_12(20));
	s4_7(21) <= sum_3b(s3_10(21),s3_11(21),s3_12(21));
	s4_7(22) <= sum_3b(s3_10(22),s3_11(22),s3_12(22));
	s4_7(23) <= sum_3b(s3_10(23),s3_11(23),s3_12(23));
	s4_7(24) <= sum_3b(s3_10(24),s3_11(24),s3_12(24));
	s4_7(25) <= sum_3b(s3_10(25),s3_11(25),s3_12(25));
	s4_7(26) <= sum_3b(s3_10(26),s3_11(26),s3_12(26));
	s4_7(27) <= sum_3b(s3_10(27),s3_11(27),s3_12(27));
	s4_7(28) <= s3_10(28);
	s4_7(29) <= s3_6(29);
	s4_7(30) <= s3_6(30);

	--Line 8 in 9 wires after 4th reduction
	s4_8(3) <= s3_8(3);
	s4_8(4) <= s3_9(4);
	s4_8(5) <= s3_11(5);
	s4_8(6) <= s3_12(6);
	s4_8(7) <= s3_12(7);
	s4_8(8) <= carry_2b(s3_10(7),s3_11(7));
	s4_8(9) <= carry_3b(s3_10(8),s3_11(8),s3_12(8));
	s4_8(10) <= carry_3b(s3_10(9),s3_11(9),s3_12(9));
	s4_8(11) <= carry_3b(s3_10(10),s3_11(10),s3_12(10));
	s4_8(12) <= carry_3b(s3_10(11),s3_11(11),s3_12(11));
	s4_8(13) <= carry_3b(s3_10(12),s3_11(12),s3_12(12));
	s4_8(14) <= carry_3b(s3_10(13),s3_11(13),s3_12(13));
	s4_8(15) <= carry_3b(s3_10(14),s3_11(14),s3_12(14));
	s4_8(16) <= carry_3b(s3_10(15),s3_11(15),s3_12(15));
	s4_8(17) <= carry_3b(s3_10(16),s3_11(16),s3_12(16));
	s4_8(18) <= carry_3b(s3_10(17),s3_11(17),s3_12(17));
	s4_8(19) <= carry_3b(s3_10(18),s3_11(18),s3_12(18));
	s4_8(20) <= carry_3b(s3_10(19),s3_11(19),s3_12(19));
	s4_8(21) <= carry_3b(s3_10(20),s3_11(20),s3_12(20));
	s4_8(22) <= carry_3b(s3_10(21),s3_11(21),s3_12(21));
	s4_8(23) <= carry_3b(s3_10(22),s3_11(22),s3_12(22));
	s4_8(24) <= carry_3b(s3_10(23),s3_11(23),s3_12(23));
	s4_8(25) <= carry_3b(s3_10(24),s3_11(24),s3_12(24));
	s4_8(26) <= carry_3b(s3_10(25),s3_11(25),s3_12(25));
	s4_8(27) <= carry_3b(s3_10(26),s3_11(26),s3_12(26));
	s4_8(28) <= carry_3b(s3_10(27),s3_11(27),s3_12(27));
	s4_8(29) <= s3_7(29);

	--Line 9 in 9 wires after 4th reduction
	s4_9(4) <= s3_10(4);
	s4_9(5) <= s3_12(5);
	s4_9(27 downto 6) <= s3_13(27 downto 6);
	s4_9(28) <= s3_11(28);
	s4_9(29) <= s3_8(29);
----------------------------------------------------------------
-----------------------------STEP 5-----------------------------
----------------------------------------------------------------
	--Line 1 in 6 wires after 5th reduction
	s5_1(2 downto 0) <= s4_1(2 downto 0);
	s5_1(3)  <= sum_3b(s4_1(3), s4_2(3), s4_3(3));
	s5_1(4)  <= sum_3b(s4_1(4), s4_2(4), s4_3(4));
	s5_1(5)  <= sum_3b(s4_1(5), s4_2(5), s4_3(5));
	s5_1(6)  <= sum_3b(s4_1(6), s4_2(6), s4_3(6));
	s5_1(7)  <= sum_3b(s4_1(7), s4_2(7), s4_3(7));
	s5_1(8)  <= sum_3b(s4_1(8), s4_2(8), s4_3(8));
	s5_1(9)  <= sum_3b(s4_1(9), s4_2(9), s4_3(9));
	s5_1(10) <= sum_3b(s4_1(10),s4_2(10),s4_3(10));
	s5_1(11) <= sum_3b(s4_1(11),s4_2(11),s4_3(11));
	s5_1(12) <= sum_3b(s4_1(12),s4_2(12),s4_3(12));
	s5_1(13) <= sum_3b(s4_1(13),s4_2(13),s4_3(13));
	s5_1(14) <= sum_3b(s4_1(14),s4_2(14),s4_3(14));
	s5_1(15) <= sum_3b(s4_1(15),s4_2(15),s4_3(15));
	s5_1(16) <= sum_3b(s4_1(16),s4_2(16),s4_3(16));
	s5_1(17) <= sum_3b(s4_1(17),s4_2(17),s4_3(17));
	s5_1(18) <= sum_3b(s4_1(18),s4_2(18),s4_3(18));
	s5_1(19) <= sum_3b(s4_1(19),s4_2(19),s4_3(19));
	s5_1(20) <= sum_3b(s4_1(20),s4_2(20),s4_3(20));
	s5_1(21) <= sum_3b(s4_1(21),s4_2(21),s4_3(21));
	s5_1(22) <= sum_3b(s4_1(22),s4_2(22),s4_3(22));
	s5_1(23) <= sum_3b(s4_1(23),s4_2(23),s4_3(23));
	s5_1(24) <= sum_3b(s4_1(24),s4_2(24),s4_3(24));
	s5_1(25) <= sum_3b(s4_1(25),s4_2(25),s4_3(25));
	s5_1(26) <= sum_3b(s4_1(26),s4_2(26),s4_3(26));
	s5_1(27) <= sum_3b(s4_1(27),s4_2(27),s4_3(27));
	s5_1(28) <= sum_3b(s4_1(28),s4_2(28),s4_3(28));
	s5_1(29) <= sum_3b(s4_1(29),s4_2(29),s4_3(29));
	s5_1(30) <= sum_3b(s4_1(30),s4_2(30),s4_3(30));
	s5_1(32 downto 31) <= s4_1(32 downto 31);

	--Line 2 in 6 wires after 5th reduction
	s5_2(2 downto 0) <= s4_2(2 downto 0);
	s5_2(3) <= s4_4(3);
	s5_2(4) <= carry_3b(s4_1(3),s4_2(3),s4_3(3));
	s5_2(5) <= carry_3b(s4_1(4),s4_2(4),s4_3(4));
	s5_2(6) <= carry_3b(s4_1(5),s4_2(5),s4_3(5));
	s5_2(7) <= carry_3b(s4_1(6),s4_2(6),s4_3(6));
	s5_2(8) <= carry_3b(s4_1(7),s4_2(7),s4_3(7));
	s5_2(9) <= carry_3b(s4_1(8),s4_2(8),s4_3(8));
	s5_2(10) <=carry_3b(s4_1(9),s4_2(9),s4_3(9)) ;
	s5_2(11) <= carry_3b(s4_1(10),s4_2(10),s4_3(10));
	s5_2(12) <= carry_3b(s4_1(11),s4_2(11),s4_3(11));
	s5_2(13) <= carry_3b(s4_1(12),s4_2(12),s4_3(12));
	s5_2(14) <= carry_3b(s4_1(13),s4_2(13),s4_3(13));
	s5_2(15) <= carry_3b(s4_1(14),s4_2(14),s4_3(14));
	s5_2(16) <= carry_3b(s4_1(15),s4_2(15),s4_3(15));
	s5_2(17) <= carry_3b(s4_1(16),s4_2(16),s4_3(16));
	s5_2(18) <= carry_3b(s4_1(17),s4_2(17),s4_3(17));
	s5_2(19) <= carry_3b(s4_1(18),s4_2(18),s4_3(18));
	s5_2(20) <= carry_3b(s4_1(19),s4_2(19),s4_3(19));
	s5_2(21) <= carry_3b(s4_1(20),s4_2(20),s4_3(20));
	s5_2(22) <= carry_3b(s4_1(21),s4_2(21),s4_3(21));
	s5_2(23) <= carry_3b(s4_1(22),s4_2(22),s4_3(22));
	s5_2(24) <= carry_3b(s4_1(23),s4_2(23),s4_3(23));
	s5_2(25) <= carry_3b(s4_1(24),s4_2(24),s4_3(24));
	s5_2(26) <= carry_3b(s4_1(25),s4_2(25),s4_3(25));
	s5_2(27) <= carry_3b(s4_1(26),s4_2(26),s4_3(26));
	s5_2(28) <= carry_3b(s4_1(27),s4_2(27),s4_3(27));
	s5_2(29) <= carry_3b(s4_1(28),s4_2(28),s4_3(28));
	s5_2(30) <= carry_3b(s4_1(29),s4_2(29),s4_3(29));
	s5_2(31) <= carry_3b(s4_1(30),s4_2(30),s4_3(30));
	s5_2(32) <= s4_2(32);

	--Line 3 in 6 wires after 5th reduction
	s5_3(2 downto 1) <= s4_3(2 downto 1);
	s5_3(3)  <= s4_5(3);
	s5_3(4)  <= sum_3b(s4_4(4), s4_5(4), s4_6(4));
	s5_3(5)  <= sum_3b(s4_4(5), s4_5(5), s4_6(5));
	s5_3(6)  <= sum_3b(s4_4(6), s4_5(6), s4_6(6));
	s5_3(7)  <= sum_3b(s4_4(7), s4_5(7), s4_6(7));
	s5_3(8)  <= sum_3b(s4_4(8), s4_5(8), s4_6(8));
	s5_3(9)  <= sum_3b(s4_4(9), s4_5(9), s4_6(9));
	s5_3(10) <= sum_3b(s4_4(10),s4_5(10),s4_6(10));
	s5_3(11) <= sum_3b(s4_4(11),s4_5(11),s4_6(11));
	s5_3(12) <= sum_3b(s4_4(12),s4_5(12),s4_6(12));
	s5_3(13) <= sum_3b(s4_4(13),s4_5(13),s4_6(13));
	s5_3(14) <= sum_3b(s4_4(14),s4_5(14),s4_6(14));
	s5_3(15) <= sum_3b(s4_4(15),s4_5(15),s4_6(15));
	s5_3(16) <= sum_3b(s4_4(16),s4_5(16),s4_6(16));
	s5_3(17) <= sum_3b(s4_4(17),s4_5(17),s4_6(17));
	s5_3(18) <= sum_3b(s4_4(18),s4_5(18),s4_6(18));
	s5_3(19) <= sum_3b(s4_4(19),s4_5(19),s4_6(19));
	s5_3(20) <= sum_3b(s4_4(20),s4_5(20),s4_6(20));
	s5_3(21) <= sum_3b(s4_4(21),s4_5(21),s4_6(21));
	s5_3(22) <= sum_3b(s4_4(22),s4_5(22),s4_6(22));
	s5_3(23) <= sum_3b(s4_4(23),s4_5(23),s4_6(23));
	s5_3(24) <= sum_3b(s4_4(24),s4_5(24),s4_6(24));
	s5_3(25) <= sum_3b(s4_4(25),s4_5(25),s4_6(25));
	s5_3(26) <= sum_3b(s4_4(26),s4_5(26),s4_6(26));
	s5_3(27) <= sum_3b(s4_4(27),s4_5(27),s4_6(27));
	s5_3(28) <= sum_3b(s4_4(28),s4_5(28),s4_6(28));
	s5_3(29) <= sum_3b(s4_4(29),s4_5(29),s4_6(29));
	s5_3(30) <= sum_3b(s4_4(30),s4_5(30),s4_6(30));
	s5_3(31) <= s4_2(31);

	--Line 4 in 6 wires after 5th reduction
	s5_4(2 downto 1) <= s4_4(2 downto 1);
	s5_4(3)  <= s4_6(3);
	s5_4(4)  <= s4_7(4);
	s5_4(5)  <= carry_3b(s4_4(4), s4_5(4), s4_6(4));
	s5_4(6)  <= carry_3b(s4_4(5), s4_5(5), s4_6(5));
	s5_4(7)  <= carry_3b(s4_4(6), s4_5(6), s4_6(6));
	s5_4(8)  <= carry_3b(s4_4(7), s4_5(7), s4_6(7));
	s5_4(9)  <= carry_3b(s4_4(8), s4_5(8), s4_6(8));
	s5_4(10) <= carry_3b(s4_4(9), s4_5(9), s4_6(9));
	s5_4(11) <= carry_3b(s4_4(10),s4_5(10),s4_6(10));
	s5_4(12) <= carry_3b(s4_4(11),s4_5(11),s4_6(11));
	s5_4(13) <= carry_3b(s4_4(12),s4_5(12),s4_6(12));
	s5_4(14) <= carry_3b(s4_4(13),s4_5(13),s4_6(13));
	s5_4(15) <= carry_3b(s4_4(14),s4_5(14),s4_6(14));
	s5_4(16) <= carry_3b(s4_4(15),s4_5(15),s4_6(15));
	s5_4(17) <= carry_3b(s4_4(16),s4_5(16),s4_6(16));
	s5_4(18) <= carry_3b(s4_4(17),s4_5(17),s4_6(17));
	s5_4(19) <= carry_3b(s4_4(18),s4_5(18),s4_6(18));
	s5_4(20) <= carry_3b(s4_4(19),s4_5(19),s4_6(19));
	s5_4(21) <= carry_3b(s4_4(20),s4_5(20),s4_6(20));
	s5_4(22) <= carry_3b(s4_4(21),s4_5(21),s4_6(21));
	s5_4(23) <= carry_3b(s4_4(22),s4_5(22),s4_6(22));
	s5_4(24) <= carry_3b(s4_4(23),s4_5(23),s4_6(23));
	s5_4(25) <= carry_3b(s4_4(24),s4_5(24),s4_6(24));
	s5_4(26) <= carry_3b(s4_4(25),s4_5(25),s4_6(25));
	s5_4(27) <= carry_3b(s4_4(26),s4_5(26),s4_6(26));
	s5_4(28) <= carry_3b(s4_4(27),s4_5(27),s4_6(27));
	s5_4(29) <= carry_3b(s4_4(28),s4_5(28),s4_6(28));
	s5_4(30) <= carry_3b(s4_4(29),s4_5(29),s4_6(29));
	s5_4(31) <= carry_3b(s4_4(30),s4_5(30),s4_6(30));

	--Line 5 in 6 wires after 5th reduction
	s5_5(2) <= s4_5(2);
	s5_5(3)  <= s4_7(3);
	s5_5(4)  <= s4_8(4);
	s5_5(5)  <= sum_2b(s4_7(5), s4_8(5));
	s5_5(6)  <= sum_3b(s4_7(6), s4_8(6), s4_9(6));
	s5_5(7)  <= sum_3b(s4_7(7), s4_8(7), s4_9(7));
	s5_5(8)  <= sum_3b(s4_7(8), s4_8(8), s4_9(8));
	s5_5(9)  <= sum_3b(s4_7(9), s4_8(9), s4_9(9));
	s5_5(10) <= sum_3b(s4_7(10),s4_8(10),s4_9(10));
	s5_5(11) <= sum_3b(s4_7(11),s4_8(11),s4_9(11));
	s5_5(12) <= sum_3b(s4_7(12),s4_8(12),s4_9(12));
	s5_5(13) <= sum_3b(s4_7(13),s4_8(13),s4_9(13));
	s5_5(14) <= sum_3b(s4_7(14),s4_8(14),s4_9(14));
	s5_5(15) <= sum_3b(s4_7(15),s4_8(15),s4_9(15));
	s5_5(16) <= sum_3b(s4_7(16),s4_8(16),s4_9(16));
	s5_5(17) <= sum_3b(s4_7(17),s4_8(17),s4_9(17));
	s5_5(18) <= sum_3b(s4_7(18),s4_8(18),s4_9(18));
	s5_5(19) <= sum_3b(s4_7(19),s4_8(19),s4_9(19));
	s5_5(20) <= sum_3b(s4_7(20),s4_8(20),s4_9(20));
	s5_5(21) <= sum_3b(s4_7(21),s4_8(21),s4_9(21));
	s5_5(22) <= sum_3b(s4_7(22),s4_8(22),s4_9(22));
	s5_5(23) <= sum_3b(s4_7(23),s4_8(23),s4_9(23));
	s5_5(24) <= sum_3b(s4_7(24),s4_8(24),s4_9(24));
	s5_5(25) <= sum_3b(s4_7(25),s4_8(25),s4_9(25));
	s5_5(26) <= sum_3b(s4_7(26),s4_8(26),s4_9(26));
	s5_5(27) <= sum_3b(s4_7(27),s4_8(27),s4_9(27));
	s5_5(28) <= sum_3b(s4_7(28),s4_8(28),s4_9(28));
	s5_5(29) <= sum_3b(s4_7(29),s4_8(29),s4_9(29));
	s5_5(30) <= s4_7(30);
	s5_5(31) <= s4_3(31);

	--Line 6 in 6 wires after 5th reduction
	s5_6(2) <= s4_6(2);
	s5_6(3)  <= s4_8(3);
	s5_6(4)  <= s4_9(4);
	s5_6(5)  <= s4_9(5);
	s5_6(6)  <= carry_2b(s4_7(5), s4_8(5));
	s5_6(7)  <= carry_3b(s4_7(6), s4_8(6), s4_9(6));
	s5_6(8)  <= carry_3b(s4_7(7), s4_8(7), s4_9(7));
	s5_6(9)  <= carry_3b(s4_7(8), s4_8(8), s4_9(8));
	s5_6(10) <= carry_3b(s4_7(9), s4_8(9), s4_9(9));
	s5_6(11) <= carry_3b(s4_7(10),s4_8(10),s4_9(10));
	s5_6(12) <= carry_3b(s4_7(11),s4_8(11),s4_9(11));
	s5_6(13) <= carry_3b(s4_7(12),s4_8(12),s4_9(12));
	s5_6(14) <= carry_3b(s4_7(13),s4_8(13),s4_9(13));
	s5_6(15) <= carry_3b(s4_7(14),s4_8(14),s4_9(14));
	s5_6(16) <= carry_3b(s4_7(15),s4_8(15),s4_9(15));
	s5_6(17) <= carry_3b(s4_7(16),s4_8(16),s4_9(16));
	s5_6(18) <= carry_3b(s4_7(17),s4_8(17),s4_9(17));
	s5_6(19) <= carry_3b(s4_7(18),s4_8(18),s4_9(18));
	s5_6(20) <= carry_3b(s4_7(19),s4_8(19),s4_9(19));
	s5_6(21) <= carry_3b(s4_7(20),s4_8(20),s4_9(20));
	s5_6(22) <= carry_3b(s4_7(21),s4_8(21),s4_9(21));
	s5_6(23) <= carry_3b(s4_7(22),s4_8(22),s4_9(22));
	s5_6(24) <= carry_3b(s4_7(23),s4_8(23),s4_9(23));
	s5_6(25) <= carry_3b(s4_7(24),s4_8(24),s4_9(24));
	s5_6(26) <= carry_3b(s4_7(25),s4_8(25),s4_9(25));
	s5_6(27) <= carry_3b(s4_7(26),s4_8(26),s4_9(26));
	s5_6(28) <= carry_3b(s4_7(27),s4_8(27),s4_9(27));
	s5_6(29) <= carry_3b(s4_7(28),s4_8(28),s4_9(28));
	s5_6(30) <= carry_3b(s4_7(29),s4_8(29),s4_9(29));
	s5_6(31) <= s4_4(31);

----------------------------------------------------------------
-----------------------------STEP 6-----------------------------
----------------------------------------------------------------
	--Line 1 in 4 wires after 6th reduction
	s6_1(1 downto 0) <= s5_1(1 downto 0);
	s6_1(2)  <= sum_3b(s5_1(2), s5_2(2), s5_3(2));
	s6_1(3)  <= sum_3b(s5_1(3), s5_2(3), s5_3(3));
	s6_1(4)  <= sum_3b(s5_1(4), s5_2(4), s5_3(4));
	s6_1(5)  <= sum_3b(s5_1(5), s5_2(5), s5_3(5));
	s6_1(6)  <= sum_3b(s5_1(6), s5_2(6), s5_3(6));
	s6_1(7)  <= sum_3b(s5_1(7), s5_2(7), s5_3(7));
	s6_1(8)  <= sum_3b(s5_1(8), s5_2(8), s5_3(8));
	s6_1(9)  <= sum_3b(s5_1(9), s5_2(9), s5_3(9));
	s6_1(10) <= sum_3b(s5_1(10),s5_2(10),s5_3(10));
	s6_1(11) <= sum_3b(s5_1(11),s5_2(11),s5_3(11));
	s6_1(12) <= sum_3b(s5_1(12),s5_2(12),s5_3(12));
	s6_1(13) <= sum_3b(s5_1(13),s5_2(13),s5_3(13));
	s6_1(14) <= sum_3b(s5_1(14),s5_2(14),s5_3(14));
	s6_1(15) <= sum_3b(s5_1(15),s5_2(15),s5_3(15));
	s6_1(16) <= sum_3b(s5_1(16),s5_2(16),s5_3(16));
	s6_1(17) <= sum_3b(s5_1(17),s5_2(17),s5_3(17));
	s6_1(18) <= sum_3b(s5_1(18),s5_2(18),s5_3(18));
	s6_1(19) <= sum_3b(s5_1(19),s5_2(19),s5_3(19));
	s6_1(20) <= sum_3b(s5_1(20),s5_2(20),s5_3(20));
	s6_1(21) <= sum_3b(s5_1(21),s5_2(21),s5_3(21));
	s6_1(22) <= sum_3b(s5_1(22),s5_2(22),s5_3(22));
	s6_1(23) <= sum_3b(s5_1(23),s5_2(23),s5_3(23));
	s6_1(24) <= sum_3b(s5_1(24),s5_2(24),s5_3(24));
	s6_1(25) <= sum_3b(s5_1(25),s5_2(25),s5_3(25));
	s6_1(26) <= sum_3b(s5_1(26),s5_2(26),s5_3(26));
	s6_1(27) <= sum_3b(s5_1(27),s5_2(27),s5_3(27));
	s6_1(28) <= sum_3b(s5_1(28),s5_2(28),s5_3(28));
	s6_1(29) <= sum_3b(s5_1(29),s5_2(29),s5_3(29));
	s6_1(30) <= sum_3b(s5_1(30),s5_2(30),s5_3(30));
	s6_1(31) <= sum_3b(s5_1(31),s5_2(31),s5_3(31));
	s6_1(32) <= s5_1(32);

	--Line 2 in 4 wires after 6th reduction
	s6_2(1 downto 0) <= s5_2(1 downto 0);
	s6_2(2)  <= s5_4(2);
	s6_2(3)  <= carry_3b(s5_1(2), s5_2(2), s5_3(2));
	s6_2(4)  <= carry_3b(s5_1(3), s5_2(3), s5_3(3));
	s6_2(5)  <= carry_3b(s5_1(4), s5_2(4), s5_3(4));
	s6_2(6)  <= carry_3b(s5_1(5), s5_2(5), s5_3(5));
	s6_2(7)  <= carry_3b(s5_1(6), s5_2(6), s5_3(6));
	s6_2(8)  <= carry_3b(s5_1(7), s5_2(7), s5_3(7));
	s6_2(9)  <= carry_3b(s5_1(8), s5_2(8), s5_3(8));
	s6_2(10) <= carry_3b(s5_1(9), s5_2(9), s5_3(9));
	s6_2(11) <= carry_3b(s5_1(10),s5_2(10),s5_3(10));
	s6_2(12) <= carry_3b(s5_1(11),s5_2(11),s5_3(11));
	s6_2(13) <= carry_3b(s5_1(12),s5_2(12),s5_3(12));
	s6_2(14) <= carry_3b(s5_1(13),s5_2(13),s5_3(13));
	s6_2(15) <= carry_3b(s5_1(14),s5_2(14),s5_3(14));
	s6_2(16) <= carry_3b(s5_1(15),s5_2(15),s5_3(15));
	s6_2(17) <= carry_3b(s5_1(16),s5_2(16),s5_3(16));
	s6_2(18) <= carry_3b(s5_1(17),s5_2(17),s5_3(17));
	s6_2(19) <= carry_3b(s5_1(18),s5_2(18),s5_3(18));
	s6_2(20) <= carry_3b(s5_1(19),s5_2(19),s5_3(19));
	s6_2(21) <= carry_3b(s5_1(20),s5_2(20),s5_3(20));
	s6_2(22) <= carry_3b(s5_1(21),s5_2(21),s5_3(21));
	s6_2(23) <= carry_3b(s5_1(22),s5_2(22),s5_3(22));
	s6_2(24) <= carry_3b(s5_1(23),s5_2(23),s5_3(23));
	s6_2(25) <= carry_3b(s5_1(24),s5_2(24),s5_3(24));
	s6_2(26) <= carry_3b(s5_1(25),s5_2(25),s5_3(25));
	s6_2(27) <= carry_3b(s5_1(26),s5_2(26),s5_3(26));
	s6_2(28) <= carry_3b(s5_1(27),s5_2(27),s5_3(27));
	s6_2(29) <= carry_3b(s5_1(28),s5_2(28),s5_3(28));
	s6_2(30) <= carry_3b(s5_1(29),s5_2(29),s5_3(29));
	s6_2(31) <= carry_3b(s5_1(30),s5_2(30),s5_3(30));
	s6_2(32) <= carry_3b(s5_1(31),s5_2(31),s5_3(31));

	--Line 3 in 4 wires after 6th reduction
	s6_3(1) <= s5_3(1);
	s6_3(2)  <= s5_5(2);
	s6_3(3)  <= sum_2b(s5_4(3), s5_5(3));
	s6_3(4)  <= sum_3b(s5_4(4), s5_5(4), s5_6(4));
	s6_3(5)  <= sum_3b(s5_4(5), s5_5(5), s5_6(5));
	s6_3(6)  <= sum_3b(s5_4(6), s5_5(6), s5_6(6));
	s6_3(7)  <= sum_3b(s5_4(7), s5_5(7), s5_6(7));
	s6_3(8)  <= sum_3b(s5_4(8), s5_5(8), s5_6(8));
	s6_3(9)  <= sum_3b(s5_4(9), s5_5(9), s5_6(9));
	s6_3(10) <= sum_3b(s5_4(10),s5_5(10),s5_6(10));
	s6_3(11) <= sum_3b(s5_4(11),s5_5(11),s5_6(11));
	s6_3(12) <= sum_3b(s5_4(12),s5_5(12),s5_6(12));
	s6_3(13) <= sum_3b(s5_4(13),s5_5(13),s5_6(13));
	s6_3(14) <= sum_3b(s5_4(14),s5_5(14),s5_6(14));
	s6_3(15) <= sum_3b(s5_4(15),s5_5(15),s5_6(15));
	s6_3(16) <= sum_3b(s5_4(16),s5_5(16),s5_6(16));
	s6_3(17) <= sum_3b(s5_4(17),s5_5(17),s5_6(17));
	s6_3(18) <= sum_3b(s5_4(18),s5_5(18),s5_6(18));
	s6_3(19) <= sum_3b(s5_4(19),s5_5(19),s5_6(19));
	s6_3(20) <= sum_3b(s5_4(20),s5_5(20),s5_6(20));
	s6_3(21) <= sum_3b(s5_4(21),s5_5(21),s5_6(21));
	s6_3(22) <= sum_3b(s5_4(22),s5_5(22),s5_6(22));
	s6_3(23) <= sum_3b(s5_4(23),s5_5(23),s5_6(23));
	s6_3(24) <= sum_3b(s5_4(24),s5_5(24),s5_6(24));
	s6_3(25) <= sum_3b(s5_4(25),s5_5(25),s5_6(25));
	s6_3(26) <= sum_3b(s5_4(26),s5_5(26),s5_6(26));
	s6_3(27) <= sum_3b(s5_4(27),s5_5(27),s5_6(27));
	s6_3(28) <= sum_3b(s5_4(28),s5_5(28),s5_6(28));
	s6_3(29) <= sum_3b(s5_4(29),s5_5(29),s5_6(29));
	s6_3(30) <= sum_3b(s5_4(30),s5_5(30),s5_6(30));
	s6_3(31) <= sum_3b(s5_4(31),s5_5(31),s5_6(31));
	s6_3(32) <= s5_2(32);

	--Line 4 in 4 wires after 6th reduction
	s6_4(1) <= s5_4(1);
	s6_4(2)  <= s5_6(2);
	s6_4(3)  <= s5_6(3);
	s6_4(4)  <= carry_2b(s5_4(3), s5_5(3));
	s6_4(5)  <= carry_3b(s5_4(4), s5_5(4), s5_6(4));
	s6_4(6)  <= carry_3b(s5_4(5), s5_5(5), s5_6(5));
	s6_4(7)  <= carry_3b(s5_4(6), s5_5(6), s5_6(6));
	s6_4(8)  <= carry_3b(s5_4(7), s5_5(7), s5_6(7));
	s6_4(9)  <= carry_3b(s5_4(8), s5_5(8), s5_6(8));
	s6_4(10) <= carry_3b(s5_4(9), s5_5(9), s5_6(9));
	s6_4(11) <= carry_3b(s5_4(10),s5_5(10),s5_6(10));
	s6_4(12) <= carry_3b(s5_4(11),s5_5(11),s5_6(11));
	s6_4(13) <= carry_3b(s5_4(12),s5_5(12),s5_6(12));
	s6_4(14) <= carry_3b(s5_4(13),s5_5(13),s5_6(13));
	s6_4(15) <= carry_3b(s5_4(14),s5_5(14),s5_6(14));
	s6_4(16) <= carry_3b(s5_4(15),s5_5(15),s5_6(15));
	s6_4(17) <= carry_3b(s5_4(16),s5_5(16),s5_6(16));
	s6_4(18) <= carry_3b(s5_4(17),s5_5(17),s5_6(17));
	s6_4(19) <= carry_3b(s5_4(18),s5_5(18),s5_6(18));
	s6_4(20) <= carry_3b(s5_4(19),s5_5(19),s5_6(19));
	s6_4(21) <= carry_3b(s5_4(20),s5_5(20),s5_6(20));
	s6_4(22) <= carry_3b(s5_4(21),s5_5(21),s5_6(21));
	s6_4(23) <= carry_3b(s5_4(22),s5_5(22),s5_6(22));
	s6_4(24) <= carry_3b(s5_4(23),s5_5(23),s5_6(23));
	s6_4(25) <= carry_3b(s5_4(24),s5_5(24),s5_6(24));
	s6_4(26) <= carry_3b(s5_4(25),s5_5(25),s5_6(25));
	s6_4(27) <= carry_3b(s5_4(26),s5_5(26),s5_6(26));
	s6_4(28) <= carry_3b(s5_4(27),s5_5(27),s5_6(27));
	s6_4(29) <= carry_3b(s5_4(28),s5_5(28),s5_6(28));
	s6_4(30) <= carry_3b(s5_4(29),s5_5(29),s5_6(29));
	s6_4(31) <= carry_3b(s5_4(30),s5_5(30),s5_6(30));
	s6_4(32) <= carry_3b(s5_4(31),s5_5(31),s5_6(31));

----------------------------------------------------------------
-----------------------------STEP 7-----------------------------
----------------------------------------------------------------
	--Line 1 in 3 wires after 7th reduction
	s7_1(0) <= s6_1(0);
	s7_1(1) <= sum_2b(s6_1(1),s6_2(1));
	s7_1(2) <= sum_3b(s6_1(2),s6_2(2),s6_3(2));
	s7_1(3)  <= sum_3b(s6_1(3), s6_2(3), s6_3(3));
	s7_1(4)  <= sum_3b(s6_1(4), s6_2(4), s6_3(4));
	s7_1(5)  <= sum_3b(s6_1(5), s6_2(5), s6_3(5));
	s7_1(6)  <= sum_3b(s6_1(6), s6_2(6), s6_3(6));
	s7_1(7)  <= sum_3b(s6_1(7), s6_2(7), s6_3(7));
	s7_1(8)  <= sum_3b(s6_1(8), s6_2(8), s6_3(8));
	s7_1(9)  <= sum_3b(s6_1(9), s6_2(9), s6_3(9));
	s7_1(10) <= sum_3b(s6_1(10),s6_2(10),s6_3(10));
	s7_1(11) <= sum_3b(s6_1(11),s6_2(11),s6_3(11));
	s7_1(12) <= sum_3b(s6_1(12),s6_2(12),s6_3(12));
	s7_1(13) <= sum_3b(s6_1(13),s6_2(13),s6_3(13));
	s7_1(14) <= sum_3b(s6_1(14),s6_2(14),s6_3(14));
	s7_1(15) <= sum_3b(s6_1(15),s6_2(15),s6_3(15));
	s7_1(16) <= sum_3b(s6_1(16),s6_2(16),s6_3(16));
	s7_1(17) <= sum_3b(s6_1(17),s6_2(17),s6_3(17));
	s7_1(18) <= sum_3b(s6_1(18),s6_2(18),s6_3(18));
	s7_1(19) <= sum_3b(s6_1(19),s6_2(19),s6_3(19));
	s7_1(20) <= sum_3b(s6_1(20),s6_2(20),s6_3(20));
	s7_1(21) <= sum_3b(s6_1(21),s6_2(21),s6_3(21));
	s7_1(22) <= sum_3b(s6_1(22),s6_2(22),s6_3(22));
	s7_1(23) <= sum_3b(s6_1(23),s6_2(23),s6_3(23));
	s7_1(24) <= sum_3b(s6_1(24),s6_2(24),s6_3(24));
	s7_1(25) <= sum_3b(s6_1(25),s6_2(25),s6_3(25));
	s7_1(26) <= sum_3b(s6_1(26),s6_2(26),s6_3(26));
	s7_1(27) <= sum_3b(s6_1(27),s6_2(27),s6_3(27));
	s7_1(28) <= sum_3b(s6_1(28),s6_2(28),s6_3(28));
	s7_1(29) <= sum_3b(s6_1(29),s6_2(29),s6_3(29));
	s7_1(30) <= sum_3b(s6_1(30),s6_2(30),s6_3(30));
	s7_1(31) <= sum_3b(s6_1(31),s6_2(31),s6_3(31));
	s7_1(32) <= sum_3b(s6_1(32),s6_2(32),s6_3(32));
	s7_1(33) <= l0(16);

	--Line 2 in 3 wires after 7th reduction
	s7_2(0) <= s6_2(0);
	s7_2(1) <= s6_3(1);
	s7_2(2) <= carry_2b(s6_1(1),s6_2(1));
	s7_2(3)  <= carry_3b(s6_1(2),s6_2(2),s6_3(2));
	s7_2(4)  <= carry_3b(s6_1(3), s6_2(3), s6_3(3));
	s7_2(5)  <= carry_3b(s6_1(4), s6_2(4), s6_3(4));
	s7_2(6)  <= carry_3b(s6_1(5), s6_2(5), s6_3(5));
	s7_2(7)  <= carry_3b(s6_1(6), s6_2(6), s6_3(6));
	s7_2(8)  <= carry_3b(s6_1(7), s6_2(7), s6_3(7));
	s7_2(9)  <= carry_3b(s6_1(8), s6_2(8), s6_3(8));
	s7_2(10) <= carry_3b(s6_1(9), s6_2(9), s6_3(9));
	s7_2(11) <= carry_3b(s6_1(10),s6_2(10),s6_3(10));
	s7_2(12) <= carry_3b(s6_1(11),s6_2(11),s6_3(11));
	s7_2(13) <= carry_3b(s6_1(12),s6_2(12),s6_3(12));
	s7_2(14) <= carry_3b(s6_1(13),s6_2(13),s6_3(13));
	s7_2(15) <= carry_3b(s6_1(14),s6_2(14),s6_3(14));
	s7_2(16) <= carry_3b(s6_1(15),s6_2(15),s6_3(15));
	s7_2(17) <= carry_3b(s6_1(16),s6_2(16),s6_3(16));
	s7_2(18) <= carry_3b(s6_1(17),s6_2(17),s6_3(17));
	s7_2(19) <= carry_3b(s6_1(18),s6_2(18),s6_3(18));
	s7_2(20) <= carry_3b(s6_1(19),s6_2(19),s6_3(19));
	s7_2(21) <= carry_3b(s6_1(20),s6_2(20),s6_3(20));
	s7_2(22) <= carry_3b(s6_1(21),s6_2(21),s6_3(21));
	s7_2(23) <= carry_3b(s6_1(22),s6_2(22),s6_3(22));
	s7_2(24) <= carry_3b(s6_1(23),s6_2(23),s6_3(23));
	s7_2(25) <= carry_3b(s6_1(24),s6_2(24),s6_3(24));
	s7_2(26) <= carry_3b(s6_1(25),s6_2(25),s6_3(25));
	s7_2(27) <= carry_3b(s6_1(26),s6_2(26),s6_3(26));
	s7_2(28) <= carry_3b(s6_1(27),s6_2(27),s6_3(27));
	s7_2(29) <= carry_3b(s6_1(28),s6_2(28),s6_3(28));
	s7_2(30) <= carry_3b(s6_1(29),s6_2(29),s6_3(29));
	s7_2(31) <= carry_3b(s6_1(30),s6_2(30),s6_3(30));
	s7_2(32) <= carry_3b(s6_1(31),s6_2(31),s6_3(31));
	s7_2(33) <= carry_3b(s6_1(32),s6_2(32),s6_3(32));


	--Line 3 in 3 wires after 7th reduction
	s7_3(32 downto 1) <= s6_4(32 downto 1);
	s7_3(33) <= l18(16);

----------------------------------------------------------------
-----------------------------STEP 8-----------------------------
----------------------------------------------------------------
	--Line 1 in 2 wires after 8th reduction
	s8_1(0) <= s7_1(0);
	s8_1(1)  <= sum_2b(s7_1(1), s7_2(1));
	s8_1(2)  <= sum_3b(s7_1(2), s7_2(2), s7_3(2));
	s8_1(3)  <= sum_3b(s7_1(3), s7_2(3), s7_3(3));
	s8_1(4)  <= sum_3b(s7_1(4), s7_2(4), s7_3(4));
	s8_1(5)  <= sum_3b(s7_1(5), s7_2(5), s7_3(5));
	s8_1(6)  <= sum_3b(s7_1(6), s7_2(6), s7_3(6));
	s8_1(7)  <= sum_3b(s7_1(7), s7_2(7), s7_3(7));
	s8_1(8)  <= sum_3b(s7_1(8), s7_2(8), s7_3(8));
	s8_1(9)  <= sum_3b(s7_1(9), s7_2(9), s7_3(9));
	s8_1(10) <= sum_3b(s7_1(10),s7_2(10),s7_3(10));
	s8_1(11) <= sum_3b(s7_1(11),s7_2(11),s7_3(11));
	s8_1(12) <= sum_3b(s7_1(12),s7_2(12),s7_3(12));
	s8_1(13) <= sum_3b(s7_1(13),s7_2(13),s7_3(13));
	s8_1(14) <= sum_3b(s7_1(14),s7_2(14),s7_3(14));
	s8_1(15) <= sum_3b(s7_1(15),s7_2(15),s7_3(15));
	s8_1(16) <= sum_3b(s7_1(16),s7_2(16),s7_3(16));
	s8_1(17) <= sum_3b(s7_1(17),s7_2(17),s7_3(17));
	s8_1(18) <= sum_3b(s7_1(18),s7_2(18),s7_3(18));
	s8_1(19) <= sum_3b(s7_1(19),s7_2(19),s7_3(19));
	s8_1(20) <= sum_3b(s7_1(20),s7_2(20),s7_3(20));
	s8_1(21) <= sum_3b(s7_1(21),s7_2(21),s7_3(21));
	s8_1(22) <= sum_3b(s7_1(22),s7_2(22),s7_3(22));
	s8_1(23) <= sum_3b(s7_1(23),s7_2(23),s7_3(23));
	s8_1(24) <= sum_3b(s7_1(24),s7_2(24),s7_3(24));
	s8_1(25) <= sum_3b(s7_1(25),s7_2(25),s7_3(25));
	s8_1(26) <= sum_3b(s7_1(26),s7_2(26),s7_3(26));
	s8_1(27) <= sum_3b(s7_1(27),s7_2(27),s7_3(27));
	s8_1(28) <= sum_3b(s7_1(28),s7_2(28),s7_3(28));
	s8_1(29) <= sum_3b(s7_1(29),s7_2(29),s7_3(29));
	s8_1(30) <= sum_3b(s7_1(30),s7_2(30),s7_3(30));
	s8_1(31) <= sum_3b(s7_1(31),s7_2(31),s7_3(31));
	s8_1(32) <= sum_3b(s7_1(32),s7_2(32),s7_3(32));
	s8_1(33) <= sum_3b(s7_1(33),s7_2(33),s7_3(33));

	--Line 2 in 2 wires after 8th reduction
	s8_2(0) <= s7_2(0);
	s8_2(1)  <= s7_3(1);
	s8_2(2)  <= carry_2b(s7_1(1), s7_2(1));
	s8_2(3)  <= carry_3b(s7_1(2), s7_2(2), s7_3(2));
	s8_2(4)  <= carry_3b(s7_1(3), s7_2(3), s7_3(3));
	s8_2(5)  <= carry_3b(s7_1(4), s7_2(4), s7_3(4));
	s8_2(6)  <= carry_3b(s7_1(5), s7_2(5), s7_3(5));
	s8_2(7)  <= carry_3b(s7_1(6), s7_2(6), s7_3(6));
	s8_2(8)  <= carry_3b(s7_1(7), s7_2(7), s7_3(7));
	s8_2(9)  <= carry_3b(s7_1(8), s7_2(8), s7_3(8));
	s8_2(10) <= carry_3b(s7_1(9), s7_2(9), s7_3(9));
	s8_2(11) <= carry_3b(s7_1(10),s7_2(10),s7_3(10));
	s8_2(12) <= carry_3b(s7_1(11),s7_2(11),s7_3(11));
	s8_2(13) <= carry_3b(s7_1(12),s7_2(12),s7_3(12));
	s8_2(14) <= carry_3b(s7_1(13),s7_2(13),s7_3(13));
	s8_2(15) <= carry_3b(s7_1(14),s7_2(14),s7_3(14));
	s8_2(16) <= carry_3b(s7_1(15),s7_2(15),s7_3(15));
	s8_2(17) <= carry_3b(s7_1(16),s7_2(16),s7_3(16));
	s8_2(18) <= carry_3b(s7_1(17),s7_2(17),s7_3(17));
	s8_2(19) <= carry_3b(s7_1(18),s7_2(18),s7_3(18));
	s8_2(20) <= carry_3b(s7_1(19),s7_2(19),s7_3(19));
	s8_2(21) <= carry_3b(s7_1(20),s7_2(20),s7_3(20));
	s8_2(22) <= carry_3b(s7_1(21),s7_2(21),s7_3(21));
	s8_2(23) <= carry_3b(s7_1(22),s7_2(22),s7_3(22));
	s8_2(24) <= carry_3b(s7_1(23),s7_2(23),s7_3(23));
	s8_2(25) <= carry_3b(s7_1(24),s7_2(24),s7_3(24));
	s8_2(26) <= carry_3b(s7_1(25),s7_2(25),s7_3(25));
	s8_2(27) <= carry_3b(s7_1(26),s7_2(26),s7_3(26));
	s8_2(28) <= carry_3b(s7_1(27),s7_2(27),s7_3(27));
	s8_2(29) <= carry_3b(s7_1(28),s7_2(28),s7_3(28));
	s8_2(30) <= carry_3b(s7_1(29),s7_2(29),s7_3(29));
	s8_2(31) <= carry_3b(s7_1(30),s7_2(30),s7_3(30));
	s8_2(32) <= carry_3b(s7_1(31),s7_2(31),s7_3(31));
	s8_2(33) <= carry_3b(s7_1(32),s7_2(32),s7_3(32));
--carry_3b(s7_1(33),s7_2(33),s7_3(33))
----------------------------------------------------------------
--------------------------FINAL  ADDER--------------------------
----------------------------------------------------------------

temp_out <= std_logic_vector(unsigned(s8_1(33 downto 0)) + unsigned(s8_2(33 downto 0)));
outp <= temp_out(33 downto 0);

--Add in the end
--Mux for MSB
--Condition for updating final o/p only (But will we reach that condition)

end architecture;
