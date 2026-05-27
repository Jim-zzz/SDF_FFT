/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12
// Date      : Mon Jul 28 16:45:13 2025
/////////////////////////////////////////////////////////////

`timescale 1ns/1ps
module FSM_DW01_inc_0_DW01_inc_14 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module FSM ( clk, reset, sel, bf_nj, do_en );
  input clk, reset;
  output sel, bf_nj, do_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23,
         \next_state1[0] , \next_state2[0] , N32, N35, N38, n7, n1, n2, n3, n4,
         n5, n6, n8, n9, n10, n11, n12, n13, n14, n15, n16;
  wire   [6:0] cnt;
  assign sel = N35;
  assign bf_nj = N38;

  DFFRHQX4 \state1_reg[0]  ( .D(\next_state1[0] ), .CK(clk), .RN(n7), .Q(N35)
         );
  DFFRHQX4 \state2_reg[0]  ( .D(\next_state2[0] ), .CK(clk), .RN(n7), .Q(N38)
         );
  DFFRHQX1 \cnt_reg[0]  ( .D(N17), .CK(clk), .RN(n7), .Q(cnt[0]) );
  DFFRHQX1 \cnt_reg[1]  ( .D(N18), .CK(clk), .RN(n7), .Q(cnt[1]) );
  DFFRHQX1 \cnt_reg[2]  ( .D(N19), .CK(clk), .RN(n7), .Q(cnt[2]) );
  DFFRHQX1 \cnt_reg[3]  ( .D(N20), .CK(clk), .RN(n7), .Q(cnt[3]) );
  DFFRHQX1 \cnt_reg[4]  ( .D(N21), .CK(clk), .RN(n7), .Q(cnt[4]) );
  DFFRHQX1 \cnt_reg[5]  ( .D(N22), .CK(clk), .RN(n7), .Q(cnt[5]) );
  DFFRHQX1 \cnt_reg[6]  ( .D(N23), .CK(clk), .RN(n7), .Q(cnt[6]) );
  DFFRHQX2 do_en_r_reg ( .D(N32), .CK(clk), .RN(n7), .Q(do_en) );
  OAI2BB2X1 U3 ( .B0(n1), .B1(n2), .A0N(N38), .A1N(n3), .Y(\next_state2[0] )
         );
  NAND4BBX1 U4 ( .AN(cnt[0]), .BN(n4), .C(n5), .D(cnt[1]), .Y(n3) );
  NAND3X1 U5 ( .A(cnt[4]), .B(cnt[1]), .C(cnt[6]), .Y(n2) );
  OR4X1 U6 ( .A(cnt[5]), .B(cnt[0]), .C(cnt[2]), .D(cnt[3]), .Y(n1) );
  OAI2BB1X1 U7 ( .A0N(N35), .A1N(n6), .B0(n8), .Y(\next_state1[0] ) );
  NAND4X1 U8 ( .A(n9), .B(n5), .C(cnt[5]), .D(n10), .Y(n8) );
  NAND3X1 U9 ( .A(cnt[0]), .B(n5), .C(n11), .Y(n6) );
  NOR3X1 U10 ( .A(n10), .B(cnt[5]), .C(cnt[1]), .Y(n11) );
  INVX1 U11 ( .A(reset), .Y(n7) );
  AOI2BB2X1 U12 ( .B0(n10), .B1(n12), .A0N(n4), .A1N(n13), .Y(N32) );
  AOI211X1 U13 ( .A0(n14), .A1(cnt[2]), .B0(cnt[3]), .C0(cnt[4]), .Y(n13) );
  INVX1 U14 ( .A(n9), .Y(n14) );
  NAND2BX1 U15 ( .AN(n5), .B(cnt[5]), .Y(n12) );
  NOR3X1 U16 ( .A(cnt[3]), .B(cnt[4]), .C(cnt[2]), .Y(n5) );
  INVX1 U17 ( .A(cnt[6]), .Y(n10) );
  AND2X1 U18 ( .A(N16), .B(n15), .Y(N23) );
  AND2X1 U19 ( .A(N15), .B(n15), .Y(N22) );
  AND2X1 U20 ( .A(N14), .B(n15), .Y(N21) );
  AND2X1 U21 ( .A(N13), .B(n15), .Y(N20) );
  AND2X1 U22 ( .A(N12), .B(n15), .Y(N19) );
  AND2X1 U23 ( .A(N11), .B(n15), .Y(N18) );
  AND2X1 U24 ( .A(N10), .B(n15), .Y(N17) );
  NAND3X1 U25 ( .A(cnt[2]), .B(n9), .C(n16), .Y(n15) );
  NOR3X1 U26 ( .A(n4), .B(cnt[4]), .C(cnt[3]), .Y(n16) );
  NAND2X1 U27 ( .A(cnt[5]), .B(cnt[6]), .Y(n4) );
  NOR2X1 U28 ( .A(cnt[0]), .B(cnt[1]), .Y(n9) );
  FSM_DW01_inc_0_DW01_inc_14 add_27 ( .A(cnt), .SUM({N16, N15, N14, N13, N12, 
        N11, N10}) );
endmodule


module delaybuffer_WIDTH12_DEPTH31 ( clk, reset, x_re, x_im, y_re, y_im );
  input [11:0] x_re;
  input [11:0] x_im;
  output [11:0] y_re;
  output [11:0] y_im;
  input clk, reset;
  wire   \buf_im[30][11] , \buf_im[30][10] , \buf_im[30][9] , \buf_im[30][8] ,
         \buf_im[30][7] , \buf_im[30][6] , \buf_im[30][5] , \buf_im[30][4] ,
         \buf_im[30][3] , \buf_im[30][2] , \buf_im[30][1] , \buf_im[30][0] ,
         \buf_im[29][11] , \buf_im[29][10] , \buf_im[29][9] , \buf_im[29][8] ,
         \buf_im[29][7] , \buf_im[29][6] , \buf_im[29][5] , \buf_im[29][4] ,
         \buf_im[29][3] , \buf_im[29][2] , \buf_im[29][1] , \buf_im[29][0] ,
         \buf_im[28][11] , \buf_im[28][10] , \buf_im[28][9] , \buf_im[28][8] ,
         \buf_im[28][7] , \buf_im[28][6] , \buf_im[28][5] , \buf_im[28][4] ,
         \buf_im[28][3] , \buf_im[28][2] , \buf_im[28][1] , \buf_im[28][0] ,
         \buf_im[27][11] , \buf_im[27][10] , \buf_im[27][9] , \buf_im[27][8] ,
         \buf_im[27][7] , \buf_im[27][6] , \buf_im[27][5] , \buf_im[27][4] ,
         \buf_im[27][3] , \buf_im[27][2] , \buf_im[27][1] , \buf_im[27][0] ,
         \buf_im[26][11] , \buf_im[26][10] , \buf_im[26][9] , \buf_im[26][8] ,
         \buf_im[26][7] , \buf_im[26][6] , \buf_im[26][5] , \buf_im[26][4] ,
         \buf_im[26][3] , \buf_im[26][2] , \buf_im[26][1] , \buf_im[26][0] ,
         \buf_im[25][11] , \buf_im[25][10] , \buf_im[25][9] , \buf_im[25][8] ,
         \buf_im[25][7] , \buf_im[25][6] , \buf_im[25][5] , \buf_im[25][4] ,
         \buf_im[25][3] , \buf_im[25][2] , \buf_im[25][1] , \buf_im[25][0] ,
         \buf_im[24][11] , \buf_im[24][10] , \buf_im[24][9] , \buf_im[24][8] ,
         \buf_im[24][7] , \buf_im[24][6] , \buf_im[24][5] , \buf_im[24][4] ,
         \buf_im[24][3] , \buf_im[24][2] , \buf_im[24][1] , \buf_im[24][0] ,
         \buf_im[23][11] , \buf_im[23][10] , \buf_im[23][9] , \buf_im[23][8] ,
         \buf_im[23][7] , \buf_im[23][6] , \buf_im[23][5] , \buf_im[23][4] ,
         \buf_im[23][3] , \buf_im[23][2] , \buf_im[23][1] , \buf_im[23][0] ,
         \buf_im[22][11] , \buf_im[22][10] , \buf_im[22][9] , \buf_im[22][8] ,
         \buf_im[22][7] , \buf_im[22][6] , \buf_im[22][5] , \buf_im[22][4] ,
         \buf_im[22][3] , \buf_im[22][2] , \buf_im[22][1] , \buf_im[22][0] ,
         \buf_im[21][11] , \buf_im[21][10] , \buf_im[21][9] , \buf_im[21][8] ,
         \buf_im[21][7] , \buf_im[21][6] , \buf_im[21][5] , \buf_im[21][4] ,
         \buf_im[21][3] , \buf_im[21][2] , \buf_im[21][1] , \buf_im[21][0] ,
         \buf_im[20][11] , \buf_im[20][10] , \buf_im[20][9] , \buf_im[20][8] ,
         \buf_im[20][7] , \buf_im[20][6] , \buf_im[20][5] , \buf_im[20][4] ,
         \buf_im[20][3] , \buf_im[20][2] , \buf_im[20][1] , \buf_im[20][0] ,
         \buf_im[19][11] , \buf_im[19][10] , \buf_im[19][9] , \buf_im[19][8] ,
         \buf_im[19][7] , \buf_im[19][6] , \buf_im[19][5] , \buf_im[19][4] ,
         \buf_im[19][3] , \buf_im[19][2] , \buf_im[19][1] , \buf_im[19][0] ,
         \buf_im[18][11] , \buf_im[18][10] , \buf_im[18][9] , \buf_im[18][8] ,
         \buf_im[18][7] , \buf_im[18][6] , \buf_im[18][5] , \buf_im[18][4] ,
         \buf_im[18][3] , \buf_im[18][2] , \buf_im[18][1] , \buf_im[18][0] ,
         \buf_im[17][11] , \buf_im[17][10] , \buf_im[17][9] , \buf_im[17][8] ,
         \buf_im[17][7] , \buf_im[17][6] , \buf_im[17][5] , \buf_im[17][4] ,
         \buf_im[17][3] , \buf_im[17][2] , \buf_im[17][1] , \buf_im[17][0] ,
         \buf_im[16][11] , \buf_im[16][10] , \buf_im[16][9] , \buf_im[16][8] ,
         \buf_im[16][7] , \buf_im[16][6] , \buf_im[16][5] , \buf_im[16][4] ,
         \buf_im[16][3] , \buf_im[16][2] , \buf_im[16][1] , \buf_im[16][0] ,
         \buf_im[15][11] , \buf_im[15][10] , \buf_im[15][9] , \buf_im[15][8] ,
         \buf_im[15][7] , \buf_im[15][6] , \buf_im[15][5] , \buf_im[15][4] ,
         \buf_im[15][3] , \buf_im[15][2] , \buf_im[15][1] , \buf_im[15][0] ,
         \buf_im[14][11] , \buf_im[14][10] , \buf_im[14][9] , \buf_im[14][8] ,
         \buf_im[14][7] , \buf_im[14][6] , \buf_im[14][5] , \buf_im[14][4] ,
         \buf_im[14][3] , \buf_im[14][2] , \buf_im[14][1] , \buf_im[14][0] ,
         \buf_im[13][11] , \buf_im[13][10] , \buf_im[13][9] , \buf_im[13][8] ,
         \buf_im[13][7] , \buf_im[13][6] , \buf_im[13][5] , \buf_im[13][4] ,
         \buf_im[13][3] , \buf_im[13][2] , \buf_im[13][1] , \buf_im[13][0] ,
         \buf_im[12][11] , \buf_im[12][10] , \buf_im[12][9] , \buf_im[12][8] ,
         \buf_im[12][7] , \buf_im[12][6] , \buf_im[12][5] , \buf_im[12][4] ,
         \buf_im[12][3] , \buf_im[12][2] , \buf_im[12][1] , \buf_im[12][0] ,
         \buf_im[11][11] , \buf_im[11][10] , \buf_im[11][9] , \buf_im[11][8] ,
         \buf_im[11][7] , \buf_im[11][6] , \buf_im[11][5] , \buf_im[11][4] ,
         \buf_im[11][3] , \buf_im[11][2] , \buf_im[11][1] , \buf_im[11][0] ,
         \buf_im[10][11] , \buf_im[10][10] , \buf_im[10][9] , \buf_im[10][8] ,
         \buf_im[10][7] , \buf_im[10][6] , \buf_im[10][5] , \buf_im[10][4] ,
         \buf_im[10][3] , \buf_im[10][2] , \buf_im[10][1] , \buf_im[10][0] ,
         \buf_im[9][11] , \buf_im[9][10] , \buf_im[9][9] , \buf_im[9][8] ,
         \buf_im[9][7] , \buf_im[9][6] , \buf_im[9][5] , \buf_im[9][4] ,
         \buf_im[9][3] , \buf_im[9][2] , \buf_im[9][1] , \buf_im[9][0] ,
         \buf_im[8][11] , \buf_im[8][10] , \buf_im[8][9] , \buf_im[8][8] ,
         \buf_im[8][7] , \buf_im[8][6] , \buf_im[8][5] , \buf_im[8][4] ,
         \buf_im[8][3] , \buf_im[8][2] , \buf_im[8][1] , \buf_im[8][0] ,
         \buf_im[7][11] , \buf_im[7][10] , \buf_im[7][9] , \buf_im[7][8] ,
         \buf_im[7][7] , \buf_im[7][6] , \buf_im[7][5] , \buf_im[7][4] ,
         \buf_im[7][3] , \buf_im[7][2] , \buf_im[7][1] , \buf_im[7][0] ,
         \buf_im[6][11] , \buf_im[6][10] , \buf_im[6][9] , \buf_im[6][8] ,
         \buf_im[6][7] , \buf_im[6][6] , \buf_im[6][5] , \buf_im[6][4] ,
         \buf_im[6][3] , \buf_im[6][2] , \buf_im[6][1] , \buf_im[6][0] ,
         \buf_im[5][11] , \buf_im[5][10] , \buf_im[5][9] , \buf_im[5][8] ,
         \buf_im[5][7] , \buf_im[5][6] , \buf_im[5][5] , \buf_im[5][4] ,
         \buf_im[5][3] , \buf_im[5][2] , \buf_im[5][1] , \buf_im[5][0] ,
         \buf_im[4][11] , \buf_im[4][10] , \buf_im[4][9] , \buf_im[4][8] ,
         \buf_im[4][7] , \buf_im[4][6] , \buf_im[4][5] , \buf_im[4][4] ,
         \buf_im[4][3] , \buf_im[4][2] , \buf_im[4][1] , \buf_im[4][0] ,
         \buf_im[3][11] , \buf_im[3][10] , \buf_im[3][9] , \buf_im[3][8] ,
         \buf_im[3][7] , \buf_im[3][6] , \buf_im[3][5] , \buf_im[3][4] ,
         \buf_im[3][3] , \buf_im[3][2] , \buf_im[3][1] , \buf_im[3][0] ,
         \buf_im[2][11] , \buf_im[2][10] , \buf_im[2][9] , \buf_im[2][8] ,
         \buf_im[2][7] , \buf_im[2][6] , \buf_im[2][5] , \buf_im[2][4] ,
         \buf_im[2][3] , \buf_im[2][2] , \buf_im[2][1] , \buf_im[2][0] ,
         \buf_im[1][11] , \buf_im[1][10] , \buf_im[1][9] , \buf_im[1][8] ,
         \buf_im[1][7] , \buf_im[1][6] , \buf_im[1][5] , \buf_im[1][4] ,
         \buf_im[1][3] , \buf_im[1][2] , \buf_im[1][1] , \buf_im[1][0] ,
         \buf_re[30][11] , \buf_re[30][10] , \buf_re[30][9] , \buf_re[30][8] ,
         \buf_re[30][7] , \buf_re[30][6] , \buf_re[30][5] , \buf_re[30][4] ,
         \buf_re[30][3] , \buf_re[30][2] , \buf_re[30][1] , \buf_re[30][0] ,
         \buf_re[29][11] , \buf_re[29][10] , \buf_re[29][9] , \buf_re[29][8] ,
         \buf_re[29][7] , \buf_re[29][6] , \buf_re[29][5] , \buf_re[29][4] ,
         \buf_re[29][3] , \buf_re[29][2] , \buf_re[29][1] , \buf_re[29][0] ,
         \buf_re[28][11] , \buf_re[28][10] , \buf_re[28][9] , \buf_re[28][8] ,
         \buf_re[28][7] , \buf_re[28][6] , \buf_re[28][5] , \buf_re[28][4] ,
         \buf_re[28][3] , \buf_re[28][2] , \buf_re[28][1] , \buf_re[28][0] ,
         \buf_re[27][11] , \buf_re[27][10] , \buf_re[27][9] , \buf_re[27][8] ,
         \buf_re[27][7] , \buf_re[27][6] , \buf_re[27][5] , \buf_re[27][4] ,
         \buf_re[27][3] , \buf_re[27][2] , \buf_re[27][1] , \buf_re[27][0] ,
         \buf_re[26][11] , \buf_re[26][10] , \buf_re[26][9] , \buf_re[26][8] ,
         \buf_re[26][7] , \buf_re[26][6] , \buf_re[26][5] , \buf_re[26][4] ,
         \buf_re[26][3] , \buf_re[26][2] , \buf_re[26][1] , \buf_re[26][0] ,
         \buf_re[25][11] , \buf_re[25][10] , \buf_re[25][9] , \buf_re[25][8] ,
         \buf_re[25][7] , \buf_re[25][6] , \buf_re[25][5] , \buf_re[25][4] ,
         \buf_re[25][3] , \buf_re[25][2] , \buf_re[25][1] , \buf_re[25][0] ,
         \buf_re[24][11] , \buf_re[24][10] , \buf_re[24][9] , \buf_re[24][8] ,
         \buf_re[24][7] , \buf_re[24][6] , \buf_re[24][5] , \buf_re[24][4] ,
         \buf_re[24][3] , \buf_re[24][2] , \buf_re[24][1] , \buf_re[24][0] ,
         \buf_re[23][11] , \buf_re[23][10] , \buf_re[23][9] , \buf_re[23][8] ,
         \buf_re[23][7] , \buf_re[23][6] , \buf_re[23][5] , \buf_re[23][4] ,
         \buf_re[23][3] , \buf_re[23][2] , \buf_re[23][1] , \buf_re[23][0] ,
         \buf_re[22][11] , \buf_re[22][10] , \buf_re[22][9] , \buf_re[22][8] ,
         \buf_re[22][7] , \buf_re[22][6] , \buf_re[22][5] , \buf_re[22][4] ,
         \buf_re[22][3] , \buf_re[22][2] , \buf_re[22][1] , \buf_re[22][0] ,
         \buf_re[21][11] , \buf_re[21][10] , \buf_re[21][9] , \buf_re[21][8] ,
         \buf_re[21][7] , \buf_re[21][6] , \buf_re[21][5] , \buf_re[21][4] ,
         \buf_re[21][3] , \buf_re[21][2] , \buf_re[21][1] , \buf_re[21][0] ,
         \buf_re[20][11] , \buf_re[20][10] , \buf_re[20][9] , \buf_re[20][8] ,
         \buf_re[20][7] , \buf_re[20][6] , \buf_re[20][5] , \buf_re[20][4] ,
         \buf_re[20][3] , \buf_re[20][2] , \buf_re[20][1] , \buf_re[20][0] ,
         \buf_re[19][11] , \buf_re[19][10] , \buf_re[19][9] , \buf_re[19][8] ,
         \buf_re[19][7] , \buf_re[19][6] , \buf_re[19][5] , \buf_re[19][4] ,
         \buf_re[19][3] , \buf_re[19][2] , \buf_re[19][1] , \buf_re[19][0] ,
         \buf_re[18][11] , \buf_re[18][10] , \buf_re[18][9] , \buf_re[18][8] ,
         \buf_re[18][7] , \buf_re[18][6] , \buf_re[18][5] , \buf_re[18][4] ,
         \buf_re[18][3] , \buf_re[18][2] , \buf_re[18][1] , \buf_re[18][0] ,
         \buf_re[17][11] , \buf_re[17][10] , \buf_re[17][9] , \buf_re[17][8] ,
         \buf_re[17][7] , \buf_re[17][6] , \buf_re[17][5] , \buf_re[17][4] ,
         \buf_re[17][3] , \buf_re[17][2] , \buf_re[17][1] , \buf_re[17][0] ,
         \buf_re[16][11] , \buf_re[16][10] , \buf_re[16][9] , \buf_re[16][8] ,
         \buf_re[16][7] , \buf_re[16][6] , \buf_re[16][5] , \buf_re[16][4] ,
         \buf_re[16][3] , \buf_re[16][2] , \buf_re[16][1] , \buf_re[16][0] ,
         \buf_re[15][11] , \buf_re[15][10] , \buf_re[15][9] , \buf_re[15][8] ,
         \buf_re[15][7] , \buf_re[15][6] , \buf_re[15][5] , \buf_re[15][4] ,
         \buf_re[15][3] , \buf_re[15][2] , \buf_re[15][1] , \buf_re[15][0] ,
         \buf_re[14][11] , \buf_re[14][10] , \buf_re[14][9] , \buf_re[14][8] ,
         \buf_re[14][7] , \buf_re[14][6] , \buf_re[14][5] , \buf_re[14][4] ,
         \buf_re[14][3] , \buf_re[14][2] , \buf_re[14][1] , \buf_re[14][0] ,
         \buf_re[13][11] , \buf_re[13][10] , \buf_re[13][9] , \buf_re[13][8] ,
         \buf_re[13][7] , \buf_re[13][6] , \buf_re[13][5] , \buf_re[13][4] ,
         \buf_re[13][3] , \buf_re[13][2] , \buf_re[13][1] , \buf_re[13][0] ,
         \buf_re[12][11] , \buf_re[12][10] , \buf_re[12][9] , \buf_re[12][8] ,
         \buf_re[12][7] , \buf_re[12][6] , \buf_re[12][5] , \buf_re[12][4] ,
         \buf_re[12][3] , \buf_re[12][2] , \buf_re[12][1] , \buf_re[12][0] ,
         \buf_re[11][11] , \buf_re[11][10] , \buf_re[11][9] , \buf_re[11][8] ,
         \buf_re[11][7] , \buf_re[11][6] , \buf_re[11][5] , \buf_re[11][4] ,
         \buf_re[11][3] , \buf_re[11][2] , \buf_re[11][1] , \buf_re[11][0] ,
         \buf_re[10][11] , \buf_re[10][10] , \buf_re[10][9] , \buf_re[10][8] ,
         \buf_re[10][7] , \buf_re[10][6] , \buf_re[10][5] , \buf_re[10][4] ,
         \buf_re[10][3] , \buf_re[10][2] , \buf_re[10][1] , \buf_re[10][0] ,
         \buf_re[9][11] , \buf_re[9][10] , \buf_re[9][9] , \buf_re[9][8] ,
         \buf_re[9][7] , \buf_re[9][6] , \buf_re[9][5] , \buf_re[9][4] ,
         \buf_re[9][3] , \buf_re[9][2] , \buf_re[9][1] , \buf_re[9][0] ,
         \buf_re[8][11] , \buf_re[8][10] , \buf_re[8][9] , \buf_re[8][8] ,
         \buf_re[8][7] , \buf_re[8][6] , \buf_re[8][5] , \buf_re[8][4] ,
         \buf_re[8][3] , \buf_re[8][2] , \buf_re[8][1] , \buf_re[8][0] ,
         \buf_re[7][11] , \buf_re[7][10] , \buf_re[7][9] , \buf_re[7][8] ,
         \buf_re[7][7] , \buf_re[7][6] , \buf_re[7][5] , \buf_re[7][4] ,
         \buf_re[7][3] , \buf_re[7][2] , \buf_re[7][1] , \buf_re[7][0] ,
         \buf_re[6][11] , \buf_re[6][10] , \buf_re[6][9] , \buf_re[6][8] ,
         \buf_re[6][7] , \buf_re[6][6] , \buf_re[6][5] , \buf_re[6][4] ,
         \buf_re[6][3] , \buf_re[6][2] , \buf_re[6][1] , \buf_re[6][0] ,
         \buf_re[5][11] , \buf_re[5][10] , \buf_re[5][9] , \buf_re[5][8] ,
         \buf_re[5][7] , \buf_re[5][6] , \buf_re[5][5] , \buf_re[5][4] ,
         \buf_re[5][3] , \buf_re[5][2] , \buf_re[5][1] , \buf_re[5][0] ,
         \buf_re[4][11] , \buf_re[4][10] , \buf_re[4][9] , \buf_re[4][8] ,
         \buf_re[4][7] , \buf_re[4][6] , \buf_re[4][5] , \buf_re[4][4] ,
         \buf_re[4][3] , \buf_re[4][2] , \buf_re[4][1] , \buf_re[4][0] ,
         \buf_re[3][11] , \buf_re[3][10] , \buf_re[3][9] , \buf_re[3][8] ,
         \buf_re[3][7] , \buf_re[3][6] , \buf_re[3][5] , \buf_re[3][4] ,
         \buf_re[3][3] , \buf_re[3][2] , \buf_re[3][1] , \buf_re[3][0] ,
         \buf_re[2][11] , \buf_re[2][10] , \buf_re[2][9] , \buf_re[2][8] ,
         \buf_re[2][7] , \buf_re[2][6] , \buf_re[2][5] , \buf_re[2][4] ,
         \buf_re[2][3] , \buf_re[2][2] , \buf_re[2][1] , \buf_re[2][0] ,
         \buf_re[1][11] , \buf_re[1][10] , \buf_re[1][9] , \buf_re[1][8] ,
         \buf_re[1][7] , \buf_re[1][6] , \buf_re[1][5] , \buf_re[1][4] ,
         \buf_re[1][3] , \buf_re[1][2] , \buf_re[1][1] , \buf_re[1][0] , n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n36, n37;

  DFFRHQX1 \buf_im_reg[1][11]  ( .D(x_im[11]), .CK(clk), .RN(n9), .Q(
        \buf_im[1][11] ) );
  DFFRHQX1 \buf_im_reg[2][11]  ( .D(\buf_im[1][11] ), .CK(clk), .RN(n9), .Q(
        \buf_im[2][11] ) );
  DFFRHQX1 \buf_im_reg[3][11]  ( .D(\buf_im[2][11] ), .CK(clk), .RN(n9), .Q(
        \buf_im[3][11] ) );
  DFFRHQX1 \buf_im_reg[4][11]  ( .D(\buf_im[3][11] ), .CK(clk), .RN(n9), .Q(
        \buf_im[4][11] ) );
  DFFRHQX1 \buf_im_reg[5][11]  ( .D(\buf_im[4][11] ), .CK(clk), .RN(n9), .Q(
        \buf_im[5][11] ) );
  DFFRHQX1 \buf_im_reg[6][11]  ( .D(\buf_im[5][11] ), .CK(clk), .RN(n9), .Q(
        \buf_im[6][11] ) );
  DFFRHQX1 \buf_im_reg[7][11]  ( .D(\buf_im[6][11] ), .CK(clk), .RN(n9), .Q(
        \buf_im[7][11] ) );
  DFFRHQX1 \buf_im_reg[8][11]  ( .D(\buf_im[7][11] ), .CK(clk), .RN(n9), .Q(
        \buf_im[8][11] ) );
  DFFRHQX1 \buf_im_reg[9][11]  ( .D(\buf_im[8][11] ), .CK(clk), .RN(n9), .Q(
        \buf_im[9][11] ) );
  DFFRHQX1 \buf_im_reg[10][11]  ( .D(\buf_im[9][11] ), .CK(clk), .RN(n9), .Q(
        \buf_im[10][11] ) );
  DFFRHQX1 \buf_im_reg[11][11]  ( .D(\buf_im[10][11] ), .CK(clk), .RN(n9), .Q(
        \buf_im[11][11] ) );
  DFFRHQX1 \buf_im_reg[12][11]  ( .D(\buf_im[11][11] ), .CK(clk), .RN(n8), .Q(
        \buf_im[12][11] ) );
  DFFRHQX1 \buf_im_reg[13][11]  ( .D(\buf_im[12][11] ), .CK(clk), .RN(n8), .Q(
        \buf_im[13][11] ) );
  DFFRHQX1 \buf_im_reg[14][11]  ( .D(\buf_im[13][11] ), .CK(clk), .RN(n8), .Q(
        \buf_im[14][11] ) );
  DFFRHQX1 \buf_im_reg[15][11]  ( .D(\buf_im[14][11] ), .CK(clk), .RN(n8), .Q(
        \buf_im[15][11] ) );
  DFFRHQX1 \buf_im_reg[16][11]  ( .D(\buf_im[15][11] ), .CK(clk), .RN(n8), .Q(
        \buf_im[16][11] ) );
  DFFRHQX1 \buf_im_reg[17][11]  ( .D(\buf_im[16][11] ), .CK(clk), .RN(n8), .Q(
        \buf_im[17][11] ) );
  DFFRHQX1 \buf_im_reg[18][11]  ( .D(\buf_im[17][11] ), .CK(clk), .RN(n8), .Q(
        \buf_im[18][11] ) );
  DFFRHQX1 \buf_im_reg[19][11]  ( .D(\buf_im[18][11] ), .CK(clk), .RN(n8), .Q(
        \buf_im[19][11] ) );
  DFFRHQX1 \buf_im_reg[20][11]  ( .D(\buf_im[19][11] ), .CK(clk), .RN(n8), .Q(
        \buf_im[20][11] ) );
  DFFRHQX1 \buf_im_reg[21][11]  ( .D(\buf_im[20][11] ), .CK(clk), .RN(n8), .Q(
        \buf_im[21][11] ) );
  DFFRHQX1 \buf_im_reg[22][11]  ( .D(\buf_im[21][11] ), .CK(clk), .RN(n8), .Q(
        \buf_im[22][11] ) );
  DFFRHQX1 \buf_im_reg[23][11]  ( .D(\buf_im[22][11] ), .CK(clk), .RN(n8), .Q(
        \buf_im[23][11] ) );
  DFFRHQX1 \buf_im_reg[24][11]  ( .D(\buf_im[23][11] ), .CK(clk), .RN(n8), .Q(
        \buf_im[24][11] ) );
  DFFRHQX1 \buf_im_reg[25][11]  ( .D(\buf_im[24][11] ), .CK(clk), .RN(n34), 
        .Q(\buf_im[25][11] ) );
  DFFRHQX1 \buf_im_reg[26][11]  ( .D(\buf_im[25][11] ), .CK(clk), .RN(n12), 
        .Q(\buf_im[26][11] ) );
  DFFRHQX1 \buf_im_reg[27][11]  ( .D(\buf_im[26][11] ), .CK(clk), .RN(n12), 
        .Q(\buf_im[27][11] ) );
  DFFRHQX1 \buf_im_reg[28][11]  ( .D(\buf_im[27][11] ), .CK(clk), .RN(n31), 
        .Q(\buf_im[28][11] ) );
  DFFRHQX1 \buf_im_reg[29][11]  ( .D(\buf_im[28][11] ), .CK(clk), .RN(n30), 
        .Q(\buf_im[29][11] ) );
  DFFRHQX1 \buf_im_reg[30][11]  ( .D(\buf_im[29][11] ), .CK(clk), .RN(n13), 
        .Q(\buf_im[30][11] ) );
  DFFRHQX1 \buf_im_reg[1][10]  ( .D(x_im[10]), .CK(clk), .RN(n12), .Q(
        \buf_im[1][10] ) );
  DFFRHQX1 \buf_im_reg[2][10]  ( .D(\buf_im[1][10] ), .CK(clk), .RN(n12), .Q(
        \buf_im[2][10] ) );
  DFFRHQX1 \buf_im_reg[3][10]  ( .D(\buf_im[2][10] ), .CK(clk), .RN(n11), .Q(
        \buf_im[3][10] ) );
  DFFRHQX1 \buf_im_reg[4][10]  ( .D(\buf_im[3][10] ), .CK(clk), .RN(n11), .Q(
        \buf_im[4][10] ) );
  DFFRHQX1 \buf_im_reg[5][10]  ( .D(\buf_im[4][10] ), .CK(clk), .RN(n11), .Q(
        \buf_im[5][10] ) );
  DFFRHQX1 \buf_im_reg[6][10]  ( .D(\buf_im[5][10] ), .CK(clk), .RN(n11), .Q(
        \buf_im[6][10] ) );
  DFFRHQX1 \buf_im_reg[7][10]  ( .D(\buf_im[6][10] ), .CK(clk), .RN(n11), .Q(
        \buf_im[7][10] ) );
  DFFRHQX1 \buf_im_reg[8][10]  ( .D(\buf_im[7][10] ), .CK(clk), .RN(n11), .Q(
        \buf_im[8][10] ) );
  DFFRHQX1 \buf_im_reg[9][10]  ( .D(\buf_im[8][10] ), .CK(clk), .RN(n11), .Q(
        \buf_im[9][10] ) );
  DFFRHQX1 \buf_im_reg[10][10]  ( .D(\buf_im[9][10] ), .CK(clk), .RN(n11), .Q(
        \buf_im[10][10] ) );
  DFFRHQX1 \buf_im_reg[11][10]  ( .D(\buf_im[10][10] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[11][10] ) );
  DFFRHQX1 \buf_im_reg[12][10]  ( .D(\buf_im[11][10] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[12][10] ) );
  DFFRHQX1 \buf_im_reg[13][10]  ( .D(\buf_im[12][10] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[13][10] ) );
  DFFRHQX1 \buf_im_reg[14][10]  ( .D(\buf_im[13][10] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[14][10] ) );
  DFFRHQX1 \buf_im_reg[15][10]  ( .D(\buf_im[14][10] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[15][10] ) );
  DFFRHQX1 \buf_im_reg[16][10]  ( .D(\buf_im[15][10] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[16][10] ) );
  DFFRHQX1 \buf_im_reg[17][10]  ( .D(\buf_im[16][10] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[17][10] ) );
  DFFRHQX1 \buf_im_reg[18][10]  ( .D(\buf_im[17][10] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[18][10] ) );
  DFFRHQX1 \buf_im_reg[19][10]  ( .D(\buf_im[18][10] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[19][10] ) );
  DFFRHQX1 \buf_im_reg[20][10]  ( .D(\buf_im[19][10] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[20][10] ) );
  DFFRHQX1 \buf_im_reg[21][10]  ( .D(\buf_im[20][10] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[21][10] ) );
  DFFRHQX1 \buf_im_reg[22][10]  ( .D(\buf_im[21][10] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[22][10] ) );
  DFFRHQX1 \buf_im_reg[23][10]  ( .D(\buf_im[22][10] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[23][10] ) );
  DFFRHQX1 \buf_im_reg[24][10]  ( .D(\buf_im[23][10] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[24][10] ) );
  DFFRHQX1 \buf_im_reg[25][10]  ( .D(\buf_im[24][10] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[25][10] ) );
  DFFRHQX1 \buf_im_reg[26][10]  ( .D(\buf_im[25][10] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[26][10] ) );
  DFFRHQX1 \buf_im_reg[27][10]  ( .D(\buf_im[26][10] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[27][10] ) );
  DFFRHQX1 \buf_im_reg[28][10]  ( .D(\buf_im[27][10] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[28][10] ) );
  DFFRHQX1 \buf_im_reg[29][10]  ( .D(\buf_im[28][10] ), .CK(clk), .RN(n9), .Q(
        \buf_im[29][10] ) );
  DFFRHQX1 \buf_im_reg[30][10]  ( .D(\buf_im[29][10] ), .CK(clk), .RN(n9), .Q(
        \buf_im[30][10] ) );
  DFFRHQX1 \buf_im_reg[1][9]  ( .D(x_im[9]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][9] ) );
  DFFRHQX1 \buf_im_reg[2][9]  ( .D(\buf_im[1][9] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][9] ) );
  DFFRHQX1 \buf_im_reg[3][9]  ( .D(\buf_im[2][9] ), .CK(clk), .RN(n17), .Q(
        \buf_im[3][9] ) );
  DFFRHQX1 \buf_im_reg[4][9]  ( .D(\buf_im[3][9] ), .CK(clk), .RN(n18), .Q(
        \buf_im[4][9] ) );
  DFFRHQX1 \buf_im_reg[5][9]  ( .D(\buf_im[4][9] ), .CK(clk), .RN(n5), .Q(
        \buf_im[5][9] ) );
  DFFRHQX1 \buf_im_reg[6][9]  ( .D(\buf_im[5][9] ), .CK(clk), .RN(n4), .Q(
        \buf_im[6][9] ) );
  DFFRHQX1 \buf_im_reg[7][9]  ( .D(\buf_im[6][9] ), .CK(clk), .RN(n13), .Q(
        \buf_im[7][9] ) );
  DFFRHQX1 \buf_im_reg[8][9]  ( .D(\buf_im[7][9] ), .CK(clk), .RN(n13), .Q(
        \buf_im[8][9] ) );
  DFFRHQX1 \buf_im_reg[9][9]  ( .D(\buf_im[8][9] ), .CK(clk), .RN(n13), .Q(
        \buf_im[9][9] ) );
  DFFRHQX1 \buf_im_reg[10][9]  ( .D(\buf_im[9][9] ), .CK(clk), .RN(n13), .Q(
        \buf_im[10][9] ) );
  DFFRHQX1 \buf_im_reg[11][9]  ( .D(\buf_im[10][9] ), .CK(clk), .RN(n13), .Q(
        \buf_im[11][9] ) );
  DFFRHQX1 \buf_im_reg[12][9]  ( .D(\buf_im[11][9] ), .CK(clk), .RN(n13), .Q(
        \buf_im[12][9] ) );
  DFFRHQX1 \buf_im_reg[13][9]  ( .D(\buf_im[12][9] ), .CK(clk), .RN(n13), .Q(
        \buf_im[13][9] ) );
  DFFRHQX1 \buf_im_reg[14][9]  ( .D(\buf_im[13][9] ), .CK(clk), .RN(n13), .Q(
        \buf_im[14][9] ) );
  DFFRHQX1 \buf_im_reg[15][9]  ( .D(\buf_im[14][9] ), .CK(clk), .RN(n13), .Q(
        \buf_im[15][9] ) );
  DFFRHQX1 \buf_im_reg[16][9]  ( .D(\buf_im[15][9] ), .CK(clk), .RN(n13), .Q(
        \buf_im[16][9] ) );
  DFFRHQX1 \buf_im_reg[17][9]  ( .D(\buf_im[16][9] ), .CK(clk), .RN(n13), .Q(
        \buf_im[17][9] ) );
  DFFRHQX1 \buf_im_reg[18][9]  ( .D(\buf_im[17][9] ), .CK(clk), .RN(n13), .Q(
        \buf_im[18][9] ) );
  DFFRHQX1 \buf_im_reg[19][9]  ( .D(\buf_im[18][9] ), .CK(clk), .RN(n13), .Q(
        \buf_im[19][9] ) );
  DFFRHQX1 \buf_im_reg[20][9]  ( .D(\buf_im[19][9] ), .CK(clk), .RN(n12), .Q(
        \buf_im[20][9] ) );
  DFFRHQX1 \buf_im_reg[21][9]  ( .D(\buf_im[20][9] ), .CK(clk), .RN(n12), .Q(
        \buf_im[21][9] ) );
  DFFRHQX1 \buf_im_reg[22][9]  ( .D(\buf_im[21][9] ), .CK(clk), .RN(n12), .Q(
        \buf_im[22][9] ) );
  DFFRHQX1 \buf_im_reg[23][9]  ( .D(\buf_im[22][9] ), .CK(clk), .RN(n12), .Q(
        \buf_im[23][9] ) );
  DFFRHQX1 \buf_im_reg[24][9]  ( .D(\buf_im[23][9] ), .CK(clk), .RN(n12), .Q(
        \buf_im[24][9] ) );
  DFFRHQX1 \buf_im_reg[25][9]  ( .D(\buf_im[24][9] ), .CK(clk), .RN(n12), .Q(
        \buf_im[25][9] ) );
  DFFRHQX1 \buf_im_reg[26][9]  ( .D(\buf_im[25][9] ), .CK(clk), .RN(n12), .Q(
        \buf_im[26][9] ) );
  DFFRHQX1 \buf_im_reg[27][9]  ( .D(\buf_im[26][9] ), .CK(clk), .RN(n12), .Q(
        \buf_im[27][9] ) );
  DFFRHQX1 \buf_im_reg[28][9]  ( .D(\buf_im[27][9] ), .CK(clk), .RN(n12), .Q(
        \buf_im[28][9] ) );
  DFFRHQX1 \buf_im_reg[29][9]  ( .D(\buf_im[28][9] ), .CK(clk), .RN(n12), .Q(
        \buf_im[29][9] ) );
  DFFRHQX1 \buf_im_reg[30][9]  ( .D(\buf_im[29][9] ), .CK(clk), .RN(n12), .Q(
        \buf_im[30][9] ) );
  DFFRHQX1 \buf_im_reg[1][8]  ( .D(x_im[8]), .CK(clk), .RN(n33), .Q(
        \buf_im[1][8] ) );
  DFFRHQX1 \buf_im_reg[2][8]  ( .D(\buf_im[1][8] ), .CK(clk), .RN(n32), .Q(
        \buf_im[2][8] ) );
  DFFRHQX1 \buf_im_reg[3][8]  ( .D(\buf_im[2][8] ), .CK(clk), .RN(n7), .Q(
        \buf_im[3][8] ) );
  DFFRHQX1 \buf_im_reg[4][8]  ( .D(\buf_im[3][8] ), .CK(clk), .RN(n5), .Q(
        \buf_im[4][8] ) );
  DFFRHQX1 \buf_im_reg[5][8]  ( .D(\buf_im[4][8] ), .CK(clk), .RN(n19), .Q(
        \buf_im[5][8] ) );
  DFFRHQX1 \buf_im_reg[6][8]  ( .D(\buf_im[5][8] ), .CK(clk), .RN(n4), .Q(
        \buf_im[6][8] ) );
  DFFRHQX1 \buf_im_reg[7][8]  ( .D(\buf_im[6][8] ), .CK(clk), .RN(n5), .Q(
        \buf_im[7][8] ) );
  DFFRHQX1 \buf_im_reg[8][8]  ( .D(\buf_im[7][8] ), .CK(clk), .RN(n15), .Q(
        \buf_im[8][8] ) );
  DFFRHQX1 \buf_im_reg[9][8]  ( .D(\buf_im[8][8] ), .CK(clk), .RN(n14), .Q(
        \buf_im[9][8] ) );
  DFFRHQX1 \buf_im_reg[10][8]  ( .D(\buf_im[9][8] ), .CK(clk), .RN(n6), .Q(
        \buf_im[10][8] ) );
  DFFRHQX1 \buf_im_reg[11][8]  ( .D(\buf_im[10][8] ), .CK(clk), .RN(n18), .Q(
        \buf_im[11][8] ) );
  DFFRHQX1 \buf_im_reg[12][8]  ( .D(\buf_im[11][8] ), .CK(clk), .RN(n4), .Q(
        \buf_im[12][8] ) );
  DFFRHQX1 \buf_im_reg[13][8]  ( .D(\buf_im[12][8] ), .CK(clk), .RN(n5), .Q(
        \buf_im[13][8] ) );
  DFFRHQX1 \buf_im_reg[14][8]  ( .D(\buf_im[13][8] ), .CK(clk), .RN(n15), .Q(
        \buf_im[14][8] ) );
  DFFRHQX1 \buf_im_reg[15][8]  ( .D(\buf_im[14][8] ), .CK(clk), .RN(n14), .Q(
        \buf_im[15][8] ) );
  DFFRHQX1 \buf_im_reg[16][8]  ( .D(\buf_im[15][8] ), .CK(clk), .RN(n6), .Q(
        \buf_im[16][8] ) );
  DFFRHQX1 \buf_im_reg[17][8]  ( .D(\buf_im[16][8] ), .CK(clk), .RN(n18), .Q(
        \buf_im[17][8] ) );
  DFFRHQX1 \buf_im_reg[18][8]  ( .D(\buf_im[17][8] ), .CK(clk), .RN(n4), .Q(
        \buf_im[18][8] ) );
  DFFRHQX1 \buf_im_reg[19][8]  ( .D(\buf_im[18][8] ), .CK(clk), .RN(n15), .Q(
        \buf_im[19][8] ) );
  DFFRHQX1 \buf_im_reg[20][8]  ( .D(\buf_im[19][8] ), .CK(clk), .RN(n15), .Q(
        \buf_im[20][8] ) );
  DFFRHQX1 \buf_im_reg[21][8]  ( .D(\buf_im[20][8] ), .CK(clk), .RN(n15), .Q(
        \buf_im[21][8] ) );
  DFFRHQX1 \buf_im_reg[22][8]  ( .D(\buf_im[21][8] ), .CK(clk), .RN(n15), .Q(
        \buf_im[22][8] ) );
  DFFRHQX1 \buf_im_reg[23][8]  ( .D(\buf_im[22][8] ), .CK(clk), .RN(n15), .Q(
        \buf_im[23][8] ) );
  DFFRHQX1 \buf_im_reg[24][8]  ( .D(\buf_im[23][8] ), .CK(clk), .RN(n15), .Q(
        \buf_im[24][8] ) );
  DFFRHQX1 \buf_im_reg[25][8]  ( .D(\buf_im[24][8] ), .CK(clk), .RN(n15), .Q(
        \buf_im[25][8] ) );
  DFFRHQX1 \buf_im_reg[26][8]  ( .D(\buf_im[25][8] ), .CK(clk), .RN(n15), .Q(
        \buf_im[26][8] ) );
  DFFRHQX1 \buf_im_reg[27][8]  ( .D(\buf_im[26][8] ), .CK(clk), .RN(n15), .Q(
        \buf_im[27][8] ) );
  DFFRHQX1 \buf_im_reg[28][8]  ( .D(\buf_im[27][8] ), .CK(clk), .RN(n15), .Q(
        \buf_im[28][8] ) );
  DFFRHQX1 \buf_im_reg[29][8]  ( .D(\buf_im[28][8] ), .CK(clk), .RN(n15), .Q(
        \buf_im[29][8] ) );
  DFFRHQX1 \buf_im_reg[30][8]  ( .D(\buf_im[29][8] ), .CK(clk), .RN(n15), .Q(
        \buf_im[30][8] ) );
  DFFRHQX1 \buf_im_reg[1][7]  ( .D(x_im[7]), .CK(clk), .RN(n15), .Q(
        \buf_im[1][7] ) );
  DFFRHQX1 \buf_im_reg[2][7]  ( .D(\buf_im[1][7] ), .CK(clk), .RN(n14), .Q(
        \buf_im[2][7] ) );
  DFFRHQX1 \buf_im_reg[3][7]  ( .D(\buf_im[2][7] ), .CK(clk), .RN(n14), .Q(
        \buf_im[3][7] ) );
  DFFRHQX1 \buf_im_reg[4][7]  ( .D(\buf_im[3][7] ), .CK(clk), .RN(n14), .Q(
        \buf_im[4][7] ) );
  DFFRHQX1 \buf_im_reg[5][7]  ( .D(\buf_im[4][7] ), .CK(clk), .RN(n14), .Q(
        \buf_im[5][7] ) );
  DFFRHQX1 \buf_im_reg[6][7]  ( .D(\buf_im[5][7] ), .CK(clk), .RN(n14), .Q(
        \buf_im[6][7] ) );
  DFFRHQX1 \buf_im_reg[7][7]  ( .D(\buf_im[6][7] ), .CK(clk), .RN(n14), .Q(
        \buf_im[7][7] ) );
  DFFRHQX1 \buf_im_reg[8][7]  ( .D(\buf_im[7][7] ), .CK(clk), .RN(n14), .Q(
        \buf_im[8][7] ) );
  DFFRHQX1 \buf_im_reg[9][7]  ( .D(\buf_im[8][7] ), .CK(clk), .RN(n14), .Q(
        \buf_im[9][7] ) );
  DFFRHQX1 \buf_im_reg[10][7]  ( .D(\buf_im[9][7] ), .CK(clk), .RN(n14), .Q(
        \buf_im[10][7] ) );
  DFFRHQX1 \buf_im_reg[11][7]  ( .D(\buf_im[10][7] ), .CK(clk), .RN(n14), .Q(
        \buf_im[11][7] ) );
  DFFRHQX1 \buf_im_reg[12][7]  ( .D(\buf_im[11][7] ), .CK(clk), .RN(n14), .Q(
        \buf_im[12][7] ) );
  DFFRHQX1 \buf_im_reg[13][7]  ( .D(\buf_im[12][7] ), .CK(clk), .RN(n14), .Q(
        \buf_im[13][7] ) );
  DFFRHQX1 \buf_im_reg[14][7]  ( .D(\buf_im[13][7] ), .CK(clk), .RN(n14), .Q(
        \buf_im[14][7] ) );
  DFFRHQX1 \buf_im_reg[15][7]  ( .D(\buf_im[14][7] ), .CK(clk), .RN(n22), .Q(
        \buf_im[15][7] ) );
  DFFRHQX1 \buf_im_reg[16][7]  ( .D(\buf_im[15][7] ), .CK(clk), .RN(n14), .Q(
        \buf_im[16][7] ) );
  DFFRHQX1 \buf_im_reg[17][7]  ( .D(\buf_im[16][7] ), .CK(clk), .RN(n25), .Q(
        \buf_im[17][7] ) );
  DFFRHQX1 \buf_im_reg[18][7]  ( .D(\buf_im[17][7] ), .CK(clk), .RN(n20), .Q(
        \buf_im[18][7] ) );
  DFFRHQX1 \buf_im_reg[19][7]  ( .D(\buf_im[18][7] ), .CK(clk), .RN(n34), .Q(
        \buf_im[19][7] ) );
  DFFRHQX1 \buf_im_reg[20][7]  ( .D(\buf_im[19][7] ), .CK(clk), .RN(n25), .Q(
        \buf_im[20][7] ) );
  DFFRHQX1 \buf_im_reg[21][7]  ( .D(\buf_im[20][7] ), .CK(clk), .RN(n12), .Q(
        \buf_im[21][7] ) );
  DFFRHQX1 \buf_im_reg[22][7]  ( .D(\buf_im[21][7] ), .CK(clk), .RN(n31), .Q(
        \buf_im[22][7] ) );
  DFFRHQX1 \buf_im_reg[23][7]  ( .D(\buf_im[22][7] ), .CK(clk), .RN(n30), .Q(
        \buf_im[23][7] ) );
  DFFRHQX1 \buf_im_reg[24][7]  ( .D(\buf_im[23][7] ), .CK(clk), .RN(n13), .Q(
        \buf_im[24][7] ) );
  DFFRHQX1 \buf_im_reg[25][7]  ( .D(\buf_im[24][7] ), .CK(clk), .RN(n29), .Q(
        \buf_im[25][7] ) );
  DFFRHQX1 \buf_im_reg[26][7]  ( .D(\buf_im[25][7] ), .CK(clk), .RN(n28), .Q(
        \buf_im[26][7] ) );
  DFFRHQX1 \buf_im_reg[27][7]  ( .D(\buf_im[26][7] ), .CK(clk), .RN(n34), .Q(
        \buf_im[27][7] ) );
  DFFRHQX1 \buf_im_reg[28][7]  ( .D(\buf_im[27][7] ), .CK(clk), .RN(n11), .Q(
        \buf_im[28][7] ) );
  DFFRHQX1 \buf_im_reg[29][7]  ( .D(\buf_im[28][7] ), .CK(clk), .RN(n10), .Q(
        \buf_im[29][7] ) );
  DFFRHQX1 \buf_im_reg[30][7]  ( .D(\buf_im[29][7] ), .CK(clk), .RN(n34), .Q(
        \buf_im[30][7] ) );
  DFFRHQX1 \buf_im_reg[1][6]  ( .D(x_im[6]), .CK(clk), .RN(n12), .Q(
        \buf_im[1][6] ) );
  DFFRHQX1 \buf_im_reg[2][6]  ( .D(\buf_im[1][6] ), .CK(clk), .RN(n12), .Q(
        \buf_im[2][6] ) );
  DFFRHQX1 \buf_im_reg[3][6]  ( .D(\buf_im[2][6] ), .CK(clk), .RN(n31), .Q(
        \buf_im[3][6] ) );
  DFFRHQX1 \buf_im_reg[4][6]  ( .D(\buf_im[3][6] ), .CK(clk), .RN(n30), .Q(
        \buf_im[4][6] ) );
  DFFRHQX1 \buf_im_reg[5][6]  ( .D(\buf_im[4][6] ), .CK(clk), .RN(n13), .Q(
        \buf_im[5][6] ) );
  DFFRHQX1 \buf_im_reg[6][6]  ( .D(\buf_im[5][6] ), .CK(clk), .RN(n29), .Q(
        \buf_im[6][6] ) );
  DFFRHQX1 \buf_im_reg[7][6]  ( .D(\buf_im[6][6] ), .CK(clk), .RN(n28), .Q(
        \buf_im[7][6] ) );
  DFFRHQX1 \buf_im_reg[8][6]  ( .D(\buf_im[7][6] ), .CK(clk), .RN(n9), .Q(
        \buf_im[8][6] ) );
  DFFRHQX1 \buf_im_reg[9][6]  ( .D(\buf_im[8][6] ), .CK(clk), .RN(n11), .Q(
        \buf_im[9][6] ) );
  DFFRHQX1 \buf_im_reg[10][6]  ( .D(\buf_im[9][6] ), .CK(clk), .RN(n10), .Q(
        \buf_im[10][6] ) );
  DFFRHQX1 \buf_im_reg[11][6]  ( .D(\buf_im[10][6] ), .CK(clk), .RN(n19), .Q(
        \buf_im[11][6] ) );
  DFFRHQX1 \buf_im_reg[12][6]  ( .D(\buf_im[11][6] ), .CK(clk), .RN(n7), .Q(
        \buf_im[12][6] ) );
  DFFRHQX1 \buf_im_reg[13][6]  ( .D(\buf_im[12][6] ), .CK(clk), .RN(n26), .Q(
        \buf_im[13][6] ) );
  DFFRHQX1 \buf_im_reg[14][6]  ( .D(\buf_im[13][6] ), .CK(clk), .RN(n24), .Q(
        \buf_im[14][6] ) );
  DFFRHQX1 \buf_im_reg[15][6]  ( .D(\buf_im[14][6] ), .CK(clk), .RN(n33), .Q(
        \buf_im[15][6] ) );
  DFFRHQX1 \buf_im_reg[16][6]  ( .D(\buf_im[15][6] ), .CK(clk), .RN(n32), .Q(
        \buf_im[16][6] ) );
  DFFRHQX1 \buf_im_reg[17][6]  ( .D(\buf_im[16][6] ), .CK(clk), .RN(n18), .Q(
        \buf_im[17][6] ) );
  DFFRHQX1 \buf_im_reg[18][6]  ( .D(\buf_im[17][6] ), .CK(clk), .RN(n19), .Q(
        \buf_im[18][6] ) );
  DFFRHQX1 \buf_im_reg[19][6]  ( .D(\buf_im[18][6] ), .CK(clk), .RN(n8), .Q(
        \buf_im[19][6] ) );
  DFFRHQX1 \buf_im_reg[20][6]  ( .D(\buf_im[19][6] ), .CK(clk), .RN(n27), .Q(
        \buf_im[20][6] ) );
  DFFRHQX1 \buf_im_reg[21][6]  ( .D(\buf_im[20][6] ), .CK(clk), .RN(n23), .Q(
        \buf_im[21][6] ) );
  DFFRHQX1 \buf_im_reg[22][6]  ( .D(\buf_im[21][6] ), .CK(clk), .RN(n21), .Q(
        \buf_im[22][6] ) );
  DFFRHQX1 \buf_im_reg[23][6]  ( .D(\buf_im[22][6] ), .CK(clk), .RN(n7), .Q(
        \buf_im[23][6] ) );
  DFFRHQX1 \buf_im_reg[24][6]  ( .D(\buf_im[23][6] ), .CK(clk), .RN(n18), .Q(
        \buf_im[24][6] ) );
  DFFRHQX1 \buf_im_reg[25][6]  ( .D(\buf_im[24][6] ), .CK(clk), .RN(n5), .Q(
        \buf_im[25][6] ) );
  DFFRHQX1 \buf_im_reg[26][6]  ( .D(\buf_im[25][6] ), .CK(clk), .RN(n4), .Q(
        \buf_im[26][6] ) );
  DFFRHQX1 \buf_im_reg[27][6]  ( .D(\buf_im[26][6] ), .CK(clk), .RN(n18), .Q(
        \buf_im[27][6] ) );
  DFFRHQX1 \buf_im_reg[28][6]  ( .D(\buf_im[27][6] ), .CK(clk), .RN(n5), .Q(
        \buf_im[28][6] ) );
  DFFRHQX1 \buf_im_reg[29][6]  ( .D(\buf_im[28][6] ), .CK(clk), .RN(n4), .Q(
        \buf_im[29][6] ) );
  DFFRHQX1 \buf_im_reg[30][6]  ( .D(\buf_im[29][6] ), .CK(clk), .RN(n18), .Q(
        \buf_im[30][6] ) );
  DFFRHQX1 \buf_im_reg[1][5]  ( .D(x_im[5]), .CK(clk), .RN(n29), .Q(
        \buf_im[1][5] ) );
  DFFRHQX1 \buf_im_reg[2][5]  ( .D(\buf_im[1][5] ), .CK(clk), .RN(n28), .Q(
        \buf_im[2][5] ) );
  DFFRHQX1 \buf_im_reg[3][5]  ( .D(\buf_im[2][5] ), .CK(clk), .RN(n9), .Q(
        \buf_im[3][5] ) );
  DFFRHQX1 \buf_im_reg[4][5]  ( .D(\buf_im[3][5] ), .CK(clk), .RN(n22), .Q(
        \buf_im[4][5] ) );
  DFFRHQX1 \buf_im_reg[5][5]  ( .D(\buf_im[4][5] ), .CK(clk), .RN(n6), .Q(
        \buf_im[5][5] ) );
  DFFRHQX1 \buf_im_reg[6][5]  ( .D(\buf_im[5][5] ), .CK(clk), .RN(n25), .Q(
        \buf_im[6][5] ) );
  DFFRHQX1 \buf_im_reg[7][5]  ( .D(\buf_im[6][5] ), .CK(clk), .RN(n20), .Q(
        \buf_im[7][5] ) );
  DFFRHQX1 \buf_im_reg[8][5]  ( .D(\buf_im[7][5] ), .CK(clk), .RN(n8), .Q(
        \buf_im[8][5] ) );
  DFFRHQX1 \buf_im_reg[9][5]  ( .D(\buf_im[8][5] ), .CK(clk), .RN(n27), .Q(
        \buf_im[9][5] ) );
  DFFRHQX1 \buf_im_reg[10][5]  ( .D(\buf_im[9][5] ), .CK(clk), .RN(n23), .Q(
        \buf_im[10][5] ) );
  DFFRHQX1 \buf_im_reg[11][5]  ( .D(\buf_im[10][5] ), .CK(clk), .RN(n21), .Q(
        \buf_im[11][5] ) );
  DFFRHQX1 \buf_im_reg[12][5]  ( .D(\buf_im[11][5] ), .CK(clk), .RN(n7), .Q(
        \buf_im[12][5] ) );
  DFFRHQX1 \buf_im_reg[13][5]  ( .D(\buf_im[12][5] ), .CK(clk), .RN(n33), .Q(
        \buf_im[13][5] ) );
  DFFRHQX1 \buf_im_reg[14][5]  ( .D(\buf_im[13][5] ), .CK(clk), .RN(n32), .Q(
        \buf_im[14][5] ) );
  DFFRHQX1 \buf_im_reg[15][5]  ( .D(\buf_im[14][5] ), .CK(clk), .RN(n26), .Q(
        \buf_im[15][5] ) );
  DFFRHQX1 \buf_im_reg[16][5]  ( .D(\buf_im[15][5] ), .CK(clk), .RN(n26), .Q(
        \buf_im[16][5] ) );
  DFFRHQX1 \buf_im_reg[17][5]  ( .D(\buf_im[16][5] ), .CK(clk), .RN(n24), .Q(
        \buf_im[17][5] ) );
  DFFRHQX1 \buf_im_reg[18][5]  ( .D(\buf_im[17][5] ), .CK(clk), .RN(n24), .Q(
        \buf_im[18][5] ) );
  DFFRHQX1 \buf_im_reg[19][5]  ( .D(\buf_im[18][5] ), .CK(clk), .RN(n26), .Q(
        \buf_im[19][5] ) );
  DFFRHQX1 \buf_im_reg[20][5]  ( .D(\buf_im[19][5] ), .CK(clk), .RN(n24), .Q(
        \buf_im[20][5] ) );
  DFFRHQX1 \buf_im_reg[21][5]  ( .D(\buf_im[20][5] ), .CK(clk), .RN(n7), .Q(
        \buf_im[21][5] ) );
  DFFRHQX1 \buf_im_reg[22][5]  ( .D(\buf_im[21][5] ), .CK(clk), .RN(n7), .Q(
        \buf_im[22][5] ) );
  DFFRHQX1 \buf_im_reg[23][5]  ( .D(\buf_im[22][5] ), .CK(clk), .RN(n7), .Q(
        \buf_im[23][5] ) );
  DFFRHQX1 \buf_im_reg[24][5]  ( .D(\buf_im[23][5] ), .CK(clk), .RN(n7), .Q(
        \buf_im[24][5] ) );
  DFFRHQX1 \buf_im_reg[25][5]  ( .D(\buf_im[24][5] ), .CK(clk), .RN(n7), .Q(
        \buf_im[25][5] ) );
  DFFRHQX1 \buf_im_reg[26][5]  ( .D(\buf_im[25][5] ), .CK(clk), .RN(n7), .Q(
        \buf_im[26][5] ) );
  DFFRHQX1 \buf_im_reg[27][5]  ( .D(\buf_im[26][5] ), .CK(clk), .RN(n7), .Q(
        \buf_im[27][5] ) );
  DFFRHQX1 \buf_im_reg[28][5]  ( .D(\buf_im[27][5] ), .CK(clk), .RN(n7), .Q(
        \buf_im[28][5] ) );
  DFFRHQX1 \buf_im_reg[29][5]  ( .D(\buf_im[28][5] ), .CK(clk), .RN(n7), .Q(
        \buf_im[29][5] ) );
  DFFRHQX1 \buf_im_reg[30][5]  ( .D(\buf_im[29][5] ), .CK(clk), .RN(n7), .Q(
        \buf_im[30][5] ) );
  DFFRHQX1 \buf_im_reg[1][4]  ( .D(x_im[4]), .CK(clk), .RN(n7), .Q(
        \buf_im[1][4] ) );
  DFFRHQX1 \buf_im_reg[2][4]  ( .D(\buf_im[1][4] ), .CK(clk), .RN(n7), .Q(
        \buf_im[2][4] ) );
  DFFRHQX1 \buf_im_reg[3][4]  ( .D(\buf_im[2][4] ), .CK(clk), .RN(n7), .Q(
        \buf_im[3][4] ) );
  DFFRHQX1 \buf_im_reg[4][4]  ( .D(\buf_im[3][4] ), .CK(clk), .RN(n6), .Q(
        \buf_im[4][4] ) );
  DFFRHQX1 \buf_im_reg[5][4]  ( .D(\buf_im[4][4] ), .CK(clk), .RN(n6), .Q(
        \buf_im[5][4] ) );
  DFFRHQX1 \buf_im_reg[6][4]  ( .D(\buf_im[5][4] ), .CK(clk), .RN(n6), .Q(
        \buf_im[6][4] ) );
  DFFRHQX1 \buf_im_reg[7][4]  ( .D(\buf_im[6][4] ), .CK(clk), .RN(n6), .Q(
        \buf_im[7][4] ) );
  DFFRHQX1 \buf_im_reg[8][4]  ( .D(\buf_im[7][4] ), .CK(clk), .RN(n6), .Q(
        \buf_im[8][4] ) );
  DFFRHQX1 \buf_im_reg[9][4]  ( .D(\buf_im[8][4] ), .CK(clk), .RN(n6), .Q(
        \buf_im[9][4] ) );
  DFFRHQX1 \buf_im_reg[10][4]  ( .D(\buf_im[9][4] ), .CK(clk), .RN(n6), .Q(
        \buf_im[10][4] ) );
  DFFRHQX1 \buf_im_reg[11][4]  ( .D(\buf_im[10][4] ), .CK(clk), .RN(n6), .Q(
        \buf_im[11][4] ) );
  DFFRHQX1 \buf_im_reg[12][4]  ( .D(\buf_im[11][4] ), .CK(clk), .RN(n6), .Q(
        \buf_im[12][4] ) );
  DFFRHQX1 \buf_im_reg[13][4]  ( .D(\buf_im[12][4] ), .CK(clk), .RN(n6), .Q(
        \buf_im[13][4] ) );
  DFFRHQX1 \buf_im_reg[14][4]  ( .D(\buf_im[13][4] ), .CK(clk), .RN(n6), .Q(
        \buf_im[14][4] ) );
  DFFRHQX1 \buf_im_reg[15][4]  ( .D(\buf_im[14][4] ), .CK(clk), .RN(n6), .Q(
        \buf_im[15][4] ) );
  DFFRHQX1 \buf_im_reg[16][4]  ( .D(\buf_im[15][4] ), .CK(clk), .RN(n6), .Q(
        \buf_im[16][4] ) );
  DFFRHQX1 \buf_im_reg[17][4]  ( .D(\buf_im[16][4] ), .CK(clk), .RN(n5), .Q(
        \buf_im[17][4] ) );
  DFFRHQX1 \buf_im_reg[18][4]  ( .D(\buf_im[17][4] ), .CK(clk), .RN(n5), .Q(
        \buf_im[18][4] ) );
  DFFRHQX1 \buf_im_reg[19][4]  ( .D(\buf_im[18][4] ), .CK(clk), .RN(n5), .Q(
        \buf_im[19][4] ) );
  DFFRHQX1 \buf_im_reg[20][4]  ( .D(\buf_im[19][4] ), .CK(clk), .RN(n5), .Q(
        \buf_im[20][4] ) );
  DFFRHQX1 \buf_im_reg[21][4]  ( .D(\buf_im[20][4] ), .CK(clk), .RN(n5), .Q(
        \buf_im[21][4] ) );
  DFFRHQX1 \buf_im_reg[22][4]  ( .D(\buf_im[21][4] ), .CK(clk), .RN(n5), .Q(
        \buf_im[22][4] ) );
  DFFRHQX1 \buf_im_reg[23][4]  ( .D(\buf_im[22][4] ), .CK(clk), .RN(n5), .Q(
        \buf_im[23][4] ) );
  DFFRHQX1 \buf_im_reg[24][4]  ( .D(\buf_im[23][4] ), .CK(clk), .RN(n5), .Q(
        \buf_im[24][4] ) );
  DFFRHQX1 \buf_im_reg[25][4]  ( .D(\buf_im[24][4] ), .CK(clk), .RN(n5), .Q(
        \buf_im[25][4] ) );
  DFFRHQX1 \buf_im_reg[26][4]  ( .D(\buf_im[25][4] ), .CK(clk), .RN(n5), .Q(
        \buf_im[26][4] ) );
  DFFRHQX1 \buf_im_reg[27][4]  ( .D(\buf_im[26][4] ), .CK(clk), .RN(n5), .Q(
        \buf_im[27][4] ) );
  DFFRHQX1 \buf_im_reg[28][4]  ( .D(\buf_im[27][4] ), .CK(clk), .RN(n5), .Q(
        \buf_im[28][4] ) );
  DFFRHQX1 \buf_im_reg[29][4]  ( .D(\buf_im[28][4] ), .CK(clk), .RN(n5), .Q(
        \buf_im[29][4] ) );
  DFFRHQX1 \buf_im_reg[30][4]  ( .D(\buf_im[29][4] ), .CK(clk), .RN(n4), .Q(
        \buf_im[30][4] ) );
  DFFRHQX1 \buf_im_reg[1][3]  ( .D(x_im[3]), .CK(clk), .RN(n4), .Q(
        \buf_im[1][3] ) );
  DFFRHQX1 \buf_im_reg[2][3]  ( .D(\buf_im[1][3] ), .CK(clk), .RN(n4), .Q(
        \buf_im[2][3] ) );
  DFFRHQX1 \buf_im_reg[3][3]  ( .D(\buf_im[2][3] ), .CK(clk), .RN(n4), .Q(
        \buf_im[3][3] ) );
  DFFRHQX1 \buf_im_reg[4][3]  ( .D(\buf_im[3][3] ), .CK(clk), .RN(n4), .Q(
        \buf_im[4][3] ) );
  DFFRHQX1 \buf_im_reg[5][3]  ( .D(\buf_im[4][3] ), .CK(clk), .RN(n4), .Q(
        \buf_im[5][3] ) );
  DFFRHQX1 \buf_im_reg[6][3]  ( .D(\buf_im[5][3] ), .CK(clk), .RN(n4), .Q(
        \buf_im[6][3] ) );
  DFFRHQX1 \buf_im_reg[7][3]  ( .D(\buf_im[6][3] ), .CK(clk), .RN(n4), .Q(
        \buf_im[7][3] ) );
  DFFRHQX1 \buf_im_reg[8][3]  ( .D(\buf_im[7][3] ), .CK(clk), .RN(n4), .Q(
        \buf_im[8][3] ) );
  DFFRHQX1 \buf_im_reg[9][3]  ( .D(\buf_im[8][3] ), .CK(clk), .RN(n4), .Q(
        \buf_im[9][3] ) );
  DFFRHQX1 \buf_im_reg[10][3]  ( .D(\buf_im[9][3] ), .CK(clk), .RN(n4), .Q(
        \buf_im[10][3] ) );
  DFFRHQX1 \buf_im_reg[11][3]  ( .D(\buf_im[10][3] ), .CK(clk), .RN(n4), .Q(
        \buf_im[11][3] ) );
  DFFRHQX1 \buf_im_reg[12][3]  ( .D(\buf_im[11][3] ), .CK(clk), .RN(n4), .Q(
        \buf_im[12][3] ) );
  DFFRHQX1 \buf_im_reg[13][3]  ( .D(\buf_im[12][3] ), .CK(clk), .RN(n12), .Q(
        \buf_im[13][3] ) );
  DFFRHQX1 \buf_im_reg[14][3]  ( .D(\buf_im[13][3] ), .CK(clk), .RN(n31), .Q(
        \buf_im[14][3] ) );
  DFFRHQX1 \buf_im_reg[15][3]  ( .D(\buf_im[14][3] ), .CK(clk), .RN(n30), .Q(
        \buf_im[15][3] ) );
  DFFRHQX1 \buf_im_reg[16][3]  ( .D(\buf_im[15][3] ), .CK(clk), .RN(n13), .Q(
        \buf_im[16][3] ) );
  DFFRHQX1 \buf_im_reg[17][3]  ( .D(\buf_im[16][3] ), .CK(clk), .RN(n29), .Q(
        \buf_im[17][3] ) );
  DFFRHQX1 \buf_im_reg[18][3]  ( .D(\buf_im[17][3] ), .CK(clk), .RN(n28), .Q(
        \buf_im[18][3] ) );
  DFFRHQX1 \buf_im_reg[19][3]  ( .D(\buf_im[18][3] ), .CK(clk), .RN(n9), .Q(
        \buf_im[19][3] ) );
  DFFRHQX1 \buf_im_reg[20][3]  ( .D(\buf_im[19][3] ), .CK(clk), .RN(n11), .Q(
        \buf_im[20][3] ) );
  DFFRHQX1 \buf_im_reg[21][3]  ( .D(\buf_im[20][3] ), .CK(clk), .RN(n10), .Q(
        \buf_im[21][3] ) );
  DFFRHQX1 \buf_im_reg[22][3]  ( .D(\buf_im[21][3] ), .CK(clk), .RN(n22), .Q(
        \buf_im[22][3] ) );
  DFFRHQX1 \buf_im_reg[23][3]  ( .D(\buf_im[22][3] ), .CK(clk), .RN(n15), .Q(
        \buf_im[23][3] ) );
  DFFRHQX1 \buf_im_reg[24][3]  ( .D(\buf_im[23][3] ), .CK(clk), .RN(n25), .Q(
        \buf_im[24][3] ) );
  DFFRHQX1 \buf_im_reg[25][3]  ( .D(\buf_im[24][3] ), .CK(clk), .RN(n20), .Q(
        \buf_im[25][3] ) );
  DFFRHQX1 \buf_im_reg[26][3]  ( .D(\buf_im[25][3] ), .CK(clk), .RN(n14), .Q(
        \buf_im[26][3] ) );
  DFFRHQX1 \buf_im_reg[27][3]  ( .D(\buf_im[26][3] ), .CK(clk), .RN(n25), .Q(
        \buf_im[27][3] ) );
  DFFRHQX1 \buf_im_reg[28][3]  ( .D(\buf_im[27][3] ), .CK(clk), .RN(n20), .Q(
        \buf_im[28][3] ) );
  DFFRHQX1 \buf_im_reg[29][3]  ( .D(\buf_im[28][3] ), .CK(clk), .RN(n29), .Q(
        \buf_im[29][3] ) );
  DFFRHQX1 \buf_im_reg[30][3]  ( .D(\buf_im[29][3] ), .CK(clk), .RN(n14), .Q(
        \buf_im[30][3] ) );
  DFFRHQX1 \buf_im_reg[1][2]  ( .D(x_im[2]), .CK(clk), .RN(n11), .Q(
        \buf_im[1][2] ) );
  DFFRHQX1 \buf_im_reg[2][2]  ( .D(\buf_im[1][2] ), .CK(clk), .RN(n9), .Q(
        \buf_im[2][2] ) );
  DFFRHQX1 \buf_im_reg[3][2]  ( .D(\buf_im[2][2] ), .CK(clk), .RN(n34), .Q(
        \buf_im[3][2] ) );
  DFFRHQX1 \buf_im_reg[4][2]  ( .D(\buf_im[3][2] ), .CK(clk), .RN(n6), .Q(
        \buf_im[4][2] ) );
  DFFRHQX1 \buf_im_reg[5][2]  ( .D(\buf_im[4][2] ), .CK(clk), .RN(n10), .Q(
        \buf_im[5][2] ) );
  DFFRHQX1 \buf_im_reg[6][2]  ( .D(\buf_im[5][2] ), .CK(clk), .RN(n11), .Q(
        \buf_im[6][2] ) );
  DFFRHQX1 \buf_im_reg[7][2]  ( .D(\buf_im[6][2] ), .CK(clk), .RN(n10), .Q(
        \buf_im[7][2] ) );
  DFFRHQX1 \buf_im_reg[8][2]  ( .D(\buf_im[7][2] ), .CK(clk), .RN(n22), .Q(
        \buf_im[8][2] ) );
  DFFRHQX1 \buf_im_reg[9][2]  ( .D(\buf_im[8][2] ), .CK(clk), .RN(n15), .Q(
        \buf_im[9][2] ) );
  DFFRHQX1 \buf_im_reg[10][2]  ( .D(\buf_im[9][2] ), .CK(clk), .RN(n25), .Q(
        \buf_im[10][2] ) );
  DFFRHQX1 \buf_im_reg[11][2]  ( .D(\buf_im[10][2] ), .CK(clk), .RN(n20), .Q(
        \buf_im[11][2] ) );
  DFFRHQX1 \buf_im_reg[12][2]  ( .D(\buf_im[11][2] ), .CK(clk), .RN(n20), .Q(
        \buf_im[12][2] ) );
  DFFRHQX1 \buf_im_reg[13][2]  ( .D(\buf_im[12][2] ), .CK(clk), .RN(n22), .Q(
        \buf_im[13][2] ) );
  DFFRHQX1 \buf_im_reg[14][2]  ( .D(\buf_im[13][2] ), .CK(clk), .RN(n34), .Q(
        \buf_im[14][2] ) );
  DFFRHQX1 \buf_im_reg[15][2]  ( .D(\buf_im[14][2] ), .CK(clk), .RN(n12), .Q(
        \buf_im[15][2] ) );
  DFFRHQX1 \buf_im_reg[16][2]  ( .D(\buf_im[15][2] ), .CK(clk), .RN(n31), .Q(
        \buf_im[16][2] ) );
  DFFRHQX1 \buf_im_reg[17][2]  ( .D(\buf_im[16][2] ), .CK(clk), .RN(n30), .Q(
        \buf_im[17][2] ) );
  DFFRHQX1 \buf_im_reg[18][2]  ( .D(\buf_im[17][2] ), .CK(clk), .RN(n13), .Q(
        \buf_im[18][2] ) );
  DFFRHQX1 \buf_im_reg[19][2]  ( .D(\buf_im[18][2] ), .CK(clk), .RN(n29), .Q(
        \buf_im[19][2] ) );
  DFFRHQX1 \buf_im_reg[20][2]  ( .D(\buf_im[19][2] ), .CK(clk), .RN(n28), .Q(
        \buf_im[20][2] ) );
  DFFRHQX1 \buf_im_reg[21][2]  ( .D(\buf_im[20][2] ), .CK(clk), .RN(n9), .Q(
        \buf_im[21][2] ) );
  DFFRHQX1 \buf_im_reg[22][2]  ( .D(\buf_im[21][2] ), .CK(clk), .RN(n3), .Q(
        \buf_im[22][2] ) );
  DFFRHQX1 \buf_im_reg[23][2]  ( .D(\buf_im[22][2] ), .CK(clk), .RN(n3), .Q(
        \buf_im[23][2] ) );
  DFFRHQX1 \buf_im_reg[24][2]  ( .D(\buf_im[23][2] ), .CK(clk), .RN(n3), .Q(
        \buf_im[24][2] ) );
  DFFRHQX1 \buf_im_reg[25][2]  ( .D(\buf_im[24][2] ), .CK(clk), .RN(n3), .Q(
        \buf_im[25][2] ) );
  DFFRHQX1 \buf_im_reg[26][2]  ( .D(\buf_im[25][2] ), .CK(clk), .RN(n3), .Q(
        \buf_im[26][2] ) );
  DFFRHQX1 \buf_im_reg[27][2]  ( .D(\buf_im[26][2] ), .CK(clk), .RN(n3), .Q(
        \buf_im[27][2] ) );
  DFFRHQX1 \buf_im_reg[28][2]  ( .D(\buf_im[27][2] ), .CK(clk), .RN(n3), .Q(
        \buf_im[28][2] ) );
  DFFRHQX1 \buf_im_reg[29][2]  ( .D(\buf_im[28][2] ), .CK(clk), .RN(n3), .Q(
        \buf_im[29][2] ) );
  DFFRHQX1 \buf_im_reg[30][2]  ( .D(\buf_im[29][2] ), .CK(clk), .RN(n3), .Q(
        \buf_im[30][2] ) );
  DFFRHQX1 \buf_im_reg[1][1]  ( .D(x_im[1]), .CK(clk), .RN(n3), .Q(
        \buf_im[1][1] ) );
  DFFRHQX1 \buf_im_reg[2][1]  ( .D(\buf_im[1][1] ), .CK(clk), .RN(n3), .Q(
        \buf_im[2][1] ) );
  DFFRHQX1 \buf_im_reg[3][1]  ( .D(\buf_im[2][1] ), .CK(clk), .RN(n3), .Q(
        \buf_im[3][1] ) );
  DFFRHQX1 \buf_im_reg[4][1]  ( .D(\buf_im[3][1] ), .CK(clk), .RN(n3), .Q(
        \buf_im[4][1] ) );
  DFFRHQX1 \buf_im_reg[5][1]  ( .D(\buf_im[4][1] ), .CK(clk), .RN(n16), .Q(
        \buf_im[5][1] ) );
  DFFRHQX1 \buf_im_reg[6][1]  ( .D(\buf_im[5][1] ), .CK(clk), .RN(n15), .Q(
        \buf_im[6][1] ) );
  DFFRHQX1 \buf_im_reg[7][1]  ( .D(\buf_im[6][1] ), .CK(clk), .RN(n19), .Q(
        \buf_im[7][1] ) );
  DFFRHQX1 \buf_im_reg[8][1]  ( .D(\buf_im[7][1] ), .CK(clk), .RN(n8), .Q(
        \buf_im[8][1] ) );
  DFFRHQX1 \buf_im_reg[9][1]  ( .D(\buf_im[8][1] ), .CK(clk), .RN(n27), .Q(
        \buf_im[9][1] ) );
  DFFRHQX1 \buf_im_reg[10][1]  ( .D(\buf_im[9][1] ), .CK(clk), .RN(n14), .Q(
        \buf_im[10][1] ) );
  DFFRHQX1 \buf_im_reg[11][1]  ( .D(\buf_im[10][1] ), .CK(clk), .RN(n19), .Q(
        \buf_im[11][1] ) );
  DFFRHQX1 \buf_im_reg[12][1]  ( .D(\buf_im[11][1] ), .CK(clk), .RN(n8), .Q(
        \buf_im[12][1] ) );
  DFFRHQX1 \buf_im_reg[13][1]  ( .D(\buf_im[12][1] ), .CK(clk), .RN(n7), .Q(
        \buf_im[13][1] ) );
  DFFRHQX1 \buf_im_reg[14][1]  ( .D(\buf_im[13][1] ), .CK(clk), .RN(n23), .Q(
        \buf_im[14][1] ) );
  DFFRHQX1 \buf_im_reg[15][1]  ( .D(\buf_im[14][1] ), .CK(clk), .RN(n21), .Q(
        \buf_im[15][1] ) );
  DFFRHQX1 \buf_im_reg[16][1]  ( .D(\buf_im[15][1] ), .CK(clk), .RN(n33), .Q(
        \buf_im[16][1] ) );
  DFFRHQX1 \buf_im_reg[17][1]  ( .D(\buf_im[16][1] ), .CK(clk), .RN(n32), .Q(
        \buf_im[17][1] ) );
  DFFRHQX1 \buf_im_reg[18][1]  ( .D(\buf_im[17][1] ), .CK(clk), .RN(n2), .Q(
        \buf_im[18][1] ) );
  DFFRHQX1 \buf_im_reg[19][1]  ( .D(\buf_im[18][1] ), .CK(clk), .RN(n2), .Q(
        \buf_im[19][1] ) );
  DFFRHQX1 \buf_im_reg[20][1]  ( .D(\buf_im[19][1] ), .CK(clk), .RN(n2), .Q(
        \buf_im[20][1] ) );
  DFFRHQX1 \buf_im_reg[21][1]  ( .D(\buf_im[20][1] ), .CK(clk), .RN(n2), .Q(
        \buf_im[21][1] ) );
  DFFRHQX1 \buf_im_reg[22][1]  ( .D(\buf_im[21][1] ), .CK(clk), .RN(n2), .Q(
        \buf_im[22][1] ) );
  DFFRHQX1 \buf_im_reg[23][1]  ( .D(\buf_im[22][1] ), .CK(clk), .RN(n2), .Q(
        \buf_im[23][1] ) );
  DFFRHQX1 \buf_im_reg[24][1]  ( .D(\buf_im[23][1] ), .CK(clk), .RN(n2), .Q(
        \buf_im[24][1] ) );
  DFFRHQX1 \buf_im_reg[25][1]  ( .D(\buf_im[24][1] ), .CK(clk), .RN(n2), .Q(
        \buf_im[25][1] ) );
  DFFRHQX1 \buf_im_reg[26][1]  ( .D(\buf_im[25][1] ), .CK(clk), .RN(n2), .Q(
        \buf_im[26][1] ) );
  DFFRHQX1 \buf_im_reg[27][1]  ( .D(\buf_im[26][1] ), .CK(clk), .RN(n2), .Q(
        \buf_im[27][1] ) );
  DFFRHQX1 \buf_im_reg[28][1]  ( .D(\buf_im[27][1] ), .CK(clk), .RN(n2), .Q(
        \buf_im[28][1] ) );
  DFFRHQX1 \buf_im_reg[29][1]  ( .D(\buf_im[28][1] ), .CK(clk), .RN(n2), .Q(
        \buf_im[29][1] ) );
  DFFRHQX1 \buf_im_reg[30][1]  ( .D(\buf_im[29][1] ), .CK(clk), .RN(n2), .Q(
        \buf_im[30][1] ) );
  DFFRHQX1 \buf_im_reg[1][0]  ( .D(x_im[0]), .CK(clk), .RN(n17), .Q(
        \buf_im[1][0] ) );
  DFFRHQX1 \buf_im_reg[2][0]  ( .D(\buf_im[1][0] ), .CK(clk), .RN(n17), .Q(
        \buf_im[2][0] ) );
  DFFRHQX1 \buf_im_reg[3][0]  ( .D(\buf_im[2][0] ), .CK(clk), .RN(n17), .Q(
        \buf_im[3][0] ) );
  DFFRHQX1 \buf_im_reg[4][0]  ( .D(\buf_im[3][0] ), .CK(clk), .RN(n17), .Q(
        \buf_im[4][0] ) );
  DFFRHQX1 \buf_im_reg[5][0]  ( .D(\buf_im[4][0] ), .CK(clk), .RN(n17), .Q(
        \buf_im[5][0] ) );
  DFFRHQX1 \buf_im_reg[6][0]  ( .D(\buf_im[5][0] ), .CK(clk), .RN(n17), .Q(
        \buf_im[6][0] ) );
  DFFRHQX1 \buf_im_reg[7][0]  ( .D(\buf_im[6][0] ), .CK(clk), .RN(n17), .Q(
        \buf_im[7][0] ) );
  DFFRHQX1 \buf_im_reg[8][0]  ( .D(\buf_im[7][0] ), .CK(clk), .RN(n17), .Q(
        \buf_im[8][0] ) );
  DFFRHQX1 \buf_im_reg[9][0]  ( .D(\buf_im[8][0] ), .CK(clk), .RN(n17), .Q(
        \buf_im[9][0] ) );
  DFFRHQX1 \buf_im_reg[10][0]  ( .D(\buf_im[9][0] ), .CK(clk), .RN(n16), .Q(
        \buf_im[10][0] ) );
  DFFRHQX1 \buf_im_reg[11][0]  ( .D(\buf_im[10][0] ), .CK(clk), .RN(n16), .Q(
        \buf_im[11][0] ) );
  DFFRHQX1 \buf_im_reg[12][0]  ( .D(\buf_im[11][0] ), .CK(clk), .RN(n16), .Q(
        \buf_im[12][0] ) );
  DFFRHQX1 \buf_im_reg[13][0]  ( .D(\buf_im[12][0] ), .CK(clk), .RN(n16), .Q(
        \buf_im[13][0] ) );
  DFFRHQX1 \buf_im_reg[14][0]  ( .D(\buf_im[13][0] ), .CK(clk), .RN(n16), .Q(
        \buf_im[14][0] ) );
  DFFRHQX1 \buf_im_reg[15][0]  ( .D(\buf_im[14][0] ), .CK(clk), .RN(n16), .Q(
        \buf_im[15][0] ) );
  DFFRHQX1 \buf_im_reg[16][0]  ( .D(\buf_im[15][0] ), .CK(clk), .RN(n16), .Q(
        \buf_im[16][0] ) );
  DFFRHQX1 \buf_im_reg[17][0]  ( .D(\buf_im[16][0] ), .CK(clk), .RN(n16), .Q(
        \buf_im[17][0] ) );
  DFFRHQX1 \buf_im_reg[18][0]  ( .D(\buf_im[17][0] ), .CK(clk), .RN(n16), .Q(
        \buf_im[18][0] ) );
  DFFRHQX1 \buf_im_reg[19][0]  ( .D(\buf_im[18][0] ), .CK(clk), .RN(n16), .Q(
        \buf_im[19][0] ) );
  DFFRHQX1 \buf_im_reg[20][0]  ( .D(\buf_im[19][0] ), .CK(clk), .RN(n16), .Q(
        \buf_im[20][0] ) );
  DFFRHQX1 \buf_im_reg[21][0]  ( .D(\buf_im[20][0] ), .CK(clk), .RN(n16), .Q(
        \buf_im[21][0] ) );
  DFFRHQX1 \buf_im_reg[22][0]  ( .D(\buf_im[21][0] ), .CK(clk), .RN(n16), .Q(
        \buf_im[22][0] ) );
  DFFRHQX1 \buf_im_reg[23][0]  ( .D(\buf_im[22][0] ), .CK(clk), .RN(n8), .Q(
        \buf_im[23][0] ) );
  DFFRHQX1 \buf_im_reg[24][0]  ( .D(\buf_im[23][0] ), .CK(clk), .RN(n27), .Q(
        \buf_im[24][0] ) );
  DFFRHQX1 \buf_im_reg[25][0]  ( .D(\buf_im[24][0] ), .CK(clk), .RN(n23), .Q(
        \buf_im[25][0] ) );
  DFFRHQX1 \buf_im_reg[26][0]  ( .D(\buf_im[25][0] ), .CK(clk), .RN(n21), .Q(
        \buf_im[26][0] ) );
  DFFRHQX1 \buf_im_reg[27][0]  ( .D(\buf_im[26][0] ), .CK(clk), .RN(n26), .Q(
        \buf_im[27][0] ) );
  DFFRHQX1 \buf_im_reg[28][0]  ( .D(\buf_im[27][0] ), .CK(clk), .RN(n24), .Q(
        \buf_im[28][0] ) );
  DFFRHQX1 \buf_im_reg[29][0]  ( .D(\buf_im[28][0] ), .CK(clk), .RN(n33), .Q(
        \buf_im[29][0] ) );
  DFFRHQX1 \buf_im_reg[30][0]  ( .D(\buf_im[29][0] ), .CK(clk), .RN(n32), .Q(
        \buf_im[30][0] ) );
  DFFRHQX1 \buf_re_reg[1][11]  ( .D(x_re[11]), .CK(clk), .RN(n21), .Q(
        \buf_re[1][11] ) );
  DFFRHQX1 \buf_re_reg[2][11]  ( .D(\buf_re[1][11] ), .CK(clk), .RN(n26), .Q(
        \buf_re[2][11] ) );
  DFFRHQX1 \buf_re_reg[3][11]  ( .D(\buf_re[2][11] ), .CK(clk), .RN(n24), .Q(
        \buf_re[3][11] ) );
  DFFRHQX1 \buf_re_reg[4][11]  ( .D(\buf_re[3][11] ), .CK(clk), .RN(n14), .Q(
        \buf_re[4][11] ) );
  DFFRHQX1 \buf_re_reg[5][11]  ( .D(\buf_re[4][11] ), .CK(clk), .RN(n33), .Q(
        \buf_re[5][11] ) );
  DFFRHQX1 \buf_re_reg[6][11]  ( .D(\buf_re[5][11] ), .CK(clk), .RN(n32), .Q(
        \buf_re[6][11] ) );
  DFFRHQX1 \buf_re_reg[7][11]  ( .D(\buf_re[6][11] ), .CK(clk), .RN(n6), .Q(
        \buf_re[7][11] ) );
  DFFRHQX1 \buf_re_reg[8][11]  ( .D(\buf_re[7][11] ), .CK(clk), .RN(n22), .Q(
        \buf_re[8][11] ) );
  DFFRHQX1 \buf_re_reg[9][11]  ( .D(\buf_re[8][11] ), .CK(clk), .RN(n22), .Q(
        \buf_re[9][11] ) );
  DFFRHQX1 \buf_re_reg[10][11]  ( .D(\buf_re[9][11] ), .CK(clk), .RN(n22), .Q(
        \buf_re[10][11] ) );
  DFFRHQX1 \buf_re_reg[11][11]  ( .D(\buf_re[10][11] ), .CK(clk), .RN(n22), 
        .Q(\buf_re[11][11] ) );
  DFFRHQX1 \buf_re_reg[12][11]  ( .D(\buf_re[11][11] ), .CK(clk), .RN(n22), 
        .Q(\buf_re[12][11] ) );
  DFFRHQX1 \buf_re_reg[13][11]  ( .D(\buf_re[12][11] ), .CK(clk), .RN(n22), 
        .Q(\buf_re[13][11] ) );
  DFFRHQX1 \buf_re_reg[14][11]  ( .D(\buf_re[13][11] ), .CK(clk), .RN(n22), 
        .Q(\buf_re[14][11] ) );
  DFFRHQX1 \buf_re_reg[15][11]  ( .D(\buf_re[14][11] ), .CK(clk), .RN(n22), 
        .Q(\buf_re[15][11] ) );
  DFFRHQX1 \buf_re_reg[16][11]  ( .D(\buf_re[15][11] ), .CK(clk), .RN(n22), 
        .Q(\buf_re[16][11] ) );
  DFFRHQX1 \buf_re_reg[17][11]  ( .D(\buf_re[16][11] ), .CK(clk), .RN(n22), 
        .Q(\buf_re[17][11] ) );
  DFFRHQX1 \buf_re_reg[18][11]  ( .D(\buf_re[17][11] ), .CK(clk), .RN(n22), 
        .Q(\buf_re[18][11] ) );
  DFFRHQX1 \buf_re_reg[19][11]  ( .D(\buf_re[18][11] ), .CK(clk), .RN(n22), 
        .Q(\buf_re[19][11] ) );
  DFFRHQX1 \buf_re_reg[20][11]  ( .D(\buf_re[19][11] ), .CK(clk), .RN(n22), 
        .Q(\buf_re[20][11] ) );
  DFFRHQX1 \buf_re_reg[21][11]  ( .D(\buf_re[20][11] ), .CK(clk), .RN(n21), 
        .Q(\buf_re[21][11] ) );
  DFFRHQX1 \buf_re_reg[22][11]  ( .D(\buf_re[21][11] ), .CK(clk), .RN(n21), 
        .Q(\buf_re[22][11] ) );
  DFFRHQX1 \buf_re_reg[23][11]  ( .D(\buf_re[22][11] ), .CK(clk), .RN(n21), 
        .Q(\buf_re[23][11] ) );
  DFFRHQX1 \buf_re_reg[24][11]  ( .D(\buf_re[23][11] ), .CK(clk), .RN(n21), 
        .Q(\buf_re[24][11] ) );
  DFFRHQX1 \buf_re_reg[25][11]  ( .D(\buf_re[24][11] ), .CK(clk), .RN(n21), 
        .Q(\buf_re[25][11] ) );
  DFFRHQX1 \buf_re_reg[26][11]  ( .D(\buf_re[25][11] ), .CK(clk), .RN(n21), 
        .Q(\buf_re[26][11] ) );
  DFFRHQX1 \buf_re_reg[27][11]  ( .D(\buf_re[26][11] ), .CK(clk), .RN(n21), 
        .Q(\buf_re[27][11] ) );
  DFFRHQX1 \buf_re_reg[28][11]  ( .D(\buf_re[27][11] ), .CK(clk), .RN(n21), 
        .Q(\buf_re[28][11] ) );
  DFFRHQX1 \buf_re_reg[29][11]  ( .D(\buf_re[28][11] ), .CK(clk), .RN(n21), 
        .Q(\buf_re[29][11] ) );
  DFFRHQX1 \buf_re_reg[30][11]  ( .D(\buf_re[29][11] ), .CK(clk), .RN(n21), 
        .Q(\buf_re[30][11] ) );
  DFFRHQX1 \buf_re_reg[1][10]  ( .D(x_re[10]), .CK(clk), .RN(n24), .Q(
        \buf_re[1][10] ) );
  DFFRHQX1 \buf_re_reg[2][10]  ( .D(\buf_re[1][10] ), .CK(clk), .RN(n24), .Q(
        \buf_re[2][10] ) );
  DFFRHQX1 \buf_re_reg[3][10]  ( .D(\buf_re[2][10] ), .CK(clk), .RN(n24), .Q(
        \buf_re[3][10] ) );
  DFFRHQX1 \buf_re_reg[4][10]  ( .D(\buf_re[3][10] ), .CK(clk), .RN(n24), .Q(
        \buf_re[4][10] ) );
  DFFRHQX1 \buf_re_reg[5][10]  ( .D(\buf_re[4][10] ), .CK(clk), .RN(n24), .Q(
        \buf_re[5][10] ) );
  DFFRHQX1 \buf_re_reg[6][10]  ( .D(\buf_re[5][10] ), .CK(clk), .RN(n24), .Q(
        \buf_re[6][10] ) );
  DFFRHQX1 \buf_re_reg[7][10]  ( .D(\buf_re[6][10] ), .CK(clk), .RN(n24), .Q(
        \buf_re[7][10] ) );
  DFFRHQX1 \buf_re_reg[8][10]  ( .D(\buf_re[7][10] ), .CK(clk), .RN(n24), .Q(
        \buf_re[8][10] ) );
  DFFRHQX1 \buf_re_reg[9][10]  ( .D(\buf_re[8][10] ), .CK(clk), .RN(n24), .Q(
        \buf_re[9][10] ) );
  DFFRHQX1 \buf_re_reg[10][10]  ( .D(\buf_re[9][10] ), .CK(clk), .RN(n24), .Q(
        \buf_re[10][10] ) );
  DFFRHQX1 \buf_re_reg[11][10]  ( .D(\buf_re[10][10] ), .CK(clk), .RN(n24), 
        .Q(\buf_re[11][10] ) );
  DFFRHQX1 \buf_re_reg[12][10]  ( .D(\buf_re[11][10] ), .CK(clk), .RN(n23), 
        .Q(\buf_re[12][10] ) );
  DFFRHQX1 \buf_re_reg[13][10]  ( .D(\buf_re[12][10] ), .CK(clk), .RN(n23), 
        .Q(\buf_re[13][10] ) );
  DFFRHQX1 \buf_re_reg[14][10]  ( .D(\buf_re[13][10] ), .CK(clk), .RN(n23), 
        .Q(\buf_re[14][10] ) );
  DFFRHQX1 \buf_re_reg[15][10]  ( .D(\buf_re[14][10] ), .CK(clk), .RN(n23), 
        .Q(\buf_re[15][10] ) );
  DFFRHQX1 \buf_re_reg[16][10]  ( .D(\buf_re[15][10] ), .CK(clk), .RN(n23), 
        .Q(\buf_re[16][10] ) );
  DFFRHQX1 \buf_re_reg[17][10]  ( .D(\buf_re[16][10] ), .CK(clk), .RN(n23), 
        .Q(\buf_re[17][10] ) );
  DFFRHQX1 \buf_re_reg[18][10]  ( .D(\buf_re[17][10] ), .CK(clk), .RN(n23), 
        .Q(\buf_re[18][10] ) );
  DFFRHQX1 \buf_re_reg[19][10]  ( .D(\buf_re[18][10] ), .CK(clk), .RN(n23), 
        .Q(\buf_re[19][10] ) );
  DFFRHQX1 \buf_re_reg[20][10]  ( .D(\buf_re[19][10] ), .CK(clk), .RN(n23), 
        .Q(\buf_re[20][10] ) );
  DFFRHQX1 \buf_re_reg[21][10]  ( .D(\buf_re[20][10] ), .CK(clk), .RN(n23), 
        .Q(\buf_re[21][10] ) );
  DFFRHQX1 \buf_re_reg[22][10]  ( .D(\buf_re[21][10] ), .CK(clk), .RN(n23), 
        .Q(\buf_re[22][10] ) );
  DFFRHQX1 \buf_re_reg[23][10]  ( .D(\buf_re[22][10] ), .CK(clk), .RN(n23), 
        .Q(\buf_re[23][10] ) );
  DFFRHQX1 \buf_re_reg[24][10]  ( .D(\buf_re[23][10] ), .CK(clk), .RN(n23), 
        .Q(\buf_re[24][10] ) );
  DFFRHQX1 \buf_re_reg[25][10]  ( .D(\buf_re[24][10] ), .CK(clk), .RN(n19), 
        .Q(\buf_re[25][10] ) );
  DFFRHQX1 \buf_re_reg[26][10]  ( .D(\buf_re[25][10] ), .CK(clk), .RN(n8), .Q(
        \buf_re[26][10] ) );
  DFFRHQX1 \buf_re_reg[27][10]  ( .D(\buf_re[26][10] ), .CK(clk), .RN(n27), 
        .Q(\buf_re[27][10] ) );
  DFFRHQX1 \buf_re_reg[28][10]  ( .D(\buf_re[27][10] ), .CK(clk), .RN(n23), 
        .Q(\buf_re[28][10] ) );
  DFFRHQX1 \buf_re_reg[29][10]  ( .D(\buf_re[28][10] ), .CK(clk), .RN(n21), 
        .Q(\buf_re[29][10] ) );
  DFFRHQX1 \buf_re_reg[30][10]  ( .D(\buf_re[29][10] ), .CK(clk), .RN(n7), .Q(
        \buf_re[30][10] ) );
  DFFRHQX1 \buf_re_reg[1][9]  ( .D(x_re[9]), .CK(clk), .RN(n26), .Q(
        \buf_re[1][9] ) );
  DFFRHQX1 \buf_re_reg[2][9]  ( .D(\buf_re[1][9] ), .CK(clk), .RN(n26), .Q(
        \buf_re[2][9] ) );
  DFFRHQX1 \buf_re_reg[3][9]  ( .D(\buf_re[2][9] ), .CK(clk), .RN(n28), .Q(
        \buf_re[3][9] ) );
  DFFRHQX1 \buf_re_reg[4][9]  ( .D(\buf_re[3][9] ), .CK(clk), .RN(n9), .Q(
        \buf_re[4][9] ) );
  DFFRHQX1 \buf_re_reg[5][9]  ( .D(\buf_re[4][9] ), .CK(clk), .RN(n11), .Q(
        \buf_re[5][9] ) );
  DFFRHQX1 \buf_re_reg[6][9]  ( .D(\buf_re[5][9] ), .CK(clk), .RN(n10), .Q(
        \buf_re[6][9] ) );
  DFFRHQX1 \buf_re_reg[7][9]  ( .D(\buf_re[6][9] ), .CK(clk), .RN(n22), .Q(
        \buf_re[7][9] ) );
  DFFRHQX1 \buf_re_reg[8][9]  ( .D(\buf_re[7][9] ), .CK(clk), .RN(n15), .Q(
        \buf_re[8][9] ) );
  DFFRHQX1 \buf_re_reg[9][9]  ( .D(\buf_re[8][9] ), .CK(clk), .RN(n14), .Q(
        \buf_re[9][9] ) );
  DFFRHQX1 \buf_re_reg[10][9]  ( .D(\buf_re[9][9] ), .CK(clk), .RN(n6), .Q(
        \buf_re[10][9] ) );
  DFFRHQX1 \buf_re_reg[11][9]  ( .D(\buf_re[10][9] ), .CK(clk), .RN(n11), .Q(
        \buf_re[11][9] ) );
  DFFRHQX1 \buf_re_reg[12][9]  ( .D(\buf_re[11][9] ), .CK(clk), .RN(n10), .Q(
        \buf_re[12][9] ) );
  DFFRHQX1 \buf_re_reg[13][9]  ( .D(\buf_re[12][9] ), .CK(clk), .RN(n22), .Q(
        \buf_re[13][9] ) );
  DFFRHQX1 \buf_re_reg[14][9]  ( .D(\buf_re[13][9] ), .CK(clk), .RN(n28), .Q(
        \buf_re[14][9] ) );
  DFFRHQX1 \buf_re_reg[15][9]  ( .D(\buf_re[14][9] ), .CK(clk), .RN(n9), .Q(
        \buf_re[15][9] ) );
  DFFRHQX1 \buf_re_reg[16][9]  ( .D(\buf_re[15][9] ), .CK(clk), .RN(n25), .Q(
        \buf_re[16][9] ) );
  DFFRHQX1 \buf_re_reg[17][9]  ( .D(\buf_re[16][9] ), .CK(clk), .RN(n25), .Q(
        \buf_re[17][9] ) );
  DFFRHQX1 \buf_re_reg[18][9]  ( .D(\buf_re[17][9] ), .CK(clk), .RN(n25), .Q(
        \buf_re[18][9] ) );
  DFFRHQX1 \buf_re_reg[19][9]  ( .D(\buf_re[18][9] ), .CK(clk), .RN(n25), .Q(
        \buf_re[19][9] ) );
  DFFRHQX1 \buf_re_reg[20][9]  ( .D(\buf_re[19][9] ), .CK(clk), .RN(n25), .Q(
        \buf_re[20][9] ) );
  DFFRHQX1 \buf_re_reg[21][9]  ( .D(\buf_re[20][9] ), .CK(clk), .RN(n25), .Q(
        \buf_re[21][9] ) );
  DFFRHQX1 \buf_re_reg[22][9]  ( .D(\buf_re[21][9] ), .CK(clk), .RN(n25), .Q(
        \buf_re[22][9] ) );
  DFFRHQX1 \buf_re_reg[23][9]  ( .D(\buf_re[22][9] ), .CK(clk), .RN(n25), .Q(
        \buf_re[23][9] ) );
  DFFRHQX1 \buf_re_reg[24][9]  ( .D(\buf_re[23][9] ), .CK(clk), .RN(n25), .Q(
        \buf_re[24][9] ) );
  DFFRHQX1 \buf_re_reg[25][9]  ( .D(\buf_re[24][9] ), .CK(clk), .RN(n25), .Q(
        \buf_re[25][9] ) );
  DFFRHQX1 \buf_re_reg[26][9]  ( .D(\buf_re[25][9] ), .CK(clk), .RN(n25), .Q(
        \buf_re[26][9] ) );
  DFFRHQX1 \buf_re_reg[27][9]  ( .D(\buf_re[26][9] ), .CK(clk), .RN(n25), .Q(
        \buf_re[27][9] ) );
  DFFRHQX1 \buf_re_reg[28][9]  ( .D(\buf_re[27][9] ), .CK(clk), .RN(n25), .Q(
        \buf_re[28][9] ) );
  DFFRHQX1 \buf_re_reg[29][9]  ( .D(\buf_re[28][9] ), .CK(clk), .RN(n24), .Q(
        \buf_re[29][9] ) );
  DFFRHQX1 \buf_re_reg[30][9]  ( .D(\buf_re[29][9] ), .CK(clk), .RN(n24), .Q(
        \buf_re[30][9] ) );
  DFFRHQX1 \buf_re_reg[1][8]  ( .D(x_re[8]), .CK(clk), .RN(n20), .Q(
        \buf_re[1][8] ) );
  DFFRHQX1 \buf_re_reg[2][8]  ( .D(\buf_re[1][8] ), .CK(clk), .RN(n1), .Q(
        \buf_re[2][8] ) );
  DFFRHQX1 \buf_re_reg[3][8]  ( .D(\buf_re[2][8] ), .CK(clk), .RN(n1), .Q(
        \buf_re[3][8] ) );
  DFFRHQX1 \buf_re_reg[4][8]  ( .D(\buf_re[3][8] ), .CK(clk), .RN(n1), .Q(
        \buf_re[4][8] ) );
  DFFRHQX1 \buf_re_reg[5][8]  ( .D(\buf_re[4][8] ), .CK(clk), .RN(n18), .Q(
        \buf_re[5][8] ) );
  DFFRHQX1 \buf_re_reg[6][8]  ( .D(\buf_re[5][8] ), .CK(clk), .RN(n9), .Q(
        \buf_re[6][8] ) );
  DFFRHQX1 \buf_re_reg[7][8]  ( .D(\buf_re[6][8] ), .CK(clk), .RN(n22), .Q(
        \buf_re[7][8] ) );
  DFFRHQX1 \buf_re_reg[8][8]  ( .D(\buf_re[7][8] ), .CK(clk), .RN(n10), .Q(
        \buf_re[8][8] ) );
  DFFRHQX1 \buf_re_reg[9][8]  ( .D(\buf_re[8][8] ), .CK(clk), .RN(n28), .Q(
        \buf_re[9][8] ) );
  DFFRHQX1 \buf_re_reg[10][8]  ( .D(\buf_re[9][8] ), .CK(clk), .RN(n20), .Q(
        \buf_re[10][8] ) );
  DFFRHQX1 \buf_re_reg[11][8]  ( .D(\buf_re[10][8] ), .CK(clk), .RN(n25), .Q(
        \buf_re[11][8] ) );
  DFFRHQX1 \buf_re_reg[12][8]  ( .D(\buf_re[11][8] ), .CK(clk), .RN(n11), .Q(
        \buf_re[12][8] ) );
  DFFRHQX1 \buf_re_reg[13][8]  ( .D(\buf_re[12][8] ), .CK(clk), .RN(n12), .Q(
        \buf_re[13][8] ) );
  DFFRHQX1 \buf_re_reg[14][8]  ( .D(\buf_re[13][8] ), .CK(clk), .RN(n15), .Q(
        \buf_re[14][8] ) );
  DFFRHQX1 \buf_re_reg[15][8]  ( .D(\buf_re[14][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[15][8] ) );
  DFFRHQX1 \buf_re_reg[16][8]  ( .D(\buf_re[15][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[16][8] ) );
  DFFRHQX1 \buf_re_reg[17][8]  ( .D(\buf_re[16][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[17][8] ) );
  DFFRHQX1 \buf_re_reg[18][8]  ( .D(\buf_re[17][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[18][8] ) );
  DFFRHQX1 \buf_re_reg[19][8]  ( .D(\buf_re[18][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[19][8] ) );
  DFFRHQX1 \buf_re_reg[20][8]  ( .D(\buf_re[19][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[20][8] ) );
  DFFRHQX1 \buf_re_reg[21][8]  ( .D(\buf_re[20][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[21][8] ) );
  DFFRHQX1 \buf_re_reg[22][8]  ( .D(\buf_re[21][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[22][8] ) );
  DFFRHQX1 \buf_re_reg[23][8]  ( .D(\buf_re[22][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[23][8] ) );
  DFFRHQX1 \buf_re_reg[24][8]  ( .D(\buf_re[23][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[24][8] ) );
  DFFRHQX1 \buf_re_reg[25][8]  ( .D(\buf_re[24][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[25][8] ) );
  DFFRHQX1 \buf_re_reg[26][8]  ( .D(\buf_re[25][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[26][8] ) );
  DFFRHQX1 \buf_re_reg[27][8]  ( .D(\buf_re[26][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[27][8] ) );
  DFFRHQX1 \buf_re_reg[28][8]  ( .D(\buf_re[27][8] ), .CK(clk), .RN(n30), .Q(
        \buf_re[28][8] ) );
  DFFRHQX1 \buf_re_reg[29][8]  ( .D(\buf_re[28][8] ), .CK(clk), .RN(n30), .Q(
        \buf_re[29][8] ) );
  DFFRHQX1 \buf_re_reg[30][8]  ( .D(\buf_re[29][8] ), .CK(clk), .RN(n30), .Q(
        \buf_re[30][8] ) );
  DFFRHQX1 \buf_re_reg[1][7]  ( .D(x_re[7]), .CK(clk), .RN(n30), .Q(
        \buf_re[1][7] ) );
  DFFRHQX1 \buf_re_reg[2][7]  ( .D(\buf_re[1][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[2][7] ) );
  DFFRHQX1 \buf_re_reg[3][7]  ( .D(\buf_re[2][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[3][7] ) );
  DFFRHQX1 \buf_re_reg[4][7]  ( .D(\buf_re[3][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[4][7] ) );
  DFFRHQX1 \buf_re_reg[5][7]  ( .D(\buf_re[4][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[5][7] ) );
  DFFRHQX1 \buf_re_reg[6][7]  ( .D(\buf_re[5][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[6][7] ) );
  DFFRHQX1 \buf_re_reg[7][7]  ( .D(\buf_re[6][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[7][7] ) );
  DFFRHQX1 \buf_re_reg[8][7]  ( .D(\buf_re[7][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[8][7] ) );
  DFFRHQX1 \buf_re_reg[9][7]  ( .D(\buf_re[8][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[9][7] ) );
  DFFRHQX1 \buf_re_reg[10][7]  ( .D(\buf_re[9][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[10][7] ) );
  DFFRHQX1 \buf_re_reg[11][7]  ( .D(\buf_re[10][7] ), .CK(clk), .RN(n29), .Q(
        \buf_re[11][7] ) );
  DFFRHQX1 \buf_re_reg[12][7]  ( .D(\buf_re[11][7] ), .CK(clk), .RN(n29), .Q(
        \buf_re[12][7] ) );
  DFFRHQX1 \buf_re_reg[13][7]  ( .D(\buf_re[12][7] ), .CK(clk), .RN(n29), .Q(
        \buf_re[13][7] ) );
  DFFRHQX1 \buf_re_reg[14][7]  ( .D(\buf_re[13][7] ), .CK(clk), .RN(n29), .Q(
        \buf_re[14][7] ) );
  DFFRHQX1 \buf_re_reg[15][7]  ( .D(\buf_re[14][7] ), .CK(clk), .RN(n29), .Q(
        \buf_re[15][7] ) );
  DFFRHQX1 \buf_re_reg[16][7]  ( .D(\buf_re[15][7] ), .CK(clk), .RN(n29), .Q(
        \buf_re[16][7] ) );
  DFFRHQX1 \buf_re_reg[17][7]  ( .D(\buf_re[16][7] ), .CK(clk), .RN(n29), .Q(
        \buf_re[17][7] ) );
  DFFRHQX1 \buf_re_reg[18][7]  ( .D(\buf_re[17][7] ), .CK(clk), .RN(n29), .Q(
        \buf_re[18][7] ) );
  DFFRHQX1 \buf_re_reg[19][7]  ( .D(\buf_re[18][7] ), .CK(clk), .RN(n29), .Q(
        \buf_re[19][7] ) );
  DFFRHQX1 \buf_re_reg[20][7]  ( .D(\buf_re[19][7] ), .CK(clk), .RN(n29), .Q(
        \buf_re[20][7] ) );
  DFFRHQX1 \buf_re_reg[21][7]  ( .D(\buf_re[20][7] ), .CK(clk), .RN(n29), .Q(
        \buf_re[21][7] ) );
  DFFRHQX1 \buf_re_reg[22][7]  ( .D(\buf_re[21][7] ), .CK(clk), .RN(n29), .Q(
        \buf_re[22][7] ) );
  DFFRHQX1 \buf_re_reg[23][7]  ( .D(\buf_re[22][7] ), .CK(clk), .RN(n29), .Q(
        \buf_re[23][7] ) );
  DFFRHQX1 \buf_re_reg[24][7]  ( .D(\buf_re[23][7] ), .CK(clk), .RN(n28), .Q(
        \buf_re[24][7] ) );
  DFFRHQX1 \buf_re_reg[25][7]  ( .D(\buf_re[24][7] ), .CK(clk), .RN(n28), .Q(
        \buf_re[25][7] ) );
  DFFRHQX1 \buf_re_reg[26][7]  ( .D(\buf_re[25][7] ), .CK(clk), .RN(n28), .Q(
        \buf_re[26][7] ) );
  DFFRHQX1 \buf_re_reg[27][7]  ( .D(\buf_re[26][7] ), .CK(clk), .RN(n28), .Q(
        \buf_re[27][7] ) );
  DFFRHQX1 \buf_re_reg[28][7]  ( .D(\buf_re[27][7] ), .CK(clk), .RN(n28), .Q(
        \buf_re[28][7] ) );
  DFFRHQX1 \buf_re_reg[29][7]  ( .D(\buf_re[28][7] ), .CK(clk), .RN(n28), .Q(
        \buf_re[29][7] ) );
  DFFRHQX1 \buf_re_reg[30][7]  ( .D(\buf_re[29][7] ), .CK(clk), .RN(n28), .Q(
        \buf_re[30][7] ) );
  DFFRHQX1 \buf_re_reg[1][6]  ( .D(x_re[6]), .CK(clk), .RN(n28), .Q(
        \buf_re[1][6] ) );
  DFFRHQX1 \buf_re_reg[2][6]  ( .D(\buf_re[1][6] ), .CK(clk), .RN(n28), .Q(
        \buf_re[2][6] ) );
  DFFRHQX1 \buf_re_reg[3][6]  ( .D(\buf_re[2][6] ), .CK(clk), .RN(n28), .Q(
        \buf_re[3][6] ) );
  DFFRHQX1 \buf_re_reg[4][6]  ( .D(\buf_re[3][6] ), .CK(clk), .RN(n28), .Q(
        \buf_re[4][6] ) );
  DFFRHQX1 \buf_re_reg[5][6]  ( .D(\buf_re[4][6] ), .CK(clk), .RN(n28), .Q(
        \buf_re[5][6] ) );
  DFFRHQX1 \buf_re_reg[6][6]  ( .D(\buf_re[5][6] ), .CK(clk), .RN(n28), .Q(
        \buf_re[6][6] ) );
  DFFRHQX1 \buf_re_reg[7][6]  ( .D(\buf_re[6][6] ), .CK(clk), .RN(n27), .Q(
        \buf_re[7][6] ) );
  DFFRHQX1 \buf_re_reg[8][6]  ( .D(\buf_re[7][6] ), .CK(clk), .RN(n27), .Q(
        \buf_re[8][6] ) );
  DFFRHQX1 \buf_re_reg[9][6]  ( .D(\buf_re[8][6] ), .CK(clk), .RN(n27), .Q(
        \buf_re[9][6] ) );
  DFFRHQX1 \buf_re_reg[10][6]  ( .D(\buf_re[9][6] ), .CK(clk), .RN(n27), .Q(
        \buf_re[10][6] ) );
  DFFRHQX1 \buf_re_reg[11][6]  ( .D(\buf_re[10][6] ), .CK(clk), .RN(n27), .Q(
        \buf_re[11][6] ) );
  DFFRHQX1 \buf_re_reg[12][6]  ( .D(\buf_re[11][6] ), .CK(clk), .RN(n27), .Q(
        \buf_re[12][6] ) );
  DFFRHQX1 \buf_re_reg[13][6]  ( .D(\buf_re[12][6] ), .CK(clk), .RN(n27), .Q(
        \buf_re[13][6] ) );
  DFFRHQX1 \buf_re_reg[14][6]  ( .D(\buf_re[13][6] ), .CK(clk), .RN(n27), .Q(
        \buf_re[14][6] ) );
  DFFRHQX1 \buf_re_reg[15][6]  ( .D(\buf_re[14][6] ), .CK(clk), .RN(n27), .Q(
        \buf_re[15][6] ) );
  DFFRHQX1 \buf_re_reg[16][6]  ( .D(\buf_re[15][6] ), .CK(clk), .RN(n27), .Q(
        \buf_re[16][6] ) );
  DFFRHQX1 \buf_re_reg[17][6]  ( .D(\buf_re[16][6] ), .CK(clk), .RN(n27), .Q(
        \buf_re[17][6] ) );
  DFFRHQX1 \buf_re_reg[18][6]  ( .D(\buf_re[17][6] ), .CK(clk), .RN(n27), .Q(
        \buf_re[18][6] ) );
  DFFRHQX1 \buf_re_reg[19][6]  ( .D(\buf_re[18][6] ), .CK(clk), .RN(n27), .Q(
        \buf_re[19][6] ) );
  DFFRHQX1 \buf_re_reg[20][6]  ( .D(\buf_re[19][6] ), .CK(clk), .RN(n26), .Q(
        \buf_re[20][6] ) );
  DFFRHQX1 \buf_re_reg[21][6]  ( .D(\buf_re[20][6] ), .CK(clk), .RN(n26), .Q(
        \buf_re[21][6] ) );
  DFFRHQX1 \buf_re_reg[22][6]  ( .D(\buf_re[21][6] ), .CK(clk), .RN(n26), .Q(
        \buf_re[22][6] ) );
  DFFRHQX1 \buf_re_reg[23][6]  ( .D(\buf_re[22][6] ), .CK(clk), .RN(n26), .Q(
        \buf_re[23][6] ) );
  DFFRHQX1 \buf_re_reg[24][6]  ( .D(\buf_re[23][6] ), .CK(clk), .RN(n26), .Q(
        \buf_re[24][6] ) );
  DFFRHQX1 \buf_re_reg[25][6]  ( .D(\buf_re[24][6] ), .CK(clk), .RN(n26), .Q(
        \buf_re[25][6] ) );
  DFFRHQX1 \buf_re_reg[26][6]  ( .D(\buf_re[25][6] ), .CK(clk), .RN(n26), .Q(
        \buf_re[26][6] ) );
  DFFRHQX1 \buf_re_reg[27][6]  ( .D(\buf_re[26][6] ), .CK(clk), .RN(n26), .Q(
        \buf_re[27][6] ) );
  DFFRHQX1 \buf_re_reg[28][6]  ( .D(\buf_re[27][6] ), .CK(clk), .RN(n26), .Q(
        \buf_re[28][6] ) );
  DFFRHQX1 \buf_re_reg[29][6]  ( .D(\buf_re[28][6] ), .CK(clk), .RN(n26), .Q(
        \buf_re[29][6] ) );
  DFFRHQX1 \buf_re_reg[30][6]  ( .D(\buf_re[29][6] ), .CK(clk), .RN(n26), .Q(
        \buf_re[30][6] ) );
  DFFRHQX1 \buf_re_reg[1][5]  ( .D(x_re[5]), .CK(clk), .RN(n21), .Q(
        \buf_re[1][5] ) );
  DFFRHQX1 \buf_re_reg[2][5]  ( .D(\buf_re[1][5] ), .CK(clk), .RN(n21), .Q(
        \buf_re[2][5] ) );
  DFFRHQX1 \buf_re_reg[3][5]  ( .D(\buf_re[2][5] ), .CK(clk), .RN(n21), .Q(
        \buf_re[3][5] ) );
  DFFRHQX1 \buf_re_reg[4][5]  ( .D(\buf_re[3][5] ), .CK(clk), .RN(n20), .Q(
        \buf_re[4][5] ) );
  DFFRHQX1 \buf_re_reg[5][5]  ( .D(\buf_re[4][5] ), .CK(clk), .RN(n20), .Q(
        \buf_re[5][5] ) );
  DFFRHQX1 \buf_re_reg[6][5]  ( .D(\buf_re[5][5] ), .CK(clk), .RN(n20), .Q(
        \buf_re[6][5] ) );
  DFFRHQX1 \buf_re_reg[7][5]  ( .D(\buf_re[6][5] ), .CK(clk), .RN(n20), .Q(
        \buf_re[7][5] ) );
  DFFRHQX1 \buf_re_reg[8][5]  ( .D(\buf_re[7][5] ), .CK(clk), .RN(n20), .Q(
        \buf_re[8][5] ) );
  DFFRHQX1 \buf_re_reg[9][5]  ( .D(\buf_re[8][5] ), .CK(clk), .RN(n20), .Q(
        \buf_re[9][5] ) );
  DFFRHQX1 \buf_re_reg[10][5]  ( .D(\buf_re[9][5] ), .CK(clk), .RN(n20), .Q(
        \buf_re[10][5] ) );
  DFFRHQX1 \buf_re_reg[11][5]  ( .D(\buf_re[10][5] ), .CK(clk), .RN(n20), .Q(
        \buf_re[11][5] ) );
  DFFRHQX1 \buf_re_reg[12][5]  ( .D(\buf_re[11][5] ), .CK(clk), .RN(n20), .Q(
        \buf_re[12][5] ) );
  DFFRHQX1 \buf_re_reg[13][5]  ( .D(\buf_re[12][5] ), .CK(clk), .RN(n20), .Q(
        \buf_re[13][5] ) );
  DFFRHQX1 \buf_re_reg[14][5]  ( .D(\buf_re[13][5] ), .CK(clk), .RN(n20), .Q(
        \buf_re[14][5] ) );
  DFFRHQX1 \buf_re_reg[15][5]  ( .D(\buf_re[14][5] ), .CK(clk), .RN(n20), .Q(
        \buf_re[15][5] ) );
  DFFRHQX1 \buf_re_reg[16][5]  ( .D(\buf_re[15][5] ), .CK(clk), .RN(n20), .Q(
        \buf_re[16][5] ) );
  DFFRHQX1 \buf_re_reg[17][5]  ( .D(\buf_re[16][5] ), .CK(clk), .RN(n4), .Q(
        \buf_re[17][5] ) );
  DFFRHQX1 \buf_re_reg[18][5]  ( .D(\buf_re[17][5] ), .CK(clk), .RN(n33), .Q(
        \buf_re[18][5] ) );
  DFFRHQX1 \buf_re_reg[19][5]  ( .D(\buf_re[18][5] ), .CK(clk), .RN(n6), .Q(
        \buf_re[19][5] ) );
  DFFRHQX1 \buf_re_reg[20][5]  ( .D(\buf_re[19][5] ), .CK(clk), .RN(n19), .Q(
        \buf_re[20][5] ) );
  DFFRHQX1 \buf_re_reg[21][5]  ( .D(\buf_re[20][5] ), .CK(clk), .RN(n33), .Q(
        \buf_re[21][5] ) );
  DFFRHQX1 \buf_re_reg[22][5]  ( .D(\buf_re[21][5] ), .CK(clk), .RN(n5), .Q(
        \buf_re[22][5] ) );
  DFFRHQX1 \buf_re_reg[23][5]  ( .D(\buf_re[22][5] ), .CK(clk), .RN(n8), .Q(
        \buf_re[23][5] ) );
  DFFRHQX1 \buf_re_reg[24][5]  ( .D(\buf_re[23][5] ), .CK(clk), .RN(n33), .Q(
        \buf_re[24][5] ) );
  DFFRHQX1 \buf_re_reg[25][5]  ( .D(\buf_re[24][5] ), .CK(clk), .RN(n4), .Q(
        \buf_re[25][5] ) );
  DFFRHQX1 \buf_re_reg[26][5]  ( .D(\buf_re[25][5] ), .CK(clk), .RN(n27), .Q(
        \buf_re[26][5] ) );
  DFFRHQX1 \buf_re_reg[27][5]  ( .D(\buf_re[26][5] ), .CK(clk), .RN(n33), .Q(
        \buf_re[27][5] ) );
  DFFRHQX1 \buf_re_reg[28][5]  ( .D(\buf_re[27][5] ), .CK(clk), .RN(n18), .Q(
        \buf_re[28][5] ) );
  DFFRHQX1 \buf_re_reg[29][5]  ( .D(\buf_re[28][5] ), .CK(clk), .RN(n14), .Q(
        \buf_re[29][5] ) );
  DFFRHQX1 \buf_re_reg[30][5]  ( .D(\buf_re[29][5] ), .CK(clk), .RN(n33), .Q(
        \buf_re[30][5] ) );
  DFFRHQX1 \buf_re_reg[1][4]  ( .D(x_re[4]), .CK(clk), .RN(n24), .Q(
        \buf_re[1][4] ) );
  DFFRHQX1 \buf_re_reg[2][4]  ( .D(\buf_re[1][4] ), .CK(clk), .RN(n27), .Q(
        \buf_re[2][4] ) );
  DFFRHQX1 \buf_re_reg[3][4]  ( .D(\buf_re[2][4] ), .CK(clk), .RN(n6), .Q(
        \buf_re[3][4] ) );
  DFFRHQX1 \buf_re_reg[4][4]  ( .D(\buf_re[3][4] ), .CK(clk), .RN(n23), .Q(
        \buf_re[4][4] ) );
  DFFRHQX1 \buf_re_reg[5][4]  ( .D(\buf_re[4][4] ), .CK(clk), .RN(n33), .Q(
        \buf_re[5][4] ) );
  DFFRHQX1 \buf_re_reg[6][4]  ( .D(\buf_re[5][4] ), .CK(clk), .RN(n15), .Q(
        \buf_re[6][4] ) );
  DFFRHQX1 \buf_re_reg[7][4]  ( .D(\buf_re[6][4] ), .CK(clk), .RN(n21), .Q(
        \buf_re[7][4] ) );
  DFFRHQX1 \buf_re_reg[8][4]  ( .D(\buf_re[7][4] ), .CK(clk), .RN(n33), .Q(
        \buf_re[8][4] ) );
  DFFRHQX1 \buf_re_reg[9][4]  ( .D(\buf_re[8][4] ), .CK(clk), .RN(n5), .Q(
        \buf_re[9][4] ) );
  DFFRHQX1 \buf_re_reg[10][4]  ( .D(\buf_re[9][4] ), .CK(clk), .RN(n7), .Q(
        \buf_re[10][4] ) );
  DFFRHQX1 \buf_re_reg[11][4]  ( .D(\buf_re[10][4] ), .CK(clk), .RN(n33), .Q(
        \buf_re[11][4] ) );
  DFFRHQX1 \buf_re_reg[12][4]  ( .D(\buf_re[11][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[12][4] ) );
  DFFRHQX1 \buf_re_reg[13][4]  ( .D(\buf_re[12][4] ), .CK(clk), .RN(n3), .Q(
        \buf_re[13][4] ) );
  DFFRHQX1 \buf_re_reg[14][4]  ( .D(\buf_re[13][4] ), .CK(clk), .RN(n3), .Q(
        \buf_re[14][4] ) );
  DFFRHQX1 \buf_re_reg[15][4]  ( .D(\buf_re[14][4] ), .CK(clk), .RN(n17), .Q(
        \buf_re[15][4] ) );
  DFFRHQX1 \buf_re_reg[16][4]  ( .D(\buf_re[15][4] ), .CK(clk), .RN(n3), .Q(
        \buf_re[16][4] ) );
  DFFRHQX1 \buf_re_reg[17][4]  ( .D(\buf_re[16][4] ), .CK(clk), .RN(n17), .Q(
        \buf_re[17][4] ) );
  DFFRHQX1 \buf_re_reg[18][4]  ( .D(\buf_re[17][4] ), .CK(clk), .RN(n2), .Q(
        \buf_re[18][4] ) );
  DFFRHQX1 \buf_re_reg[19][4]  ( .D(\buf_re[18][4] ), .CK(clk), .RN(n16), .Q(
        \buf_re[19][4] ) );
  DFFRHQX1 \buf_re_reg[20][4]  ( .D(\buf_re[19][4] ), .CK(clk), .RN(n3), .Q(
        \buf_re[20][4] ) );
  DFFRHQX1 \buf_re_reg[21][4]  ( .D(\buf_re[20][4] ), .CK(clk), .RN(n17), .Q(
        \buf_re[21][4] ) );
  DFFRHQX1 \buf_re_reg[22][4]  ( .D(\buf_re[21][4] ), .CK(clk), .RN(n2), .Q(
        \buf_re[22][4] ) );
  DFFRHQX1 \buf_re_reg[23][4]  ( .D(\buf_re[22][4] ), .CK(clk), .RN(n16), .Q(
        \buf_re[23][4] ) );
  DFFRHQX1 \buf_re_reg[24][4]  ( .D(\buf_re[23][4] ), .CK(clk), .RN(n17), .Q(
        \buf_re[24][4] ) );
  DFFRHQX1 \buf_re_reg[25][4]  ( .D(\buf_re[24][4] ), .CK(clk), .RN(n3), .Q(
        \buf_re[25][4] ) );
  DFFRHQX1 \buf_re_reg[26][4]  ( .D(\buf_re[25][4] ), .CK(clk), .RN(n19), .Q(
        \buf_re[26][4] ) );
  DFFRHQX1 \buf_re_reg[27][4]  ( .D(\buf_re[26][4] ), .CK(clk), .RN(n19), .Q(
        \buf_re[27][4] ) );
  DFFRHQX1 \buf_re_reg[28][4]  ( .D(\buf_re[27][4] ), .CK(clk), .RN(n19), .Q(
        \buf_re[28][4] ) );
  DFFRHQX1 \buf_re_reg[29][4]  ( .D(\buf_re[28][4] ), .CK(clk), .RN(n19), .Q(
        \buf_re[29][4] ) );
  DFFRHQX1 \buf_re_reg[30][4]  ( .D(\buf_re[29][4] ), .CK(clk), .RN(n19), .Q(
        \buf_re[30][4] ) );
  DFFRHQX1 \buf_re_reg[1][3]  ( .D(x_re[3]), .CK(clk), .RN(n19), .Q(
        \buf_re[1][3] ) );
  DFFRHQX1 \buf_re_reg[2][3]  ( .D(\buf_re[1][3] ), .CK(clk), .RN(n19), .Q(
        \buf_re[2][3] ) );
  DFFRHQX1 \buf_re_reg[3][3]  ( .D(\buf_re[2][3] ), .CK(clk), .RN(n19), .Q(
        \buf_re[3][3] ) );
  DFFRHQX1 \buf_re_reg[4][3]  ( .D(\buf_re[3][3] ), .CK(clk), .RN(n19), .Q(
        \buf_re[4][3] ) );
  DFFRHQX1 \buf_re_reg[5][3]  ( .D(\buf_re[4][3] ), .CK(clk), .RN(n19), .Q(
        \buf_re[5][3] ) );
  DFFRHQX1 \buf_re_reg[6][3]  ( .D(\buf_re[5][3] ), .CK(clk), .RN(n19), .Q(
        \buf_re[6][3] ) );
  DFFRHQX1 \buf_re_reg[7][3]  ( .D(\buf_re[6][3] ), .CK(clk), .RN(n19), .Q(
        \buf_re[7][3] ) );
  DFFRHQX1 \buf_re_reg[8][3]  ( .D(\buf_re[7][3] ), .CK(clk), .RN(n19), .Q(
        \buf_re[8][3] ) );
  DFFRHQX1 \buf_re_reg[9][3]  ( .D(\buf_re[8][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[9][3] ) );
  DFFRHQX1 \buf_re_reg[10][3]  ( .D(\buf_re[9][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[10][3] ) );
  DFFRHQX1 \buf_re_reg[11][3]  ( .D(\buf_re[10][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[11][3] ) );
  DFFRHQX1 \buf_re_reg[12][3]  ( .D(\buf_re[11][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[12][3] ) );
  DFFRHQX1 \buf_re_reg[13][3]  ( .D(\buf_re[12][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[13][3] ) );
  DFFRHQX1 \buf_re_reg[14][3]  ( .D(\buf_re[13][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[14][3] ) );
  DFFRHQX1 \buf_re_reg[15][3]  ( .D(\buf_re[14][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[15][3] ) );
  DFFRHQX1 \buf_re_reg[16][3]  ( .D(\buf_re[15][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[16][3] ) );
  DFFRHQX1 \buf_re_reg[17][3]  ( .D(\buf_re[16][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[17][3] ) );
  DFFRHQX1 \buf_re_reg[18][3]  ( .D(\buf_re[17][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[18][3] ) );
  DFFRHQX1 \buf_re_reg[19][3]  ( .D(\buf_re[18][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[19][3] ) );
  DFFRHQX1 \buf_re_reg[20][3]  ( .D(\buf_re[19][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[20][3] ) );
  DFFRHQX1 \buf_re_reg[21][3]  ( .D(\buf_re[20][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[21][3] ) );
  DFFRHQX1 \buf_re_reg[22][3]  ( .D(\buf_re[21][3] ), .CK(clk), .RN(n12), .Q(
        \buf_re[22][3] ) );
  DFFRHQX1 \buf_re_reg[23][3]  ( .D(\buf_re[22][3] ), .CK(clk), .RN(n31), .Q(
        \buf_re[23][3] ) );
  DFFRHQX1 \buf_re_reg[24][3]  ( .D(\buf_re[23][3] ), .CK(clk), .RN(n30), .Q(
        \buf_re[24][3] ) );
  DFFRHQX1 \buf_re_reg[25][3]  ( .D(\buf_re[24][3] ), .CK(clk), .RN(n13), .Q(
        \buf_re[25][3] ) );
  DFFRHQX1 \buf_re_reg[26][3]  ( .D(\buf_re[25][3] ), .CK(clk), .RN(n29), .Q(
        \buf_re[26][3] ) );
  DFFRHQX1 \buf_re_reg[27][3]  ( .D(\buf_re[26][3] ), .CK(clk), .RN(n28), .Q(
        \buf_re[27][3] ) );
  DFFRHQX1 \buf_re_reg[28][3]  ( .D(\buf_re[27][3] ), .CK(clk), .RN(n9), .Q(
        \buf_re[28][3] ) );
  DFFRHQX1 \buf_re_reg[29][3]  ( .D(\buf_re[28][3] ), .CK(clk), .RN(n11), .Q(
        \buf_re[29][3] ) );
  DFFRHQX1 \buf_re_reg[30][3]  ( .D(\buf_re[29][3] ), .CK(clk), .RN(n10), .Q(
        \buf_re[30][3] ) );
  DFFRHQX1 \buf_re_reg[1][2]  ( .D(x_re[2]), .CK(clk), .RN(n22), .Q(
        \buf_re[1][2] ) );
  DFFRHQX1 \buf_re_reg[2][2]  ( .D(\buf_re[1][2] ), .CK(clk), .RN(n6), .Q(
        \buf_re[2][2] ) );
  DFFRHQX1 \buf_re_reg[3][2]  ( .D(\buf_re[2][2] ), .CK(clk), .RN(n25), .Q(
        \buf_re[3][2] ) );
  DFFRHQX1 \buf_re_reg[4][2]  ( .D(\buf_re[3][2] ), .CK(clk), .RN(n20), .Q(
        \buf_re[4][2] ) );
  DFFRHQX1 \buf_re_reg[5][2]  ( .D(\buf_re[4][2] ), .CK(clk), .RN(n26), .Q(
        \buf_re[5][2] ) );
  DFFRHQX1 \buf_re_reg[6][2]  ( .D(\buf_re[5][2] ), .CK(clk), .RN(n27), .Q(
        \buf_re[6][2] ) );
  DFFRHQX1 \buf_re_reg[7][2]  ( .D(\buf_re[6][2] ), .CK(clk), .RN(n26), .Q(
        \buf_re[7][2] ) );
  DFFRHQX1 \buf_re_reg[8][2]  ( .D(\buf_re[7][2] ), .CK(clk), .RN(n33), .Q(
        \buf_re[8][2] ) );
  DFFRHQX1 \buf_re_reg[9][2]  ( .D(\buf_re[8][2] ), .CK(clk), .RN(n32), .Q(
        \buf_re[9][2] ) );
  DFFRHQX1 \buf_re_reg[10][2]  ( .D(\buf_re[9][2] ), .CK(clk), .RN(n5), .Q(
        \buf_re[10][2] ) );
  DFFRHQX1 \buf_re_reg[11][2]  ( .D(\buf_re[10][2] ), .CK(clk), .RN(n19), .Q(
        \buf_re[11][2] ) );
  DFFRHQX1 \buf_re_reg[12][2]  ( .D(\buf_re[11][2] ), .CK(clk), .RN(n8), .Q(
        \buf_re[12][2] ) );
  DFFRHQX1 \buf_re_reg[13][2]  ( .D(\buf_re[12][2] ), .CK(clk), .RN(n23), .Q(
        \buf_re[13][2] ) );
  DFFRHQX1 \buf_re_reg[14][2]  ( .D(\buf_re[13][2] ), .CK(clk), .RN(n21), .Q(
        \buf_re[14][2] ) );
  DFFRHQX1 \buf_re_reg[15][2]  ( .D(\buf_re[14][2] ), .CK(clk), .RN(n7), .Q(
        \buf_re[15][2] ) );
  DFFRHQX1 \buf_re_reg[16][2]  ( .D(\buf_re[15][2] ), .CK(clk), .RN(n33), .Q(
        \buf_re[16][2] ) );
  DFFRHQX1 \buf_re_reg[17][2]  ( .D(\buf_re[16][2] ), .CK(clk), .RN(n32), .Q(
        \buf_re[17][2] ) );
  DFFRHQX1 \buf_re_reg[18][2]  ( .D(\buf_re[17][2] ), .CK(clk), .RN(n24), .Q(
        \buf_re[18][2] ) );
  DFFRHQX1 \buf_re_reg[19][2]  ( .D(\buf_re[18][2] ), .CK(clk), .RN(n23), .Q(
        \buf_re[19][2] ) );
  DFFRHQX1 \buf_re_reg[20][2]  ( .D(\buf_re[19][2] ), .CK(clk), .RN(n26), .Q(
        \buf_re[20][2] ) );
  DFFRHQX1 \buf_re_reg[21][2]  ( .D(\buf_re[20][2] ), .CK(clk), .RN(n24), .Q(
        \buf_re[21][2] ) );
  DFFRHQX1 \buf_re_reg[22][2]  ( .D(\buf_re[21][2] ), .CK(clk), .RN(n33), .Q(
        \buf_re[22][2] ) );
  DFFRHQX1 \buf_re_reg[23][2]  ( .D(\buf_re[22][2] ), .CK(clk), .RN(n32), .Q(
        \buf_re[23][2] ) );
  DFFRHQX1 \buf_re_reg[24][2]  ( .D(\buf_re[23][2] ), .CK(clk), .RN(n15), .Q(
        \buf_re[24][2] ) );
  DFFRHQX1 \buf_re_reg[25][2]  ( .D(\buf_re[24][2] ), .CK(clk), .RN(n19), .Q(
        \buf_re[25][2] ) );
  DFFRHQX1 \buf_re_reg[26][2]  ( .D(\buf_re[25][2] ), .CK(clk), .RN(n8), .Q(
        \buf_re[26][2] ) );
  DFFRHQX1 \buf_re_reg[27][2]  ( .D(\buf_re[26][2] ), .CK(clk), .RN(n27), .Q(
        \buf_re[27][2] ) );
  DFFRHQX1 \buf_re_reg[28][2]  ( .D(\buf_re[27][2] ), .CK(clk), .RN(n23), .Q(
        \buf_re[28][2] ) );
  DFFRHQX1 \buf_re_reg[29][2]  ( .D(\buf_re[28][2] ), .CK(clk), .RN(n21), .Q(
        \buf_re[29][2] ) );
  DFFRHQX1 \buf_re_reg[30][2]  ( .D(\buf_re[29][2] ), .CK(clk), .RN(n7), .Q(
        \buf_re[30][2] ) );
  DFFRHQX1 \buf_re_reg[1][1]  ( .D(x_re[1]), .CK(clk), .RN(n2), .Q(
        \buf_re[1][1] ) );
  DFFRHQX1 \buf_re_reg[2][1]  ( .D(\buf_re[1][1] ), .CK(clk), .RN(n3), .Q(
        \buf_re[2][1] ) );
  DFFRHQX1 \buf_re_reg[3][1]  ( .D(\buf_re[2][1] ), .CK(clk), .RN(n17), .Q(
        \buf_re[3][1] ) );
  DFFRHQX1 \buf_re_reg[4][1]  ( .D(\buf_re[3][1] ), .CK(clk), .RN(n16), .Q(
        \buf_re[4][1] ) );
  DFFRHQX1 \buf_re_reg[5][1]  ( .D(\buf_re[4][1] ), .CK(clk), .RN(n2), .Q(
        \buf_re[5][1] ) );
  DFFRHQX1 \buf_re_reg[6][1]  ( .D(\buf_re[5][1] ), .CK(clk), .RN(n16), .Q(
        \buf_re[6][1] ) );
  DFFRHQX1 \buf_re_reg[7][1]  ( .D(\buf_re[6][1] ), .CK(clk), .RN(n2), .Q(
        \buf_re[7][1] ) );
  DFFRHQX1 \buf_re_reg[8][1]  ( .D(\buf_re[7][1] ), .CK(clk), .RN(n34), .Q(
        \buf_re[8][1] ) );
  DFFRHQX1 \buf_re_reg[9][1]  ( .D(\buf_re[8][1] ), .CK(clk), .RN(n2), .Q(
        \buf_re[9][1] ) );
  DFFRHQX1 \buf_re_reg[10][1]  ( .D(\buf_re[9][1] ), .CK(clk), .RN(n34), .Q(
        \buf_re[10][1] ) );
  DFFRHQX1 \buf_re_reg[11][1]  ( .D(\buf_re[10][1] ), .CK(clk), .RN(n34), .Q(
        \buf_re[11][1] ) );
  DFFRHQX1 \buf_re_reg[12][1]  ( .D(\buf_re[11][1] ), .CK(clk), .RN(n34), .Q(
        \buf_re[12][1] ) );
  DFFRHQX1 \buf_re_reg[13][1]  ( .D(\buf_re[12][1] ), .CK(clk), .RN(n34), .Q(
        \buf_re[13][1] ) );
  DFFRHQX1 \buf_re_reg[14][1]  ( .D(\buf_re[13][1] ), .CK(clk), .RN(n2), .Q(
        \buf_re[14][1] ) );
  DFFRHQX1 \buf_re_reg[15][1]  ( .D(\buf_re[14][1] ), .CK(clk), .RN(n16), .Q(
        \buf_re[15][1] ) );
  DFFRHQX1 \buf_re_reg[16][1]  ( .D(\buf_re[15][1] ), .CK(clk), .RN(n3), .Q(
        \buf_re[16][1] ) );
  DFFRHQX1 \buf_re_reg[17][1]  ( .D(\buf_re[16][1] ), .CK(clk), .RN(n17), .Q(
        \buf_re[17][1] ) );
  DFFRHQX1 \buf_re_reg[18][1]  ( .D(\buf_re[17][1] ), .CK(clk), .RN(n2), .Q(
        \buf_re[18][1] ) );
  DFFRHQX1 \buf_re_reg[19][1]  ( .D(\buf_re[18][1] ), .CK(clk), .RN(n16), .Q(
        \buf_re[19][1] ) );
  DFFRHQX1 \buf_re_reg[20][1]  ( .D(\buf_re[19][1] ), .CK(clk), .RN(n3), .Q(
        \buf_re[20][1] ) );
  DFFRHQX1 \buf_re_reg[21][1]  ( .D(\buf_re[20][1] ), .CK(clk), .RN(n17), .Q(
        \buf_re[21][1] ) );
  DFFRHQX1 \buf_re_reg[22][1]  ( .D(\buf_re[21][1] ), .CK(clk), .RN(n2), .Q(
        \buf_re[22][1] ) );
  DFFRHQX1 \buf_re_reg[23][1]  ( .D(\buf_re[22][1] ), .CK(clk), .RN(n16), .Q(
        \buf_re[23][1] ) );
  DFFRHQX1 \buf_re_reg[24][1]  ( .D(\buf_re[23][1] ), .CK(clk), .RN(n3), .Q(
        \buf_re[24][1] ) );
  DFFRHQX1 \buf_re_reg[25][1]  ( .D(\buf_re[24][1] ), .CK(clk), .RN(n17), .Q(
        \buf_re[25][1] ) );
  DFFRHQX1 \buf_re_reg[26][1]  ( .D(\buf_re[25][1] ), .CK(clk), .RN(n16), .Q(
        \buf_re[26][1] ) );
  DFFRHQX1 \buf_re_reg[27][1]  ( .D(\buf_re[26][1] ), .CK(clk), .RN(n17), .Q(
        \buf_re[27][1] ) );
  DFFRHQX1 \buf_re_reg[28][1]  ( .D(\buf_re[27][1] ), .CK(clk), .RN(n17), .Q(
        \buf_re[28][1] ) );
  DFFRHQX1 \buf_re_reg[29][1]  ( .D(\buf_re[28][1] ), .CK(clk), .RN(n17), .Q(
        \buf_re[29][1] ) );
  DFFRHQX1 \buf_re_reg[30][1]  ( .D(\buf_re[29][1] ), .CK(clk), .RN(n17), .Q(
        \buf_re[30][1] ) );
  DFFRHQX1 \buf_re_reg[1][0]  ( .D(x_re[0]), .CK(clk), .RN(n33), .Q(
        \buf_re[1][0] ) );
  DFFRHQX1 \buf_re_reg[2][0]  ( .D(\buf_re[1][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[2][0] ) );
  DFFRHQX1 \buf_re_reg[3][0]  ( .D(\buf_re[2][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[3][0] ) );
  DFFRHQX1 \buf_re_reg[4][0]  ( .D(\buf_re[3][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[4][0] ) );
  DFFRHQX1 \buf_re_reg[5][0]  ( .D(\buf_re[4][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[5][0] ) );
  DFFRHQX1 \buf_re_reg[6][0]  ( .D(\buf_re[5][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[6][0] ) );
  DFFRHQX1 \buf_re_reg[7][0]  ( .D(\buf_re[6][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[7][0] ) );
  DFFRHQX1 \buf_re_reg[8][0]  ( .D(\buf_re[7][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[8][0] ) );
  DFFRHQX1 \buf_re_reg[9][0]  ( .D(\buf_re[8][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[9][0] ) );
  DFFRHQX1 \buf_re_reg[10][0]  ( .D(\buf_re[9][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[10][0] ) );
  DFFRHQX1 \buf_re_reg[11][0]  ( .D(\buf_re[10][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[11][0] ) );
  DFFRHQX1 \buf_re_reg[12][0]  ( .D(\buf_re[11][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[12][0] ) );
  DFFRHQX1 \buf_re_reg[13][0]  ( .D(\buf_re[12][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[13][0] ) );
  DFFRHQX1 \buf_re_reg[14][0]  ( .D(\buf_re[13][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[14][0] ) );
  DFFRHQX1 \buf_re_reg[15][0]  ( .D(\buf_re[14][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[15][0] ) );
  DFFRHQX1 \buf_re_reg[16][0]  ( .D(\buf_re[15][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[16][0] ) );
  DFFRHQX1 \buf_re_reg[17][0]  ( .D(\buf_re[16][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[17][0] ) );
  DFFRHQX1 \buf_re_reg[18][0]  ( .D(\buf_re[17][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[18][0] ) );
  DFFRHQX1 \buf_re_reg[19][0]  ( .D(\buf_re[18][0] ), .CK(clk), .RN(n25), .Q(
        \buf_re[19][0] ) );
  DFFRHQX1 \buf_re_reg[20][0]  ( .D(\buf_re[19][0] ), .CK(clk), .RN(n31), .Q(
        \buf_re[20][0] ) );
  DFFRHQX1 \buf_re_reg[21][0]  ( .D(\buf_re[20][0] ), .CK(clk), .RN(n30), .Q(
        \buf_re[21][0] ) );
  DFFRHQX1 \buf_re_reg[22][0]  ( .D(\buf_re[21][0] ), .CK(clk), .RN(n13), .Q(
        \buf_re[22][0] ) );
  DFFRHQX1 \buf_re_reg[23][0]  ( .D(\buf_re[22][0] ), .CK(clk), .RN(n29), .Q(
        \buf_re[23][0] ) );
  DFFRHQX1 \buf_re_reg[24][0]  ( .D(\buf_re[23][0] ), .CK(clk), .RN(n31), .Q(
        \buf_re[24][0] ) );
  DFFRHQX1 \buf_re_reg[25][0]  ( .D(\buf_re[24][0] ), .CK(clk), .RN(n30), .Q(
        \buf_re[25][0] ) );
  DFFRHQX1 \buf_re_reg[26][0]  ( .D(\buf_re[25][0] ), .CK(clk), .RN(n13), .Q(
        \buf_re[26][0] ) );
  DFFRHQX1 \buf_re_reg[27][0]  ( .D(\buf_re[26][0] ), .CK(clk), .RN(n29), .Q(
        \buf_re[27][0] ) );
  DFFRHQX1 \buf_re_reg[28][0]  ( .D(\buf_re[27][0] ), .CK(clk), .RN(n31), .Q(
        \buf_re[28][0] ) );
  DFFRHQX1 \buf_re_reg[29][0]  ( .D(\buf_re[28][0] ), .CK(clk), .RN(n30), .Q(
        \buf_re[29][0] ) );
  DFFRHQX1 \buf_re_reg[30][0]  ( .D(\buf_re[29][0] ), .CK(clk), .RN(n13), .Q(
        \buf_re[30][0] ) );
  DFFHQX1 \y_re_r_reg[11]  ( .D(\buf_re[30][11] ), .CK(clk), .Q(y_re[11]) );
  DFFHQX1 \y_re_r_reg[10]  ( .D(\buf_re[30][10] ), .CK(clk), .Q(y_re[10]) );
  DFFHQX1 \y_re_r_reg[9]  ( .D(\buf_re[30][9] ), .CK(clk), .Q(y_re[9]) );
  DFFHQX1 \y_re_r_reg[8]  ( .D(\buf_re[30][8] ), .CK(clk), .Q(y_re[8]) );
  DFFHQX1 \y_re_r_reg[7]  ( .D(\buf_re[30][7] ), .CK(clk), .Q(y_re[7]) );
  DFFHQX1 \y_re_r_reg[5]  ( .D(\buf_re[30][5] ), .CK(clk), .Q(y_re[5]) );
  DFFHQX1 \y_re_r_reg[4]  ( .D(\buf_re[30][4] ), .CK(clk), .Q(y_re[4]) );
  DFFHQX1 \y_re_r_reg[3]  ( .D(\buf_re[30][3] ), .CK(clk), .Q(y_re[3]) );
  DFFHQX1 \y_re_r_reg[2]  ( .D(\buf_re[30][2] ), .CK(clk), .Q(y_re[2]) );
  DFFHQX1 \y_re_r_reg[1]  ( .D(\buf_re[30][1] ), .CK(clk), .Q(y_re[1]) );
  DFFHQX1 \y_re_r_reg[0]  ( .D(\buf_re[30][0] ), .CK(clk), .Q(y_re[0]) );
  DFFHQX1 \y_im_r_reg[11]  ( .D(\buf_im[30][11] ), .CK(clk), .Q(y_im[11]) );
  DFFHQX1 \y_im_r_reg[10]  ( .D(\buf_im[30][10] ), .CK(clk), .Q(y_im[10]) );
  DFFHQX1 \y_im_r_reg[9]  ( .D(\buf_im[30][9] ), .CK(clk), .Q(y_im[9]) );
  DFFHQX1 \y_im_r_reg[7]  ( .D(\buf_im[30][7] ), .CK(clk), .Q(y_im[7]) );
  DFFHQX1 \y_im_r_reg[5]  ( .D(\buf_im[30][5] ), .CK(clk), .Q(y_im[5]) );
  DFFHQX1 \y_im_r_reg[4]  ( .D(\buf_im[30][4] ), .CK(clk), .Q(y_im[4]) );
  DFFHQX1 \y_im_r_reg[3]  ( .D(\buf_im[30][3] ), .CK(clk), .Q(y_im[3]) );
  DFFHQX1 \y_im_r_reg[1]  ( .D(\buf_im[30][1] ), .CK(clk), .Q(y_im[1]) );
  DFFHQX1 \y_im_r_reg[0]  ( .D(\buf_im[30][0] ), .CK(clk), .Q(y_im[0]) );
  DFFHQX1 \y_re_r_reg[6]  ( .D(\buf_re[30][6] ), .CK(clk), .Q(y_re[6]) );
  DFFHQX1 \y_im_r_reg[6]  ( .D(\buf_im[30][6] ), .CK(clk), .Q(y_im[6]) );
  DFFHQX1 \y_im_r_reg[8]  ( .D(\buf_im[30][8] ), .CK(clk), .Q(y_im[8]) );
  INVXL U3 ( .A(n36), .Y(n34) );
  INVX1 U4 ( .A(reset), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n36) );
  INVX1 U6 ( .A(n1), .Y(n37) );
  INVX1 U8 ( .A(n36), .Y(n32) );
  INVX1 U9 ( .A(n37), .Y(n33) );
  INVX1 U10 ( .A(n36), .Y(n18) );
  INVX1 U11 ( .A(n37), .Y(n19) );
  INVX1 U12 ( .A(n37), .Y(n20) );
  INVX1 U13 ( .A(n37), .Y(n27) );
  INVX1 U14 ( .A(n36), .Y(n28) );
  INVX1 U15 ( .A(n36), .Y(n29) );
  INVX1 U16 ( .A(n36), .Y(n30) );
  INVX1 U17 ( .A(n37), .Y(n31) );
  INVX1 U18 ( .A(n37), .Y(n25) );
  INVX1 U19 ( .A(n37), .Y(n26) );
  INVX1 U20 ( .A(n36), .Y(n23) );
  INVX1 U21 ( .A(n37), .Y(n24) );
  INVX1 U22 ( .A(n36), .Y(n21) );
  INVX1 U23 ( .A(n36), .Y(n22) );
  INVX1 U24 ( .A(n37), .Y(n16) );
  INVX1 U25 ( .A(n37), .Y(n17) );
  INVX1 U26 ( .A(n36), .Y(n2) );
  INVX1 U27 ( .A(n37), .Y(n3) );
  INVX1 U28 ( .A(n36), .Y(n4) );
  INVX1 U29 ( .A(n36), .Y(n5) );
  INVX1 U30 ( .A(n37), .Y(n6) );
  INVX1 U31 ( .A(n36), .Y(n7) );
  INVX1 U32 ( .A(n37), .Y(n14) );
  INVX1 U33 ( .A(n37), .Y(n15) );
  INVX1 U34 ( .A(n37), .Y(n13) );
  INVX1 U35 ( .A(n36), .Y(n10) );
  INVX1 U36 ( .A(n36), .Y(n11) );
  INVX1 U37 ( .A(n36), .Y(n12) );
  INVX1 U38 ( .A(n37), .Y(n8) );
  INVX1 U39 ( .A(n36), .Y(n9) );
  DFFHQX1 \y_im_r_reg[2]  ( .D(\buf_im[30][2] ), .CK(clk), .Q(y_im[2]) );
endmodule


module carry_select_adder2_WIDTH12_23 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, n16, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n5, n6, n7,
         n8, n9, n10, n11;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];
  assign z[11] = n6;

  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFHX1 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n8), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  AND2X2 U4 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
  OR2X2 U18 ( .A(x[6]), .B(y[6]), .Y(n7) );
  AND2X2 U19 ( .A(y[6]), .B(x[6]), .Y(n8) );
  XNOR2X1 U20 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  XOR2X1 U21 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n7), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFHX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFHX4 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(
        carry), .S(low_sum[5]) );
  NAND2X4 U8 ( .A(high_sum1[5]), .B(n10), .Y(n5) );
  ADDFHX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFHX1 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFHX1 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  MX2X1 U3 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(n11), .Y(z[6]) );
  MX2X1 U5 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(n11), .Y(z[7]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(n11), .Y(z[8]) );
  AOI2BB1X2 U7 ( .A0N(y[11]), .A1N(x[11]), .B0(n16), .Y(z[12]) );
  MX2X1 U9 ( .A(high_sum1[3]), .B(high_sum2[3]), .S0(n9), .Y(z[9]) );
  MX2X1 U10 ( .A(high_sum1[4]), .B(high_sum2[4]), .S0(n9), .Y(z[10]) );
  OAI2BB1X4 U11 ( .A0N(high_sum2[5]), .A1N(n9), .B0(n5), .Y(n6) );
  CLKINVX8 U12 ( .A(carry), .Y(n9) );
  INVX4 U13 ( .A(n9), .Y(n10) );
  INVX3 U14 ( .A(n9), .Y(n11) );
  CLKINVX4 U15 ( .A(n6), .Y(n16) );
endmodule


module carry_select_adder2_WIDTH12_22 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3,
         n4, n5, n6, n7;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFHX1 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n6), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFHX4 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(
        carry), .S(low_sum[5]) );
  XOR2XL U3 ( .A(y[2]), .B(x[2]), .Y(n1) );
  XOR2X1 U4 ( .A(\add_27/carry[2] ), .B(n1), .Y(low_sum[2]) );
  MX2X1 U10 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U11 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U12 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U13 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U14 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U15 ( .A(x[6]), .B(y[6]), .Y(n5) );
  AND2X2 U18 ( .A(y[6]), .B(x[6]), .Y(n6) );
  AND2X2 U19 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
  XNOR2X1 U20 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  XOR2X1 U21 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n5), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFHX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  NAND2X1 U5 ( .A(x[2]), .B(y[2]), .Y(n4) );
  NAND2X2 U9 ( .A(x[2]), .B(\add_27/carry[2] ), .Y(n3) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFHX4 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFHX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  INVXL U6 ( .A(n7), .Y(z[11]) );
  MXI2X4 U7 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n7) );
  NAND2X1 U8 ( .A(y[2]), .B(\add_27/carry[2] ), .Y(n2) );
  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n7), .Y(z[12]) );
  NAND3X1 U17 ( .A(n4), .B(n2), .C(n3), .Y(\add_27/carry[3] ) );
endmodule


module carry_select_adder2_WIDTH12_21 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, n12, \add_27/carry[2] , \add_27/carry[1] , net25756,
         \high_sum2[3] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , net26196, net26194, net26186, net26172,
         \high_sum1[2] , net26865, net26838, net26832, net26831, net26869,
         net26868, net26840, net26837, net26170, \high_sum1[4] , net26878,
         net26844, net26806, net26274, \high_sum1[3] ,
         \add_1_root_add_28_2/carry[2] , net29880, net29924, net30245,
         net29864, net25727, n16, \high_sum2[5] ,
         \add_1_root_add_28_2/carry[5] , \add_1_root_add_28_2/carry[4] ,
         \add_1_root_add_28_2/carry[3] , net26842, net26841, net26815,
         net26814, \high_sum2[4] , \add_29/carry[5] , \add_29/carry[4] ,
         net26835, n2, n3, n4, n5, n6, n8, n14, n15, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n28, n29;
  wire   [5:0] low_sum;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];
  assign z[10] = net25756;

  ADDFHX4 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(
        carry), .S(low_sum[5]) );
  ADDFHX4 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(n25), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(\high_sum1[4] ) );
  ADDFHX4 \add_29/U1_4  ( .A(x[10]), .B(n25), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(\high_sum2[4] ) );
  ADDFHX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  AND2X4 U4 ( .A(net26868), .B(net26878), .Y(net29880) );
  INVX3 U7 ( .A(y[7]), .Y(net26868) );
  INVX1 U15 ( .A(x[7]), .Y(net26878) );
  AOI21X4 U16 ( .A0(net26842), .A1(net26841), .B0(net26835), .Y(net26814) );
  NOR2X4 U19 ( .A(net30245), .B(n3), .Y(net26842) );
  NOR2X4 U20 ( .A(n15), .B(x[8]), .Y(net30245) );
  NOR2X4 U22 ( .A(net29880), .B(n18), .Y(net26841) );
  XNOR3X4 U31 ( .A(n22), .B(net29864), .C(\add_29/carry[5] ), .Y(
        \high_sum2[5] ) );
  AOI2BB2X4 U36 ( .B0(\high_sum2[5] ), .B1(n12), .A0N(net25727), .A1N(n12), 
        .Y(n16) );
  AOI21X4 U39 ( .A0(net26806), .A1(n4), .B0(net30245), .Y(
        \add_1_root_add_28_2/carry[3] ) );
  NAND2X4 U41 ( .A(n15), .B(x[8]), .Y(n4) );
  INVX2 U43 ( .A(n16), .Y(z[11]) );
  NAND2BXL U46 ( .AN(net29880), .B(net26170), .Y(net26196) );
  XOR2X1 U49 ( .A(x[7]), .B(net26869), .Y(n5) );
  AND2X1 U50 ( .A(y[6]), .B(x[6]), .Y(n6) );
  XNOR3X2 U52 ( .A(n19), .B(x[6]), .C(n12), .Y(z[6]) );
  OAI2BB1X4 U62 ( .A0N(net26844), .A1N(net26274), .B0(net26170), .Y(
        \add_1_root_add_28_2/carry[2] ) );
  NAND2BX4 U63 ( .AN(y[7]), .B(net26878), .Y(net26274) );
  NAND2XL U67 ( .A(x[6]), .B(y[6]), .Y(net26840) );
  AND2X1 U77 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
  ADDFHX4 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(n23), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(\high_sum1[3] ) );
  ADDFHX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  INVXL U3 ( .A(y[6]), .Y(n3) );
  CLKINVX3 U6 ( .A(y[8]), .Y(n14) );
  INVX4 U8 ( .A(n14), .Y(n15) );
  INVX1 U11 ( .A(net26868), .Y(net26869) );
  MX2X1 U12 ( .A(n5), .B(net26196), .S0(n6), .Y(net26172) );
  CLKBUFXL U14 ( .A(y[6]), .Y(n19) );
  XNOR2X1 U17 ( .A(n23), .B(x[9]), .Y(net26838) );
  INVX1 U23 ( .A(n4), .Y(net26832) );
  AND2X2 U28 ( .A(n23), .B(x[9]), .Y(n24) );
  XOR2X1 U29 ( .A(n20), .B(net26194), .Y(\high_sum1[2] ) );
  AOI2BB1X4 U30 ( .A0N(n15), .A1N(x[8]), .B0(n2), .Y(net26835) );
  XOR2X1 U33 ( .A(net26838), .B(n8), .Y(\high_sum2[3] ) );
  INVX1 U35 ( .A(x[11]), .Y(n22) );
  BUFX3 U37 ( .A(y[9]), .Y(n23) );
  INVX1 U38 ( .A(x[6]), .Y(n18) );
  INVX1 U40 ( .A(n22), .Y(n21) );
  NAND2BX4 U42 ( .AN(y[6]), .B(n18), .Y(net26844) );
  AOI2BB2X4 U47 ( .B0(net26814), .B1(net26815), .A0N(x[9]), .A1N(n23), .Y(
        \add_29/carry[4] ) );
  BUFX1 U51 ( .A(net26806), .Y(n20) );
  XNOR3X4 U53 ( .A(n21), .B(net29864), .C(\add_1_root_add_28_2/carry[5] ), .Y(
        net25727) );
  NOR2BX2 U54 ( .AN(net26868), .B(x[7]), .Y(net26837) );
  INVX8 U56 ( .A(carry), .Y(n12) );
  AOI2BB1X4 U57 ( .A0N(net29864), .A1N(n21), .B0(n16), .Y(z[12]) );
  OR2X4 U60 ( .A(net26878), .B(net26868), .Y(n2) );
  INVX8 U61 ( .A(\add_1_root_add_28_2/carry[2] ), .Y(net26806) );
  ADDFHX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFHX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  OAI2BB2X2 U5 ( .B0(n29), .B1(n28), .A0N(\high_sum1[2] ), .A1N(net29924), .Y(
        z[8]) );
  CLKINVX3 U9 ( .A(n12), .Y(n28) );
  CLKINVX2 U10 ( .A(carry), .Y(net26186) );
  NAND2X2 U13 ( .A(x[7]), .B(y[7]), .Y(net26170) );
  INVX1 U18 ( .A(net30245), .Y(net26865) );
  OAI21X2 U21 ( .A0(net26837), .A1(net26840), .B0(net26170), .Y(net26831) );
  CLKBUFX8 U24 ( .A(y[11]), .Y(net29864) );
  CLKINVX3 U25 ( .A(net26186), .Y(net29924) );
  AOI21X2 U26 ( .A0(net26865), .A1(net26831), .B0(net26832), .Y(n8) );
  MX2X1 U27 ( .A(\high_sum2[4] ), .B(\high_sum1[4] ), .S0(carry), .Y(net25756)
         );
  MX2X1 U32 ( .A(n5), .B(net26196), .S0(net26844), .Y(n26) );
  NAND2BX1 U34 ( .AN(net30245), .B(n4), .Y(net26194) );
  MX2X1 U44 ( .A(net26172), .B(n26), .S0(carry), .Y(z[7]) );
  MX2X1 U45 ( .A(\high_sum2[3] ), .B(\high_sum1[3] ), .S0(carry), .Y(z[9]) );
  XOR2X1 U48 ( .A(net26194), .B(net26831), .Y(n29) );
  BUFX3 U55 ( .A(y[10]), .Y(n25) );
  NOR2BX2 U58 ( .AN(n4), .B(n24), .Y(net26815) );
endmodule


module carry_select_adder2_WIDTH12_20 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   \add_29/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n7, n8, n9,
         n23, n24, n31, net37034, net37037, net37058, n6, n4, n3, n29, n27,
         n20, n1, \high_sum2[5] , \high_sum2[4] , \add_29/carry[5] ,
         \add_29/carry[3] , n28, n26, \high_sum1[4] , \add_29/carry[4] ,
         \add_1_root_add_28_2/carry[5] , n22, n21, n15, n13, n10,
         \high_sum2[3] , \high_sum2[1] , \high_sum1[3] , \high_sum1[1] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , n33, n34;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  ADDFHX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFHX4 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  XOR2X1 U20 ( .A(\add_29/carry[2] ), .B(n9), .Y(high_sum2[2]) );
  XOR2X1 U24 ( .A(y[8]), .B(x[8]), .Y(n9) );
  ADDFHX4 U38 ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(n23) );
  AND2X1 U44 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
  ADDFHX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  NAND2X2 U21 ( .A(\add_29/carry[2] ), .B(y[8]), .Y(n6) );
  XNOR2X4 U29 ( .A(\add_29/carry[5] ), .B(n33), .Y(\high_sum2[5] ) );
  INVX2 U42 ( .A(n29), .Y(z[11]) );
  NAND2X1 U6 ( .A(n27), .B(y[11]), .Y(n3) );
  AOI2BB2X4 U41 ( .B0(\high_sum2[5] ), .B1(net37034), .A0N(n28), .A1N(net37034), .Y(n29) );
  ADDFHX4 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(\high_sum2[4] ) );
  AND2X2 U31 ( .A(y[6]), .B(x[6]), .Y(n22) );
  XOR2X1 U43 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  ADDFHX4 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n22), .CO(\add_29/carry[2] ), 
        .S(\high_sum2[1] ) );
  OR2X2 U11 ( .A(x[6]), .B(y[6]), .Y(n21) );
  ADDFHX4 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n21), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(\high_sum1[1] ) );
  ADDFHX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(\high_sum2[3] ) );
  NAND2X2 U27 ( .A(x[8]), .B(y[8]), .Y(n15) );
  NAND3X4 U28 ( .A(n13), .B(n10), .C(n15), .Y(\add_1_root_add_28_2/carry[3] )
         );
  ADDFHX4 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(\high_sum1[4] ) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .S(
        low_sum[5]) );
  OAI2BB2X1 U4 ( .B0(n34), .B1(net37034), .A0N(high_sum2[2]), .A1N(n31), .Y(
        z[8]) );
  OAI2BB2X1 U5 ( .B0(high_sum2[0]), .B1(net37034), .A0N(high_sum2[0]), .A1N(
        n31), .Y(z[6]) );
  AOI2BB1X4 U7 ( .A0N(n26), .A1N(x[11]), .B0(n29), .Y(z[12]) );
  NAND2X4 U8 ( .A(n1), .B(x[11]), .Y(n4) );
  INVX8 U9 ( .A(n26), .Y(n1) );
  INVX1 U10 ( .A(x[8]), .Y(net37058) );
  BUFX8 U12 ( .A(y[11]), .Y(n26) );
  CLKINVX3 U13 ( .A(n23), .Y(n31) );
  MX2X1 U14 ( .A(\high_sum2[1] ), .B(\high_sum1[1] ), .S0(n23), .Y(z[7]) );
  MX2X1 U15 ( .A(\high_sum2[3] ), .B(\high_sum1[3] ), .S0(n23), .Y(z[9]) );
  NAND2X4 U17 ( .A(\add_1_root_add_28_2/carry[2] ), .B(x[8]), .Y(n13) );
  NAND2X4 U18 ( .A(\add_1_root_add_28_2/carry[2] ), .B(y[8]), .Y(n10) );
  AND2X4 U19 ( .A(n4), .B(n3), .Y(n33) );
  XNOR2X1 U22 ( .A(net37037), .B(n9), .Y(n34) );
  OAI2BB2X1 U23 ( .B0(n20), .B1(net37034), .A0N(\high_sum2[4] ), .A1N(net37034), .Y(z[10]) );
  XNOR3X4 U26 ( .A(x[11]), .B(n26), .C(\add_1_root_add_28_2/carry[5] ), .Y(n28) );
  INVX1 U30 ( .A(\high_sum1[4] ), .Y(n20) );
  INVX1 U32 ( .A(x[11]), .Y(n27) );
  CLKINVX8 U33 ( .A(n24), .Y(net37034) );
  NAND2BX2 U34 ( .AN(net37058), .B(\add_29/carry[2] ), .Y(n7) );
  ADDFHX4 U35 ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(n24) );
  ADDFHX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFHX4 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(\high_sum1[3] ) );
  NAND2X1 U3 ( .A(x[8]), .B(y[8]), .Y(n8) );
  BUFX3 U16 ( .A(\add_1_root_add_28_2/carry[2] ), .Y(net37037) );
  NAND3X2 U25 ( .A(n7), .B(n8), .C(n6), .Y(\add_29/carry[3] ) );
endmodule


module butterfly_WIDTH12_DW01_inc_1_DW01_inc_27 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;
  wire   \carry[11] , net29906, net29905, \carry[9] , n4, n5, n8, n9, n10, n11,
         net37021, net37057, \carry[8] , net25664, n7, n3, n2, \carry[7] , n12
;

  XNOR2X4 U1 ( .A(\carry[9] ), .B(n4), .Y(SUM[9]) );
  XOR2X1 U15 ( .A(A[4]), .B(n11), .Y(SUM[4]) );
  AND2X2 U17 ( .A(n8), .B(net29906), .Y(n11) );
  INVX1 U18 ( .A(net29905), .Y(net29906) );
  ADDHX2 U1_1_8 ( .A(A[8]), .B(\carry[8] ), .CO(\carry[9] ), .S(SUM[8]) );
  AND2X1 U19 ( .A(n10), .B(A[2]), .Y(n7) );
  XOR2X1 U10 ( .A(A[2]), .B(n9), .Y(SUM[2]) );
  NAND2XL U8 ( .A(A[3]), .B(A[4]), .Y(n5) );
  AND2X4 U13 ( .A(A[0]), .B(A[1]), .Y(n9) );
  NAND3X4 U4 ( .A(A[5]), .B(A[1]), .C(A[2]), .Y(n2) );
  NAND3X4 U5 ( .A(A[0]), .B(A[3]), .C(A[4]), .Y(n3) );
  NOR2X4 U3 ( .A(n2), .B(n3), .Y(net25664) );
  ADDHX4 U1_1_7 ( .A(A[7]), .B(\carry[7] ), .CO(\carry[8] ), .S(SUM[7]) );
  ADDHX4 U1_1_6 ( .A(A[6]), .B(net25664), .CO(\carry[7] ), .S(SUM[6]) );
  ADDHX2 U1_1_10 ( .A(A[10]), .B(net37021), .CO(\carry[11] ), .S(SUM[10]) );
  XOR2X4 U2 ( .A(\carry[11] ), .B(A[11]), .Y(SUM[11]) );
  XOR2X2 U6 ( .A(A[5]), .B(n7), .Y(SUM[5]) );
  NOR2BX1 U7 ( .AN(n9), .B(n5), .Y(n10) );
  AND2X4 U9 ( .A(\carry[8] ), .B(net37057), .Y(net37021) );
  AND2X2 U11 ( .A(A[2]), .B(n9), .Y(n8) );
  AND2X2 U12 ( .A(A[8]), .B(A[9]), .Y(net37057) );
  INVX1 U16 ( .A(A[9]), .Y(n4) );
  XOR2X1 U20 ( .A(net29906), .B(n8), .Y(SUM[3]) );
  INVX1 U14 ( .A(A[3]), .Y(net29905) );
  INVX4 U21 ( .A(SUM[0]), .Y(n12) );
  INVX4 U22 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X2 U23 ( .A(n12), .B(A[1]), .Y(SUM[1]) );
endmodule


module butterfly_WIDTH12_DW01_inc_2 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;
  wire   n1, n2, n3, n5, n6, n7, n9, n10, n13, n14, n16, n17, n20, n21, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n34, n35, n36, n59, n60, n62,
         n63, n64, n65, n66;

  XNOR2X4 U11 ( .A(n27), .B(A[9]), .Y(n6) );
  XOR2X4 U18 ( .A(n1), .B(A[7]), .Y(SUM[7]) );
  MXI2X4 U21 ( .A(n14), .B(n13), .S0(n59), .Y(SUM[6]) );
  AND2X4 U34 ( .A(A[3]), .B(A[2]), .Y(n34) );
  INVXL U44 ( .A(A[0]), .Y(SUM[0]) );
  MXI2X2 U45 ( .A(n21), .B(n20), .S0(n66), .Y(SUM[3]) );
  AND2X4 U46 ( .A(A[7]), .B(A[8]), .Y(n27) );
  MXI2X1 U47 ( .A(n3), .B(n2), .S0(n65), .Y(SUM[10]) );
  NAND2X1 U49 ( .A(n27), .B(A[9]), .Y(n26) );
  AND2X2 U50 ( .A(n5), .B(A[10]), .Y(n25) );
  INVX1 U51 ( .A(n26), .Y(n5) );
  INVX1 U52 ( .A(A[5]), .Y(n17) );
  XNOR2X1 U53 ( .A(n32), .B(n17), .Y(n16) );
  XNOR2X2 U54 ( .A(n66), .B(n35), .Y(SUM[2]) );
  CLKINVX8 U55 ( .A(n62), .Y(n36) );
  AND2X2 U56 ( .A(A[5]), .B(A[4]), .Y(n31) );
  CLKINVXL U57 ( .A(A[3]), .Y(n21) );
  XOR2XL U58 ( .A(n35), .B(A[3]), .Y(n20) );
  INVX1 U59 ( .A(A[4]), .Y(n32) );
  AND2X4 U60 ( .A(n36), .B(n60), .Y(n59) );
  INVX1 U61 ( .A(A[7]), .Y(n28) );
  AND2X2 U62 ( .A(A[2]), .B(A[3]), .Y(n60) );
  NAND2X4 U63 ( .A(n63), .B(A[4]), .Y(n30) );
  MXI2X1 U64 ( .A(n7), .B(n6), .S0(n1), .Y(SUM[9]) );
  CLKINVX3 U66 ( .A(A[6]), .Y(n14) );
  XOR2XL U67 ( .A(n59), .B(A[4]), .Y(SUM[4]) );
  XOR2X2 U68 ( .A(A[0]), .B(A[1]), .Y(SUM[1]) );
  NAND2X4 U69 ( .A(A[0]), .B(A[1]), .Y(n62) );
  NAND2X4 U70 ( .A(n36), .B(n34), .Y(n64) );
  INVX2 U71 ( .A(A[2]), .Y(n35) );
  AND2X2 U72 ( .A(A[1]), .B(A[0]), .Y(n66) );
  AND2X4 U73 ( .A(A[5]), .B(A[6]), .Y(n63) );
  NOR2X4 U76 ( .A(n64), .B(n30), .Y(n29) );
  BUFX1 U77 ( .A(n1), .Y(n65) );
  AND2X1 U78 ( .A(n65), .B(n25), .Y(n24) );
  MXI2X2 U79 ( .A(n10), .B(n9), .S0(n1), .Y(SUM[8]) );
  INVXL U80 ( .A(A[8]), .Y(n10) );
  XOR2X1 U81 ( .A(n28), .B(A[8]), .Y(n9) );
  INVX1 U82 ( .A(A[10]), .Y(n3) );
  INVX1 U83 ( .A(A[9]), .Y(n7) );
  MXI2XL U84 ( .A(n17), .B(n16), .S0(n59), .Y(SUM[5]) );
  XOR2X4 U48 ( .A(n31), .B(n14), .Y(n13) );
  BUFX12 U65 ( .A(n29), .Y(n1) );
  XOR2X1 U74 ( .A(n26), .B(A[10]), .Y(n2) );
  XOR2X2 U75 ( .A(n24), .B(A[11]), .Y(SUM[11]) );
endmodule


module butterfly_WIDTH12 ( clk, x0_re, x0_im, x1_re, x1_im, y0_re, y0_im, 
        y1_re, y1_im );
  input [11:0] x0_re;
  input [11:0] x0_im;
  input [11:0] x1_re;
  input [11:0] x1_im;
  output [11:0] y0_re;
  output [11:0] y0_im;
  output [11:0] y1_re;
  output [11:0] y1_im;
  input clk;
  wire   N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N9, N8,
         N7, N6, N5, N4, N3, N2, N11, N10, N1, N0, n5, n6, n8;
  wire   [11:0] x1_re_neg;
  wire   [11:0] x1_im_neg;
  wire   [12:0] temp1;
  wire   [12:0] temp2;
  wire   [12:0] temp3;
  wire   [12:0] temp4;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  DFFHQXL \add_re_reg[12]  ( .D(temp1[12]), .CK(clk), .Q(y0_re[11]) );
  DFFHQXL \add_re_reg[11]  ( .D(temp1[11]), .CK(clk), .Q(y0_re[10]) );
  DFFHQXL \add_re_reg[10]  ( .D(temp1[10]), .CK(clk), .Q(y0_re[9]) );
  DFFHQXL \add_re_reg[9]  ( .D(temp1[9]), .CK(clk), .Q(y0_re[8]) );
  DFFHQXL \add_re_reg[8]  ( .D(temp1[8]), .CK(clk), .Q(y0_re[7]) );
  DFFHQXL \add_re_reg[7]  ( .D(temp1[7]), .CK(clk), .Q(y0_re[6]) );
  DFFHQXL \add_re_reg[6]  ( .D(temp1[6]), .CK(clk), .Q(y0_re[5]) );
  DFFHQX1 \add_re_reg[5]  ( .D(temp1[5]), .CK(clk), .Q(y0_re[4]) );
  DFFHQX1 \add_re_reg[4]  ( .D(temp1[4]), .CK(clk), .Q(y0_re[3]) );
  DFFHQX1 \add_re_reg[3]  ( .D(temp1[3]), .CK(clk), .Q(y0_re[2]) );
  DFFHQX1 \add_re_reg[2]  ( .D(temp1[2]), .CK(clk), .Q(y0_re[1]) );
  DFFHQX1 \add_re_reg[1]  ( .D(temp1[1]), .CK(clk), .Q(y0_re[0]) );
  DFFHQXL \add_im_reg[12]  ( .D(temp2[12]), .CK(clk), .Q(y0_im[11]) );
  DFFHQXL \add_im_reg[11]  ( .D(temp2[11]), .CK(clk), .Q(y0_im[10]) );
  DFFHQXL \add_im_reg[10]  ( .D(temp2[10]), .CK(clk), .Q(y0_im[9]) );
  DFFHQXL \add_im_reg[9]  ( .D(temp2[9]), .CK(clk), .Q(y0_im[8]) );
  DFFHQXL \add_im_reg[8]  ( .D(temp2[8]), .CK(clk), .Q(y0_im[7]) );
  DFFHQXL \add_im_reg[7]  ( .D(temp2[7]), .CK(clk), .Q(y0_im[6]) );
  DFFHQXL \add_im_reg[6]  ( .D(temp2[6]), .CK(clk), .Q(y0_im[5]) );
  DFFHQX1 \add_im_reg[5]  ( .D(temp2[5]), .CK(clk), .Q(y0_im[4]) );
  DFFHQX1 \add_im_reg[4]  ( .D(temp2[4]), .CK(clk), .Q(y0_im[3]) );
  DFFHQX1 \add_im_reg[3]  ( .D(temp2[3]), .CK(clk), .Q(y0_im[2]) );
  DFFHQX1 \add_im_reg[2]  ( .D(temp2[2]), .CK(clk), .Q(y0_im[1]) );
  DFFHQX1 \add_im_reg[1]  ( .D(temp2[1]), .CK(clk), .Q(y0_im[0]) );
  DFFHQXL \sub_re_reg[9]  ( .D(temp3[9]), .CK(clk), .Q(y1_re[8]) );
  DFFHQXL \sub_re_reg[8]  ( .D(temp3[8]), .CK(clk), .Q(y1_re[7]) );
  DFFHQXL \sub_re_reg[6]  ( .D(temp3[6]), .CK(clk), .Q(y1_re[5]) );
  DFFHQX1 \sub_re_reg[5]  ( .D(temp3[5]), .CK(clk), .Q(y1_re[4]) );
  DFFHQX1 \sub_re_reg[4]  ( .D(temp3[4]), .CK(clk), .Q(y1_re[3]) );
  DFFHQX1 \sub_re_reg[3]  ( .D(temp3[3]), .CK(clk), .Q(y1_re[2]) );
  DFFHQX1 \sub_re_reg[2]  ( .D(temp3[2]), .CK(clk), .Q(y1_re[1]) );
  DFFHQX1 \sub_re_reg[1]  ( .D(temp3[1]), .CK(clk), .Q(y1_re[0]) );
  DFFHQXL \sub_im_reg[10]  ( .D(temp4[10]), .CK(clk), .Q(y1_im[9]) );
  DFFHQXL \sub_im_reg[9]  ( .D(temp4[9]), .CK(clk), .Q(y1_im[8]) );
  DFFHQXL \sub_im_reg[8]  ( .D(temp4[8]), .CK(clk), .Q(y1_im[7]) );
  DFFHQXL \sub_im_reg[7]  ( .D(temp4[7]), .CK(clk), .Q(y1_im[6]) );
  DFFHQXL \sub_im_reg[6]  ( .D(temp4[6]), .CK(clk), .Q(y1_im[5]) );
  DFFHQX1 \sub_im_reg[5]  ( .D(temp4[5]), .CK(clk), .Q(y1_im[4]) );
  DFFHQX1 \sub_im_reg[4]  ( .D(temp4[4]), .CK(clk), .Q(y1_im[3]) );
  DFFHQX1 \sub_im_reg[3]  ( .D(temp4[3]), .CK(clk), .Q(y1_im[2]) );
  DFFHQX1 \sub_im_reg[2]  ( .D(temp4[2]), .CK(clk), .Q(y1_im[1]) );
  DFFHQX1 \sub_im_reg[1]  ( .D(temp4[1]), .CK(clk), .Q(y1_im[0]) );
  DFFXL \sub_im_reg[11]  ( .D(temp4[11]), .CK(clk), .Q(y1_im[10]) );
  DFFXL \sub_im_reg[12]  ( .D(temp4[12]), .CK(clk), .Q(y1_im[11]) );
  CLKINVX8 U3 ( .A(x1_im[2]), .Y(N21) );
  CLKINVX8 U4 ( .A(x1_im[0]), .Y(N23) );
  INVX8 U8 ( .A(x1_im[3]), .Y(N20) );
  CLKINVX3 U11 ( .A(x1_im[6]), .Y(N17) );
  INVX1 U19 ( .A(x1_im[10]), .Y(N13) );
  INVX1 U20 ( .A(x1_im[11]), .Y(N12) );
  INVX1 U21 ( .A(x1_im[7]), .Y(N16) );
  INVX1 U22 ( .A(x1_im[8]), .Y(N15) );
  INVX1 U23 ( .A(x1_re[10]), .Y(N1) );
  INVX1 U24 ( .A(x1_re[11]), .Y(N0) );
  DFFXL \sub_re_reg[11]  ( .D(temp3[11]), .CK(clk), .Q(y1_re[10]) );
  DFFXL \sub_re_reg[12]  ( .D(temp3[12]), .CK(clk), .Q(y1_re[11]) );
  DFFXL \sub_re_reg[7]  ( .D(temp3[7]), .CK(clk), .Q(y1_re[6]) );
  CLKINVX8 U5 ( .A(x1_re[3]), .Y(N8) );
  CLKINVX3 U9 ( .A(n5), .Y(n6) );
  INVX4 U13 ( .A(x1_re[7]), .Y(N4) );
  CLKINVX3 U14 ( .A(x1_re[8]), .Y(N3) );
  CLKINVX8 U15 ( .A(x1_re[0]), .Y(N11) );
  CLKINVX8 U17 ( .A(x1_im[4]), .Y(N19) );
  CLKINVX8 U18 ( .A(x1_re[5]), .Y(N6) );
  CLKINVX8 U25 ( .A(x1_im[1]), .Y(N22) );
  INVX8 U26 ( .A(x1_re[4]), .Y(N7) );
  INVX8 U27 ( .A(x1_re[2]), .Y(N9) );
  CLKINVX3 U28 ( .A(x1_re[9]), .Y(N2) );
  CLKINVX8 U29 ( .A(x1_re[6]), .Y(N5) );
  INVX1 U30 ( .A(x1_im[9]), .Y(N14) );
  carry_select_adder2_WIDTH12_23 c0 ( .x(x0_re), .y({x1_re[11:2], n8, x1_re[0]}), .z({temp1[12:1], SYNOPSYS_UNCONNECTED__0}) );
  carry_select_adder2_WIDTH12_22 c1 ( .x(x0_im), .y({x1_im[11:2], n6, x1_im[0]}), .z({temp2[12:1], SYNOPSYS_UNCONNECTED__1}) );
  carry_select_adder2_WIDTH12_21 c2 ( .x(x0_re), .y(x1_re_neg), .z({
        temp3[12:1], SYNOPSYS_UNCONNECTED__2}) );
  carry_select_adder2_WIDTH12_20 c3 ( .x(x0_im), .y(x1_im_neg), .z({
        temp4[12:1], SYNOPSYS_UNCONNECTED__3}) );
  butterfly_WIDTH12_DW01_inc_1_DW01_inc_27 add_0_root_add_22_ni ( .A({N12, N13, 
        N14, N15, N16, N17, N18, N19, N20, N21, N22, N23}), .SUM(x1_im_neg) );
  butterfly_WIDTH12_DW01_inc_2 add_0_root_add_21_ni ( .A({N0, N1, N2, N3, N4, 
        N5, N6, N7, N8, N9, N10, N11}), .SUM(x1_re_neg) );
  DFFHQXL \sub_re_reg[10]  ( .D(temp3[10]), .CK(clk), .Q(y1_re[9]) );
  BUFX16 U6 ( .A(x1_re[1]), .Y(n8) );
  INVX8 U7 ( .A(x1_im[5]), .Y(N18) );
  CLKINVX8 U10 ( .A(x1_im[1]), .Y(n5) );
  INVX8 U12 ( .A(x1_re[1]), .Y(N10) );
endmodule


module sdfunit1_WIDTH12_DEPTH31_DW01_inc_0_DW01_inc_13 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module sdfunit1_WIDTH12_DEPTH31 ( clk, di_en, reset, x_re, x_im, y_re, y_im, 
        do_en );
  input [11:0] x_re;
  input [11:0] x_im;
  output [11:0] y_re;
  output [11:0] y_im;
  input clk, di_en, reset;
  output do_en;
  wire   sel, bf_nj, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13,
         N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41,
         N42, N43, N44, N45, N46, N47, N48, N50, N51, N52, N53, N54, N55, N56,
         N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70,
         N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84,
         N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62;
  wire   [11:0] bf_y1_re;
  wire   [11:0] dx_re;
  wire   [11:0] bf_y1_im;
  wire   [11:0] dx_im;
  wire   [11:0] dy_re;
  wire   [11:0] dy_im;
  wire   [11:0] bf_y0_re;
  wire   [11:0] bf_y0_im;
  wire   [11:0] mux2_im;
  wire   [11:0] dout_re;
  wire   [11:0] dout_im;

  INVX1 U3 ( .A(n1), .Y(N97) );
  AOI22X1 U4 ( .A0(n2), .A1(mux2_im[0]), .B0(bf_nj), .B1(N74), .Y(n1) );
  INVX1 U5 ( .A(n3), .Y(N96) );
  AOI22X1 U6 ( .A0(n2), .A1(mux2_im[1]), .B0(N75), .B1(bf_nj), .Y(n3) );
  INVX1 U7 ( .A(n4), .Y(N95) );
  AOI22X1 U8 ( .A0(n2), .A1(mux2_im[2]), .B0(N76), .B1(bf_nj), .Y(n4) );
  INVX1 U9 ( .A(n5), .Y(N94) );
  AOI22X1 U10 ( .A0(n2), .A1(mux2_im[3]), .B0(N77), .B1(bf_nj), .Y(n5) );
  INVX1 U11 ( .A(n6), .Y(N93) );
  AOI22X1 U12 ( .A0(n2), .A1(mux2_im[4]), .B0(N78), .B1(bf_nj), .Y(n6) );
  INVX1 U13 ( .A(n7), .Y(N92) );
  AOI22X1 U14 ( .A0(n2), .A1(mux2_im[5]), .B0(N79), .B1(bf_nj), .Y(n7) );
  INVX1 U15 ( .A(n8), .Y(N91) );
  AOI22X1 U16 ( .A0(n2), .A1(mux2_im[6]), .B0(N80), .B1(bf_nj), .Y(n8) );
  INVX1 U17 ( .A(n9), .Y(N90) );
  AOI22X1 U18 ( .A0(n2), .A1(mux2_im[7]), .B0(N81), .B1(bf_nj), .Y(n9) );
  INVX1 U19 ( .A(n10), .Y(N9) );
  AOI22X1 U20 ( .A0(sel), .A1(bf_y1_re[3]), .B0(x_re[3]), .B1(n11), .Y(n10) );
  INVX1 U21 ( .A(n12), .Y(N89) );
  AOI22X1 U22 ( .A0(n2), .A1(mux2_im[8]), .B0(N82), .B1(bf_nj), .Y(n12) );
  INVX1 U23 ( .A(n13), .Y(N88) );
  AOI22X1 U24 ( .A0(n2), .A1(mux2_im[9]), .B0(N83), .B1(bf_nj), .Y(n13) );
  INVX1 U25 ( .A(n14), .Y(N87) );
  AOI22X1 U26 ( .A0(n2), .A1(mux2_im[10]), .B0(N84), .B1(bf_nj), .Y(n14) );
  INVX1 U27 ( .A(n15), .Y(N86) );
  AOI22X1 U28 ( .A0(n2), .A1(mux2_im[11]), .B0(N85), .B1(bf_nj), .Y(n15) );
  INVX1 U29 ( .A(bf_nj), .Y(n2) );
  INVX1 U30 ( .A(n16), .Y(N8) );
  AOI22X1 U31 ( .A0(bf_y1_re[4]), .A1(sel), .B0(x_re[4]), .B1(n11), .Y(n16) );
  INVX1 U32 ( .A(n17), .Y(N7) );
  AOI22X1 U33 ( .A0(bf_y1_re[5]), .A1(sel), .B0(x_re[5]), .B1(n11), .Y(n17) );
  OAI2BB2X1 U34 ( .B0(bf_nj), .B1(N73), .A0N(bf_nj), .A1N(mux2_im[0]), .Y(N61)
         );
  OAI2BB2X1 U35 ( .B0(bf_nj), .B1(N72), .A0N(bf_nj), .A1N(mux2_im[1]), .Y(N60)
         );
  INVX1 U36 ( .A(n18), .Y(N6) );
  AOI22X1 U37 ( .A0(bf_y1_re[6]), .A1(sel), .B0(x_re[6]), .B1(n11), .Y(n18) );
  OAI2BB2X1 U38 ( .B0(bf_nj), .B1(N71), .A0N(bf_nj), .A1N(mux2_im[2]), .Y(N59)
         );
  OAI2BB2X1 U39 ( .B0(bf_nj), .B1(N70), .A0N(bf_nj), .A1N(mux2_im[3]), .Y(N58)
         );
  OAI2BB2X1 U40 ( .B0(bf_nj), .B1(N69), .A0N(bf_nj), .A1N(mux2_im[4]), .Y(N57)
         );
  OAI2BB2X1 U41 ( .B0(bf_nj), .B1(N68), .A0N(bf_nj), .A1N(mux2_im[5]), .Y(N56)
         );
  OAI2BB2X1 U42 ( .B0(bf_nj), .B1(N67), .A0N(bf_nj), .A1N(mux2_im[6]), .Y(N55)
         );
  OAI2BB2X1 U43 ( .B0(bf_nj), .B1(N66), .A0N(bf_nj), .A1N(mux2_im[7]), .Y(N54)
         );
  OAI2BB2X1 U44 ( .B0(bf_nj), .B1(N65), .A0N(bf_nj), .A1N(mux2_im[8]), .Y(N53)
         );
  OAI2BB2X1 U45 ( .B0(bf_nj), .B1(N64), .A0N(bf_nj), .A1N(mux2_im[9]), .Y(N52)
         );
  OAI2BB2X1 U46 ( .B0(bf_nj), .B1(N63), .A0N(bf_nj), .A1N(mux2_im[10]), .Y(N51) );
  OAI2BB2X1 U47 ( .B0(bf_nj), .B1(N62), .A0N(bf_nj), .A1N(mux2_im[11]), .Y(N50) );
  INVX1 U48 ( .A(n19), .Y(N5) );
  AOI22X1 U49 ( .A0(bf_y1_re[7]), .A1(sel), .B0(x_re[7]), .B1(n11), .Y(n19) );
  INVX1 U50 ( .A(n20), .Y(N48) );
  AOI22X1 U51 ( .A0(bf_y0_im[0]), .A1(sel), .B0(dy_im[0]), .B1(n11), .Y(n20)
         );
  INVX1 U52 ( .A(n21), .Y(N47) );
  AOI22X1 U53 ( .A0(bf_y0_im[1]), .A1(sel), .B0(dy_im[1]), .B1(n11), .Y(n21)
         );
  INVX1 U54 ( .A(n22), .Y(N46) );
  AOI22X1 U55 ( .A0(bf_y0_im[2]), .A1(sel), .B0(dy_im[2]), .B1(n11), .Y(n22)
         );
  INVX1 U56 ( .A(n23), .Y(N45) );
  AOI22X1 U57 ( .A0(bf_y0_im[3]), .A1(sel), .B0(dy_im[3]), .B1(n11), .Y(n23)
         );
  INVX1 U58 ( .A(n24), .Y(N44) );
  AOI22X1 U59 ( .A0(bf_y0_im[4]), .A1(sel), .B0(dy_im[4]), .B1(n11), .Y(n24)
         );
  INVX1 U60 ( .A(n25), .Y(N43) );
  AOI22X1 U61 ( .A0(bf_y0_im[5]), .A1(sel), .B0(dy_im[5]), .B1(n11), .Y(n25)
         );
  INVX1 U62 ( .A(n26), .Y(N42) );
  AOI22X1 U63 ( .A0(bf_y0_im[6]), .A1(sel), .B0(dy_im[6]), .B1(n11), .Y(n26)
         );
  INVX1 U64 ( .A(n27), .Y(N41) );
  AOI22X1 U65 ( .A0(bf_y0_im[7]), .A1(sel), .B0(dy_im[7]), .B1(n11), .Y(n27)
         );
  INVX1 U66 ( .A(n28), .Y(N40) );
  AOI22X1 U67 ( .A0(bf_y0_im[8]), .A1(sel), .B0(dy_im[8]), .B1(n11), .Y(n28)
         );
  INVX1 U68 ( .A(n29), .Y(N4) );
  AOI22X1 U69 ( .A0(bf_y1_re[8]), .A1(sel), .B0(x_re[8]), .B1(n11), .Y(n29) );
  INVX1 U70 ( .A(n30), .Y(N39) );
  AOI22X1 U71 ( .A0(bf_y0_im[9]), .A1(sel), .B0(dy_im[9]), .B1(n11), .Y(n30)
         );
  INVX1 U72 ( .A(n31), .Y(N38) );
  AOI22X1 U73 ( .A0(bf_y0_im[10]), .A1(sel), .B0(dy_im[10]), .B1(n11), .Y(n31)
         );
  INVX1 U74 ( .A(n32), .Y(N37) );
  AOI22X1 U75 ( .A0(bf_y0_im[11]), .A1(sel), .B0(dy_im[11]), .B1(n11), .Y(n32)
         );
  INVX1 U76 ( .A(n33), .Y(N36) );
  INVX1 U78 ( .A(n34), .Y(N35) );
  AOI22X1 U79 ( .A0(bf_y0_re[1]), .A1(sel), .B0(dy_re[1]), .B1(n11), .Y(n34)
         );
  INVX1 U80 ( .A(n35), .Y(N34) );
  AOI22X1 U81 ( .A0(bf_y0_re[2]), .A1(sel), .B0(dy_re[2]), .B1(n11), .Y(n35)
         );
  INVX1 U82 ( .A(n36), .Y(N33) );
  AOI22X1 U83 ( .A0(bf_y0_re[3]), .A1(sel), .B0(dy_re[3]), .B1(n11), .Y(n36)
         );
  INVX1 U84 ( .A(n37), .Y(N32) );
  AOI22X1 U85 ( .A0(bf_y0_re[4]), .A1(sel), .B0(dy_re[4]), .B1(n11), .Y(n37)
         );
  INVX1 U86 ( .A(n38), .Y(N31) );
  AOI22X1 U87 ( .A0(bf_y0_re[5]), .A1(sel), .B0(dy_re[5]), .B1(n11), .Y(n38)
         );
  INVX1 U88 ( .A(n39), .Y(N30) );
  AOI22X1 U89 ( .A0(bf_y0_re[6]), .A1(sel), .B0(dy_re[6]), .B1(n11), .Y(n39)
         );
  INVX1 U90 ( .A(n40), .Y(N3) );
  AOI22X1 U91 ( .A0(bf_y1_re[9]), .A1(sel), .B0(x_re[9]), .B1(n11), .Y(n40) );
  INVX1 U92 ( .A(n41), .Y(N29) );
  AOI22X1 U93 ( .A0(bf_y0_re[7]), .A1(sel), .B0(dy_re[7]), .B1(n11), .Y(n41)
         );
  INVX1 U94 ( .A(n42), .Y(N28) );
  AOI22X1 U95 ( .A0(bf_y0_re[8]), .A1(sel), .B0(dy_re[8]), .B1(n11), .Y(n42)
         );
  INVX1 U96 ( .A(n43), .Y(N27) );
  AOI22X1 U97 ( .A0(bf_y0_re[9]), .A1(sel), .B0(dy_re[9]), .B1(n11), .Y(n43)
         );
  INVX1 U98 ( .A(n44), .Y(N26) );
  AOI22X1 U99 ( .A0(bf_y0_re[10]), .A1(sel), .B0(dy_re[10]), .B1(n11), .Y(n44)
         );
  INVX1 U100 ( .A(n45), .Y(N25) );
  AOI22X1 U101 ( .A0(bf_y0_re[11]), .A1(sel), .B0(dy_re[11]), .B1(n11), .Y(n45) );
  INVX1 U102 ( .A(n46), .Y(N24) );
  AOI22X1 U103 ( .A0(bf_y1_im[0]), .A1(sel), .B0(x_im[0]), .B1(n11), .Y(n46)
         );
  INVX1 U104 ( .A(n47), .Y(N23) );
  AOI22X1 U105 ( .A0(bf_y1_im[1]), .A1(sel), .B0(x_im[1]), .B1(n11), .Y(n47)
         );
  INVX1 U106 ( .A(n48), .Y(N22) );
  AOI22X1 U107 ( .A0(bf_y1_im[2]), .A1(sel), .B0(x_im[2]), .B1(n11), .Y(n48)
         );
  INVX1 U108 ( .A(n49), .Y(N21) );
  AOI22X1 U109 ( .A0(bf_y1_im[3]), .A1(sel), .B0(x_im[3]), .B1(n11), .Y(n49)
         );
  INVX1 U110 ( .A(n50), .Y(N20) );
  AOI22X1 U111 ( .A0(bf_y1_im[4]), .A1(sel), .B0(x_im[4]), .B1(n11), .Y(n50)
         );
  INVX1 U112 ( .A(n51), .Y(N2) );
  AOI22X1 U113 ( .A0(bf_y1_re[10]), .A1(sel), .B0(x_re[10]), .B1(n11), .Y(n51)
         );
  INVX1 U114 ( .A(n52), .Y(N19) );
  AOI22X1 U115 ( .A0(bf_y1_im[5]), .A1(sel), .B0(x_im[5]), .B1(n11), .Y(n52)
         );
  INVX1 U116 ( .A(n53), .Y(N18) );
  AOI22X1 U117 ( .A0(bf_y1_im[6]), .A1(sel), .B0(x_im[6]), .B1(n11), .Y(n53)
         );
  INVX1 U118 ( .A(n54), .Y(N17) );
  AOI22X1 U119 ( .A0(bf_y1_im[7]), .A1(sel), .B0(x_im[7]), .B1(n11), .Y(n54)
         );
  INVX1 U120 ( .A(n55), .Y(N16) );
  AOI22X1 U121 ( .A0(bf_y1_im[8]), .A1(sel), .B0(x_im[8]), .B1(n11), .Y(n55)
         );
  INVX1 U122 ( .A(n56), .Y(N15) );
  AOI22X1 U123 ( .A0(bf_y1_im[9]), .A1(sel), .B0(x_im[9]), .B1(n11), .Y(n56)
         );
  INVX1 U124 ( .A(n57), .Y(N14) );
  AOI22X1 U125 ( .A0(bf_y1_im[10]), .A1(sel), .B0(x_im[10]), .B1(n11), .Y(n57)
         );
  INVX1 U126 ( .A(n58), .Y(N13) );
  AOI22X1 U127 ( .A0(bf_y1_im[11]), .A1(sel), .B0(x_im[11]), .B1(n11), .Y(n58)
         );
  INVX1 U128 ( .A(n59), .Y(N12) );
  AOI22X1 U129 ( .A0(bf_y1_re[0]), .A1(sel), .B0(x_re[0]), .B1(n11), .Y(n59)
         );
  INVX1 U130 ( .A(n60), .Y(N11) );
  AOI22X1 U131 ( .A0(bf_y1_re[1]), .A1(sel), .B0(x_re[1]), .B1(n11), .Y(n60)
         );
  INVX1 U132 ( .A(n61), .Y(N10) );
  AOI22X1 U133 ( .A0(bf_y1_re[2]), .A1(sel), .B0(x_re[2]), .B1(n11), .Y(n61)
         );
  INVX1 U134 ( .A(n62), .Y(N1) );
  AOI22X1 U135 ( .A0(bf_y1_re[11]), .A1(sel), .B0(x_re[11]), .B1(n11), .Y(n62)
         );
  DFFHQXL \dx_im_reg[0]  ( .D(N24), .CK(clk), .Q(dx_im[0]) );
  DFFHQXL \dx_im_reg[1]  ( .D(N23), .CK(clk), .Q(dx_im[1]) );
  DFFHQXL \dx_im_reg[2]  ( .D(N22), .CK(clk), .Q(dx_im[2]) );
  DFFHQXL \dx_im_reg[3]  ( .D(N21), .CK(clk), .Q(dx_im[3]) );
  DFFHQXL \dx_im_reg[4]  ( .D(N20), .CK(clk), .Q(dx_im[4]) );
  DFFHQXL \dx_im_reg[5]  ( .D(N19), .CK(clk), .Q(dx_im[5]) );
  DFFHQXL \dx_im_reg[6]  ( .D(N18), .CK(clk), .Q(dx_im[6]) );
  DFFHQXL \dx_im_reg[7]  ( .D(N17), .CK(clk), .Q(dx_im[7]) );
  DFFHQXL \dx_im_reg[8]  ( .D(N16), .CK(clk), .Q(dx_im[8]) );
  DFFHQXL \dx_im_reg[9]  ( .D(N15), .CK(clk), .Q(dx_im[9]) );
  DFFHQXL \dx_im_reg[10]  ( .D(N14), .CK(clk), .Q(dx_im[10]) );
  DFFHQXL \dx_im_reg[11]  ( .D(N13), .CK(clk), .Q(dx_im[11]) );
  DFFHQXL \dx_re_reg[0]  ( .D(N12), .CK(clk), .Q(dx_re[0]) );
  DFFHQXL \dx_re_reg[1]  ( .D(N11), .CK(clk), .Q(dx_re[1]) );
  DFFHQXL \dx_re_reg[2]  ( .D(N10), .CK(clk), .Q(dx_re[2]) );
  DFFHQXL \dx_re_reg[3]  ( .D(N9), .CK(clk), .Q(dx_re[3]) );
  DFFHQXL \dx_re_reg[4]  ( .D(N8), .CK(clk), .Q(dx_re[4]) );
  DFFHQXL \dx_re_reg[5]  ( .D(N7), .CK(clk), .Q(dx_re[5]) );
  DFFHQXL \dx_re_reg[6]  ( .D(N6), .CK(clk), .Q(dx_re[6]) );
  DFFHQXL \dx_re_reg[7]  ( .D(N5), .CK(clk), .Q(dx_re[7]) );
  DFFHQXL \dx_re_reg[8]  ( .D(N4), .CK(clk), .Q(dx_re[8]) );
  DFFHQXL \dx_re_reg[9]  ( .D(N3), .CK(clk), .Q(dx_re[9]) );
  DFFHQXL \dx_re_reg[10]  ( .D(N2), .CK(clk), .Q(dx_re[10]) );
  DFFHQXL \dx_re_reg[11]  ( .D(N1), .CK(clk), .Q(dx_re[11]) );
  DFFXL \mux2_re_reg[11]  ( .D(N25), .CK(clk), .QN(N62) );
  DFFXL \mux2_re_reg[10]  ( .D(N26), .CK(clk), .QN(N63) );
  DFFXL \mux2_re_reg[9]  ( .D(N27), .CK(clk), .QN(N64) );
  DFFXL \mux2_re_reg[8]  ( .D(N28), .CK(clk), .QN(N65) );
  DFFXL \mux2_re_reg[7]  ( .D(N29), .CK(clk), .QN(N66) );
  DFFXL \mux2_re_reg[6]  ( .D(N30), .CK(clk), .QN(N67) );
  DFFXL \mux2_re_reg[5]  ( .D(N31), .CK(clk), .QN(N68) );
  DFFXL \mux2_re_reg[4]  ( .D(N32), .CK(clk), .QN(N69) );
  DFFXL \mux2_re_reg[3]  ( .D(N33), .CK(clk), .QN(N70) );
  DFFXL \mux2_re_reg[2]  ( .D(N34), .CK(clk), .QN(N71) );
  DFFXL \mux2_re_reg[1]  ( .D(N35), .CK(clk), .QN(N72) );
  DFFXL \mux2_re_reg[0]  ( .D(N36), .CK(clk), .QN(N73) );
  DFFHQXL \mux2_im_reg[11]  ( .D(N37), .CK(clk), .Q(mux2_im[11]) );
  DFFHQXL \mux2_im_reg[10]  ( .D(N38), .CK(clk), .Q(mux2_im[10]) );
  DFFHQXL \mux2_im_reg[9]  ( .D(N39), .CK(clk), .Q(mux2_im[9]) );
  DFFHQXL \mux2_im_reg[8]  ( .D(N40), .CK(clk), .Q(mux2_im[8]) );
  DFFHQXL \mux2_im_reg[7]  ( .D(N41), .CK(clk), .Q(mux2_im[7]) );
  DFFHQXL \mux2_im_reg[6]  ( .D(N42), .CK(clk), .Q(mux2_im[6]) );
  DFFHQXL \mux2_im_reg[5]  ( .D(N43), .CK(clk), .Q(mux2_im[5]) );
  DFFHQXL \mux2_im_reg[4]  ( .D(N44), .CK(clk), .Q(mux2_im[4]) );
  DFFHQXL \mux2_im_reg[3]  ( .D(N45), .CK(clk), .Q(mux2_im[3]) );
  DFFHQXL \mux2_im_reg[2]  ( .D(N46), .CK(clk), .Q(mux2_im[2]) );
  DFFHQXL \mux2_im_reg[1]  ( .D(N47), .CK(clk), .Q(mux2_im[1]) );
  DFFHQXL \mux2_im_reg[0]  ( .D(N48), .CK(clk), .Q(mux2_im[0]) );
  DFFHQX1 \dout_re_reg[11]  ( .D(N50), .CK(clk), .Q(dout_re[11]) );
  DFFHQX1 \dout_re_reg[10]  ( .D(N51), .CK(clk), .Q(dout_re[10]) );
  DFFHQX1 \dout_re_reg[9]  ( .D(N52), .CK(clk), .Q(dout_re[9]) );
  DFFHQX1 \dout_re_reg[8]  ( .D(N53), .CK(clk), .Q(dout_re[8]) );
  DFFHQX1 \dout_re_reg[7]  ( .D(N54), .CK(clk), .Q(dout_re[7]) );
  DFFHQX1 \dout_re_reg[6]  ( .D(N55), .CK(clk), .Q(dout_re[6]) );
  DFFHQX1 \dout_re_reg[5]  ( .D(N56), .CK(clk), .Q(dout_re[5]) );
  DFFHQX1 \dout_re_reg[4]  ( .D(N57), .CK(clk), .Q(dout_re[4]) );
  DFFHQX1 \dout_re_reg[3]  ( .D(N58), .CK(clk), .Q(dout_re[3]) );
  DFFHQX1 \dout_re_reg[2]  ( .D(N59), .CK(clk), .Q(dout_re[2]) );
  DFFHQX1 \dout_re_reg[1]  ( .D(N60), .CK(clk), .Q(dout_re[1]) );
  DFFHQX1 \dout_re_reg[0]  ( .D(N61), .CK(clk), .Q(dout_re[0]) );
  DFFHQX1 \dout_im_reg[11]  ( .D(N86), .CK(clk), .Q(dout_im[11]) );
  DFFHQX1 \dout_im_reg[10]  ( .D(N87), .CK(clk), .Q(dout_im[10]) );
  DFFHQX1 \dout_im_reg[9]  ( .D(N88), .CK(clk), .Q(dout_im[9]) );
  DFFHQX1 \dout_im_reg[8]  ( .D(N89), .CK(clk), .Q(dout_im[8]) );
  DFFHQX1 \dout_im_reg[7]  ( .D(N90), .CK(clk), .Q(dout_im[7]) );
  DFFHQX1 \dout_im_reg[6]  ( .D(N91), .CK(clk), .Q(dout_im[6]) );
  DFFHQX1 \dout_im_reg[5]  ( .D(N92), .CK(clk), .Q(dout_im[5]) );
  DFFHQX1 \dout_im_reg[4]  ( .D(N93), .CK(clk), .Q(dout_im[4]) );
  DFFHQX1 \dout_im_reg[3]  ( .D(N94), .CK(clk), .Q(dout_im[3]) );
  DFFHQX1 \dout_im_reg[2]  ( .D(N95), .CK(clk), .Q(dout_im[2]) );
  DFFHQX1 \dout_im_reg[1]  ( .D(N96), .CK(clk), .Q(dout_im[1]) );
  DFFHQX1 \dout_im_reg[0]  ( .D(N97), .CK(clk), .Q(dout_im[0]) );
  DFFHQX1 \y_re_reg[11]  ( .D(dout_re[11]), .CK(clk), .Q(y_re[11]) );
  DFFHQX1 \y_re_reg[10]  ( .D(dout_re[10]), .CK(clk), .Q(y_re[10]) );
  DFFHQX1 \y_re_reg[9]  ( .D(dout_re[9]), .CK(clk), .Q(y_re[9]) );
  DFFHQX1 \y_re_reg[8]  ( .D(dout_re[8]), .CK(clk), .Q(y_re[8]) );
  DFFHQX1 \y_re_reg[7]  ( .D(dout_re[7]), .CK(clk), .Q(y_re[7]) );
  DFFHQX1 \y_re_reg[6]  ( .D(dout_re[6]), .CK(clk), .Q(y_re[6]) );
  DFFHQX1 \y_re_reg[5]  ( .D(dout_re[5]), .CK(clk), .Q(y_re[5]) );
  DFFHQX1 \y_re_reg[4]  ( .D(dout_re[4]), .CK(clk), .Q(y_re[4]) );
  DFFHQX1 \y_re_reg[3]  ( .D(dout_re[3]), .CK(clk), .Q(y_re[3]) );
  DFFHQX1 \y_re_reg[2]  ( .D(dout_re[2]), .CK(clk), .Q(y_re[2]) );
  DFFHQX1 \y_re_reg[1]  ( .D(dout_re[1]), .CK(clk), .Q(y_re[1]) );
  DFFHQX1 \y_re_reg[0]  ( .D(dout_re[0]), .CK(clk), .Q(y_re[0]) );
  DFFHQX1 \y_im_reg[11]  ( .D(dout_im[11]), .CK(clk), .Q(y_im[11]) );
  DFFHQX1 \y_im_reg[10]  ( .D(dout_im[10]), .CK(clk), .Q(y_im[10]) );
  DFFHQX1 \y_im_reg[9]  ( .D(dout_im[9]), .CK(clk), .Q(y_im[9]) );
  DFFHQX1 \y_im_reg[8]  ( .D(dout_im[8]), .CK(clk), .Q(y_im[8]) );
  DFFHQX1 \y_im_reg[7]  ( .D(dout_im[7]), .CK(clk), .Q(y_im[7]) );
  DFFHQX1 \y_im_reg[6]  ( .D(dout_im[6]), .CK(clk), .Q(y_im[6]) );
  DFFHQX1 \y_im_reg[5]  ( .D(dout_im[5]), .CK(clk), .Q(y_im[5]) );
  DFFHQX1 \y_im_reg[4]  ( .D(dout_im[4]), .CK(clk), .Q(y_im[4]) );
  DFFHQX1 \y_im_reg[3]  ( .D(dout_im[3]), .CK(clk), .Q(y_im[3]) );
  DFFHQX1 \y_im_reg[2]  ( .D(dout_im[2]), .CK(clk), .Q(y_im[2]) );
  DFFHQX1 \y_im_reg[1]  ( .D(dout_im[1]), .CK(clk), .Q(y_im[1]) );
  DFFHQX1 \y_im_reg[0]  ( .D(dout_im[0]), .CK(clk), .Q(y_im[0]) );
  AOI22XL U77 ( .A0(bf_y0_re[0]), .A1(sel), .B0(dy_re[0]), .B1(n11), .Y(n33)
         );
  CLKINVX3 U136 ( .A(sel), .Y(n11) );
  FSM f0 ( .clk(clk), .reset(reset), .sel(sel), .bf_nj(bf_nj), .do_en(do_en)
         );
  delaybuffer_WIDTH12_DEPTH31 d0 ( .clk(clk), .reset(reset), .x_re(dx_re), 
        .x_im(dx_im), .y_re(dy_re), .y_im(dy_im) );
  butterfly_WIDTH12 b0 ( .clk(clk), .x0_re(dy_re), .x0_im(dy_im), .x1_re(x_re), 
        .x1_im(x_im), .y0_re(bf_y0_re), .y0_im(bf_y0_im), .y1_re(bf_y1_re), 
        .y1_im(bf_y1_im) );
  sdfunit1_WIDTH12_DEPTH31_DW01_inc_0_DW01_inc_13 add_91 ( .A({N62, N63, N64, 
        N65, N66, N67, N68, N69, N70, N71, N72, N73}), .SUM({N85, N84, N83, 
        N82, N81, N80, N79, N78, N77, N76, N75, N74}) );
endmodule


module FSM2_DW01_inc_0_DW01_inc_12 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module FSM2 ( clk, reset, di_en, sel, do_en );
  input clk, reset, di_en;
  output sel, do_en;
  wire   N6, N7, N8, N9, N10, N11, N12, state1, next_state1, N28, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19;
  wire   [6:0] cnt;
  assign sel = state1;

  DFFRHQX4 state1_reg ( .D(next_state1), .CK(clk), .RN(n29), .Q(state1) );
  DFFRHQX1 \cnt_reg[0]  ( .D(n28), .CK(clk), .RN(n29), .Q(cnt[0]) );
  DFFRHQX1 \cnt_reg[1]  ( .D(n27), .CK(clk), .RN(n29), .Q(cnt[1]) );
  DFFRHQX1 \cnt_reg[2]  ( .D(n26), .CK(clk), .RN(n29), .Q(cnt[2]) );
  DFFRHQX1 \cnt_reg[3]  ( .D(n25), .CK(clk), .RN(n29), .Q(cnt[3]) );
  DFFRHQX1 \cnt_reg[4]  ( .D(n24), .CK(clk), .RN(n29), .Q(cnt[4]) );
  DFFRHQX1 \cnt_reg[5]  ( .D(n23), .CK(clk), .RN(n29), .Q(cnt[5]) );
  DFFRHQX1 \cnt_reg[6]  ( .D(n22), .CK(clk), .RN(n29), .Q(cnt[6]) );
  DFFRHQX2 do_en_r_reg ( .D(N28), .CK(clk), .RN(n29), .Q(do_en) );
  DFFNRX1 start_count_reg ( .D(n30), .CKN(clk), .RN(n29), .Q(n11) );
  OAI21XL U3 ( .A0(n1), .A1(n2), .B0(n3), .Y(next_state1) );
  OAI31X1 U4 ( .A0(n4), .A1(cnt[2]), .A2(n5), .B0(state1), .Y(n3) );
  XNOR2X1 U5 ( .A(cnt[5]), .B(cnt[6]), .Y(n5) );
  NAND3X1 U6 ( .A(n6), .B(n7), .C(cnt[4]), .Y(n2) );
  NAND3X1 U7 ( .A(n8), .B(n9), .C(n10), .Y(n1) );
  OR2X1 U8 ( .A(di_en), .B(n11), .Y(n30) );
  INVX1 U9 ( .A(reset), .Y(n29) );
  OAI2BB2X1 U10 ( .B0(n11), .B1(n6), .A0N(N6), .A1N(n12), .Y(n28) );
  OAI2BB2X1 U11 ( .B0(n11), .B1(n7), .A0N(N7), .A1N(n12), .Y(n27) );
  OAI2BB2X1 U12 ( .B0(n11), .B1(n10), .A0N(N8), .A1N(n12), .Y(n26) );
  OAI2BB2X1 U13 ( .B0(n11), .B1(n8), .A0N(N9), .A1N(n12), .Y(n25) );
  OAI2BB2X1 U14 ( .B0(n13), .B1(n11), .A0N(N10), .A1N(n12), .Y(n24) );
  OAI2BB2X1 U15 ( .B0(n14), .B1(n11), .A0N(N11), .A1N(n12), .Y(n23) );
  OAI2BB2X1 U16 ( .B0(n9), .B1(n11), .A0N(N12), .A1N(n12), .Y(n22) );
  AND2X1 U17 ( .A(n15), .B(n11), .Y(n12) );
  NAND4BXL U18 ( .AN(n4), .B(cnt[2]), .C(cnt[5]), .D(cnt[6]), .Y(n15) );
  NAND4X1 U19 ( .A(n6), .B(n7), .C(n8), .D(n13), .Y(n4) );
  INVX1 U20 ( .A(cnt[0]), .Y(n6) );
  MXI2X1 U21 ( .A(n16), .B(n17), .S0(n9), .Y(N28) );
  INVX1 U22 ( .A(cnt[6]), .Y(n9) );
  AOI21X1 U23 ( .A0(cnt[4]), .A1(n18), .B0(cnt[5]), .Y(n17) );
  OAI21XL U24 ( .A0(n10), .A1(n7), .B0(n8), .Y(n18) );
  INVX1 U25 ( .A(cnt[3]), .Y(n8) );
  INVX1 U26 ( .A(cnt[1]), .Y(n7) );
  INVX1 U27 ( .A(cnt[2]), .Y(n10) );
  OAI21XL U28 ( .A0(n19), .A1(n13), .B0(n14), .Y(n16) );
  INVX1 U29 ( .A(cnt[5]), .Y(n14) );
  INVX1 U30 ( .A(cnt[4]), .Y(n13) );
  AOI31X1 U31 ( .A0(cnt[0]), .A1(cnt[2]), .A2(cnt[1]), .B0(cnt[3]), .Y(n19) );
  FSM2_DW01_inc_0_DW01_inc_12 add_36 ( .A(cnt), .SUM({N12, N11, N10, N9, N8, 
        N7, N6}) );
endmodule


module delaybuffer_WIDTH12_DEPTH15 ( clk, reset, x_re, x_im, y_re, y_im );
  input [11:0] x_re;
  input [11:0] x_im;
  output [11:0] y_re;
  output [11:0] y_im;
  input clk, reset;
  wire   \buf_im[14][11] , \buf_im[14][10] , \buf_im[14][9] , \buf_im[14][8] ,
         \buf_im[14][7] , \buf_im[14][6] , \buf_im[14][5] , \buf_im[14][4] ,
         \buf_im[14][3] , \buf_im[14][2] , \buf_im[14][1] , \buf_im[14][0] ,
         \buf_im[13][11] , \buf_im[13][10] , \buf_im[13][9] , \buf_im[13][8] ,
         \buf_im[13][7] , \buf_im[13][6] , \buf_im[13][5] , \buf_im[13][4] ,
         \buf_im[13][3] , \buf_im[13][2] , \buf_im[13][1] , \buf_im[13][0] ,
         \buf_im[12][11] , \buf_im[12][10] , \buf_im[12][9] , \buf_im[12][8] ,
         \buf_im[12][7] , \buf_im[12][6] , \buf_im[12][5] , \buf_im[12][4] ,
         \buf_im[12][3] , \buf_im[12][2] , \buf_im[12][1] , \buf_im[12][0] ,
         \buf_im[11][11] , \buf_im[11][10] , \buf_im[11][9] , \buf_im[11][8] ,
         \buf_im[11][7] , \buf_im[11][6] , \buf_im[11][5] , \buf_im[11][4] ,
         \buf_im[11][3] , \buf_im[11][2] , \buf_im[11][1] , \buf_im[11][0] ,
         \buf_im[10][11] , \buf_im[10][10] , \buf_im[10][9] , \buf_im[10][8] ,
         \buf_im[10][7] , \buf_im[10][6] , \buf_im[10][5] , \buf_im[10][4] ,
         \buf_im[10][3] , \buf_im[10][2] , \buf_im[10][1] , \buf_im[10][0] ,
         \buf_im[9][11] , \buf_im[9][10] , \buf_im[9][9] , \buf_im[9][8] ,
         \buf_im[9][7] , \buf_im[9][6] , \buf_im[9][5] , \buf_im[9][4] ,
         \buf_im[9][3] , \buf_im[9][2] , \buf_im[9][1] , \buf_im[9][0] ,
         \buf_im[8][11] , \buf_im[8][10] , \buf_im[8][9] , \buf_im[8][8] ,
         \buf_im[8][7] , \buf_im[8][6] , \buf_im[8][5] , \buf_im[8][4] ,
         \buf_im[8][3] , \buf_im[8][2] , \buf_im[8][1] , \buf_im[8][0] ,
         \buf_im[7][11] , \buf_im[7][10] , \buf_im[7][9] , \buf_im[7][8] ,
         \buf_im[7][7] , \buf_im[7][6] , \buf_im[7][5] , \buf_im[7][4] ,
         \buf_im[7][3] , \buf_im[7][2] , \buf_im[7][1] , \buf_im[7][0] ,
         \buf_im[6][11] , \buf_im[6][10] , \buf_im[6][9] , \buf_im[6][8] ,
         \buf_im[6][7] , \buf_im[6][6] , \buf_im[6][5] , \buf_im[6][4] ,
         \buf_im[6][3] , \buf_im[6][2] , \buf_im[6][1] , \buf_im[6][0] ,
         \buf_im[5][11] , \buf_im[5][10] , \buf_im[5][9] , \buf_im[5][8] ,
         \buf_im[5][7] , \buf_im[5][6] , \buf_im[5][5] , \buf_im[5][4] ,
         \buf_im[5][3] , \buf_im[5][2] , \buf_im[5][1] , \buf_im[5][0] ,
         \buf_im[4][11] , \buf_im[4][10] , \buf_im[4][9] , \buf_im[4][8] ,
         \buf_im[4][7] , \buf_im[4][6] , \buf_im[4][5] , \buf_im[4][4] ,
         \buf_im[4][3] , \buf_im[4][2] , \buf_im[4][1] , \buf_im[4][0] ,
         \buf_im[3][11] , \buf_im[3][10] , \buf_im[3][9] , \buf_im[3][8] ,
         \buf_im[3][7] , \buf_im[3][6] , \buf_im[3][5] , \buf_im[3][4] ,
         \buf_im[3][3] , \buf_im[3][2] , \buf_im[3][1] , \buf_im[3][0] ,
         \buf_im[2][11] , \buf_im[2][10] , \buf_im[2][9] , \buf_im[2][8] ,
         \buf_im[2][7] , \buf_im[2][6] , \buf_im[2][5] , \buf_im[2][4] ,
         \buf_im[2][3] , \buf_im[2][2] , \buf_im[2][1] , \buf_im[2][0] ,
         \buf_im[1][11] , \buf_im[1][10] , \buf_im[1][9] , \buf_im[1][8] ,
         \buf_im[1][7] , \buf_im[1][6] , \buf_im[1][5] , \buf_im[1][4] ,
         \buf_im[1][3] , \buf_im[1][2] , \buf_im[1][1] , \buf_im[1][0] ,
         \buf_re[14][11] , \buf_re[14][10] , \buf_re[14][9] , \buf_re[14][8] ,
         \buf_re[14][7] , \buf_re[14][6] , \buf_re[14][5] , \buf_re[14][4] ,
         \buf_re[14][3] , \buf_re[14][2] , \buf_re[14][1] , \buf_re[14][0] ,
         \buf_re[13][11] , \buf_re[13][10] , \buf_re[13][9] , \buf_re[13][8] ,
         \buf_re[13][7] , \buf_re[13][6] , \buf_re[13][5] , \buf_re[13][4] ,
         \buf_re[13][3] , \buf_re[13][2] , \buf_re[13][1] , \buf_re[13][0] ,
         \buf_re[12][11] , \buf_re[12][10] , \buf_re[12][9] , \buf_re[12][8] ,
         \buf_re[12][7] , \buf_re[12][6] , \buf_re[12][5] , \buf_re[12][4] ,
         \buf_re[12][3] , \buf_re[12][2] , \buf_re[12][1] , \buf_re[12][0] ,
         \buf_re[11][11] , \buf_re[11][10] , \buf_re[11][9] , \buf_re[11][8] ,
         \buf_re[11][7] , \buf_re[11][6] , \buf_re[11][5] , \buf_re[11][4] ,
         \buf_re[11][3] , \buf_re[11][2] , \buf_re[11][1] , \buf_re[11][0] ,
         \buf_re[10][11] , \buf_re[10][10] , \buf_re[10][9] , \buf_re[10][8] ,
         \buf_re[10][7] , \buf_re[10][6] , \buf_re[10][5] , \buf_re[10][4] ,
         \buf_re[10][3] , \buf_re[10][2] , \buf_re[10][1] , \buf_re[10][0] ,
         \buf_re[9][11] , \buf_re[9][10] , \buf_re[9][9] , \buf_re[9][8] ,
         \buf_re[9][7] , \buf_re[9][6] , \buf_re[9][5] , \buf_re[9][4] ,
         \buf_re[9][3] , \buf_re[9][2] , \buf_re[9][1] , \buf_re[9][0] ,
         \buf_re[8][11] , \buf_re[8][10] , \buf_re[8][9] , \buf_re[8][8] ,
         \buf_re[8][7] , \buf_re[8][6] , \buf_re[8][5] , \buf_re[8][4] ,
         \buf_re[8][3] , \buf_re[8][2] , \buf_re[8][1] , \buf_re[8][0] ,
         \buf_re[7][11] , \buf_re[7][10] , \buf_re[7][9] , \buf_re[7][8] ,
         \buf_re[7][7] , \buf_re[7][6] , \buf_re[7][5] , \buf_re[7][4] ,
         \buf_re[7][3] , \buf_re[7][2] , \buf_re[7][1] , \buf_re[7][0] ,
         \buf_re[6][11] , \buf_re[6][10] , \buf_re[6][9] , \buf_re[6][8] ,
         \buf_re[6][7] , \buf_re[6][6] , \buf_re[6][5] , \buf_re[6][4] ,
         \buf_re[6][3] , \buf_re[6][2] , \buf_re[6][1] , \buf_re[6][0] ,
         \buf_re[5][11] , \buf_re[5][10] , \buf_re[5][9] , \buf_re[5][8] ,
         \buf_re[5][7] , \buf_re[5][6] , \buf_re[5][5] , \buf_re[5][4] ,
         \buf_re[5][3] , \buf_re[5][2] , \buf_re[5][1] , \buf_re[5][0] ,
         \buf_re[4][11] , \buf_re[4][10] , \buf_re[4][9] , \buf_re[4][8] ,
         \buf_re[4][7] , \buf_re[4][6] , \buf_re[4][5] , \buf_re[4][4] ,
         \buf_re[4][3] , \buf_re[4][2] , \buf_re[4][1] , \buf_re[4][0] ,
         \buf_re[3][11] , \buf_re[3][10] , \buf_re[3][9] , \buf_re[3][8] ,
         \buf_re[3][7] , \buf_re[3][6] , \buf_re[3][5] , \buf_re[3][4] ,
         \buf_re[3][3] , \buf_re[3][2] , \buf_re[3][1] , \buf_re[3][0] ,
         \buf_re[2][11] , \buf_re[2][10] , \buf_re[2][9] , \buf_re[2][8] ,
         \buf_re[2][7] , \buf_re[2][6] , \buf_re[2][5] , \buf_re[2][4] ,
         \buf_re[2][3] , \buf_re[2][2] , \buf_re[2][1] , \buf_re[2][0] ,
         \buf_re[1][11] , \buf_re[1][10] , \buf_re[1][9] , \buf_re[1][8] ,
         \buf_re[1][7] , \buf_re[1][6] , \buf_re[1][5] , \buf_re[1][4] ,
         \buf_re[1][3] , \buf_re[1][2] , \buf_re[1][1] , \buf_re[1][0] , n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25;

  DFFRHQX1 \buf_im_reg[1][11]  ( .D(x_im[11]), .CK(clk), .RN(n6), .Q(
        \buf_im[1][11] ) );
  DFFRHQX1 \buf_im_reg[2][11]  ( .D(\buf_im[1][11] ), .CK(clk), .RN(n18), .Q(
        \buf_im[2][11] ) );
  DFFRHQX1 \buf_im_reg[3][11]  ( .D(\buf_im[2][11] ), .CK(clk), .RN(n6), .Q(
        \buf_im[3][11] ) );
  DFFRHQX1 \buf_im_reg[4][11]  ( .D(\buf_im[3][11] ), .CK(clk), .RN(n18), .Q(
        \buf_im[4][11] ) );
  DFFRHQX1 \buf_im_reg[5][11]  ( .D(\buf_im[4][11] ), .CK(clk), .RN(n6), .Q(
        \buf_im[5][11] ) );
  DFFRHQX1 \buf_im_reg[6][11]  ( .D(\buf_im[5][11] ), .CK(clk), .RN(n18), .Q(
        \buf_im[6][11] ) );
  DFFRHQX1 \buf_im_reg[7][11]  ( .D(\buf_im[6][11] ), .CK(clk), .RN(n18), .Q(
        \buf_im[7][11] ) );
  DFFRHQX1 \buf_im_reg[8][11]  ( .D(\buf_im[7][11] ), .CK(clk), .RN(n18), .Q(
        \buf_im[8][11] ) );
  DFFRHQX1 \buf_im_reg[9][11]  ( .D(\buf_im[8][11] ), .CK(clk), .RN(n18), .Q(
        \buf_im[9][11] ) );
  DFFRHQX1 \buf_im_reg[10][11]  ( .D(\buf_im[9][11] ), .CK(clk), .RN(n18), .Q(
        \buf_im[10][11] ) );
  DFFRHQX1 \buf_im_reg[11][11]  ( .D(\buf_im[10][11] ), .CK(clk), .RN(n18), 
        .Q(\buf_im[11][11] ) );
  DFFRHQX1 \buf_im_reg[12][11]  ( .D(\buf_im[11][11] ), .CK(clk), .RN(n18), 
        .Q(\buf_im[12][11] ) );
  DFFRHQX1 \buf_im_reg[13][11]  ( .D(\buf_im[12][11] ), .CK(clk), .RN(n18), 
        .Q(\buf_im[13][11] ) );
  DFFRHQX1 \buf_im_reg[14][11]  ( .D(\buf_im[13][11] ), .CK(clk), .RN(n18), 
        .Q(\buf_im[14][11] ) );
  DFFRHQX1 \buf_im_reg[1][10]  ( .D(x_im[10]), .CK(clk), .RN(n19), .Q(
        \buf_im[1][10] ) );
  DFFRHQX1 \buf_im_reg[2][10]  ( .D(\buf_im[1][10] ), .CK(clk), .RN(n19), .Q(
        \buf_im[2][10] ) );
  DFFRHQX1 \buf_im_reg[3][10]  ( .D(\buf_im[2][10] ), .CK(clk), .RN(n19), .Q(
        \buf_im[3][10] ) );
  DFFRHQX1 \buf_im_reg[4][10]  ( .D(\buf_im[3][10] ), .CK(clk), .RN(n19), .Q(
        \buf_im[4][10] ) );
  DFFRHQX1 \buf_im_reg[5][10]  ( .D(\buf_im[4][10] ), .CK(clk), .RN(n19), .Q(
        \buf_im[5][10] ) );
  DFFRHQX1 \buf_im_reg[6][10]  ( .D(\buf_im[5][10] ), .CK(clk), .RN(n19), .Q(
        \buf_im[6][10] ) );
  DFFRHQX1 \buf_im_reg[7][10]  ( .D(\buf_im[6][10] ), .CK(clk), .RN(n18), .Q(
        \buf_im[7][10] ) );
  DFFRHQX1 \buf_im_reg[8][10]  ( .D(\buf_im[7][10] ), .CK(clk), .RN(n6), .Q(
        \buf_im[8][10] ) );
  DFFRHQX1 \buf_im_reg[9][10]  ( .D(\buf_im[8][10] ), .CK(clk), .RN(n18), .Q(
        \buf_im[9][10] ) );
  DFFRHQX1 \buf_im_reg[10][10]  ( .D(\buf_im[9][10] ), .CK(clk), .RN(n6), .Q(
        \buf_im[10][10] ) );
  DFFRHQX1 \buf_im_reg[11][10]  ( .D(\buf_im[10][10] ), .CK(clk), .RN(n18), 
        .Q(\buf_im[11][10] ) );
  DFFRHQX1 \buf_im_reg[12][10]  ( .D(\buf_im[11][10] ), .CK(clk), .RN(n6), .Q(
        \buf_im[12][10] ) );
  DFFRHQX1 \buf_im_reg[13][10]  ( .D(\buf_im[12][10] ), .CK(clk), .RN(n18), 
        .Q(\buf_im[13][10] ) );
  DFFRHQX1 \buf_im_reg[14][10]  ( .D(\buf_im[13][10] ), .CK(clk), .RN(n6), .Q(
        \buf_im[14][10] ) );
  DFFRHQX1 \buf_im_reg[1][9]  ( .D(x_im[9]), .CK(clk), .RN(n20), .Q(
        \buf_im[1][9] ) );
  DFFRHQX1 \buf_im_reg[2][9]  ( .D(\buf_im[1][9] ), .CK(clk), .RN(n20), .Q(
        \buf_im[2][9] ) );
  DFFRHQX1 \buf_im_reg[3][9]  ( .D(\buf_im[2][9] ), .CK(clk), .RN(n20), .Q(
        \buf_im[3][9] ) );
  DFFRHQX1 \buf_im_reg[4][9]  ( .D(\buf_im[3][9] ), .CK(clk), .RN(n20), .Q(
        \buf_im[4][9] ) );
  DFFRHQX1 \buf_im_reg[5][9]  ( .D(\buf_im[4][9] ), .CK(clk), .RN(n20), .Q(
        \buf_im[5][9] ) );
  DFFRHQX1 \buf_im_reg[6][9]  ( .D(\buf_im[5][9] ), .CK(clk), .RN(n20), .Q(
        \buf_im[6][9] ) );
  DFFRHQX1 \buf_im_reg[7][9]  ( .D(\buf_im[6][9] ), .CK(clk), .RN(n20), .Q(
        \buf_im[7][9] ) );
  DFFRHQX1 \buf_im_reg[8][9]  ( .D(\buf_im[7][9] ), .CK(clk), .RN(n19), .Q(
        \buf_im[8][9] ) );
  DFFRHQX1 \buf_im_reg[9][9]  ( .D(\buf_im[8][9] ), .CK(clk), .RN(n19), .Q(
        \buf_im[9][9] ) );
  DFFRHQX1 \buf_im_reg[10][9]  ( .D(\buf_im[9][9] ), .CK(clk), .RN(n19), .Q(
        \buf_im[10][9] ) );
  DFFRHQX1 \buf_im_reg[11][9]  ( .D(\buf_im[10][9] ), .CK(clk), .RN(n19), .Q(
        \buf_im[11][9] ) );
  DFFRHQX1 \buf_im_reg[12][9]  ( .D(\buf_im[11][9] ), .CK(clk), .RN(n19), .Q(
        \buf_im[12][9] ) );
  DFFRHQX1 \buf_im_reg[13][9]  ( .D(\buf_im[12][9] ), .CK(clk), .RN(n19), .Q(
        \buf_im[13][9] ) );
  DFFRHQX1 \buf_im_reg[14][9]  ( .D(\buf_im[13][9] ), .CK(clk), .RN(n19), .Q(
        \buf_im[14][9] ) );
  DFFRHQX1 \buf_im_reg[1][8]  ( .D(x_im[8]), .CK(clk), .RN(n23), .Q(
        \buf_im[1][8] ) );
  DFFRHQX1 \buf_im_reg[2][8]  ( .D(\buf_im[1][8] ), .CK(clk), .RN(n23), .Q(
        \buf_im[2][8] ) );
  DFFRHQX1 \buf_im_reg[3][8]  ( .D(\buf_im[2][8] ), .CK(clk), .RN(n23), .Q(
        \buf_im[3][8] ) );
  DFFRHQX1 \buf_im_reg[4][8]  ( .D(\buf_im[3][8] ), .CK(clk), .RN(n23), .Q(
        \buf_im[4][8] ) );
  DFFRHQX1 \buf_im_reg[5][8]  ( .D(\buf_im[4][8] ), .CK(clk), .RN(n23), .Q(
        \buf_im[5][8] ) );
  DFFRHQX1 \buf_im_reg[6][8]  ( .D(\buf_im[5][8] ), .CK(clk), .RN(n23), .Q(
        \buf_im[6][8] ) );
  DFFRHQX1 \buf_im_reg[7][8]  ( .D(\buf_im[6][8] ), .CK(clk), .RN(n23), .Q(
        \buf_im[7][8] ) );
  DFFRHQX1 \buf_im_reg[8][8]  ( .D(\buf_im[7][8] ), .CK(clk), .RN(n23), .Q(
        \buf_im[8][8] ) );
  DFFRHQX1 \buf_im_reg[9][8]  ( .D(\buf_im[8][8] ), .CK(clk), .RN(n23), .Q(
        \buf_im[9][8] ) );
  DFFRHQX1 \buf_im_reg[10][8]  ( .D(\buf_im[9][8] ), .CK(clk), .RN(n23), .Q(
        \buf_im[10][8] ) );
  DFFRHQX1 \buf_im_reg[11][8]  ( .D(\buf_im[10][8] ), .CK(clk), .RN(n22), .Q(
        \buf_im[11][8] ) );
  DFFRHQX1 \buf_im_reg[12][8]  ( .D(\buf_im[11][8] ), .CK(clk), .RN(n22), .Q(
        \buf_im[12][8] ) );
  DFFRHQX1 \buf_im_reg[13][8]  ( .D(\buf_im[12][8] ), .CK(clk), .RN(n22), .Q(
        \buf_im[13][8] ) );
  DFFRHQX1 \buf_im_reg[14][8]  ( .D(\buf_im[13][8] ), .CK(clk), .RN(n22), .Q(
        \buf_im[14][8] ) );
  DFFRHQX1 \buf_im_reg[1][7]  ( .D(x_im[7]), .CK(clk), .RN(n22), .Q(
        \buf_im[1][7] ) );
  DFFRHQX1 \buf_im_reg[2][7]  ( .D(\buf_im[1][7] ), .CK(clk), .RN(n22), .Q(
        \buf_im[2][7] ) );
  DFFRHQX1 \buf_im_reg[3][7]  ( .D(\buf_im[2][7] ), .CK(clk), .RN(n22), .Q(
        \buf_im[3][7] ) );
  DFFRHQX1 \buf_im_reg[4][7]  ( .D(\buf_im[3][7] ), .CK(clk), .RN(n22), .Q(
        \buf_im[4][7] ) );
  DFFRHQX1 \buf_im_reg[5][7]  ( .D(\buf_im[4][7] ), .CK(clk), .RN(n22), .Q(
        \buf_im[5][7] ) );
  DFFRHQX1 \buf_im_reg[6][7]  ( .D(\buf_im[5][7] ), .CK(clk), .RN(n22), .Q(
        \buf_im[6][7] ) );
  DFFRHQX1 \buf_im_reg[7][7]  ( .D(\buf_im[6][7] ), .CK(clk), .RN(n22), .Q(
        \buf_im[7][7] ) );
  DFFRHQX1 \buf_im_reg[8][7]  ( .D(\buf_im[7][7] ), .CK(clk), .RN(n22), .Q(
        \buf_im[8][7] ) );
  DFFRHQX1 \buf_im_reg[9][7]  ( .D(\buf_im[8][7] ), .CK(clk), .RN(n22), .Q(
        \buf_im[9][7] ) );
  DFFRHQX1 \buf_im_reg[10][7]  ( .D(\buf_im[9][7] ), .CK(clk), .RN(n21), .Q(
        \buf_im[10][7] ) );
  DFFRHQX1 \buf_im_reg[11][7]  ( .D(\buf_im[10][7] ), .CK(clk), .RN(n21), .Q(
        \buf_im[11][7] ) );
  DFFRHQX1 \buf_im_reg[12][7]  ( .D(\buf_im[11][7] ), .CK(clk), .RN(n21), .Q(
        \buf_im[12][7] ) );
  DFFRHQX1 \buf_im_reg[13][7]  ( .D(\buf_im[12][7] ), .CK(clk), .RN(n21), .Q(
        \buf_im[13][7] ) );
  DFFRHQX1 \buf_im_reg[14][7]  ( .D(\buf_im[13][7] ), .CK(clk), .RN(n21), .Q(
        \buf_im[14][7] ) );
  DFFRHQX1 \buf_im_reg[1][6]  ( .D(x_im[6]), .CK(clk), .RN(n21), .Q(
        \buf_im[1][6] ) );
  DFFRHQX1 \buf_im_reg[2][6]  ( .D(\buf_im[1][6] ), .CK(clk), .RN(n21), .Q(
        \buf_im[2][6] ) );
  DFFRHQX1 \buf_im_reg[3][6]  ( .D(\buf_im[2][6] ), .CK(clk), .RN(n21), .Q(
        \buf_im[3][6] ) );
  DFFRHQX1 \buf_im_reg[4][6]  ( .D(\buf_im[3][6] ), .CK(clk), .RN(n21), .Q(
        \buf_im[4][6] ) );
  DFFRHQX1 \buf_im_reg[5][6]  ( .D(\buf_im[4][6] ), .CK(clk), .RN(n21), .Q(
        \buf_im[5][6] ) );
  DFFRHQX1 \buf_im_reg[6][6]  ( .D(\buf_im[5][6] ), .CK(clk), .RN(n21), .Q(
        \buf_im[6][6] ) );
  DFFRHQX1 \buf_im_reg[7][6]  ( .D(\buf_im[6][6] ), .CK(clk), .RN(n21), .Q(
        \buf_im[7][6] ) );
  DFFRHQX1 \buf_im_reg[8][6]  ( .D(\buf_im[7][6] ), .CK(clk), .RN(n21), .Q(
        \buf_im[8][6] ) );
  DFFRHQX1 \buf_im_reg[9][6]  ( .D(\buf_im[8][6] ), .CK(clk), .RN(n20), .Q(
        \buf_im[9][6] ) );
  DFFRHQX1 \buf_im_reg[10][6]  ( .D(\buf_im[9][6] ), .CK(clk), .RN(n20), .Q(
        \buf_im[10][6] ) );
  DFFRHQX1 \buf_im_reg[11][6]  ( .D(\buf_im[10][6] ), .CK(clk), .RN(n20), .Q(
        \buf_im[11][6] ) );
  DFFRHQX1 \buf_im_reg[12][6]  ( .D(\buf_im[11][6] ), .CK(clk), .RN(n20), .Q(
        \buf_im[12][6] ) );
  DFFRHQX1 \buf_im_reg[13][6]  ( .D(\buf_im[12][6] ), .CK(clk), .RN(n20), .Q(
        \buf_im[13][6] ) );
  DFFRHQX1 \buf_im_reg[14][6]  ( .D(\buf_im[13][6] ), .CK(clk), .RN(n20), .Q(
        \buf_im[14][6] ) );
  DFFRHQX1 \buf_im_reg[1][5]  ( .D(x_im[5]), .CK(clk), .RN(n18), .Q(
        \buf_im[1][5] ) );
  DFFRHQX1 \buf_im_reg[2][5]  ( .D(\buf_im[1][5] ), .CK(clk), .RN(n18), .Q(
        \buf_im[2][5] ) );
  DFFRHQX1 \buf_im_reg[3][5]  ( .D(\buf_im[2][5] ), .CK(clk), .RN(n18), .Q(
        \buf_im[3][5] ) );
  DFFRHQX1 \buf_im_reg[4][5]  ( .D(\buf_im[3][5] ), .CK(clk), .RN(n18), .Q(
        \buf_im[4][5] ) );
  DFFRHQX1 \buf_im_reg[5][5]  ( .D(\buf_im[4][5] ), .CK(clk), .RN(n18), .Q(
        \buf_im[5][5] ) );
  DFFRHQX1 \buf_im_reg[6][5]  ( .D(\buf_im[5][5] ), .CK(clk), .RN(n6), .Q(
        \buf_im[6][5] ) );
  DFFRHQX1 \buf_im_reg[7][5]  ( .D(\buf_im[6][5] ), .CK(clk), .RN(n2), .Q(
        \buf_im[7][5] ) );
  DFFRHQX1 \buf_im_reg[8][5]  ( .D(\buf_im[7][5] ), .CK(clk), .RN(n18), .Q(
        \buf_im[8][5] ) );
  DFFRHQX1 \buf_im_reg[9][5]  ( .D(\buf_im[8][5] ), .CK(clk), .RN(n6), .Q(
        \buf_im[9][5] ) );
  DFFRHQX1 \buf_im_reg[10][5]  ( .D(\buf_im[9][5] ), .CK(clk), .RN(n2), .Q(
        \buf_im[10][5] ) );
  DFFRHQX1 \buf_im_reg[11][5]  ( .D(\buf_im[10][5] ), .CK(clk), .RN(n18), .Q(
        \buf_im[11][5] ) );
  DFFRHQX1 \buf_im_reg[12][5]  ( .D(\buf_im[11][5] ), .CK(clk), .RN(n2), .Q(
        \buf_im[12][5] ) );
  DFFRHQX1 \buf_im_reg[13][5]  ( .D(\buf_im[12][5] ), .CK(clk), .RN(n2), .Q(
        \buf_im[13][5] ) );
  DFFRHQX1 \buf_im_reg[14][5]  ( .D(\buf_im[13][5] ), .CK(clk), .RN(n2), .Q(
        \buf_im[14][5] ) );
  DFFRHQX1 \buf_im_reg[1][4]  ( .D(x_im[4]), .CK(clk), .RN(n2), .Q(
        \buf_im[1][4] ) );
  DFFRHQX1 \buf_im_reg[2][4]  ( .D(\buf_im[1][4] ), .CK(clk), .RN(n2), .Q(
        \buf_im[2][4] ) );
  DFFRHQX1 \buf_im_reg[3][4]  ( .D(\buf_im[2][4] ), .CK(clk), .RN(n2), .Q(
        \buf_im[3][4] ) );
  DFFRHQX1 \buf_im_reg[4][4]  ( .D(\buf_im[3][4] ), .CK(clk), .RN(n17), .Q(
        \buf_im[4][4] ) );
  DFFRHQX1 \buf_im_reg[5][4]  ( .D(\buf_im[4][4] ), .CK(clk), .RN(n17), .Q(
        \buf_im[5][4] ) );
  DFFRHQX1 \buf_im_reg[6][4]  ( .D(\buf_im[5][4] ), .CK(clk), .RN(n17), .Q(
        \buf_im[6][4] ) );
  DFFRHQX1 \buf_im_reg[7][4]  ( .D(\buf_im[6][4] ), .CK(clk), .RN(n17), .Q(
        \buf_im[7][4] ) );
  DFFRHQX1 \buf_im_reg[8][4]  ( .D(\buf_im[7][4] ), .CK(clk), .RN(n17), .Q(
        \buf_im[8][4] ) );
  DFFRHQX1 \buf_im_reg[9][4]  ( .D(\buf_im[8][4] ), .CK(clk), .RN(n17), .Q(
        \buf_im[9][4] ) );
  DFFRHQX1 \buf_im_reg[10][4]  ( .D(\buf_im[9][4] ), .CK(clk), .RN(n17), .Q(
        \buf_im[10][4] ) );
  DFFRHQX1 \buf_im_reg[11][4]  ( .D(\buf_im[10][4] ), .CK(clk), .RN(n17), .Q(
        \buf_im[11][4] ) );
  DFFRHQX1 \buf_im_reg[12][4]  ( .D(\buf_im[11][4] ), .CK(clk), .RN(n17), .Q(
        \buf_im[12][4] ) );
  DFFRHQX1 \buf_im_reg[13][4]  ( .D(\buf_im[12][4] ), .CK(clk), .RN(n17), .Q(
        \buf_im[13][4] ) );
  DFFRHQX1 \buf_im_reg[14][4]  ( .D(\buf_im[13][4] ), .CK(clk), .RN(n17), .Q(
        \buf_im[14][4] ) );
  DFFRHQX1 \buf_im_reg[1][3]  ( .D(x_im[3]), .CK(clk), .RN(n17), .Q(
        \buf_im[1][3] ) );
  DFFRHQX1 \buf_im_reg[2][3]  ( .D(\buf_im[1][3] ), .CK(clk), .RN(n17), .Q(
        \buf_im[2][3] ) );
  DFFRHQX1 \buf_im_reg[3][3]  ( .D(\buf_im[2][3] ), .CK(clk), .RN(n16), .Q(
        \buf_im[3][3] ) );
  DFFRHQX1 \buf_im_reg[4][3]  ( .D(\buf_im[3][3] ), .CK(clk), .RN(n16), .Q(
        \buf_im[4][3] ) );
  DFFRHQX1 \buf_im_reg[5][3]  ( .D(\buf_im[4][3] ), .CK(clk), .RN(n16), .Q(
        \buf_im[5][3] ) );
  DFFRHQX1 \buf_im_reg[6][3]  ( .D(\buf_im[5][3] ), .CK(clk), .RN(n16), .Q(
        \buf_im[6][3] ) );
  DFFRHQX1 \buf_im_reg[7][3]  ( .D(\buf_im[6][3] ), .CK(clk), .RN(n16), .Q(
        \buf_im[7][3] ) );
  DFFRHQX1 \buf_im_reg[8][3]  ( .D(\buf_im[7][3] ), .CK(clk), .RN(n16), .Q(
        \buf_im[8][3] ) );
  DFFRHQX1 \buf_im_reg[9][3]  ( .D(\buf_im[8][3] ), .CK(clk), .RN(n16), .Q(
        \buf_im[9][3] ) );
  DFFRHQX1 \buf_im_reg[10][3]  ( .D(\buf_im[9][3] ), .CK(clk), .RN(n16), .Q(
        \buf_im[10][3] ) );
  DFFRHQX1 \buf_im_reg[11][3]  ( .D(\buf_im[10][3] ), .CK(clk), .RN(n16), .Q(
        \buf_im[11][3] ) );
  DFFRHQX1 \buf_im_reg[12][3]  ( .D(\buf_im[11][3] ), .CK(clk), .RN(n16), .Q(
        \buf_im[12][3] ) );
  DFFRHQX1 \buf_im_reg[13][3]  ( .D(\buf_im[12][3] ), .CK(clk), .RN(n16), .Q(
        \buf_im[13][3] ) );
  DFFRHQX1 \buf_im_reg[14][3]  ( .D(\buf_im[13][3] ), .CK(clk), .RN(n16), .Q(
        \buf_im[14][3] ) );
  DFFRHQX1 \buf_im_reg[1][2]  ( .D(x_im[2]), .CK(clk), .RN(n16), .Q(
        \buf_im[1][2] ) );
  DFFRHQX1 \buf_im_reg[2][2]  ( .D(\buf_im[1][2] ), .CK(clk), .RN(n15), .Q(
        \buf_im[2][2] ) );
  DFFRHQX1 \buf_im_reg[3][2]  ( .D(\buf_im[2][2] ), .CK(clk), .RN(n15), .Q(
        \buf_im[3][2] ) );
  DFFRHQX1 \buf_im_reg[4][2]  ( .D(\buf_im[3][2] ), .CK(clk), .RN(n15), .Q(
        \buf_im[4][2] ) );
  DFFRHQX1 \buf_im_reg[5][2]  ( .D(\buf_im[4][2] ), .CK(clk), .RN(n15), .Q(
        \buf_im[5][2] ) );
  DFFRHQX1 \buf_im_reg[6][2]  ( .D(\buf_im[5][2] ), .CK(clk), .RN(n15), .Q(
        \buf_im[6][2] ) );
  DFFRHQX1 \buf_im_reg[7][2]  ( .D(\buf_im[6][2] ), .CK(clk), .RN(n15), .Q(
        \buf_im[7][2] ) );
  DFFRHQX1 \buf_im_reg[8][2]  ( .D(\buf_im[7][2] ), .CK(clk), .RN(n15), .Q(
        \buf_im[8][2] ) );
  DFFRHQX1 \buf_im_reg[9][2]  ( .D(\buf_im[8][2] ), .CK(clk), .RN(n15), .Q(
        \buf_im[9][2] ) );
  DFFRHQX1 \buf_im_reg[10][2]  ( .D(\buf_im[9][2] ), .CK(clk), .RN(n15), .Q(
        \buf_im[10][2] ) );
  DFFRHQX1 \buf_im_reg[11][2]  ( .D(\buf_im[10][2] ), .CK(clk), .RN(n15), .Q(
        \buf_im[11][2] ) );
  DFFRHQX1 \buf_im_reg[12][2]  ( .D(\buf_im[11][2] ), .CK(clk), .RN(n15), .Q(
        \buf_im[12][2] ) );
  DFFRHQX1 \buf_im_reg[13][2]  ( .D(\buf_im[12][2] ), .CK(clk), .RN(n15), .Q(
        \buf_im[13][2] ) );
  DFFRHQX1 \buf_im_reg[14][2]  ( .D(\buf_im[13][2] ), .CK(clk), .RN(n15), .Q(
        \buf_im[14][2] ) );
  DFFRHQX1 \buf_im_reg[1][1]  ( .D(x_im[1]), .CK(clk), .RN(n14), .Q(
        \buf_im[1][1] ) );
  DFFRHQX1 \buf_im_reg[2][1]  ( .D(\buf_im[1][1] ), .CK(clk), .RN(n14), .Q(
        \buf_im[2][1] ) );
  DFFRHQX1 \buf_im_reg[3][1]  ( .D(\buf_im[2][1] ), .CK(clk), .RN(n14), .Q(
        \buf_im[3][1] ) );
  DFFRHQX1 \buf_im_reg[4][1]  ( .D(\buf_im[3][1] ), .CK(clk), .RN(n14), .Q(
        \buf_im[4][1] ) );
  DFFRHQX1 \buf_im_reg[5][1]  ( .D(\buf_im[4][1] ), .CK(clk), .RN(n14), .Q(
        \buf_im[5][1] ) );
  DFFRHQX1 \buf_im_reg[6][1]  ( .D(\buf_im[5][1] ), .CK(clk), .RN(n14), .Q(
        \buf_im[6][1] ) );
  DFFRHQX1 \buf_im_reg[7][1]  ( .D(\buf_im[6][1] ), .CK(clk), .RN(n14), .Q(
        \buf_im[7][1] ) );
  DFFRHQX1 \buf_im_reg[8][1]  ( .D(\buf_im[7][1] ), .CK(clk), .RN(n14), .Q(
        \buf_im[8][1] ) );
  DFFRHQX1 \buf_im_reg[9][1]  ( .D(\buf_im[8][1] ), .CK(clk), .RN(n14), .Q(
        \buf_im[9][1] ) );
  DFFRHQX1 \buf_im_reg[10][1]  ( .D(\buf_im[9][1] ), .CK(clk), .RN(n14), .Q(
        \buf_im[10][1] ) );
  DFFRHQX1 \buf_im_reg[11][1]  ( .D(\buf_im[10][1] ), .CK(clk), .RN(n14), .Q(
        \buf_im[11][1] ) );
  DFFRHQX1 \buf_im_reg[12][1]  ( .D(\buf_im[11][1] ), .CK(clk), .RN(n14), .Q(
        \buf_im[12][1] ) );
  DFFRHQX1 \buf_im_reg[13][1]  ( .D(\buf_im[12][1] ), .CK(clk), .RN(n14), .Q(
        \buf_im[13][1] ) );
  DFFRHQX1 \buf_im_reg[14][1]  ( .D(\buf_im[13][1] ), .CK(clk), .RN(n13), .Q(
        \buf_im[14][1] ) );
  DFFRHQX1 \buf_im_reg[1][0]  ( .D(x_im[0]), .CK(clk), .RN(n24), .Q(
        \buf_im[1][0] ) );
  DFFRHQX1 \buf_im_reg[2][0]  ( .D(\buf_im[1][0] ), .CK(clk), .RN(n24), .Q(
        \buf_im[2][0] ) );
  DFFRHQX1 \buf_im_reg[3][0]  ( .D(\buf_im[2][0] ), .CK(clk), .RN(n24), .Q(
        \buf_im[3][0] ) );
  DFFRHQX1 \buf_im_reg[4][0]  ( .D(\buf_im[3][0] ), .CK(clk), .RN(n24), .Q(
        \buf_im[4][0] ) );
  DFFRHQX1 \buf_im_reg[5][0]  ( .D(\buf_im[4][0] ), .CK(clk), .RN(n24), .Q(
        \buf_im[5][0] ) );
  DFFRHQX1 \buf_im_reg[6][0]  ( .D(\buf_im[5][0] ), .CK(clk), .RN(n24), .Q(
        \buf_im[6][0] ) );
  DFFRHQX1 \buf_im_reg[7][0]  ( .D(\buf_im[6][0] ), .CK(clk), .RN(n24), .Q(
        \buf_im[7][0] ) );
  DFFRHQX1 \buf_im_reg[8][0]  ( .D(\buf_im[7][0] ), .CK(clk), .RN(n24), .Q(
        \buf_im[8][0] ) );
  DFFRHQX1 \buf_im_reg[9][0]  ( .D(\buf_im[8][0] ), .CK(clk), .RN(n24), .Q(
        \buf_im[9][0] ) );
  DFFRHQX1 \buf_im_reg[10][0]  ( .D(\buf_im[9][0] ), .CK(clk), .RN(n24), .Q(
        \buf_im[10][0] ) );
  DFFRHQX1 \buf_im_reg[11][0]  ( .D(\buf_im[10][0] ), .CK(clk), .RN(n24), .Q(
        \buf_im[11][0] ) );
  DFFRHQX1 \buf_im_reg[12][0]  ( .D(\buf_im[11][0] ), .CK(clk), .RN(n23), .Q(
        \buf_im[12][0] ) );
  DFFRHQX1 \buf_im_reg[13][0]  ( .D(\buf_im[12][0] ), .CK(clk), .RN(n23), .Q(
        \buf_im[13][0] ) );
  DFFRHQX1 \buf_im_reg[14][0]  ( .D(\buf_im[13][0] ), .CK(clk), .RN(n23), .Q(
        \buf_im[14][0] ) );
  DFFRHQX1 \buf_re_reg[1][11]  ( .D(x_re[11]), .CK(clk), .RN(n7), .Q(
        \buf_re[1][11] ) );
  DFFRHQX1 \buf_re_reg[2][11]  ( .D(\buf_re[1][11] ), .CK(clk), .RN(n7), .Q(
        \buf_re[2][11] ) );
  DFFRHQX1 \buf_re_reg[3][11]  ( .D(\buf_re[2][11] ), .CK(clk), .RN(n7), .Q(
        \buf_re[3][11] ) );
  DFFRHQX1 \buf_re_reg[4][11]  ( .D(\buf_re[3][11] ), .CK(clk), .RN(n7), .Q(
        \buf_re[4][11] ) );
  DFFRHQX1 \buf_re_reg[5][11]  ( .D(\buf_re[4][11] ), .CK(clk), .RN(n7), .Q(
        \buf_re[5][11] ) );
  DFFRHQX1 \buf_re_reg[6][11]  ( .D(\buf_re[5][11] ), .CK(clk), .RN(n7), .Q(
        \buf_re[6][11] ) );
  DFFRHQX1 \buf_re_reg[7][11]  ( .D(\buf_re[6][11] ), .CK(clk), .RN(n6), .Q(
        \buf_re[7][11] ) );
  DFFRHQX1 \buf_re_reg[8][11]  ( .D(\buf_re[7][11] ), .CK(clk), .RN(n6), .Q(
        \buf_re[8][11] ) );
  DFFRHQX1 \buf_re_reg[9][11]  ( .D(\buf_re[8][11] ), .CK(clk), .RN(n6), .Q(
        \buf_re[9][11] ) );
  DFFRHQX1 \buf_re_reg[10][11]  ( .D(\buf_re[9][11] ), .CK(clk), .RN(n6), .Q(
        \buf_re[10][11] ) );
  DFFRHQX1 \buf_re_reg[11][11]  ( .D(\buf_re[10][11] ), .CK(clk), .RN(n6), .Q(
        \buf_re[11][11] ) );
  DFFRHQX1 \buf_re_reg[12][11]  ( .D(\buf_re[11][11] ), .CK(clk), .RN(n6), .Q(
        \buf_re[12][11] ) );
  DFFRHQX1 \buf_re_reg[13][11]  ( .D(\buf_re[12][11] ), .CK(clk), .RN(n6), .Q(
        \buf_re[13][11] ) );
  DFFRHQX1 \buf_re_reg[14][11]  ( .D(\buf_re[13][11] ), .CK(clk), .RN(n6), .Q(
        \buf_re[14][11] ) );
  DFFRHQX1 \buf_re_reg[1][10]  ( .D(x_re[10]), .CK(clk), .RN(n8), .Q(
        \buf_re[1][10] ) );
  DFFRHQX1 \buf_re_reg[2][10]  ( .D(\buf_re[1][10] ), .CK(clk), .RN(n8), .Q(
        \buf_re[2][10] ) );
  DFFRHQX1 \buf_re_reg[3][10]  ( .D(\buf_re[2][10] ), .CK(clk), .RN(n8), .Q(
        \buf_re[3][10] ) );
  DFFRHQX1 \buf_re_reg[4][10]  ( .D(\buf_re[3][10] ), .CK(clk), .RN(n8), .Q(
        \buf_re[4][10] ) );
  DFFRHQX1 \buf_re_reg[5][10]  ( .D(\buf_re[4][10] ), .CK(clk), .RN(n8), .Q(
        \buf_re[5][10] ) );
  DFFRHQX1 \buf_re_reg[6][10]  ( .D(\buf_re[5][10] ), .CK(clk), .RN(n8), .Q(
        \buf_re[6][10] ) );
  DFFRHQX1 \buf_re_reg[7][10]  ( .D(\buf_re[6][10] ), .CK(clk), .RN(n8), .Q(
        \buf_re[7][10] ) );
  DFFRHQX1 \buf_re_reg[8][10]  ( .D(\buf_re[7][10] ), .CK(clk), .RN(n7), .Q(
        \buf_re[8][10] ) );
  DFFRHQX1 \buf_re_reg[9][10]  ( .D(\buf_re[8][10] ), .CK(clk), .RN(n7), .Q(
        \buf_re[9][10] ) );
  DFFRHQX1 \buf_re_reg[10][10]  ( .D(\buf_re[9][10] ), .CK(clk), .RN(n7), .Q(
        \buf_re[10][10] ) );
  DFFRHQX1 \buf_re_reg[11][10]  ( .D(\buf_re[10][10] ), .CK(clk), .RN(n7), .Q(
        \buf_re[11][10] ) );
  DFFRHQX1 \buf_re_reg[12][10]  ( .D(\buf_re[11][10] ), .CK(clk), .RN(n7), .Q(
        \buf_re[12][10] ) );
  DFFRHQX1 \buf_re_reg[13][10]  ( .D(\buf_re[12][10] ), .CK(clk), .RN(n7), .Q(
        \buf_re[13][10] ) );
  DFFRHQX1 \buf_re_reg[14][10]  ( .D(\buf_re[13][10] ), .CK(clk), .RN(n7), .Q(
        \buf_re[14][10] ) );
  DFFRHQX1 \buf_re_reg[1][9]  ( .D(x_re[9]), .CK(clk), .RN(n9), .Q(
        \buf_re[1][9] ) );
  DFFRHQX1 \buf_re_reg[2][9]  ( .D(\buf_re[1][9] ), .CK(clk), .RN(n9), .Q(
        \buf_re[2][9] ) );
  DFFRHQX1 \buf_re_reg[3][9]  ( .D(\buf_re[2][9] ), .CK(clk), .RN(n9), .Q(
        \buf_re[3][9] ) );
  DFFRHQX1 \buf_re_reg[4][9]  ( .D(\buf_re[3][9] ), .CK(clk), .RN(n9), .Q(
        \buf_re[4][9] ) );
  DFFRHQX1 \buf_re_reg[5][9]  ( .D(\buf_re[4][9] ), .CK(clk), .RN(n9), .Q(
        \buf_re[5][9] ) );
  DFFRHQX1 \buf_re_reg[6][9]  ( .D(\buf_re[5][9] ), .CK(clk), .RN(n9), .Q(
        \buf_re[6][9] ) );
  DFFRHQX1 \buf_re_reg[7][9]  ( .D(\buf_re[6][9] ), .CK(clk), .RN(n9), .Q(
        \buf_re[7][9] ) );
  DFFRHQX1 \buf_re_reg[8][9]  ( .D(\buf_re[7][9] ), .CK(clk), .RN(n9), .Q(
        \buf_re[8][9] ) );
  DFFRHQX1 \buf_re_reg[9][9]  ( .D(\buf_re[8][9] ), .CK(clk), .RN(n8), .Q(
        \buf_re[9][9] ) );
  DFFRHQX1 \buf_re_reg[10][9]  ( .D(\buf_re[9][9] ), .CK(clk), .RN(n8), .Q(
        \buf_re[10][9] ) );
  DFFRHQX1 \buf_re_reg[11][9]  ( .D(\buf_re[10][9] ), .CK(clk), .RN(n8), .Q(
        \buf_re[11][9] ) );
  DFFRHQX1 \buf_re_reg[12][9]  ( .D(\buf_re[11][9] ), .CK(clk), .RN(n8), .Q(
        \buf_re[12][9] ) );
  DFFRHQX1 \buf_re_reg[13][9]  ( .D(\buf_re[12][9] ), .CK(clk), .RN(n8), .Q(
        \buf_re[13][9] ) );
  DFFRHQX1 \buf_re_reg[14][9]  ( .D(\buf_re[13][9] ), .CK(clk), .RN(n8), .Q(
        \buf_re[14][9] ) );
  DFFRHQX1 \buf_re_reg[1][8]  ( .D(x_re[8]), .CK(clk), .RN(n12), .Q(
        \buf_re[1][8] ) );
  DFFRHQX1 \buf_re_reg[2][8]  ( .D(\buf_re[1][8] ), .CK(clk), .RN(n12), .Q(
        \buf_re[2][8] ) );
  DFFRHQX1 \buf_re_reg[3][8]  ( .D(\buf_re[2][8] ), .CK(clk), .RN(n12), .Q(
        \buf_re[3][8] ) );
  DFFRHQX1 \buf_re_reg[4][8]  ( .D(\buf_re[3][8] ), .CK(clk), .RN(n12), .Q(
        \buf_re[4][8] ) );
  DFFRHQX1 \buf_re_reg[5][8]  ( .D(\buf_re[4][8] ), .CK(clk), .RN(n12), .Q(
        \buf_re[5][8] ) );
  DFFRHQX1 \buf_re_reg[6][8]  ( .D(\buf_re[5][8] ), .CK(clk), .RN(n12), .Q(
        \buf_re[6][8] ) );
  DFFRHQX1 \buf_re_reg[7][8]  ( .D(\buf_re[6][8] ), .CK(clk), .RN(n12), .Q(
        \buf_re[7][8] ) );
  DFFRHQX1 \buf_re_reg[8][8]  ( .D(\buf_re[7][8] ), .CK(clk), .RN(n12), .Q(
        \buf_re[8][8] ) );
  DFFRHQX1 \buf_re_reg[9][8]  ( .D(\buf_re[8][8] ), .CK(clk), .RN(n12), .Q(
        \buf_re[9][8] ) );
  DFFRHQX1 \buf_re_reg[10][8]  ( .D(\buf_re[9][8] ), .CK(clk), .RN(n12), .Q(
        \buf_re[10][8] ) );
  DFFRHQX1 \buf_re_reg[11][8]  ( .D(\buf_re[10][8] ), .CK(clk), .RN(n12), .Q(
        \buf_re[11][8] ) );
  DFFRHQX1 \buf_re_reg[12][8]  ( .D(\buf_re[11][8] ), .CK(clk), .RN(n11), .Q(
        \buf_re[12][8] ) );
  DFFRHQX1 \buf_re_reg[13][8]  ( .D(\buf_re[12][8] ), .CK(clk), .RN(n11), .Q(
        \buf_re[13][8] ) );
  DFFRHQX1 \buf_re_reg[14][8]  ( .D(\buf_re[13][8] ), .CK(clk), .RN(n11), .Q(
        \buf_re[14][8] ) );
  DFFRHQX1 \buf_re_reg[1][7]  ( .D(x_re[7]), .CK(clk), .RN(n11), .Q(
        \buf_re[1][7] ) );
  DFFRHQX1 \buf_re_reg[2][7]  ( .D(\buf_re[1][7] ), .CK(clk), .RN(n11), .Q(
        \buf_re[2][7] ) );
  DFFRHQX1 \buf_re_reg[3][7]  ( .D(\buf_re[2][7] ), .CK(clk), .RN(n11), .Q(
        \buf_re[3][7] ) );
  DFFRHQX1 \buf_re_reg[4][7]  ( .D(\buf_re[3][7] ), .CK(clk), .RN(n11), .Q(
        \buf_re[4][7] ) );
  DFFRHQX1 \buf_re_reg[5][7]  ( .D(\buf_re[4][7] ), .CK(clk), .RN(n11), .Q(
        \buf_re[5][7] ) );
  DFFRHQX1 \buf_re_reg[6][7]  ( .D(\buf_re[5][7] ), .CK(clk), .RN(n11), .Q(
        \buf_re[6][7] ) );
  DFFRHQX1 \buf_re_reg[7][7]  ( .D(\buf_re[6][7] ), .CK(clk), .RN(n11), .Q(
        \buf_re[7][7] ) );
  DFFRHQX1 \buf_re_reg[8][7]  ( .D(\buf_re[7][7] ), .CK(clk), .RN(n11), .Q(
        \buf_re[8][7] ) );
  DFFRHQX1 \buf_re_reg[9][7]  ( .D(\buf_re[8][7] ), .CK(clk), .RN(n11), .Q(
        \buf_re[9][7] ) );
  DFFRHQX1 \buf_re_reg[10][7]  ( .D(\buf_re[9][7] ), .CK(clk), .RN(n11), .Q(
        \buf_re[10][7] ) );
  DFFRHQX1 \buf_re_reg[11][7]  ( .D(\buf_re[10][7] ), .CK(clk), .RN(n10), .Q(
        \buf_re[11][7] ) );
  DFFRHQX1 \buf_re_reg[12][7]  ( .D(\buf_re[11][7] ), .CK(clk), .RN(n10), .Q(
        \buf_re[12][7] ) );
  DFFRHQX1 \buf_re_reg[13][7]  ( .D(\buf_re[12][7] ), .CK(clk), .RN(n10), .Q(
        \buf_re[13][7] ) );
  DFFRHQX1 \buf_re_reg[14][7]  ( .D(\buf_re[13][7] ), .CK(clk), .RN(n10), .Q(
        \buf_re[14][7] ) );
  DFFRHQX1 \buf_re_reg[1][6]  ( .D(x_re[6]), .CK(clk), .RN(n10), .Q(
        \buf_re[1][6] ) );
  DFFRHQX1 \buf_re_reg[2][6]  ( .D(\buf_re[1][6] ), .CK(clk), .RN(n10), .Q(
        \buf_re[2][6] ) );
  DFFRHQX1 \buf_re_reg[3][6]  ( .D(\buf_re[2][6] ), .CK(clk), .RN(n10), .Q(
        \buf_re[3][6] ) );
  DFFRHQX1 \buf_re_reg[4][6]  ( .D(\buf_re[3][6] ), .CK(clk), .RN(n10), .Q(
        \buf_re[4][6] ) );
  DFFRHQX1 \buf_re_reg[5][6]  ( .D(\buf_re[4][6] ), .CK(clk), .RN(n10), .Q(
        \buf_re[5][6] ) );
  DFFRHQX1 \buf_re_reg[6][6]  ( .D(\buf_re[5][6] ), .CK(clk), .RN(n10), .Q(
        \buf_re[6][6] ) );
  DFFRHQX1 \buf_re_reg[7][6]  ( .D(\buf_re[6][6] ), .CK(clk), .RN(n10), .Q(
        \buf_re[7][6] ) );
  DFFRHQX1 \buf_re_reg[8][6]  ( .D(\buf_re[7][6] ), .CK(clk), .RN(n10), .Q(
        \buf_re[8][6] ) );
  DFFRHQX1 \buf_re_reg[9][6]  ( .D(\buf_re[8][6] ), .CK(clk), .RN(n10), .Q(
        \buf_re[9][6] ) );
  DFFRHQX1 \buf_re_reg[10][6]  ( .D(\buf_re[9][6] ), .CK(clk), .RN(n9), .Q(
        \buf_re[10][6] ) );
  DFFRHQX1 \buf_re_reg[11][6]  ( .D(\buf_re[10][6] ), .CK(clk), .RN(n9), .Q(
        \buf_re[11][6] ) );
  DFFRHQX1 \buf_re_reg[12][6]  ( .D(\buf_re[11][6] ), .CK(clk), .RN(n9), .Q(
        \buf_re[12][6] ) );
  DFFRHQX1 \buf_re_reg[13][6]  ( .D(\buf_re[12][6] ), .CK(clk), .RN(n9), .Q(
        \buf_re[13][6] ) );
  DFFRHQX1 \buf_re_reg[14][6]  ( .D(\buf_re[13][6] ), .CK(clk), .RN(n9), .Q(
        \buf_re[14][6] ) );
  DFFRHQX1 \buf_re_reg[1][5]  ( .D(x_re[5]), .CK(clk), .RN(n6), .Q(
        \buf_re[1][5] ) );
  DFFRHQX1 \buf_re_reg[2][5]  ( .D(\buf_re[1][5] ), .CK(clk), .RN(n6), .Q(
        \buf_re[2][5] ) );
  DFFRHQX1 \buf_re_reg[3][5]  ( .D(\buf_re[2][5] ), .CK(clk), .RN(n6), .Q(
        \buf_re[3][5] ) );
  DFFRHQX1 \buf_re_reg[4][5]  ( .D(\buf_re[3][5] ), .CK(clk), .RN(n6), .Q(
        \buf_re[4][5] ) );
  DFFRHQX1 \buf_re_reg[5][5]  ( .D(\buf_re[4][5] ), .CK(clk), .RN(n6), .Q(
        \buf_re[5][5] ) );
  DFFRHQX1 \buf_re_reg[6][5]  ( .D(\buf_re[5][5] ), .CK(clk), .RN(n5), .Q(
        \buf_re[6][5] ) );
  DFFRHQX1 \buf_re_reg[7][5]  ( .D(\buf_re[6][5] ), .CK(clk), .RN(n5), .Q(
        \buf_re[7][5] ) );
  DFFRHQX1 \buf_re_reg[8][5]  ( .D(\buf_re[7][5] ), .CK(clk), .RN(n5), .Q(
        \buf_re[8][5] ) );
  DFFRHQX1 \buf_re_reg[9][5]  ( .D(\buf_re[8][5] ), .CK(clk), .RN(n5), .Q(
        \buf_re[9][5] ) );
  DFFRHQX1 \buf_re_reg[10][5]  ( .D(\buf_re[9][5] ), .CK(clk), .RN(n5), .Q(
        \buf_re[10][5] ) );
  DFFRHQX1 \buf_re_reg[11][5]  ( .D(\buf_re[10][5] ), .CK(clk), .RN(n5), .Q(
        \buf_re[11][5] ) );
  DFFRHQX1 \buf_re_reg[12][5]  ( .D(\buf_re[11][5] ), .CK(clk), .RN(n5), .Q(
        \buf_re[12][5] ) );
  DFFRHQX1 \buf_re_reg[13][5]  ( .D(\buf_re[12][5] ), .CK(clk), .RN(n5), .Q(
        \buf_re[13][5] ) );
  DFFRHQX1 \buf_re_reg[14][5]  ( .D(\buf_re[13][5] ), .CK(clk), .RN(n5), .Q(
        \buf_re[14][5] ) );
  DFFRHQX1 \buf_re_reg[1][4]  ( .D(x_re[4]), .CK(clk), .RN(n5), .Q(
        \buf_re[1][4] ) );
  DFFRHQX1 \buf_re_reg[2][4]  ( .D(\buf_re[1][4] ), .CK(clk), .RN(n5), .Q(
        \buf_re[2][4] ) );
  DFFRHQX1 \buf_re_reg[3][4]  ( .D(\buf_re[2][4] ), .CK(clk), .RN(n5), .Q(
        \buf_re[3][4] ) );
  DFFRHQX1 \buf_re_reg[4][4]  ( .D(\buf_re[3][4] ), .CK(clk), .RN(n5), .Q(
        \buf_re[4][4] ) );
  DFFRHQX1 \buf_re_reg[5][4]  ( .D(\buf_re[4][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[5][4] ) );
  DFFRHQX1 \buf_re_reg[6][4]  ( .D(\buf_re[5][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[6][4] ) );
  DFFRHQX1 \buf_re_reg[7][4]  ( .D(\buf_re[6][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[7][4] ) );
  DFFRHQX1 \buf_re_reg[8][4]  ( .D(\buf_re[7][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[8][4] ) );
  DFFRHQX1 \buf_re_reg[9][4]  ( .D(\buf_re[8][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[9][4] ) );
  DFFRHQX1 \buf_re_reg[10][4]  ( .D(\buf_re[9][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[10][4] ) );
  DFFRHQX1 \buf_re_reg[11][4]  ( .D(\buf_re[10][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[11][4] ) );
  DFFRHQX1 \buf_re_reg[12][4]  ( .D(\buf_re[11][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[12][4] ) );
  DFFRHQX1 \buf_re_reg[13][4]  ( .D(\buf_re[12][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[13][4] ) );
  DFFRHQX1 \buf_re_reg[14][4]  ( .D(\buf_re[13][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[14][4] ) );
  DFFRHQX1 \buf_re_reg[1][3]  ( .D(x_re[3]), .CK(clk), .RN(n4), .Q(
        \buf_re[1][3] ) );
  DFFRHQX1 \buf_re_reg[2][3]  ( .D(\buf_re[1][3] ), .CK(clk), .RN(n4), .Q(
        \buf_re[2][3] ) );
  DFFRHQX1 \buf_re_reg[3][3]  ( .D(\buf_re[2][3] ), .CK(clk), .RN(n4), .Q(
        \buf_re[3][3] ) );
  DFFRHQX1 \buf_re_reg[4][3]  ( .D(\buf_re[3][3] ), .CK(clk), .RN(n3), .Q(
        \buf_re[4][3] ) );
  DFFRHQX1 \buf_re_reg[5][3]  ( .D(\buf_re[4][3] ), .CK(clk), .RN(n3), .Q(
        \buf_re[5][3] ) );
  DFFRHQX1 \buf_re_reg[6][3]  ( .D(\buf_re[5][3] ), .CK(clk), .RN(n3), .Q(
        \buf_re[6][3] ) );
  DFFRHQX1 \buf_re_reg[7][3]  ( .D(\buf_re[6][3] ), .CK(clk), .RN(n3), .Q(
        \buf_re[7][3] ) );
  DFFRHQX1 \buf_re_reg[8][3]  ( .D(\buf_re[7][3] ), .CK(clk), .RN(n3), .Q(
        \buf_re[8][3] ) );
  DFFRHQX1 \buf_re_reg[9][3]  ( .D(\buf_re[8][3] ), .CK(clk), .RN(n3), .Q(
        \buf_re[9][3] ) );
  DFFRHQX1 \buf_re_reg[10][3]  ( .D(\buf_re[9][3] ), .CK(clk), .RN(n3), .Q(
        \buf_re[10][3] ) );
  DFFRHQX1 \buf_re_reg[11][3]  ( .D(\buf_re[10][3] ), .CK(clk), .RN(n3), .Q(
        \buf_re[11][3] ) );
  DFFRHQX1 \buf_re_reg[12][3]  ( .D(\buf_re[11][3] ), .CK(clk), .RN(n3), .Q(
        \buf_re[12][3] ) );
  DFFRHQX1 \buf_re_reg[13][3]  ( .D(\buf_re[12][3] ), .CK(clk), .RN(n3), .Q(
        \buf_re[13][3] ) );
  DFFRHQX1 \buf_re_reg[14][3]  ( .D(\buf_re[13][3] ), .CK(clk), .RN(n3), .Q(
        \buf_re[14][3] ) );
  DFFRHQX1 \buf_re_reg[1][2]  ( .D(x_re[2]), .CK(clk), .RN(n3), .Q(
        \buf_re[1][2] ) );
  DFFRHQX1 \buf_re_reg[2][2]  ( .D(\buf_re[1][2] ), .CK(clk), .RN(n3), .Q(
        \buf_re[2][2] ) );
  DFFRHQX1 \buf_re_reg[3][2]  ( .D(\buf_re[2][2] ), .CK(clk), .RN(n2), .Q(
        \buf_re[3][2] ) );
  DFFRHQX1 \buf_re_reg[4][2]  ( .D(\buf_re[3][2] ), .CK(clk), .RN(n2), .Q(
        \buf_re[4][2] ) );
  DFFRHQX1 \buf_re_reg[5][2]  ( .D(\buf_re[4][2] ), .CK(clk), .RN(n2), .Q(
        \buf_re[5][2] ) );
  DFFRHQX1 \buf_re_reg[6][2]  ( .D(\buf_re[5][2] ), .CK(clk), .RN(n2), .Q(
        \buf_re[6][2] ) );
  DFFRHQX1 \buf_re_reg[7][2]  ( .D(\buf_re[6][2] ), .CK(clk), .RN(n2), .Q(
        \buf_re[7][2] ) );
  DFFRHQX1 \buf_re_reg[8][2]  ( .D(\buf_re[7][2] ), .CK(clk), .RN(n2), .Q(
        \buf_re[8][2] ) );
  DFFRHQX1 \buf_re_reg[9][2]  ( .D(\buf_re[8][2] ), .CK(clk), .RN(n2), .Q(
        \buf_re[9][2] ) );
  DFFRHQX1 \buf_re_reg[10][2]  ( .D(\buf_re[9][2] ), .CK(clk), .RN(n2), .Q(
        \buf_re[10][2] ) );
  DFFRHQX1 \buf_re_reg[11][2]  ( .D(\buf_re[10][2] ), .CK(clk), .RN(n2), .Q(
        \buf_re[11][2] ) );
  DFFRHQX1 \buf_re_reg[12][2]  ( .D(\buf_re[11][2] ), .CK(clk), .RN(n2), .Q(
        \buf_re[12][2] ) );
  DFFRHQX1 \buf_re_reg[13][2]  ( .D(\buf_re[12][2] ), .CK(clk), .RN(n2), .Q(
        \buf_re[13][2] ) );
  DFFRHQX1 \buf_re_reg[14][2]  ( .D(\buf_re[13][2] ), .CK(clk), .RN(n2), .Q(
        \buf_re[14][2] ) );
  DFFRHQX1 \buf_re_reg[1][1]  ( .D(x_re[1]), .CK(clk), .RN(n2), .Q(
        \buf_re[1][1] ) );
  DFFRHQX1 \buf_re_reg[2][1]  ( .D(\buf_re[1][1] ), .CK(clk), .RN(n1), .Q(
        \buf_re[2][1] ) );
  DFFRHQX1 \buf_re_reg[3][1]  ( .D(\buf_re[2][1] ), .CK(clk), .RN(n1), .Q(
        \buf_re[3][1] ) );
  DFFRHQX1 \buf_re_reg[4][1]  ( .D(\buf_re[3][1] ), .CK(clk), .RN(n1), .Q(
        \buf_re[4][1] ) );
  DFFRHQX1 \buf_re_reg[5][1]  ( .D(\buf_re[4][1] ), .CK(clk), .RN(n1), .Q(
        \buf_re[5][1] ) );
  DFFRHQX1 \buf_re_reg[6][1]  ( .D(\buf_re[5][1] ), .CK(clk), .RN(n1), .Q(
        \buf_re[6][1] ) );
  DFFRHQX1 \buf_re_reg[7][1]  ( .D(\buf_re[6][1] ), .CK(clk), .RN(n1), .Q(
        \buf_re[7][1] ) );
  DFFRHQX1 \buf_re_reg[8][1]  ( .D(\buf_re[7][1] ), .CK(clk), .RN(n1), .Q(
        \buf_re[8][1] ) );
  DFFRHQX1 \buf_re_reg[9][1]  ( .D(\buf_re[8][1] ), .CK(clk), .RN(n1), .Q(
        \buf_re[9][1] ) );
  DFFRHQX1 \buf_re_reg[10][1]  ( .D(\buf_re[9][1] ), .CK(clk), .RN(n1), .Q(
        \buf_re[10][1] ) );
  DFFRHQX1 \buf_re_reg[11][1]  ( .D(\buf_re[10][1] ), .CK(clk), .RN(n1), .Q(
        \buf_re[11][1] ) );
  DFFRHQX1 \buf_re_reg[12][1]  ( .D(\buf_re[11][1] ), .CK(clk), .RN(n1), .Q(
        \buf_re[12][1] ) );
  DFFRHQX1 \buf_re_reg[13][1]  ( .D(\buf_re[12][1] ), .CK(clk), .RN(n1), .Q(
        \buf_re[13][1] ) );
  DFFRHQX1 \buf_re_reg[14][1]  ( .D(\buf_re[13][1] ), .CK(clk), .RN(n1), .Q(
        \buf_re[14][1] ) );
  DFFRHQX1 \buf_re_reg[1][0]  ( .D(x_re[0]), .CK(clk), .RN(n13), .Q(
        \buf_re[1][0] ) );
  DFFRHQX1 \buf_re_reg[2][0]  ( .D(\buf_re[1][0] ), .CK(clk), .RN(n13), .Q(
        \buf_re[2][0] ) );
  DFFRHQX1 \buf_re_reg[3][0]  ( .D(\buf_re[2][0] ), .CK(clk), .RN(n13), .Q(
        \buf_re[3][0] ) );
  DFFRHQX1 \buf_re_reg[4][0]  ( .D(\buf_re[3][0] ), .CK(clk), .RN(n13), .Q(
        \buf_re[4][0] ) );
  DFFRHQX1 \buf_re_reg[5][0]  ( .D(\buf_re[4][0] ), .CK(clk), .RN(n13), .Q(
        \buf_re[5][0] ) );
  DFFRHQX1 \buf_re_reg[6][0]  ( .D(\buf_re[5][0] ), .CK(clk), .RN(n13), .Q(
        \buf_re[6][0] ) );
  DFFRHQX1 \buf_re_reg[7][0]  ( .D(\buf_re[6][0] ), .CK(clk), .RN(n13), .Q(
        \buf_re[7][0] ) );
  DFFRHQX1 \buf_re_reg[8][0]  ( .D(\buf_re[7][0] ), .CK(clk), .RN(n13), .Q(
        \buf_re[8][0] ) );
  DFFRHQX1 \buf_re_reg[9][0]  ( .D(\buf_re[8][0] ), .CK(clk), .RN(n13), .Q(
        \buf_re[9][0] ) );
  DFFRHQX1 \buf_re_reg[10][0]  ( .D(\buf_re[9][0] ), .CK(clk), .RN(n13), .Q(
        \buf_re[10][0] ) );
  DFFRHQX1 \buf_re_reg[11][0]  ( .D(\buf_re[10][0] ), .CK(clk), .RN(n13), .Q(
        \buf_re[11][0] ) );
  DFFRHQX1 \buf_re_reg[12][0]  ( .D(\buf_re[11][0] ), .CK(clk), .RN(n13), .Q(
        \buf_re[12][0] ) );
  DFFRHQX1 \buf_re_reg[13][0]  ( .D(\buf_re[12][0] ), .CK(clk), .RN(n12), .Q(
        \buf_re[13][0] ) );
  DFFRHQX1 \buf_re_reg[14][0]  ( .D(\buf_re[13][0] ), .CK(clk), .RN(n12), .Q(
        \buf_re[14][0] ) );
  DFFHQX1 \y_re_r_reg[10]  ( .D(\buf_re[14][10] ), .CK(clk), .Q(y_re[10]) );
  DFFHQX1 \y_re_r_reg[9]  ( .D(\buf_re[14][9] ), .CK(clk), .Q(y_re[9]) );
  DFFHQX1 \y_re_r_reg[8]  ( .D(\buf_re[14][8] ), .CK(clk), .Q(y_re[8]) );
  DFFHQX1 \y_re_r_reg[7]  ( .D(\buf_re[14][7] ), .CK(clk), .Q(y_re[7]) );
  DFFHQX1 \y_re_r_reg[4]  ( .D(\buf_re[14][4] ), .CK(clk), .Q(y_re[4]) );
  DFFHQX1 \y_re_r_reg[3]  ( .D(\buf_re[14][3] ), .CK(clk), .Q(y_re[3]) );
  DFFHQX1 \y_re_r_reg[2]  ( .D(\buf_re[14][2] ), .CK(clk), .Q(y_re[2]) );
  DFFHQX1 \y_im_r_reg[10]  ( .D(\buf_im[14][10] ), .CK(clk), .Q(y_im[10]) );
  DFFHQX1 \y_im_r_reg[9]  ( .D(\buf_im[14][9] ), .CK(clk), .Q(y_im[9]) );
  DFFHQX1 \y_im_r_reg[8]  ( .D(\buf_im[14][8] ), .CK(clk), .Q(y_im[8]) );
  DFFHQX1 \y_im_r_reg[7]  ( .D(\buf_im[14][7] ), .CK(clk), .Q(y_im[7]) );
  DFFHQX1 \y_im_r_reg[4]  ( .D(\buf_im[14][4] ), .CK(clk), .Q(y_im[4]) );
  DFFHQX1 \y_im_r_reg[3]  ( .D(\buf_im[14][3] ), .CK(clk), .Q(y_im[3]) );
  DFFHQX1 \y_im_r_reg[2]  ( .D(\buf_im[14][2] ), .CK(clk), .Q(y_im[2]) );
  DFFHQX1 \y_im_r_reg[6]  ( .D(\buf_im[14][6] ), .CK(clk), .Q(y_im[6]) );
  DFFHQX1 \y_im_r_reg[11]  ( .D(\buf_im[14][11] ), .CK(clk), .Q(y_im[11]) );
  DFFHQX1 \y_re_r_reg[6]  ( .D(\buf_re[14][6] ), .CK(clk), .Q(y_re[6]) );
  DFFHQX1 \y_re_r_reg[11]  ( .D(\buf_re[14][11] ), .CK(clk), .Q(y_re[11]) );
  DFFHQX1 \y_re_r_reg[5]  ( .D(\buf_re[14][5] ), .CK(clk), .Q(y_re[5]) );
  DFFHQX1 \y_re_r_reg[1]  ( .D(\buf_re[14][1] ), .CK(clk), .Q(y_re[1]) );
  DFFHQX1 \y_re_r_reg[0]  ( .D(\buf_re[14][0] ), .CK(clk), .Q(y_re[0]) );
  DFFHQX1 \y_im_r_reg[5]  ( .D(\buf_im[14][5] ), .CK(clk), .Q(y_im[5]) );
  DFFHQX1 \y_im_r_reg[1]  ( .D(\buf_im[14][1] ), .CK(clk), .Q(y_im[1]) );
  DFFHQX1 \y_im_r_reg[0]  ( .D(\buf_im[14][0] ), .CK(clk), .Q(y_im[0]) );
  INVX1 U3 ( .A(n2), .Y(n25) );
  INVX1 U4 ( .A(n25), .Y(n1) );
  INVX1 U5 ( .A(reset), .Y(n2) );
  INVX1 U6 ( .A(n25), .Y(n3) );
  INVX1 U7 ( .A(n25), .Y(n4) );
  INVX1 U8 ( .A(n25), .Y(n5) );
  INVX1 U9 ( .A(n25), .Y(n10) );
  INVX1 U10 ( .A(n25), .Y(n11) );
  INVX1 U11 ( .A(n25), .Y(n12) );
  INVX1 U12 ( .A(n25), .Y(n9) );
  INVX1 U13 ( .A(n25), .Y(n8) );
  INVX1 U14 ( .A(reset), .Y(n6) );
  INVX1 U15 ( .A(n25), .Y(n7) );
  INVX1 U16 ( .A(n25), .Y(n24) );
  INVX1 U17 ( .A(n25), .Y(n13) );
  INVX1 U18 ( .A(n25), .Y(n14) );
  INVX1 U19 ( .A(n25), .Y(n15) );
  INVX1 U20 ( .A(n25), .Y(n16) );
  INVX1 U21 ( .A(n25), .Y(n17) );
  INVX1 U22 ( .A(n25), .Y(n21) );
  INVX1 U23 ( .A(n25), .Y(n22) );
  INVX1 U24 ( .A(n25), .Y(n23) );
  INVX1 U25 ( .A(n25), .Y(n20) );
  INVX1 U26 ( .A(n25), .Y(n19) );
  INVX1 U27 ( .A(reset), .Y(n18) );
endmodule


module carry_select_adder2_WIDTH12_19 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U5 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U8 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_18 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U5 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U8 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_17 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U5 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U8 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_16 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U5 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U8 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module butterfly2_WIDTH12_4_DW01_inc_0_DW01_inc_24 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module butterfly2_WIDTH12_4_DW01_inc_1_DW01_inc_25 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module butterfly2_WIDTH12_4 ( x0_re, x0_im, x1_re, x1_im, y0_re, y0_im, y1_re, 
        y1_im );
  input [11:0] x0_re;
  input [11:0] x0_im;
  input [11:0] x1_re;
  input [11:0] x1_im;
  output [11:0] y0_re;
  output [11:0] y0_im;
  output [11:0] y1_re;
  output [11:0] y1_im;
  wire   N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N9, N8,
         N7, N6, N5, N4, N3, N2, N11, N10, N1, N0;
  wire   [11:0] x1_re_neg;
  wire   [11:0] x1_im_neg;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  INVX1 U3 ( .A(x1_re[10]), .Y(N1) );
  INVX1 U4 ( .A(x1_re[11]), .Y(N0) );
  INVX1 U5 ( .A(x1_re[1]), .Y(N10) );
  INVX1 U6 ( .A(x1_re[2]), .Y(N9) );
  INVX1 U7 ( .A(x1_re[3]), .Y(N8) );
  INVX1 U8 ( .A(x1_re[4]), .Y(N7) );
  INVX1 U9 ( .A(x1_re[5]), .Y(N6) );
  INVX1 U10 ( .A(x1_re[6]), .Y(N5) );
  INVX1 U11 ( .A(x1_re[7]), .Y(N4) );
  INVX1 U12 ( .A(x1_re[8]), .Y(N3) );
  INVX1 U13 ( .A(x1_re[9]), .Y(N2) );
  INVX1 U14 ( .A(x1_re[0]), .Y(N11) );
  INVX1 U15 ( .A(x1_im[10]), .Y(N13) );
  INVX1 U16 ( .A(x1_im[11]), .Y(N12) );
  INVX1 U17 ( .A(x1_im[1]), .Y(N22) );
  INVX1 U18 ( .A(x1_im[2]), .Y(N21) );
  INVX1 U19 ( .A(x1_im[3]), .Y(N20) );
  INVX1 U20 ( .A(x1_im[4]), .Y(N19) );
  INVX1 U21 ( .A(x1_im[5]), .Y(N18) );
  INVX1 U22 ( .A(x1_im[6]), .Y(N17) );
  INVX1 U23 ( .A(x1_im[7]), .Y(N16) );
  INVX1 U24 ( .A(x1_im[8]), .Y(N15) );
  INVX1 U25 ( .A(x1_im[9]), .Y(N14) );
  INVX1 U26 ( .A(x1_im[0]), .Y(N23) );
  carry_select_adder2_WIDTH12_19 c0 ( .x(x0_re), .y(x1_re), .z({y0_re, 
        SYNOPSYS_UNCONNECTED__0}) );
  carry_select_adder2_WIDTH12_18 c1 ( .x(x0_im), .y(x1_im), .z({y0_im, 
        SYNOPSYS_UNCONNECTED__1}) );
  carry_select_adder2_WIDTH12_17 c2 ( .x(x0_re), .y(x1_re_neg), .z({y1_re, 
        SYNOPSYS_UNCONNECTED__2}) );
  carry_select_adder2_WIDTH12_16 c3 ( .x(x0_im), .y(x1_im_neg), .z({y1_im, 
        SYNOPSYS_UNCONNECTED__3}) );
  butterfly2_WIDTH12_4_DW01_inc_0_DW01_inc_24 add_0_root_add_22_ni ( .A({N12, 
        N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23}), .SUM(
        x1_im_neg) );
  butterfly2_WIDTH12_4_DW01_inc_1_DW01_inc_25 add_0_root_add_21_ni ( .A({N0, 
        N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11}), .SUM(x1_re_neg) );
endmodule


module twiddle2 ( clk, addr, tw_re, tw_im );
  input [5:0] addr;
  output [11:0] tw_re;
  output [11:0] tw_im;
  input clk;
  wire   N222, N223, N224, N225, N226, N227, N228, N229, N230, N231, N232,
         N280, N281, N282, N283, N284, N285, N286, N287, N288, N289, N290, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143;

  NAND4BXL U3 ( .AN(n1), .B(n2), .C(n3), .D(n4), .Y(N290) );
  AND3X1 U4 ( .A(n5), .B(n6), .C(n7), .Y(n4) );
  NAND4X1 U5 ( .A(n8), .B(n9), .C(n10), .D(n11), .Y(N289) );
  AND3X1 U6 ( .A(n12), .B(n13), .C(n14), .Y(n11) );
  NAND4BXL U7 ( .AN(n15), .B(n10), .C(n16), .D(n17), .Y(N288) );
  NOR2X1 U8 ( .A(n18), .B(n19), .Y(n17) );
  NAND4BXL U9 ( .AN(n20), .B(n21), .C(n22), .D(n23), .Y(N287) );
  AND2X1 U10 ( .A(n24), .B(n25), .Y(n23) );
  NAND4BXL U11 ( .AN(n26), .B(n27), .C(n28), .D(n29), .Y(n20) );
  NAND4X1 U12 ( .A(n30), .B(n31), .C(n32), .D(n9), .Y(N286) );
  NAND3X1 U13 ( .A(n31), .B(n21), .C(n33), .Y(N285) );
  AND3X1 U14 ( .A(n34), .B(n35), .C(n36), .Y(n33) );
  AND3X1 U15 ( .A(n37), .B(n38), .C(n39), .Y(n21) );
  NAND4X1 U16 ( .A(n10), .B(n40), .C(n32), .D(n41), .Y(N284) );
  NOR2X1 U17 ( .A(n42), .B(n43), .Y(n41) );
  NAND4X1 U18 ( .A(n44), .B(n45), .C(n46), .D(n47), .Y(N283) );
  AND3X1 U19 ( .A(n25), .B(n48), .C(n49), .Y(n47) );
  NAND3X1 U20 ( .A(n46), .B(n31), .C(n50), .Y(N282) );
  NOR3BX1 U21 ( .AN(n38), .B(n51), .C(n52), .Y(n50) );
  NOR2BX1 U22 ( .AN(n53), .B(n54), .Y(n31) );
  AND4X1 U23 ( .A(n12), .B(n36), .C(n55), .D(n56), .Y(n46) );
  AND4X1 U24 ( .A(n57), .B(n58), .C(n59), .D(n29), .Y(n56) );
  NAND4X1 U25 ( .A(n30), .B(n12), .C(n25), .D(n60), .Y(N281) );
  AND4X1 U26 ( .A(n61), .B(n45), .C(n34), .D(n62), .Y(n30) );
  AND3X1 U27 ( .A(n63), .B(n64), .C(n40), .Y(n45) );
  NAND4BXL U28 ( .AN(n65), .B(n39), .C(n22), .D(n10), .Y(N280) );
  AND3X1 U29 ( .A(n66), .B(n63), .C(n67), .Y(n10) );
  NOR3X1 U30 ( .A(n68), .B(n54), .C(n26), .Y(n67) );
  INVX1 U31 ( .A(n19), .Y(n22) );
  NOR4BX1 U32 ( .AN(n32), .B(n69), .C(n15), .D(n70), .Y(n39) );
  NAND3BX1 U33 ( .AN(n52), .B(n71), .C(n72), .Y(n70) );
  NAND4BXL U34 ( .AN(n73), .B(n9), .C(n74), .D(n7), .Y(n65) );
  AND2X1 U35 ( .A(n75), .B(n6), .Y(n9) );
  NAND3BX1 U36 ( .AN(n43), .B(n61), .C(n76), .Y(N232) );
  NOR3X1 U37 ( .A(n15), .B(n77), .C(n68), .Y(n76) );
  INVX1 U38 ( .A(n59), .Y(n68) );
  NAND4X1 U39 ( .A(n49), .B(n78), .C(n79), .D(n48), .Y(n15) );
  NOR4BBX1 U40 ( .AN(n37), .BN(n16), .C(n51), .D(n19), .Y(n61) );
  NAND4X1 U41 ( .A(n57), .B(n80), .C(n13), .D(n81), .Y(n19) );
  NAND4X1 U42 ( .A(n14), .B(n24), .C(n72), .D(n82), .Y(n51) );
  NAND3X1 U43 ( .A(n36), .B(n35), .C(n44), .Y(n43) );
  AND3X1 U44 ( .A(n71), .B(n83), .C(n28), .Y(n44) );
  NAND3X1 U45 ( .A(n84), .B(n32), .C(n85), .Y(N231) );
  AND3X1 U46 ( .A(n58), .B(n81), .C(n13), .Y(n85) );
  AND3X1 U47 ( .A(n86), .B(n60), .C(n87), .Y(n32) );
  NAND4X1 U48 ( .A(n88), .B(n89), .C(n90), .D(n91), .Y(N230) );
  AND4X1 U49 ( .A(n57), .B(n87), .C(n59), .D(n37), .Y(n91) );
  NOR2X1 U50 ( .A(n1), .B(n18), .Y(n90) );
  NAND4BXL U51 ( .AN(n52), .B(n12), .C(n40), .D(n92), .Y(n18) );
  AND3X1 U52 ( .A(n35), .B(n7), .C(n74), .Y(n92) );
  NAND2X1 U53 ( .A(n93), .B(n94), .Y(n52) );
  NAND4X1 U54 ( .A(n95), .B(n29), .C(n96), .D(n97), .Y(N229) );
  NOR4BX1 U55 ( .AN(n6), .B(n98), .C(n99), .D(n26), .Y(n97) );
  NOR2X1 U56 ( .A(n69), .B(n100), .Y(n96) );
  NAND3X1 U57 ( .A(n83), .B(n82), .C(n62), .Y(n69) );
  NAND4X1 U58 ( .A(n101), .B(n36), .C(n102), .D(n103), .Y(N228) );
  AND3X1 U59 ( .A(n28), .B(n80), .C(n72), .Y(n103) );
  NAND4X1 U60 ( .A(n104), .B(n101), .C(n105), .D(n106), .Y(N227) );
  NOR3X1 U61 ( .A(n99), .B(n107), .C(n108), .Y(n106) );
  NAND4X1 U62 ( .A(n89), .B(n8), .C(n105), .D(n109), .Y(N226) );
  AND4X1 U63 ( .A(n25), .B(n6), .C(n66), .D(n93), .Y(n109) );
  AND4X1 U64 ( .A(n53), .B(n27), .C(n58), .D(n64), .Y(n66) );
  AND4X1 U65 ( .A(n7), .B(n86), .C(n82), .D(n81), .Y(n105) );
  NAND3X1 U66 ( .A(n110), .B(n111), .C(n112), .Y(n7) );
  NAND4X1 U67 ( .A(n2), .B(n16), .C(n113), .D(n114), .Y(N225) );
  AND4X1 U68 ( .A(n83), .B(n78), .C(n93), .D(n6), .Y(n114) );
  NAND3X1 U69 ( .A(n110), .B(n111), .C(n115), .Y(n6) );
  NAND4X1 U70 ( .A(n116), .B(n101), .C(n113), .D(n117), .Y(N224) );
  NOR3X1 U71 ( .A(n99), .B(n77), .C(n54), .Y(n117) );
  INVX1 U72 ( .A(n58), .Y(n77) );
  INVX1 U73 ( .A(n79), .Y(n99) );
  NAND3X1 U74 ( .A(n118), .B(n110), .C(n119), .Y(n79) );
  AND4X1 U75 ( .A(n5), .B(n74), .C(n88), .D(n120), .Y(n113) );
  NOR3X1 U76 ( .A(n26), .B(n98), .C(n107), .Y(n120) );
  INVX1 U77 ( .A(n60), .Y(n107) );
  INVX1 U78 ( .A(n81), .Y(n98) );
  AND3X1 U79 ( .A(n110), .B(n121), .C(n122), .Y(n26) );
  AND3X1 U80 ( .A(n64), .B(n82), .C(n13), .Y(n88) );
  AND3X1 U81 ( .A(n49), .B(n86), .C(n14), .Y(n5) );
  NAND3X1 U82 ( .A(n118), .B(n112), .C(n123), .Y(n86) );
  NAND4X1 U83 ( .A(n102), .B(n83), .C(n13), .D(n82), .Y(N223) );
  NAND2X1 U84 ( .A(n124), .B(n115), .Y(n82) );
  NAND3X1 U85 ( .A(n118), .B(addr[0]), .C(n125), .Y(n13) );
  NAND3X1 U86 ( .A(n118), .B(addr[0]), .C(n126), .Y(n83) );
  AND4X1 U87 ( .A(n3), .B(n27), .C(n55), .D(n127), .Y(n102) );
  AND3X1 U88 ( .A(n78), .B(n60), .C(n93), .Y(n127) );
  NAND2X1 U89 ( .A(n122), .B(n126), .Y(n93) );
  NAND2X1 U90 ( .A(n122), .B(n125), .Y(n60) );
  AND2X1 U91 ( .A(n118), .B(n128), .Y(n122) );
  AND3X1 U92 ( .A(n34), .B(n81), .C(n16), .Y(n55) );
  NAND2X1 U93 ( .A(n119), .B(n124), .Y(n81) );
  AND4X1 U94 ( .A(n95), .B(n75), .C(n58), .D(n64), .Y(n3) );
  NAND2X1 U95 ( .A(n124), .B(n112), .Y(n64) );
  AND2X1 U96 ( .A(n118), .B(n129), .Y(n124) );
  NAND3X1 U97 ( .A(n118), .B(n115), .C(n130), .Y(n58) );
  AND4X1 U98 ( .A(n12), .B(n87), .C(n131), .D(n74), .Y(n95) );
  NOR2X1 U99 ( .A(n54), .B(n108), .Y(n131) );
  INVX1 U100 ( .A(n48), .Y(n108) );
  NAND3X1 U101 ( .A(n118), .B(n115), .C(n123), .Y(n48) );
  AND3X1 U102 ( .A(n118), .B(n112), .C(n130), .Y(n54) );
  NOR2X1 U103 ( .A(addr[4]), .B(addr[5]), .Y(n118) );
  NAND4X1 U104 ( .A(n84), .B(n132), .C(n104), .D(n133), .Y(N222) );
  AND4X1 U105 ( .A(n57), .B(n74), .C(n87), .D(n35), .Y(n133) );
  NAND2X1 U106 ( .A(n134), .B(n119), .Y(n35) );
  NAND3X1 U107 ( .A(addr[4]), .B(addr[0]), .C(n125), .Y(n87) );
  NAND3X1 U108 ( .A(addr[4]), .B(n129), .C(n119), .Y(n74) );
  NAND2X1 U109 ( .A(n135), .B(n110), .Y(n57) );
  INVX1 U110 ( .A(n100), .Y(n104) );
  NAND4X1 U111 ( .A(n116), .B(n8), .C(n136), .D(n2), .Y(n100) );
  AND4X1 U112 ( .A(n53), .B(n25), .C(n37), .D(n59), .Y(n2) );
  NAND2X1 U113 ( .A(n123), .B(n137), .Y(n59) );
  NAND3X1 U114 ( .A(n115), .B(addr[2]), .C(addr[5]), .Y(n37) );
  NAND3X1 U115 ( .A(n112), .B(addr[2]), .C(addr[5]), .Y(n25) );
  NAND3X1 U116 ( .A(addr[4]), .B(addr[0]), .C(n126), .Y(n53) );
  NOR2BX1 U117 ( .AN(n27), .B(n1), .Y(n136) );
  NAND2X1 U118 ( .A(n63), .B(n38), .Y(n1) );
  NAND2X1 U119 ( .A(n134), .B(n112), .Y(n38) );
  NAND3X1 U120 ( .A(addr[4]), .B(n110), .C(n119), .Y(n63) );
  NOR2X1 U121 ( .A(n128), .B(addr[1]), .Y(n119) );
  NAND2X1 U122 ( .A(n73), .B(n125), .Y(n27) );
  AND3X1 U123 ( .A(n36), .B(n80), .C(n34), .Y(n8) );
  NAND2X1 U124 ( .A(n138), .B(n110), .Y(n34) );
  NAND2X1 U125 ( .A(n135), .B(n123), .Y(n80) );
  NAND2X1 U126 ( .A(n139), .B(n125), .Y(n36) );
  AND3X1 U127 ( .A(n94), .B(n75), .C(n40), .Y(n116) );
  NAND2X1 U128 ( .A(n138), .B(n126), .Y(n40) );
  NAND2X1 U129 ( .A(n137), .B(n129), .Y(n75) );
  NAND2X1 U130 ( .A(n73), .B(n126), .Y(n94) );
  AND4X1 U131 ( .A(n89), .B(n12), .C(n28), .D(n72), .Y(n84) );
  NAND2X1 U132 ( .A(n137), .B(n110), .Y(n72) );
  NAND2X1 U133 ( .A(n134), .B(n115), .Y(n28) );
  AND2X1 U134 ( .A(addr[5]), .B(n129), .Y(n134) );
  NAND3X1 U135 ( .A(n112), .B(addr[3]), .C(addr[5]), .Y(n12) );
  INVX1 U136 ( .A(n140), .Y(n89) );
  NAND4BXL U137 ( .AN(n42), .B(n101), .C(n141), .D(n29), .Y(n140) );
  NAND2X1 U138 ( .A(n138), .B(n125), .Y(n29) );
  AND2X1 U139 ( .A(n130), .B(n121), .Y(n125) );
  INVX1 U140 ( .A(n132), .Y(n138) );
  NAND2X1 U141 ( .A(addr[5]), .B(n128), .Y(n132) );
  AND2X1 U142 ( .A(n49), .B(n78), .Y(n141) );
  NAND2X1 U143 ( .A(n135), .B(n129), .Y(n78) );
  NOR2X1 U144 ( .A(addr[2]), .B(addr[3]), .Y(n129) );
  NAND2X1 U145 ( .A(n137), .B(n130), .Y(n49) );
  AND2X1 U146 ( .A(n115), .B(addr[4]), .Y(n137) );
  AND2X1 U147 ( .A(n24), .B(n71), .Y(n101) );
  NAND2X1 U148 ( .A(n135), .B(n130), .Y(n71) );
  NOR2X1 U149 ( .A(n142), .B(addr[3]), .Y(n130) );
  AND2X1 U150 ( .A(n112), .B(addr[4]), .Y(n135) );
  NOR2X1 U151 ( .A(n128), .B(n121), .Y(n112) );
  INVX1 U152 ( .A(addr[0]), .Y(n128) );
  NAND2X1 U153 ( .A(n139), .B(n126), .Y(n24) );
  AND2X1 U154 ( .A(n123), .B(n121), .Y(n126) );
  NOR2X1 U155 ( .A(n143), .B(addr[2]), .Y(n123) );
  NAND3X1 U156 ( .A(n14), .B(n62), .C(n16), .Y(n42) );
  NAND2X1 U157 ( .A(n139), .B(n110), .Y(n16) );
  AND2X1 U158 ( .A(addr[5]), .B(addr[0]), .Y(n139) );
  NAND3X1 U159 ( .A(n110), .B(n121), .C(n73), .Y(n62) );
  NOR2X1 U160 ( .A(n111), .B(addr[0]), .Y(n73) );
  INVX1 U161 ( .A(addr[4]), .Y(n111) );
  NOR2X1 U162 ( .A(n143), .B(n142), .Y(n110) );
  INVX1 U163 ( .A(addr[2]), .Y(n142) );
  INVX1 U164 ( .A(addr[3]), .Y(n143) );
  NAND3X1 U165 ( .A(n115), .B(addr[3]), .C(addr[5]), .Y(n14) );
  NOR2X1 U166 ( .A(n121), .B(addr[0]), .Y(n115) );
  INVX1 U167 ( .A(addr[1]), .Y(n121) );
  DFFHQX1 \temp_im_reg[11]  ( .D(N280), .CK(clk), .Q(tw_im[11]) );
  DFFHQX1 \temp_im_reg[10]  ( .D(N280), .CK(clk), .Q(tw_im[10]) );
  DFFHQX1 \temp_im_reg[9]  ( .D(N281), .CK(clk), .Q(tw_im[9]) );
  DFFHQX1 \temp_im_reg[8]  ( .D(N282), .CK(clk), .Q(tw_im[8]) );
  DFFHQX1 \temp_im_reg[7]  ( .D(N283), .CK(clk), .Q(tw_im[7]) );
  DFFHQX1 \temp_im_reg[6]  ( .D(N284), .CK(clk), .Q(tw_im[6]) );
  DFFHQX1 \temp_im_reg[5]  ( .D(N285), .CK(clk), .Q(tw_im[5]) );
  DFFHQX1 \temp_im_reg[4]  ( .D(N286), .CK(clk), .Q(tw_im[4]) );
  DFFHQX1 \temp_im_reg[3]  ( .D(N287), .CK(clk), .Q(tw_im[3]) );
  DFFHQX1 \temp_im_reg[2]  ( .D(N288), .CK(clk), .Q(tw_im[2]) );
  DFFHQX1 \temp_im_reg[1]  ( .D(N289), .CK(clk), .Q(tw_im[1]) );
  DFFHQX1 \temp_im_reg[0]  ( .D(N290), .CK(clk), .Q(tw_im[0]) );
  DFFHQX1 \temp_re_reg[11]  ( .D(N222), .CK(clk), .Q(tw_re[11]) );
  DFFHQX1 \temp_re_reg[10]  ( .D(N222), .CK(clk), .Q(tw_re[10]) );
  DFFHQX1 \temp_re_reg[9]  ( .D(N223), .CK(clk), .Q(tw_re[9]) );
  DFFHQX1 \temp_re_reg[8]  ( .D(N224), .CK(clk), .Q(tw_re[8]) );
  DFFHQX1 \temp_re_reg[7]  ( .D(N225), .CK(clk), .Q(tw_re[7]) );
  DFFHQX1 \temp_re_reg[6]  ( .D(N226), .CK(clk), .Q(tw_re[6]) );
  DFFHQX1 \temp_re_reg[5]  ( .D(N227), .CK(clk), .Q(tw_re[5]) );
  DFFHQX1 \temp_re_reg[4]  ( .D(N228), .CK(clk), .Q(tw_re[4]) );
  DFFHQX1 \temp_re_reg[3]  ( .D(N229), .CK(clk), .Q(tw_re[3]) );
  DFFHQX1 \temp_re_reg[2]  ( .D(N230), .CK(clk), .Q(tw_re[2]) );
  DFFHQX1 \temp_re_reg[1]  ( .D(N231), .CK(clk), .Q(tw_re[1]) );
  DFFHQX1 \temp_re_reg[0]  ( .D(N232), .CK(clk), .Q(tw_re[0]) );
endmodule


module multiply_WIDTH12_1_DW01_add_0_DW01_add_51 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  XOR3X2 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_1_DW01_add_1_DW01_add_52 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  XOR3X2 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_1_DW01_add_2_DW01_add_53 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  XOR3X2 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_1_DW01_inc_1_DW01_inc_31 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_1_DW01_add_4_DW01_add_81 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  XOR3X2 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_1_DW01_inc_0_DW01_inc_29 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_1_DW01_add_3_DW01_add_79 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  XOR3X2 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_1_DW_mult_tc_7 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n27,
         n29, n36, n37, n38, n39, n40, n41, n43, n44, n45, n47, n49, n50, n52,
         n54, n56, n57, n58, n59, n60, n61, n62, n64, n65, n68, n69, n70, n71,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n99, n100, n105, n106, n107, n108, n109,
         n110, n112, n113, n115, n116, n117, n118, n123, n124, n126, n131,
         n132, n135, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n253, n254, n255, n256, n257, n258, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n462, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n525, n526, n527, n528, n529, n530, n531, n532, n534;
  assign n1 = b[0];
  assign n409 = b[11];
  assign n410 = b[10];
  assign n411 = b[9];
  assign n412 = b[8];
  assign n413 = b[7];
  assign n414 = b[6];
  assign n415 = b[5];
  assign n416 = b[4];
  assign n417 = b[3];
  assign n418 = b[2];
  assign n419 = b[1];
  assign n445 = a[11];
  assign n446 = a[9];
  assign n447 = a[7];
  assign n448 = a[5];
  assign n449 = a[3];
  assign n450 = a[1];

  CMPR42X2 U192 ( .A(n287), .B(n267), .C(n198), .D(n202), .ICI(n195), .S(n192), 
        .ICO(n190), .CO(n191) );
  CMPR42X2 U195 ( .A(n268), .B(n212), .C(n205), .D(n210), .ICI(n203), .S(n200), 
        .ICO(n198), .CO(n199) );
  XNOR2X4 U419 ( .A(n534), .B(a[10]), .Y(n433) );
  XNOR2X4 U422 ( .A(n447), .B(a[8]), .Y(n434) );
  XNOR2X4 U425 ( .A(n448), .B(a[6]), .Y(n435) );
  XNOR2X4 U431 ( .A(n450), .B(a[2]), .Y(n437) );
  ADDHXL U437 ( .A(n326), .B(n256), .CO(n242), .S(n243) );
  ADDHXL U438 ( .A(n322), .B(n254), .CO(n225), .S(n226) );
  ADDFX2 U439 ( .A(n291), .B(n281), .CI(n301), .CO(n223), .S(n224) );
  ADDFX2 U440 ( .A(n265), .B(n275), .CI(n285), .CO(n180), .S(n181) );
  CMPR42X1 U441 ( .A(n294), .B(n325), .C(n314), .D(n304), .ICI(n242), .S(n239), 
        .ICO(n237), .CO(n238) );
  ADDHXL U442 ( .A(n324), .B(n255), .CO(n235), .S(n236) );
  CMPR42X1 U443 ( .A(n270), .B(n280), .C(n290), .D(n225), .ICI(n223), .S(n219), 
        .ICO(n217), .CO(n218) );
  CMPR42X1 U444 ( .A(n273), .B(n263), .C(n171), .D(n175), .ICI(n172), .S(n169), 
        .ICO(n167), .CO(n168) );
  ADDHXL U445 ( .A(n328), .B(n317), .CO(n246), .S(n247) );
  ADDFX2 U446 ( .A(n306), .B(n327), .CI(n316), .CO(n244), .S(n245) );
  ADDFX2 U447 ( .A(n315), .B(n305), .CI(n243), .CO(n240), .S(n241) );
  CMPR42X1 U448 ( .A(n313), .B(n293), .C(n303), .D(n236), .ICI(n237), .S(n234), 
        .ICO(n232), .CO(n233) );
  ADDFX2 U449 ( .A(n282), .B(n323), .CI(n292), .CO(n230), .S(n231) );
  NOR2BX1 U450 ( .AN(n1), .B(n434), .Y(n282) );
  OAI22X1 U451 ( .A0(n429), .A1(n367), .B0(n366), .B1(n435), .Y(n292) );
  OAI22X1 U452 ( .A0(n428), .A1(n352), .B0(n351), .B1(n434), .Y(n278) );
  ADDHXL U453 ( .A(n320), .B(n253), .CO(n212), .S(n213) );
  CMPR42X1 U454 ( .A(n289), .B(n269), .C(n309), .D(n214), .ICI(n217), .S(n211), 
        .ICO(n209), .CO(n210) );
  CMPR42X1 U455 ( .A(n266), .B(n196), .C(n276), .D(n307), .ICI(n193), .S(n189), 
        .ICO(n187), .CO(n188) );
  CMPR42X1 U456 ( .A(n284), .B(n274), .C(n180), .D(n176), .ICI(n177), .S(n174), 
        .ICO(n172), .CO(n173) );
  NOR2X1 U457 ( .A(n208), .B(n215), .Y(n90) );
  OAI22X1 U458 ( .A0(n432), .A1(n400), .B0(n399), .B1(n462), .Y(n323) );
  AOI21X1 U459 ( .A0(n462), .A1(n432), .B0(n396), .Y(n514) );
  INVX1 U460 ( .A(n514), .Y(n319) );
  AOI21X1 U461 ( .A0(n436), .A1(n430), .B0(n370), .Y(n515) );
  INVX1 U462 ( .A(n515), .Y(n295) );
  NAND2X1 U463 ( .A(n330), .B(n258), .Y(n135) );
  AOI21X1 U464 ( .A0(n435), .A1(n429), .B0(n357), .Y(n516) );
  INVX1 U465 ( .A(n516), .Y(n283) );
  AOI21X1 U467 ( .A0(n437), .A1(n431), .B0(n383), .Y(n517) );
  INVX1 U468 ( .A(n517), .Y(n307) );
  AOI21X1 U469 ( .A0(n107), .A1(n115), .B0(n108), .Y(n106) );
  OAI22X1 U470 ( .A0(n427), .A1(n339), .B0(n433), .B1(n338), .Y(n266) );
  AOI21X1 U471 ( .A0(n3), .A1(n527), .B0(n52), .Y(n50) );
  XNOR2X1 U472 ( .A(n160), .B(n159), .Y(n5) );
  OAI22XL U473 ( .A0(n431), .A1(n388), .B0(n387), .B1(n437), .Y(n311) );
  NAND2BX1 U475 ( .AN(n39), .B(n40), .Y(n6) );
  AOI22X1 U476 ( .A0(n523), .A1(n131), .B0(n247), .B1(n257), .Y(n126) );
  OAI22XL U477 ( .A0(n430), .A1(n372), .B0(n371), .B1(n436), .Y(n296) );
  XOR2X1 U478 ( .A(n158), .B(n518), .Y(n4) );
  OAI22XL U479 ( .A0(n430), .A1(n376), .B0(n375), .B1(n436), .Y(n300) );
  NAND2BX1 U480 ( .AN(n60), .B(n61), .Y(n9) );
  OAI2BB2X1 U481 ( .B0(n126), .B1(n124), .A0N(n245), .A1N(n246), .Y(n123) );
  OAI22XL U482 ( .A0(n431), .A1(n387), .B0(n386), .B1(n437), .Y(n310) );
  AOI22X1 U484 ( .A0(n525), .A1(n123), .B0(n241), .B1(n244), .Y(n118) );
  OAI22XL U485 ( .A0(n430), .A1(n378), .B0(n377), .B1(n436), .Y(n302) );
  OAI22XL U486 ( .A0(n427), .A1(n332), .B0(n433), .B1(n331), .Y(n518) );
  NAND2BXL U487 ( .AN(n76), .B(n77), .Y(n11) );
  NAND2BX1 U488 ( .AN(n87), .B(n88), .Y(n13) );
  OAI22XL U489 ( .A0(n431), .A1(n389), .B0(n388), .B1(n437), .Y(n312) );
  AOI22X1 U490 ( .A0(n38), .A1(n528), .B0(n160), .B1(n159), .Y(n519) );
  INVX1 U491 ( .A(n519), .Y(n29) );
  NAND2BX1 U492 ( .AN(n90), .B(n91), .Y(n14) );
  NAND2XL U493 ( .A(n79), .B(n82), .Y(n12) );
  OR2X2 U494 ( .A(n216), .B(n221), .Y(n520) );
  AND2X2 U495 ( .A(n222), .B(n228), .Y(n521) );
  OR2X2 U496 ( .A(n166), .B(n168), .Y(n522) );
  OR2X2 U497 ( .A(n247), .B(n257), .Y(n523) );
  OR2X2 U499 ( .A(n241), .B(n244), .Y(n525) );
  OR2X2 U500 ( .A(n222), .B(n228), .Y(n526) );
  OR2X2 U501 ( .A(n173), .B(n169), .Y(n527) );
  OR2X2 U502 ( .A(n160), .B(n159), .Y(n528) );
  OR2XL U503 ( .A(n179), .B(n185), .Y(n529) );
  AOI21X4 U506 ( .A0(n85), .A1(n93), .B0(n86), .Y(n84) );
  XNOR2X4 U508 ( .A(n449), .B(a[4]), .Y(n436) );
  OAI22XL U512 ( .A0(n431), .A1(n386), .B0(n385), .B1(n437), .Y(n309) );
  OAI22XL U513 ( .A0(n427), .A1(n342), .B0(n433), .B1(n341), .Y(n269) );
  OAI22XL U514 ( .A0(n429), .A1(n364), .B0(n363), .B1(n435), .Y(n289) );
  OAI22XL U515 ( .A0(n431), .A1(n391), .B0(n390), .B1(n437), .Y(n314) );
  OAI22XL U516 ( .A0(n432), .A1(n403), .B0(n402), .B1(n462), .Y(n326) );
  OAI22XL U517 ( .A0(n430), .A1(n442), .B0(n436), .B1(n382), .Y(n256) );
  NAND2BXL U518 ( .AN(n1), .B(n448), .Y(n382) );
  OAI22XL U519 ( .A0(n432), .A1(n399), .B0(n398), .B1(n462), .Y(n322) );
  OAI22XL U520 ( .A0(n428), .A1(n440), .B0(n434), .B1(n356), .Y(n254) );
  INVXL U521 ( .A(n534), .Y(n440) );
  OAI22XL U522 ( .A0(n430), .A1(n377), .B0(n376), .B1(n436), .Y(n301) );
  OAI22XL U523 ( .A0(n428), .A1(n355), .B0(n354), .B1(n434), .Y(n281) );
  OAI22XL U524 ( .A0(n429), .A1(n366), .B0(n365), .B1(n435), .Y(n291) );
  OAI22XL U525 ( .A0(n432), .A1(n397), .B0(n396), .B1(n462), .Y(n320) );
  OAI22X1 U526 ( .A0(n427), .A1(n439), .B0(n433), .B1(n343), .Y(n253) );
  INVXL U527 ( .A(n445), .Y(n439) );
  OAI22XL U528 ( .A0(n431), .A1(n385), .B0(n384), .B1(n437), .Y(n308) );
  OAI22XL U529 ( .A0(n429), .A1(n363), .B0(n362), .B1(n435), .Y(n288) );
  ADDFX2 U530 ( .A(n264), .B(n182), .CI(n295), .CO(n175), .S(n176) );
  OAI22XL U531 ( .A0(n427), .A1(n337), .B0(n433), .B1(n336), .Y(n264) );
  OAI22XL U532 ( .A0(n429), .A1(n360), .B0(n359), .B1(n435), .Y(n285) );
  OAI22XL U533 ( .A0(n428), .A1(n349), .B0(n348), .B1(n434), .Y(n275) );
  OAI22XL U534 ( .A0(n427), .A1(n338), .B0(n433), .B1(n337), .Y(n265) );
  OAI22XL U535 ( .A0(n428), .A1(n351), .B0(n350), .B1(n434), .Y(n277) );
  OAI22X1 U536 ( .A0(n431), .A1(n384), .B0(n383), .B1(n437), .Y(n196) );
  OAI22XL U537 ( .A0(n432), .A1(n402), .B0(n401), .B1(n462), .Y(n325) );
  NOR2BXL U538 ( .AN(n1), .B(n435), .Y(n294) );
  OAI22XL U539 ( .A0(n430), .A1(n380), .B0(n379), .B1(n436), .Y(n304) );
  OAI22XL U540 ( .A0(n432), .A1(n401), .B0(n400), .B1(n462), .Y(n324) );
  OAI22XL U541 ( .A0(n429), .A1(n441), .B0(n435), .B1(n369), .Y(n255) );
  INVXL U542 ( .A(n447), .Y(n441) );
  NOR2BXL U543 ( .AN(n1), .B(n433), .Y(n270) );
  OAI22XL U544 ( .A0(n429), .A1(n365), .B0(n364), .B1(n435), .Y(n290) );
  OAI22XL U545 ( .A0(n428), .A1(n354), .B0(n353), .B1(n434), .Y(n280) );
  OAI22XL U546 ( .A0(n427), .A1(n341), .B0(n433), .B1(n340), .Y(n268) );
  XNOR2X1 U547 ( .A(n298), .B(n278), .Y(n205) );
  OAI22XL U548 ( .A0(n427), .A1(n336), .B0(n433), .B1(n335), .Y(n263) );
  INVXL U549 ( .A(n170), .Y(n171) );
  OAI22XL U550 ( .A0(n428), .A1(n347), .B0(n346), .B1(n434), .Y(n273) );
  OAI22X1 U551 ( .A0(n431), .A1(n443), .B0(n437), .B1(n395), .Y(n257) );
  INVXL U552 ( .A(n449), .Y(n443) );
  NAND2BXL U553 ( .AN(n1), .B(n449), .Y(n395) );
  OAI22X1 U554 ( .A0(n432), .A1(n406), .B0(n405), .B1(n462), .Y(n329) );
  OAI22XL U555 ( .A0(n432), .A1(n444), .B0(n408), .B1(n462), .Y(n258) );
  OAI22XL U556 ( .A0(n432), .A1(n407), .B0(n406), .B1(n462), .Y(n330) );
  NAND2BXL U557 ( .AN(n1), .B(n450), .Y(n408) );
  OAI22XL U558 ( .A0(n432), .A1(n404), .B0(n403), .B1(n462), .Y(n327) );
  NOR2BXL U559 ( .AN(n1), .B(n436), .Y(n306) );
  OAI22XL U560 ( .A0(n431), .A1(n393), .B0(n392), .B1(n437), .Y(n316) );
  OAI22XL U561 ( .A0(n432), .A1(n405), .B0(n404), .B1(n462), .Y(n328) );
  OAI22XL U562 ( .A0(n431), .A1(n394), .B0(n393), .B1(n437), .Y(n317) );
  XNOR2X1 U563 ( .A(n449), .B(n1), .Y(n394) );
  OAI22XL U564 ( .A0(n430), .A1(n381), .B0(n380), .B1(n436), .Y(n305) );
  OAI22XL U565 ( .A0(n431), .A1(n392), .B0(n391), .B1(n437), .Y(n315) );
  XNOR2X1 U566 ( .A(n448), .B(n1), .Y(n381) );
  OAI22XL U567 ( .A0(n430), .A1(n379), .B0(n378), .B1(n436), .Y(n303) );
  OAI22XL U568 ( .A0(n429), .A1(n368), .B0(n367), .B1(n435), .Y(n293) );
  OAI22XL U569 ( .A0(n431), .A1(n390), .B0(n389), .B1(n437), .Y(n313) );
  OAI22XL U570 ( .A0(n428), .A1(n350), .B0(n349), .B1(n434), .Y(n276) );
  OAI22XL U571 ( .A0(n429), .A1(n358), .B0(n357), .B1(n435), .Y(n170) );
  OAI22XL U572 ( .A0(n430), .A1(n375), .B0(n374), .B1(n436), .Y(n299) );
  OAI22XL U573 ( .A0(n428), .A1(n353), .B0(n352), .B1(n434), .Y(n279) );
  OAI22XL U574 ( .A0(n427), .A1(n340), .B0(n433), .B1(n339), .Y(n267) );
  OAI22XL U575 ( .A0(n429), .A1(n362), .B0(n361), .B1(n435), .Y(n287) );
  OAI22XL U576 ( .A0(n428), .A1(n348), .B0(n347), .B1(n434), .Y(n274) );
  OAI22XL U577 ( .A0(n429), .A1(n359), .B0(n358), .B1(n435), .Y(n284) );
  CMPR42X1 U578 ( .A(n170), .B(n262), .C(n272), .D(n283), .ICI(n167), .S(n166), 
        .ICO(n164), .CO(n165) );
  OAI22XL U579 ( .A0(n428), .A1(n346), .B0(n345), .B1(n434), .Y(n272) );
  OAI22XL U580 ( .A0(n427), .A1(n335), .B0(n433), .B1(n334), .Y(n262) );
  ADDFX2 U581 ( .A(n261), .B(n163), .CI(n164), .CO(n160), .S(n161) );
  OAI22XL U582 ( .A0(n427), .A1(n334), .B0(n433), .B1(n333), .Y(n261) );
  INVX1 U583 ( .A(n162), .Y(n163) );
  OAI22XL U584 ( .A0(n428), .A1(n345), .B0(n344), .B1(n434), .Y(n162) );
  INVX1 U585 ( .A(n448), .Y(n442) );
  NOR2BX1 U586 ( .AN(n1), .B(n437), .Y(n318) );
  XNOR2X1 U587 ( .A(n450), .B(n419), .Y(n406) );
  XNOR2X1 U588 ( .A(n450), .B(n1), .Y(n407) );
  INVX1 U589 ( .A(n450), .Y(n444) );
  XNOR2X1 U590 ( .A(n450), .B(n416), .Y(n403) );
  XNOR2X1 U591 ( .A(n450), .B(n418), .Y(n405) );
  XNOR2X1 U592 ( .A(n449), .B(n419), .Y(n393) );
  XNOR2X1 U593 ( .A(n450), .B(n417), .Y(n404) );
  XNOR2X1 U594 ( .A(n449), .B(n409), .Y(n383) );
  XNOR2X1 U595 ( .A(n450), .B(n415), .Y(n402) );
  XNOR2X1 U596 ( .A(n449), .B(n417), .Y(n391) );
  XNOR2X1 U597 ( .A(n449), .B(n418), .Y(n392) );
  XNOR2X1 U598 ( .A(n448), .B(n419), .Y(n380) );
  NOR2X1 U599 ( .A(n329), .B(n318), .Y(n132) );
  NAND2BX1 U601 ( .AN(n1), .B(n447), .Y(n369) );
  XNOR2X1 U602 ( .A(n450), .B(n414), .Y(n401) );
  XNOR2X1 U603 ( .A(n447), .B(n1), .Y(n368) );
  XNOR2X1 U604 ( .A(n449), .B(n416), .Y(n390) );
  XNOR2X1 U605 ( .A(n448), .B(n418), .Y(n379) );
  NAND2BX1 U606 ( .AN(n1), .B(n534), .Y(n356) );
  XNOR2X1 U607 ( .A(n534), .B(n1), .Y(n355) );
  XNOR2X1 U608 ( .A(n447), .B(n418), .Y(n366) );
  XNOR2X1 U609 ( .A(n450), .B(n412), .Y(n399) );
  XNOR2X1 U610 ( .A(n450), .B(n413), .Y(n400) );
  XNOR2X1 U611 ( .A(n447), .B(n419), .Y(n367) );
  XNOR2X1 U612 ( .A(n534), .B(n419), .Y(n354) );
  XNOR2X1 U613 ( .A(n447), .B(n417), .Y(n365) );
  XNOR2X1 U614 ( .A(n534), .B(n416), .Y(n351) );
  XNOR2X1 U615 ( .A(n447), .B(n416), .Y(n364) );
  XNOR2X1 U616 ( .A(n445), .B(n1), .Y(n342) );
  XNOR2X1 U617 ( .A(n450), .B(n409), .Y(n396) );
  NAND2BX1 U618 ( .AN(n1), .B(n445), .Y(n343) );
  XNOR2X1 U619 ( .A(n447), .B(n415), .Y(n363) );
  XNOR2X1 U620 ( .A(n449), .B(n411), .Y(n385) );
  XNOR2X1 U621 ( .A(n449), .B(n410), .Y(n384) );
  XNOR2X1 U622 ( .A(n448), .B(n412), .Y(n373) );
  XNOR2X1 U623 ( .A(n534), .B(n415), .Y(n350) );
  XNOR2X1 U624 ( .A(n448), .B(n409), .Y(n370) );
  XNOR2X1 U625 ( .A(n445), .B(n416), .Y(n338) );
  XNOR2X1 U626 ( .A(n445), .B(n415), .Y(n337) );
  XNOR2X1 U627 ( .A(n534), .B(n414), .Y(n349) );
  XNOR2X1 U628 ( .A(n447), .B(n409), .Y(n357) );
  NOR2X1 U630 ( .A(n245), .B(n246), .Y(n124) );
  XNOR2X1 U631 ( .A(n448), .B(n416), .Y(n377) );
  XNOR2X1 U632 ( .A(n449), .B(n415), .Y(n389) );
  XNOR2X1 U633 ( .A(n448), .B(n417), .Y(n378) );
  XNOR2X1 U634 ( .A(n449), .B(n414), .Y(n388) );
  XNOR2X1 U635 ( .A(n448), .B(n415), .Y(n376) );
  XNOR2X1 U636 ( .A(n449), .B(n413), .Y(n387) );
  XNOR2X1 U637 ( .A(n450), .B(n410), .Y(n397) );
  XNOR2X1 U638 ( .A(n450), .B(n411), .Y(n398) );
  XOR2X1 U639 ( .A(n450), .B(a[0]), .Y(n426) );
  CLKINVX3 U640 ( .A(a[0]), .Y(n462) );
  XNOR2X1 U641 ( .A(n449), .B(n412), .Y(n386) );
  XOR2X1 U642 ( .A(n449), .B(a[2]), .Y(n425) );
  XNOR2X1 U643 ( .A(n534), .B(n418), .Y(n353) );
  XNOR2X1 U644 ( .A(n448), .B(n414), .Y(n375) );
  XNOR2X1 U645 ( .A(n534), .B(n417), .Y(n352) );
  XNOR2X1 U646 ( .A(n448), .B(n413), .Y(n374) );
  XNOR2X1 U647 ( .A(n445), .B(n419), .Y(n341) );
  OAI22X1 U648 ( .A0(n430), .A1(n374), .B0(n373), .B1(n436), .Y(n298) );
  XNOR2X1 U649 ( .A(n447), .B(n414), .Y(n362) );
  XNOR2X1 U650 ( .A(n445), .B(n417), .Y(n339) );
  XNOR2X1 U651 ( .A(n445), .B(n418), .Y(n340) );
  XNOR2X1 U652 ( .A(n448), .B(n410), .Y(n371) );
  XOR2X1 U653 ( .A(n448), .B(a[4]), .Y(n424) );
  XNOR2X1 U654 ( .A(n448), .B(n411), .Y(n372) );
  XNOR2X1 U655 ( .A(n447), .B(n412), .Y(n360) );
  XNOR2X1 U656 ( .A(n447), .B(n413), .Y(n361) );
  CMPR42X1 U657 ( .A(n277), .B(n297), .C(n197), .D(n204), .ICI(n201), .S(n195), 
        .ICO(n193), .CO(n194) );
  OR2X2 U658 ( .A(n298), .B(n278), .Y(n204) );
  INVX1 U659 ( .A(n196), .Y(n197) );
  OAI22X1 U660 ( .A0(n430), .A1(n373), .B0(n372), .B1(n436), .Y(n297) );
  OAI22X1 U661 ( .A0(n430), .A1(n371), .B0(n370), .B1(n436), .Y(n182) );
  XNOR2X1 U662 ( .A(n445), .B(n414), .Y(n336) );
  XNOR2X1 U663 ( .A(n447), .B(n410), .Y(n358) );
  XNOR2X1 U664 ( .A(n534), .B(n412), .Y(n347) );
  XNOR2X1 U665 ( .A(n534), .B(n413), .Y(n348) );
  XNOR2X1 U666 ( .A(n447), .B(n411), .Y(n359) );
  XNOR2X1 U667 ( .A(n534), .B(n411), .Y(n346) );
  XNOR2X1 U668 ( .A(n445), .B(n413), .Y(n335) );
  XOR2X1 U669 ( .A(n447), .B(a[6]), .Y(n423) );
  XNOR2X1 U670 ( .A(n445), .B(n412), .Y(n334) );
  XNOR2X1 U671 ( .A(n534), .B(n410), .Y(n345) );
  NAND2X1 U672 ( .A(n229), .B(n233), .Y(n110) );
  NAND2X1 U673 ( .A(n234), .B(n238), .Y(n113) );
  NOR2X1 U674 ( .A(n229), .B(n233), .Y(n109) );
  NOR2X1 U675 ( .A(n234), .B(n238), .Y(n112) );
  NOR2X1 U676 ( .A(n239), .B(n240), .Y(n116) );
  NAND2X1 U677 ( .A(n239), .B(n240), .Y(n117) );
  CMPR42X1 U678 ( .A(n312), .B(n302), .C(n235), .D(n232), .ICI(n231), .S(n229), 
        .ICO(n227), .CO(n228) );
  CMPR42X1 U679 ( .A(n311), .B(n226), .C(n230), .D(n224), .ICI(n227), .S(n222), 
        .ICO(n220), .CO(n221) );
  CMPR42X1 U680 ( .A(n321), .B(n300), .C(n310), .D(n220), .ICI(n219), .S(n216), 
        .ICO(n214), .CO(n215) );
  OAI22X1 U681 ( .A0(n432), .A1(n398), .B0(n397), .B1(n462), .Y(n321) );
  NAND2X1 U682 ( .A(n520), .B(n526), .Y(n94) );
  NOR2X1 U685 ( .A(n192), .B(n199), .Y(n81) );
  OAI22X1 U686 ( .A0(n429), .A1(n361), .B0(n360), .B1(n435), .Y(n286) );
  INVX1 U687 ( .A(n182), .Y(n183) );
  AOI21X1 U688 ( .A0(n52), .A1(n522), .B0(n47), .Y(n45) );
  INVX1 U689 ( .A(n49), .Y(n47) );
  NAND2X1 U690 ( .A(n527), .B(n522), .Y(n44) );
  XNOR2X1 U691 ( .A(n446), .B(n409), .Y(n344) );
  XNOR2X1 U692 ( .A(n445), .B(n411), .Y(n333) );
  XOR2X1 U694 ( .A(n445), .B(a[10]), .Y(n421) );
  XNOR2X1 U695 ( .A(n445), .B(n410), .Y(n332) );
  OAI21XL U696 ( .A0(n68), .A1(n60), .B0(n61), .Y(n59) );
  NOR2X1 U697 ( .A(n87), .B(n90), .Y(n85) );
  OAI21XL U698 ( .A0(n87), .A1(n91), .B0(n88), .Y(n86) );
  NAND2X1 U699 ( .A(n216), .B(n221), .Y(n99) );
  OAI21XL U700 ( .A0(n118), .A1(n116), .B0(n117), .Y(n115) );
  NOR2X1 U701 ( .A(n109), .B(n112), .Y(n107) );
  OAI21XL U702 ( .A0(n109), .A1(n113), .B0(n110), .Y(n108) );
  NAND2X1 U704 ( .A(n208), .B(n215), .Y(n91) );
  NAND2X1 U705 ( .A(n200), .B(n207), .Y(n88) );
  INVX1 U706 ( .A(n93), .Y(n92) );
  NAND2X1 U707 ( .A(n192), .B(n199), .Y(n82) );
  NOR2X1 U708 ( .A(n186), .B(n191), .Y(n76) );
  INVX1 U709 ( .A(n81), .Y(n79) );
  INVX1 U710 ( .A(n82), .Y(n80) );
  NAND2X1 U711 ( .A(n186), .B(n191), .Y(n77) );
  NOR2X1 U712 ( .A(n179), .B(n185), .Y(n65) );
  NOR2X1 U714 ( .A(n76), .B(n81), .Y(n70) );
  NAND2X1 U715 ( .A(n179), .B(n185), .Y(n68) );
  NOR2X1 U716 ( .A(n178), .B(n174), .Y(n60) );
  NAND2X1 U719 ( .A(n178), .B(n174), .Y(n61) );
  INVX1 U720 ( .A(n84), .Y(n83) );
  NAND2X1 U721 ( .A(n173), .B(n169), .Y(n54) );
  NAND2X1 U722 ( .A(n166), .B(n168), .Y(n49) );
  INVX1 U723 ( .A(n54), .Y(n52) );
  NOR2X1 U724 ( .A(n165), .B(n161), .Y(n39) );
  INVX1 U725 ( .A(n45), .Y(n43) );
  NAND2X1 U727 ( .A(n165), .B(n161), .Y(n40) );
  OAI21XL U728 ( .A0(n45), .A1(n39), .B0(n40), .Y(n38) );
  NOR2X1 U729 ( .A(n44), .B(n39), .Y(n37) );
  ADDFX2 U730 ( .A(n162), .B(n260), .CI(n271), .CO(n158), .S(n159) );
  OAI22X1 U732 ( .A0(n427), .A1(n333), .B0(n433), .B1(n332), .Y(n260) );
  XNOR2X1 U734 ( .A(n445), .B(n409), .Y(n331) );
  NOR2X1 U735 ( .A(n65), .B(n60), .Y(n58) );
  XOR2X1 U736 ( .A(n100), .B(n15), .Y(product[10]) );
  NAND2X1 U737 ( .A(n520), .B(n99), .Y(n15) );
  AOI21X1 U738 ( .A0(n105), .A1(n526), .B0(n521), .Y(n100) );
  INVX1 U739 ( .A(n106), .Y(n105) );
  XOR2X1 U740 ( .A(n92), .B(n14), .Y(product[11]) );
  XNOR2X1 U741 ( .A(n89), .B(n13), .Y(product[12]) );
  OAI21XL U742 ( .A0(n92), .A1(n90), .B0(n91), .Y(n89) );
  XNOR2X1 U743 ( .A(n83), .B(n12), .Y(product[13]) );
  XOR2X1 U744 ( .A(n78), .B(n11), .Y(product[14]) );
  AOI21X1 U745 ( .A0(n83), .A1(n79), .B0(n80), .Y(n78) );
  XOR2X1 U746 ( .A(n69), .B(n10), .Y(product[15]) );
  NAND2X1 U747 ( .A(n529), .B(n68), .Y(n10) );
  XOR2X1 U748 ( .A(n62), .B(n9), .Y(product[16]) );
  XNOR2X1 U750 ( .A(n3), .B(n8), .Y(product[17]) );
  NAND2X1 U751 ( .A(n527), .B(n54), .Y(n8) );
  XOR2X1 U752 ( .A(n50), .B(n7), .Y(product[18]) );
  NAND2X1 U753 ( .A(n522), .B(n49), .Y(n7) );
  XOR2X1 U754 ( .A(n41), .B(n6), .Y(product[19]) );
  XOR2X1 U756 ( .A(n36), .B(n5), .Y(product[20]) );
  AOI21X1 U757 ( .A0(n3), .A1(n37), .B0(n38), .Y(n36) );
  XOR2X1 U758 ( .A(n27), .B(n4), .Y(product[21]) );
  XOR2X2 U466 ( .A(n534), .B(a[8]), .Y(n422) );
  CMPR42X1 U474 ( .A(n288), .B(n308), .C(n319), .D(n209), .ICI(n206), .S(n203), 
        .ICO(n201), .CO(n202) );
  NAND2X2 U483 ( .A(n434), .B(n422), .Y(n428) );
  CMPR42X1 U498 ( .A(n183), .B(n187), .C(n181), .D(n188), .ICI(n184), .S(n179), 
        .ICO(n177), .CO(n178) );
  NAND2X2 U504 ( .A(n435), .B(n423), .Y(n429) );
  OAI221X1 U505 ( .A0(n106), .A1(n94), .B0(n530), .B1(n531), .C0(n99), .Y(n93)
         );
  INVX1 U507 ( .A(n520), .Y(n530) );
  INVX1 U509 ( .A(n521), .Y(n531) );
  AOI31X1 U510 ( .A0(n3), .A1(n527), .A2(n522), .B0(n43), .Y(n41) );
  NAND2X2 U511 ( .A(n436), .B(n424), .Y(n430) );
  AOI31X1 U600 ( .A0(n3), .A1(n37), .A2(n528), .B0(n29), .Y(n27) );
  OAI2BB2X1 U629 ( .B0(n132), .B1(n135), .A0N(n329), .A1N(n318), .Y(n131) );
  AOI21X1 U683 ( .A0(n434), .A1(n428), .B0(n344), .Y(n532) );
  INVX1 U684 ( .A(n532), .Y(n271) );
  AOI31X1 U693 ( .A0(n529), .A1(n83), .A2(n70), .B0(n64), .Y(n62) );
  NAND2X4 U713 ( .A(n433), .B(n421), .Y(n427) );
  BUFX3 U726 ( .A(n446), .Y(n534) );
  AOI21X1 U731 ( .A0(n83), .A1(n70), .B0(n71), .Y(n69) );
  OAI21X1 U733 ( .A0(n76), .A1(n82), .B0(n77), .Y(n71) );
  OAI21X4 U749 ( .A0(n56), .A1(n84), .B0(n57), .Y(n3) );
  NAND2X1 U755 ( .A(n70), .B(n58), .Y(n56) );
  AOI21X2 U759 ( .A0(n71), .A1(n58), .B0(n59), .Y(n57) );
  NAND2X2 U760 ( .A(n426), .B(n462), .Y(n432) );
  NAND2X2 U761 ( .A(n437), .B(n425), .Y(n431) );
  CMPR42X1 U762 ( .A(n299), .B(n279), .C(n213), .D(n218), .ICI(n211), .S(n208), 
        .ICO(n206), .CO(n207) );
  CMPR42X1 U763 ( .A(n296), .B(n286), .C(n190), .D(n194), .ICI(n189), .S(n186), 
        .ICO(n184), .CO(n185) );
  NOR2X1 U764 ( .A(n200), .B(n207), .Y(n87) );
  OAI2BB1X1 U703 ( .A0N(n71), .A1N(n529), .B0(n68), .Y(n64) );
endmodule


module multiply_WIDTH12_1_DW_mult_tc_9 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n27,
         n29, n36, n37, n38, n39, n40, n41, n43, n44, n45, n47, n49, n50, n52,
         n54, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n68, n69, n70,
         n71, n73, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n97, n99, n100, n105, n106,
         n107, n108, n109, n110, n112, n113, n115, n116, n117, n118, n123,
         n124, n126, n131, n132, n135, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n439, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n462, n514, n515, n516, n517, n518, n519,
         n520, n522, n523, n524, n525, n526, n527, n528, n529, n530;
  assign n1 = b[0];
  assign n409 = b[11];
  assign n410 = b[10];
  assign n411 = b[9];
  assign n412 = b[8];
  assign n413 = b[7];
  assign n414 = b[6];
  assign n415 = b[5];
  assign n416 = b[4];
  assign n417 = b[3];
  assign n418 = b[2];
  assign n419 = b[1];
  assign n445 = a[11];
  assign n446 = a[9];
  assign n447 = a[7];
  assign n448 = a[5];
  assign n449 = a[3];
  assign n450 = a[1];

  CMPR42X2 U192 ( .A(n287), .B(n267), .C(n198), .D(n202), .ICI(n195), .S(n192), 
        .ICO(n190), .CO(n191) );
  CMPR42X2 U195 ( .A(n268), .B(n212), .C(n205), .D(n210), .ICI(n203), .S(n200), 
        .ICO(n198), .CO(n199) );
  XNOR2X4 U419 ( .A(n530), .B(a[10]), .Y(n433) );
  XNOR2X4 U422 ( .A(n447), .B(a[8]), .Y(n434) );
  XNOR2X4 U431 ( .A(n450), .B(a[2]), .Y(n437) );
  ADDHXL U437 ( .A(n326), .B(n256), .CO(n242), .S(n243) );
  ADDFX2 U438 ( .A(n265), .B(n275), .CI(n285), .CO(n180), .S(n181) );
  ADDHXL U439 ( .A(n322), .B(n254), .CO(n225), .S(n226) );
  ADDFX2 U440 ( .A(n291), .B(n281), .CI(n301), .CO(n223), .S(n224) );
  CMPR42X1 U441 ( .A(n294), .B(n325), .C(n314), .D(n304), .ICI(n242), .S(n239), 
        .ICO(n237), .CO(n238) );
  ADDHXL U442 ( .A(n324), .B(n255), .CO(n235), .S(n236) );
  CMPR42X1 U443 ( .A(n270), .B(n280), .C(n290), .D(n225), .ICI(n223), .S(n219), 
        .ICO(n217), .CO(n218) );
  CMPR42X1 U444 ( .A(n273), .B(n263), .C(n171), .D(n175), .ICI(n172), .S(n169), 
        .ICO(n167), .CO(n168) );
  ADDHXL U445 ( .A(n328), .B(n317), .CO(n246), .S(n247) );
  ADDFX2 U446 ( .A(n306), .B(n327), .CI(n316), .CO(n244), .S(n245) );
  ADDFX2 U447 ( .A(n315), .B(n305), .CI(n243), .CO(n240), .S(n241) );
  CMPR42X1 U448 ( .A(n313), .B(n293), .C(n303), .D(n236), .ICI(n237), .S(n234), 
        .ICO(n232), .CO(n233) );
  ADDFX2 U449 ( .A(n282), .B(n323), .CI(n292), .CO(n230), .S(n231) );
  NOR2BXL U450 ( .AN(n1), .B(n434), .Y(n282) );
  OAI22X1 U451 ( .A0(n429), .A1(n367), .B0(n366), .B1(n435), .Y(n292) );
  ADDHXL U452 ( .A(n320), .B(n253), .CO(n212), .S(n213) );
  CMPR42X1 U453 ( .A(n289), .B(n269), .C(n309), .D(n214), .ICI(n217), .S(n211), 
        .ICO(n209), .CO(n210) );
  CMPR42X1 U454 ( .A(n266), .B(n196), .C(n276), .D(n307), .ICI(n193), .S(n189), 
        .ICO(n187), .CO(n188) );
  CMPR42X1 U456 ( .A(n284), .B(n274), .C(n180), .D(n176), .ICI(n177), .S(n174), 
        .ICO(n172), .CO(n173) );
  NOR2X1 U457 ( .A(n208), .B(n215), .Y(n90) );
  OAI22X1 U458 ( .A0(n432), .A1(n400), .B0(n399), .B1(n462), .Y(n323) );
  OAI22X1 U459 ( .A0(n427), .A1(n339), .B0(n433), .B1(n338), .Y(n266) );
  OR2X1 U460 ( .A(n298), .B(n278), .Y(n204) );
  AOI21XL U461 ( .A0(n435), .A1(n429), .B0(n357), .Y(n514) );
  INVX1 U462 ( .A(n514), .Y(n283) );
  OAI22XL U464 ( .A0(n431), .A1(n443), .B0(n437), .B1(n395), .Y(n257) );
  OAI22X1 U465 ( .A0(n427), .A1(n341), .B0(n433), .B1(n340), .Y(n268) );
  NAND2X1 U466 ( .A(n330), .B(n258), .Y(n135) );
  OAI22XL U467 ( .A0(n430), .A1(n371), .B0(n370), .B1(n436), .Y(n182) );
  AOI21X1 U469 ( .A0(n107), .A1(n115), .B0(n108), .Y(n106) );
  AOI21X1 U470 ( .A0(n462), .A1(n432), .B0(n396), .Y(n515) );
  INVX1 U471 ( .A(n515), .Y(n319) );
  NAND2BX1 U472 ( .AN(n60), .B(n61), .Y(n9) );
  OAI22XL U473 ( .A0(n431), .A1(n388), .B0(n387), .B1(n437), .Y(n311) );
  XNOR2X1 U474 ( .A(n160), .B(n159), .Y(n5) );
  AOI22X1 U475 ( .A0(n520), .A1(n131), .B0(n247), .B1(n257), .Y(n126) );
  OAI22XL U476 ( .A0(n430), .A1(n372), .B0(n371), .B1(n436), .Y(n296) );
  NAND2BX1 U477 ( .AN(n39), .B(n40), .Y(n6) );
  OAI22XL U478 ( .A0(n430), .A1(n376), .B0(n375), .B1(n436), .Y(n300) );
  NOR2BX1 U479 ( .AN(n70), .B(n65), .Y(n63) );
  XOR2X1 U480 ( .A(n158), .B(n259), .Y(n4) );
  OAI2BB2X1 U481 ( .B0(n126), .B1(n124), .A0N(n245), .A1N(n246), .Y(n123) );
  OAI22XL U482 ( .A0(n431), .A1(n387), .B0(n386), .B1(n437), .Y(n310) );
  NAND2BX1 U483 ( .AN(n65), .B(n68), .Y(n10) );
  AOI22X1 U484 ( .A0(n522), .A1(n123), .B0(n241), .B1(n244), .Y(n118) );
  OAI22XL U485 ( .A0(n430), .A1(n378), .B0(n377), .B1(n436), .Y(n302) );
  NAND2BX1 U486 ( .AN(n90), .B(n91), .Y(n14) );
  AOI21X1 U487 ( .A0(n83), .A1(n79), .B0(n80), .Y(n78) );
  INVX1 U488 ( .A(n84), .Y(n83) );
  OAI22XL U489 ( .A0(n431), .A1(n389), .B0(n388), .B1(n437), .Y(n312) );
  AOI22X1 U490 ( .A0(n38), .A1(n525), .B0(n160), .B1(n159), .Y(n516) );
  INVX1 U491 ( .A(n516), .Y(n29) );
  NAND2BXL U493 ( .AN(n76), .B(n77), .Y(n11) );
  OR2X2 U494 ( .A(n216), .B(n221), .Y(n517) );
  AND2X2 U495 ( .A(n222), .B(n228), .Y(n518) );
  OR2X2 U496 ( .A(n166), .B(n168), .Y(n519) );
  OR2X2 U497 ( .A(n247), .B(n257), .Y(n520) );
  OR2X2 U499 ( .A(n241), .B(n244), .Y(n522) );
  OR2X2 U500 ( .A(n222), .B(n228), .Y(n523) );
  OR2X2 U501 ( .A(n173), .B(n169), .Y(n524) );
  OR2X2 U502 ( .A(n160), .B(n159), .Y(n525) );
  AOI21XL U506 ( .A0(n83), .A1(n70), .B0(n71), .Y(n69) );
  AOI21X4 U507 ( .A0(n85), .A1(n93), .B0(n86), .Y(n84) );
  XNOR2X4 U509 ( .A(n449), .B(a[4]), .Y(n436) );
  OAI22XL U512 ( .A0(n431), .A1(n386), .B0(n385), .B1(n437), .Y(n309) );
  OAI22XL U513 ( .A0(n427), .A1(n342), .B0(n433), .B1(n341), .Y(n269) );
  OAI22XL U514 ( .A0(n429), .A1(n364), .B0(n363), .B1(n435), .Y(n289) );
  OAI22XL U515 ( .A0(n431), .A1(n391), .B0(n390), .B1(n437), .Y(n314) );
  OAI22XL U516 ( .A0(n432), .A1(n403), .B0(n402), .B1(n462), .Y(n326) );
  OAI22XL U517 ( .A0(n430), .A1(n442), .B0(n436), .B1(n382), .Y(n256) );
  NAND2BXL U518 ( .AN(n1), .B(n448), .Y(n382) );
  OAI22XL U519 ( .A0(n432), .A1(n399), .B0(n398), .B1(n462), .Y(n322) );
  OAI22XL U520 ( .A0(n428), .A1(n529), .B0(n434), .B1(n356), .Y(n254) );
  OAI22XL U522 ( .A0(n430), .A1(n377), .B0(n376), .B1(n436), .Y(n301) );
  OAI22XL U523 ( .A0(n428), .A1(n355), .B0(n354), .B1(n434), .Y(n281) );
  OAI22XL U524 ( .A0(n429), .A1(n366), .B0(n365), .B1(n435), .Y(n291) );
  OAI22XL U525 ( .A0(n432), .A1(n397), .B0(n396), .B1(n462), .Y(n320) );
  OAI22X1 U526 ( .A0(n427), .A1(n439), .B0(n433), .B1(n343), .Y(n253) );
  INVXL U527 ( .A(n445), .Y(n439) );
  OAI22XL U528 ( .A0(n431), .A1(n385), .B0(n384), .B1(n437), .Y(n308) );
  OAI22XL U529 ( .A0(n429), .A1(n363), .B0(n362), .B1(n435), .Y(n288) );
  ADDFX2 U530 ( .A(n264), .B(n182), .CI(n295), .CO(n175), .S(n176) );
  OAI22XL U532 ( .A0(n427), .A1(n337), .B0(n433), .B1(n336), .Y(n264) );
  OAI22XL U534 ( .A0(n429), .A1(n360), .B0(n359), .B1(n435), .Y(n285) );
  OAI22XL U535 ( .A0(n428), .A1(n349), .B0(n348), .B1(n434), .Y(n275) );
  OAI22XL U536 ( .A0(n427), .A1(n338), .B0(n433), .B1(n337), .Y(n265) );
  OAI22XL U537 ( .A0(n428), .A1(n351), .B0(n350), .B1(n434), .Y(n277) );
  OAI22X1 U538 ( .A0(n431), .A1(n384), .B0(n383), .B1(n437), .Y(n196) );
  OAI22XL U539 ( .A0(n432), .A1(n402), .B0(n401), .B1(n462), .Y(n325) );
  NOR2BXL U540 ( .AN(n1), .B(n435), .Y(n294) );
  OAI22XL U541 ( .A0(n430), .A1(n380), .B0(n379), .B1(n436), .Y(n304) );
  OAI22XL U542 ( .A0(n432), .A1(n401), .B0(n400), .B1(n462), .Y(n324) );
  OAI22XL U543 ( .A0(n429), .A1(n441), .B0(n435), .B1(n369), .Y(n255) );
  INVXL U544 ( .A(n447), .Y(n441) );
  NOR2BXL U545 ( .AN(n1), .B(n433), .Y(n270) );
  OAI22XL U546 ( .A0(n429), .A1(n365), .B0(n364), .B1(n435), .Y(n290) );
  OAI22XL U547 ( .A0(n428), .A1(n354), .B0(n353), .B1(n434), .Y(n280) );
  XNOR2X1 U548 ( .A(n298), .B(n278), .Y(n205) );
  OAI22XL U549 ( .A0(n427), .A1(n336), .B0(n433), .B1(n335), .Y(n263) );
  INVXL U550 ( .A(n170), .Y(n171) );
  OAI22XL U551 ( .A0(n428), .A1(n347), .B0(n346), .B1(n434), .Y(n273) );
  INVXL U552 ( .A(n449), .Y(n443) );
  NAND2BXL U553 ( .AN(n1), .B(n449), .Y(n395) );
  OAI22X1 U554 ( .A0(n432), .A1(n406), .B0(n405), .B1(n462), .Y(n329) );
  OAI22XL U555 ( .A0(n432), .A1(n444), .B0(n408), .B1(n462), .Y(n258) );
  OAI22XL U556 ( .A0(n432), .A1(n407), .B0(n406), .B1(n462), .Y(n330) );
  NAND2BXL U557 ( .AN(n1), .B(n450), .Y(n408) );
  OAI22XL U558 ( .A0(n432), .A1(n404), .B0(n403), .B1(n462), .Y(n327) );
  NOR2BXL U559 ( .AN(n1), .B(n436), .Y(n306) );
  OAI22XL U560 ( .A0(n431), .A1(n393), .B0(n392), .B1(n437), .Y(n316) );
  OAI22XL U561 ( .A0(n432), .A1(n405), .B0(n404), .B1(n462), .Y(n328) );
  OAI22XL U562 ( .A0(n431), .A1(n394), .B0(n393), .B1(n437), .Y(n317) );
  XNOR2X1 U563 ( .A(n449), .B(n1), .Y(n394) );
  OAI22XL U564 ( .A0(n430), .A1(n381), .B0(n380), .B1(n436), .Y(n305) );
  OAI22XL U565 ( .A0(n431), .A1(n392), .B0(n391), .B1(n437), .Y(n315) );
  XNOR2X1 U566 ( .A(n448), .B(n1), .Y(n381) );
  OAI22XL U567 ( .A0(n430), .A1(n379), .B0(n378), .B1(n436), .Y(n303) );
  OAI22XL U568 ( .A0(n429), .A1(n368), .B0(n367), .B1(n435), .Y(n293) );
  OAI22XL U569 ( .A0(n431), .A1(n390), .B0(n389), .B1(n437), .Y(n313) );
  OAI22XL U571 ( .A0(n428), .A1(n350), .B0(n349), .B1(n434), .Y(n276) );
  OAI22XL U572 ( .A0(n429), .A1(n358), .B0(n357), .B1(n435), .Y(n170) );
  OAI22XL U573 ( .A0(n430), .A1(n375), .B0(n374), .B1(n436), .Y(n299) );
  OAI22XL U574 ( .A0(n428), .A1(n353), .B0(n352), .B1(n434), .Y(n279) );
  OAI22XL U575 ( .A0(n427), .A1(n340), .B0(n433), .B1(n339), .Y(n267) );
  OAI22XL U576 ( .A0(n429), .A1(n362), .B0(n361), .B1(n435), .Y(n287) );
  OAI22XL U577 ( .A0(n428), .A1(n348), .B0(n347), .B1(n434), .Y(n274) );
  OAI22XL U578 ( .A0(n429), .A1(n359), .B0(n358), .B1(n435), .Y(n284) );
  CMPR42X1 U579 ( .A(n170), .B(n262), .C(n272), .D(n283), .ICI(n167), .S(n166), 
        .ICO(n164), .CO(n165) );
  OAI22XL U580 ( .A0(n428), .A1(n346), .B0(n345), .B1(n434), .Y(n272) );
  OAI22XL U581 ( .A0(n427), .A1(n335), .B0(n433), .B1(n334), .Y(n262) );
  ADDFX2 U582 ( .A(n261), .B(n163), .CI(n164), .CO(n160), .S(n161) );
  OAI22XL U583 ( .A0(n427), .A1(n334), .B0(n433), .B1(n333), .Y(n261) );
  INVX1 U584 ( .A(n162), .Y(n163) );
  OAI22XL U585 ( .A0(n428), .A1(n345), .B0(n344), .B1(n434), .Y(n162) );
  INVX1 U586 ( .A(n448), .Y(n442) );
  NOR2BX1 U587 ( .AN(n1), .B(n437), .Y(n318) );
  XNOR2X1 U588 ( .A(n450), .B(n419), .Y(n406) );
  XNOR2X1 U589 ( .A(n450), .B(n1), .Y(n407) );
  INVX1 U590 ( .A(n450), .Y(n444) );
  XNOR2X1 U591 ( .A(n450), .B(n416), .Y(n403) );
  XNOR2X1 U592 ( .A(n450), .B(n418), .Y(n405) );
  XNOR2X1 U593 ( .A(n449), .B(n419), .Y(n393) );
  XNOR2X1 U594 ( .A(n450), .B(n417), .Y(n404) );
  XNOR2X1 U595 ( .A(n449), .B(n409), .Y(n383) );
  XNOR2X1 U596 ( .A(n450), .B(n415), .Y(n402) );
  XNOR2X1 U597 ( .A(n449), .B(n417), .Y(n391) );
  XNOR2X1 U598 ( .A(n449), .B(n418), .Y(n392) );
  XNOR2X1 U599 ( .A(n448), .B(n419), .Y(n380) );
  NOR2X1 U600 ( .A(n329), .B(n318), .Y(n132) );
  NAND2BX1 U602 ( .AN(n1), .B(n447), .Y(n369) );
  XNOR2X1 U603 ( .A(n450), .B(n414), .Y(n401) );
  XNOR2X1 U604 ( .A(n447), .B(n1), .Y(n368) );
  XNOR2X1 U605 ( .A(n449), .B(n416), .Y(n390) );
  XNOR2X1 U606 ( .A(n448), .B(n418), .Y(n379) );
  NAND2BX1 U607 ( .AN(n1), .B(n530), .Y(n356) );
  XNOR2X1 U608 ( .A(n530), .B(n1), .Y(n355) );
  XNOR2X1 U609 ( .A(n447), .B(n418), .Y(n366) );
  XNOR2X1 U610 ( .A(n450), .B(n412), .Y(n399) );
  XNOR2X1 U611 ( .A(n450), .B(n413), .Y(n400) );
  XNOR2X1 U612 ( .A(n447), .B(n419), .Y(n367) );
  XNOR2X1 U613 ( .A(n530), .B(n419), .Y(n354) );
  XNOR2X1 U614 ( .A(n447), .B(n417), .Y(n365) );
  XNOR2X1 U615 ( .A(n530), .B(n416), .Y(n351) );
  XNOR2X1 U616 ( .A(n447), .B(n416), .Y(n364) );
  XNOR2X1 U617 ( .A(n445), .B(n1), .Y(n342) );
  XNOR2X1 U618 ( .A(n450), .B(n409), .Y(n396) );
  NAND2BX1 U619 ( .AN(n1), .B(n445), .Y(n343) );
  XNOR2X1 U620 ( .A(n447), .B(n415), .Y(n363) );
  XNOR2X1 U621 ( .A(n449), .B(n411), .Y(n385) );
  XNOR2X1 U622 ( .A(n449), .B(n410), .Y(n384) );
  XNOR2X1 U623 ( .A(n448), .B(n412), .Y(n373) );
  XNOR2X1 U624 ( .A(n530), .B(n415), .Y(n350) );
  XNOR2X1 U626 ( .A(n448), .B(n409), .Y(n370) );
  XNOR2X1 U627 ( .A(n445), .B(n416), .Y(n338) );
  XNOR2X1 U628 ( .A(n445), .B(n415), .Y(n337) );
  XNOR2X1 U629 ( .A(n530), .B(n414), .Y(n349) );
  XNOR2X1 U630 ( .A(n447), .B(n409), .Y(n357) );
  NOR2X1 U632 ( .A(n245), .B(n246), .Y(n124) );
  XNOR2X1 U633 ( .A(n448), .B(n416), .Y(n377) );
  XNOR2X1 U634 ( .A(n449), .B(n415), .Y(n389) );
  XNOR2X1 U635 ( .A(n448), .B(n417), .Y(n378) );
  XNOR2X1 U636 ( .A(n449), .B(n414), .Y(n388) );
  XNOR2X1 U637 ( .A(n448), .B(n415), .Y(n376) );
  XNOR2X1 U638 ( .A(n449), .B(n413), .Y(n387) );
  XNOR2X1 U639 ( .A(n450), .B(n410), .Y(n397) );
  XNOR2X1 U640 ( .A(n450), .B(n411), .Y(n398) );
  XOR2X1 U641 ( .A(n450), .B(a[0]), .Y(n426) );
  CLKINVX3 U642 ( .A(a[0]), .Y(n462) );
  XNOR2X1 U643 ( .A(n449), .B(n412), .Y(n386) );
  XOR2X1 U644 ( .A(n449), .B(a[2]), .Y(n425) );
  XNOR2X1 U645 ( .A(n530), .B(n418), .Y(n353) );
  XNOR2X1 U646 ( .A(n448), .B(n414), .Y(n375) );
  XNOR2X1 U647 ( .A(n530), .B(n417), .Y(n352) );
  XNOR2X1 U648 ( .A(n448), .B(n413), .Y(n374) );
  XNOR2X1 U649 ( .A(n445), .B(n419), .Y(n341) );
  OAI22X1 U650 ( .A0(n430), .A1(n374), .B0(n373), .B1(n436), .Y(n298) );
  XNOR2X1 U651 ( .A(n447), .B(n414), .Y(n362) );
  XNOR2X1 U652 ( .A(n445), .B(n417), .Y(n339) );
  XNOR2X1 U653 ( .A(n445), .B(n418), .Y(n340) );
  XNOR2X1 U654 ( .A(n448), .B(n410), .Y(n371) );
  XOR2X1 U655 ( .A(n448), .B(a[4]), .Y(n424) );
  XNOR2X1 U656 ( .A(n448), .B(n411), .Y(n372) );
  XNOR2X1 U657 ( .A(n447), .B(n412), .Y(n360) );
  XNOR2X1 U658 ( .A(n447), .B(n413), .Y(n361) );
  CMPR42X1 U659 ( .A(n277), .B(n297), .C(n197), .D(n204), .ICI(n201), .S(n195), 
        .ICO(n193), .CO(n194) );
  INVX1 U660 ( .A(n196), .Y(n197) );
  OAI22X1 U661 ( .A0(n430), .A1(n373), .B0(n372), .B1(n436), .Y(n297) );
  XNOR2X1 U662 ( .A(n445), .B(n414), .Y(n336) );
  XNOR2X1 U663 ( .A(n447), .B(n410), .Y(n358) );
  XNOR2X1 U664 ( .A(n530), .B(n412), .Y(n347) );
  XNOR2X1 U665 ( .A(n530), .B(n413), .Y(n348) );
  XNOR2X1 U666 ( .A(n447), .B(n411), .Y(n359) );
  XNOR2X1 U667 ( .A(n530), .B(n411), .Y(n346) );
  XNOR2X1 U668 ( .A(n445), .B(n413), .Y(n335) );
  XOR2X1 U669 ( .A(n447), .B(a[6]), .Y(n423) );
  XNOR2X1 U670 ( .A(n445), .B(n412), .Y(n334) );
  XNOR2X1 U671 ( .A(n530), .B(n410), .Y(n345) );
  NAND2X1 U672 ( .A(n229), .B(n233), .Y(n110) );
  NAND2X1 U673 ( .A(n234), .B(n238), .Y(n113) );
  NOR2X1 U674 ( .A(n229), .B(n233), .Y(n109) );
  NOR2X1 U675 ( .A(n234), .B(n238), .Y(n112) );
  NOR2X1 U676 ( .A(n239), .B(n240), .Y(n116) );
  NAND2X1 U677 ( .A(n239), .B(n240), .Y(n117) );
  CMPR42X1 U678 ( .A(n312), .B(n302), .C(n235), .D(n232), .ICI(n231), .S(n229), 
        .ICO(n227), .CO(n228) );
  CMPR42X1 U679 ( .A(n311), .B(n226), .C(n230), .D(n224), .ICI(n227), .S(n222), 
        .ICO(n220), .CO(n221) );
  CMPR42X1 U680 ( .A(n321), .B(n300), .C(n310), .D(n220), .ICI(n219), .S(n216), 
        .ICO(n214), .CO(n215) );
  OAI22X1 U681 ( .A0(n432), .A1(n398), .B0(n397), .B1(n462), .Y(n321) );
  NAND2X1 U682 ( .A(n517), .B(n523), .Y(n94) );
  AOI21X1 U683 ( .A0(n517), .A1(n518), .B0(n97), .Y(n95) );
  INVX1 U684 ( .A(n99), .Y(n97) );
  NOR2X1 U685 ( .A(n192), .B(n199), .Y(n81) );
  CMPR42X1 U686 ( .A(n296), .B(n286), .C(n190), .D(n194), .ICI(n189), .S(n186), 
        .ICO(n184), .CO(n185) );
  OAI22X1 U687 ( .A0(n429), .A1(n361), .B0(n360), .B1(n435), .Y(n286) );
  CMPR42X1 U688 ( .A(n183), .B(n187), .C(n181), .D(n188), .ICI(n184), .S(n179), 
        .ICO(n177), .CO(n178) );
  INVX1 U689 ( .A(n182), .Y(n183) );
  AOI21X1 U690 ( .A0(n52), .A1(n519), .B0(n47), .Y(n45) );
  INVX1 U691 ( .A(n49), .Y(n47) );
  NAND2X1 U692 ( .A(n524), .B(n519), .Y(n44) );
  XNOR2X1 U693 ( .A(n530), .B(n409), .Y(n344) );
  XNOR2X1 U694 ( .A(n445), .B(n411), .Y(n333) );
  XOR2X1 U695 ( .A(n530), .B(a[8]), .Y(n422) );
  XOR2X1 U696 ( .A(n445), .B(a[10]), .Y(n421) );
  XNOR2X1 U697 ( .A(n445), .B(n410), .Y(n332) );
  OAI21XL U698 ( .A0(n68), .A1(n60), .B0(n61), .Y(n59) );
  NAND2X1 U701 ( .A(n216), .B(n221), .Y(n99) );
  OAI21XL U702 ( .A0(n118), .A1(n116), .B0(n117), .Y(n115) );
  NOR2X1 U703 ( .A(n109), .B(n112), .Y(n107) );
  OAI21XL U704 ( .A0(n109), .A1(n113), .B0(n110), .Y(n108) );
  NAND2X1 U706 ( .A(n208), .B(n215), .Y(n91) );
  NAND2X1 U707 ( .A(n200), .B(n207), .Y(n88) );
  INVX1 U708 ( .A(n93), .Y(n92) );
  INVX1 U711 ( .A(n81), .Y(n79) );
  INVX1 U712 ( .A(n82), .Y(n80) );
  NAND2X1 U713 ( .A(n186), .B(n191), .Y(n77) );
  NAND2X1 U715 ( .A(n179), .B(n185), .Y(n68) );
  NOR2X1 U716 ( .A(n178), .B(n174), .Y(n60) );
  OAI21XL U717 ( .A0(n73), .A1(n65), .B0(n68), .Y(n64) );
  INVX1 U718 ( .A(n71), .Y(n73) );
  NAND2X1 U719 ( .A(n178), .B(n174), .Y(n61) );
  NAND2X1 U720 ( .A(n173), .B(n169), .Y(n54) );
  NAND2X1 U721 ( .A(n166), .B(n168), .Y(n49) );
  INVX1 U722 ( .A(n54), .Y(n52) );
  NOR2X1 U723 ( .A(n165), .B(n161), .Y(n39) );
  INVX1 U724 ( .A(n45), .Y(n43) );
  NAND2X1 U726 ( .A(n165), .B(n161), .Y(n40) );
  OAI21XL U727 ( .A0(n45), .A1(n39), .B0(n40), .Y(n38) );
  NOR2X1 U728 ( .A(n44), .B(n39), .Y(n37) );
  ADDFX2 U729 ( .A(n162), .B(n260), .CI(n271), .CO(n158), .S(n159) );
  OAI22X1 U731 ( .A0(n427), .A1(n333), .B0(n433), .B1(n332), .Y(n260) );
  XNOR2X1 U734 ( .A(n445), .B(n409), .Y(n331) );
  NOR2X1 U735 ( .A(n65), .B(n60), .Y(n58) );
  XOR2X1 U736 ( .A(n100), .B(n15), .Y(product[10]) );
  NAND2X1 U737 ( .A(n517), .B(n99), .Y(n15) );
  AOI21X1 U738 ( .A0(n105), .A1(n523), .B0(n518), .Y(n100) );
  INVX1 U739 ( .A(n106), .Y(n105) );
  XOR2X1 U740 ( .A(n92), .B(n14), .Y(product[11]) );
  XNOR2X1 U741 ( .A(n89), .B(n13), .Y(product[12]) );
  OAI21XL U742 ( .A0(n92), .A1(n90), .B0(n91), .Y(n89) );
  XNOR2X1 U743 ( .A(n83), .B(n12), .Y(product[13]) );
  NAND2X1 U744 ( .A(n79), .B(n82), .Y(n12) );
  XOR2X1 U745 ( .A(n78), .B(n11), .Y(product[14]) );
  XOR2X1 U746 ( .A(n69), .B(n10), .Y(product[15]) );
  XOR2X1 U747 ( .A(n62), .B(n9), .Y(product[16]) );
  XNOR2X1 U748 ( .A(n3), .B(n8), .Y(product[17]) );
  NAND2X1 U749 ( .A(n524), .B(n54), .Y(n8) );
  XOR2X1 U750 ( .A(n50), .B(n7), .Y(product[18]) );
  NAND2X1 U751 ( .A(n519), .B(n49), .Y(n7) );
  AOI21X1 U752 ( .A0(n3), .A1(n524), .B0(n52), .Y(n50) );
  XOR2X1 U753 ( .A(n41), .B(n6), .Y(product[19]) );
  XOR2X1 U755 ( .A(n36), .B(n5), .Y(product[20]) );
  AOI21X1 U756 ( .A0(n3), .A1(n37), .B0(n38), .Y(n36) );
  XOR2X1 U757 ( .A(n27), .B(n4), .Y(product[21]) );
  NOR2X1 U455 ( .A(n76), .B(n81), .Y(n70) );
  NOR2X1 U463 ( .A(n186), .B(n191), .Y(n76) );
  AOI21X2 U492 ( .A0(n71), .A1(n58), .B0(n59), .Y(n57) );
  OAI21X1 U498 ( .A0(n76), .A1(n82), .B0(n77), .Y(n71) );
  CMPR42X1 U503 ( .A(n288), .B(n308), .C(n319), .D(n209), .ICI(n206), .S(n203), 
        .ICO(n201), .CO(n202) );
  NAND2X2 U505 ( .A(n434), .B(n422), .Y(n428) );
  NAND2X1 U508 ( .A(n192), .B(n199), .Y(n82) );
  AOI21X1 U510 ( .A0(n436), .A1(n430), .B0(n370), .Y(n526) );
  INVX1 U511 ( .A(n526), .Y(n295) );
  AOI21XL U521 ( .A0(n437), .A1(n431), .B0(n383), .Y(n527) );
  INVX1 U531 ( .A(n527), .Y(n307) );
  OAI21X1 U533 ( .A0(n106), .A1(n94), .B0(n95), .Y(n93) );
  AOI21X1 U570 ( .A0(n434), .A1(n428), .B0(n344), .Y(n528) );
  INVX1 U601 ( .A(n528), .Y(n271) );
  AOI31X1 U625 ( .A0(n3), .A1(n524), .A2(n519), .B0(n43), .Y(n41) );
  OAI2BB2X1 U631 ( .B0(n132), .B1(n135), .A0N(n329), .A1N(n318), .Y(n131) );
  NAND2X2 U699 ( .A(n435), .B(n423), .Y(n429) );
  AOI31X1 U700 ( .A0(n3), .A1(n37), .A2(n525), .B0(n29), .Y(n27) );
  NAND2BXL U705 ( .AN(n87), .B(n88), .Y(n13) );
  OAI22XL U709 ( .A0(n427), .A1(n332), .B0(n433), .B1(n331), .Y(n259) );
  NOR2XL U710 ( .A(n87), .B(n90), .Y(n85) );
  OAI21X1 U714 ( .A0(n87), .A1(n91), .B0(n88), .Y(n86) );
  OAI21X4 U725 ( .A0(n56), .A1(n84), .B0(n57), .Y(n3) );
  XNOR2X4 U730 ( .A(n448), .B(a[6]), .Y(n435) );
  INVX1 U732 ( .A(n446), .Y(n529) );
  INVX8 U733 ( .A(n529), .Y(n530) );
  NAND2X2 U754 ( .A(n426), .B(n462), .Y(n432) );
  NAND2X2 U758 ( .A(n437), .B(n425), .Y(n431) );
  OAI22X1 U759 ( .A0(n428), .A1(n352), .B0(n351), .B1(n434), .Y(n278) );
  CMPR42X1 U760 ( .A(n299), .B(n279), .C(n213), .D(n218), .ICI(n211), .S(n208), 
        .ICO(n206), .CO(n207) );
  NAND2X2 U761 ( .A(n433), .B(n421), .Y(n427) );
  NAND2X1 U762 ( .A(n70), .B(n58), .Y(n56) );
  NOR2X1 U763 ( .A(n200), .B(n207), .Y(n87) );
  AOI21X1 U764 ( .A0(n63), .A1(n83), .B0(n64), .Y(n62) );
  NAND2X4 U468 ( .A(n436), .B(n424), .Y(n430) );
  NOR2X2 U504 ( .A(n179), .B(n185), .Y(n65) );
endmodule


module multiply_WIDTH12_1_DW_mult_tc_11 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n27,
         n29, n35, n36, n37, n38, n39, n40, n41, n43, n44, n45, n47, n49, n50,
         n52, n54, n56, n57, n58, n59, n60, n61, n62, n64, n65, n68, n69, n70,
         n71, n73, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n97, n99, n100, n105, n106,
         n107, n108, n109, n110, n112, n113, n115, n116, n117, n118, n123,
         n124, n126, n131, n132, n135, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n462, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527;
  assign n1 = b[0];
  assign n409 = b[11];
  assign n410 = b[10];
  assign n411 = b[9];
  assign n412 = b[8];
  assign n413 = b[7];
  assign n414 = b[6];
  assign n415 = b[5];
  assign n416 = b[4];
  assign n417 = b[3];
  assign n418 = b[2];
  assign n419 = b[1];
  assign n445 = a[11];
  assign n446 = a[9];
  assign n447 = a[7];
  assign n448 = a[5];
  assign n449 = a[3];
  assign n450 = a[1];

  CMPR42X2 U192 ( .A(n287), .B(n267), .C(n198), .D(n202), .ICI(n195), .S(n192), 
        .ICO(n190), .CO(n191) );
  XNOR2X4 U422 ( .A(n447), .B(a[8]), .Y(n434) );
  XNOR2X4 U425 ( .A(n448), .B(a[6]), .Y(n435) );
  XNOR2X4 U431 ( .A(n450), .B(a[2]), .Y(n437) );
  ADDHXL U437 ( .A(n326), .B(n256), .CO(n242), .S(n243) );
  CMPR42X1 U438 ( .A(n294), .B(n325), .C(n314), .D(n304), .ICI(n242), .S(n239), 
        .ICO(n237), .CO(n238) );
  ADDHXL U439 ( .A(n324), .B(n255), .CO(n235), .S(n236) );
  ADDHXL U440 ( .A(n322), .B(n254), .CO(n225), .S(n226) );
  ADDFX2 U441 ( .A(n291), .B(n281), .CI(n301), .CO(n223), .S(n224) );
  ADDHXL U442 ( .A(n320), .B(n253), .CO(n212), .S(n213) );
  ADDFX2 U443 ( .A(n265), .B(n275), .CI(n285), .CO(n180), .S(n181) );
  NOR2X1 U444 ( .A(n178), .B(n174), .Y(n60) );
  NOR2X2 U445 ( .A(n179), .B(n185), .Y(n65) );
  NOR2X2 U446 ( .A(n186), .B(n191), .Y(n76) );
  CMPR42X1 U447 ( .A(n266), .B(n196), .C(n276), .D(n307), .ICI(n193), .S(n189), 
        .ICO(n187), .CO(n188) );
  ADDHXL U449 ( .A(n328), .B(n317), .CO(n246), .S(n247) );
  ADDFX2 U450 ( .A(n306), .B(n327), .CI(n316), .CO(n244), .S(n245) );
  ADDFX2 U451 ( .A(n315), .B(n305), .CI(n243), .CO(n240), .S(n241) );
  CMPR42X1 U452 ( .A(n313), .B(n293), .C(n303), .D(n236), .ICI(n237), .S(n234), 
        .ICO(n232), .CO(n233) );
  ADDFX2 U453 ( .A(n282), .B(n323), .CI(n292), .CO(n230), .S(n231) );
  NOR2BX1 U454 ( .AN(n1), .B(n434), .Y(n282) );
  CMPR42X1 U455 ( .A(n299), .B(n279), .C(n213), .D(n218), .ICI(n211), .S(n208), 
        .ICO(n206), .CO(n207) );
  CMPR42X1 U456 ( .A(n273), .B(n263), .C(n171), .D(n175), .ICI(n172), .S(n169), 
        .ICO(n167), .CO(n168) );
  NOR2X1 U458 ( .A(n208), .B(n215), .Y(n90) );
  AOI21X1 U459 ( .A0(n71), .A1(n58), .B0(n59), .Y(n57) );
  OAI22X1 U460 ( .A0(n427), .A1(n339), .B0(n433), .B1(n338), .Y(n266) );
  OAI21X1 U461 ( .A0(n106), .A1(n94), .B0(n95), .Y(n93) );
  AOI21X1 U462 ( .A0(n107), .A1(n115), .B0(n108), .Y(n106) );
  OAI22X1 U463 ( .A0(n429), .A1(n367), .B0(n366), .B1(n435), .Y(n292) );
  NOR2X1 U464 ( .A(n65), .B(n60), .Y(n58) );
  AOI31X1 U465 ( .A0(n514), .A1(n83), .A2(n70), .B0(n64), .Y(n62) );
  INVX1 U466 ( .A(n65), .Y(n514) );
  NAND2BX1 U467 ( .AN(n60), .B(n61), .Y(n9) );
  OAI22X1 U468 ( .A0(n432), .A1(n400), .B0(n399), .B1(n462), .Y(n323) );
  NAND2BX1 U469 ( .AN(n65), .B(n68), .Y(n10) );
  NAND2X1 U470 ( .A(n330), .B(n258), .Y(n135) );
  AOI21X1 U471 ( .A0(n436), .A1(n430), .B0(n370), .Y(n515) );
  INVX1 U472 ( .A(n515), .Y(n295) );
  NAND2BX1 U473 ( .AN(n76), .B(n77), .Y(n11) );
  AOI21X1 U474 ( .A0(n462), .A1(n432), .B0(n396), .Y(n516) );
  INVX1 U475 ( .A(n516), .Y(n319) );
  OAI2BB1X1 U476 ( .A0N(n38), .A1N(n526), .B0(n35), .Y(n29) );
  AOI21X1 U477 ( .A0(n3), .A1(n525), .B0(n52), .Y(n50) );
  AOI22X1 U478 ( .A0(n522), .A1(n131), .B0(n247), .B1(n257), .Y(n126) );
  AOI21X1 U479 ( .A0(n434), .A1(n428), .B0(n344), .Y(n517) );
  INVX1 U480 ( .A(n517), .Y(n271) );
  NAND2BX1 U481 ( .AN(n39), .B(n40), .Y(n6) );
  OAI22X1 U482 ( .A0(n428), .A1(n352), .B0(n351), .B1(n434), .Y(n278) );
  OAI2BB2X1 U483 ( .B0(n126), .B1(n124), .A0N(n245), .A1N(n246), .Y(n123) );
  NAND2BX1 U484 ( .AN(n90), .B(n91), .Y(n14) );
  AOI31X1 U485 ( .A0(n3), .A1(n37), .A2(n526), .B0(n29), .Y(n27) );
  AOI22X1 U486 ( .A0(n523), .A1(n123), .B0(n241), .B1(n244), .Y(n118) );
  AOI21X1 U487 ( .A0(n435), .A1(n429), .B0(n357), .Y(n518) );
  INVX1 U488 ( .A(n518), .Y(n283) );
  NAND2BX1 U489 ( .AN(n87), .B(n88), .Y(n13) );
  XOR2X1 U490 ( .A(n158), .B(n259), .Y(n4) );
  OR2X2 U491 ( .A(n216), .B(n221), .Y(n519) );
  AND2X2 U492 ( .A(n222), .B(n228), .Y(n520) );
  OR2X2 U493 ( .A(n166), .B(n168), .Y(n521) );
  OR2X2 U494 ( .A(n247), .B(n257), .Y(n522) );
  OR2X2 U495 ( .A(n241), .B(n244), .Y(n523) );
  OR2X2 U496 ( .A(n222), .B(n228), .Y(n524) );
  OR2X2 U497 ( .A(n173), .B(n169), .Y(n525) );
  OR2X2 U498 ( .A(n160), .B(n159), .Y(n526) );
  XNOR2X4 U502 ( .A(n449), .B(a[4]), .Y(n436) );
  NAND2XL U506 ( .A(n70), .B(n58), .Y(n56) );
  OAI22XL U507 ( .A0(n431), .A1(n386), .B0(n385), .B1(n437), .Y(n309) );
  OAI22XL U508 ( .A0(n427), .A1(n342), .B0(n433), .B1(n341), .Y(n269) );
  OAI22XL U509 ( .A0(n429), .A1(n364), .B0(n363), .B1(n435), .Y(n289) );
  OAI22XL U510 ( .A0(n431), .A1(n391), .B0(n390), .B1(n437), .Y(n314) );
  OAI22XL U511 ( .A0(n432), .A1(n403), .B0(n402), .B1(n462), .Y(n326) );
  OAI22XL U512 ( .A0(n430), .A1(n442), .B0(n436), .B1(n382), .Y(n256) );
  NAND2BXL U513 ( .AN(n1), .B(n448), .Y(n382) );
  OAI22XL U514 ( .A0(n432), .A1(n399), .B0(n398), .B1(n462), .Y(n322) );
  OAI22XL U515 ( .A0(n428), .A1(n440), .B0(n434), .B1(n356), .Y(n254) );
  INVXL U516 ( .A(n446), .Y(n440) );
  OAI22XL U517 ( .A0(n430), .A1(n377), .B0(n376), .B1(n436), .Y(n301) );
  OAI22XL U518 ( .A0(n428), .A1(n355), .B0(n354), .B1(n434), .Y(n281) );
  OAI22XL U519 ( .A0(n429), .A1(n366), .B0(n365), .B1(n435), .Y(n291) );
  OAI22XL U520 ( .A0(n432), .A1(n397), .B0(n396), .B1(n462), .Y(n320) );
  OAI22X1 U521 ( .A0(n427), .A1(n439), .B0(n433), .B1(n343), .Y(n253) );
  INVXL U522 ( .A(n445), .Y(n439) );
  OAI22XL U523 ( .A0(n431), .A1(n385), .B0(n384), .B1(n437), .Y(n308) );
  OAI22XL U524 ( .A0(n429), .A1(n363), .B0(n362), .B1(n435), .Y(n288) );
  ADDFX2 U525 ( .A(n264), .B(n182), .CI(n295), .CO(n175), .S(n176) );
  OAI22XL U526 ( .A0(n427), .A1(n337), .B0(n433), .B1(n336), .Y(n264) );
  OAI22XL U527 ( .A0(n429), .A1(n360), .B0(n359), .B1(n435), .Y(n285) );
  OAI22XL U528 ( .A0(n428), .A1(n349), .B0(n348), .B1(n434), .Y(n275) );
  OAI22XL U529 ( .A0(n427), .A1(n338), .B0(n433), .B1(n337), .Y(n265) );
  OAI22XL U530 ( .A0(n428), .A1(n351), .B0(n350), .B1(n434), .Y(n277) );
  OAI22X1 U531 ( .A0(n431), .A1(n384), .B0(n383), .B1(n437), .Y(n196) );
  OAI22XL U532 ( .A0(n432), .A1(n402), .B0(n401), .B1(n462), .Y(n325) );
  NOR2BXL U533 ( .AN(n1), .B(n435), .Y(n294) );
  OAI22XL U534 ( .A0(n430), .A1(n380), .B0(n379), .B1(n436), .Y(n304) );
  OAI22XL U535 ( .A0(n432), .A1(n401), .B0(n400), .B1(n462), .Y(n324) );
  OAI22XL U536 ( .A0(n429), .A1(n441), .B0(n435), .B1(n369), .Y(n255) );
  INVXL U537 ( .A(n447), .Y(n441) );
  NOR2BXL U538 ( .AN(n1), .B(n433), .Y(n270) );
  OAI22XL U539 ( .A0(n429), .A1(n365), .B0(n364), .B1(n435), .Y(n290) );
  OAI22XL U540 ( .A0(n428), .A1(n354), .B0(n353), .B1(n434), .Y(n280) );
  OAI22XL U541 ( .A0(n427), .A1(n341), .B0(n433), .B1(n340), .Y(n268) );
  XNOR2X1 U542 ( .A(n298), .B(n278), .Y(n205) );
  OAI22XL U543 ( .A0(n427), .A1(n336), .B0(n433), .B1(n335), .Y(n263) );
  INVXL U544 ( .A(n170), .Y(n171) );
  OAI22XL U545 ( .A0(n428), .A1(n347), .B0(n346), .B1(n434), .Y(n273) );
  INVXL U547 ( .A(n449), .Y(n443) );
  NAND2BXL U548 ( .AN(n1), .B(n449), .Y(n395) );
  OAI22X1 U549 ( .A0(n432), .A1(n406), .B0(n405), .B1(n462), .Y(n329) );
  OAI22XL U550 ( .A0(n432), .A1(n444), .B0(n408), .B1(n462), .Y(n258) );
  OAI22XL U551 ( .A0(n432), .A1(n407), .B0(n406), .B1(n462), .Y(n330) );
  NAND2BXL U552 ( .AN(n1), .B(n450), .Y(n408) );
  OAI22XL U553 ( .A0(n432), .A1(n404), .B0(n403), .B1(n462), .Y(n327) );
  NOR2BXL U554 ( .AN(n1), .B(n436), .Y(n306) );
  OAI22XL U555 ( .A0(n431), .A1(n393), .B0(n392), .B1(n437), .Y(n316) );
  OAI22XL U556 ( .A0(n432), .A1(n405), .B0(n404), .B1(n462), .Y(n328) );
  OAI22XL U557 ( .A0(n431), .A1(n394), .B0(n393), .B1(n437), .Y(n317) );
  XNOR2X1 U558 ( .A(n449), .B(n1), .Y(n394) );
  OAI22XL U559 ( .A0(n430), .A1(n381), .B0(n380), .B1(n436), .Y(n305) );
  OAI22XL U560 ( .A0(n431), .A1(n392), .B0(n391), .B1(n437), .Y(n315) );
  XNOR2X1 U561 ( .A(n448), .B(n1), .Y(n381) );
  OAI22XL U562 ( .A0(n430), .A1(n379), .B0(n378), .B1(n436), .Y(n303) );
  OAI22XL U563 ( .A0(n429), .A1(n368), .B0(n367), .B1(n435), .Y(n293) );
  OAI22XL U564 ( .A0(n431), .A1(n390), .B0(n389), .B1(n437), .Y(n313) );
  OAI22XL U565 ( .A0(n428), .A1(n350), .B0(n349), .B1(n434), .Y(n276) );
  OAI22XL U566 ( .A0(n429), .A1(n358), .B0(n357), .B1(n435), .Y(n170) );
  OAI22XL U567 ( .A0(n430), .A1(n375), .B0(n374), .B1(n436), .Y(n299) );
  OAI22XL U568 ( .A0(n428), .A1(n353), .B0(n352), .B1(n434), .Y(n279) );
  OAI22XL U569 ( .A0(n427), .A1(n340), .B0(n433), .B1(n339), .Y(n267) );
  OAI22XL U570 ( .A0(n429), .A1(n362), .B0(n361), .B1(n435), .Y(n287) );
  OAI22XL U571 ( .A0(n428), .A1(n348), .B0(n347), .B1(n434), .Y(n274) );
  OAI22XL U572 ( .A0(n429), .A1(n359), .B0(n358), .B1(n435), .Y(n284) );
  CMPR42X1 U573 ( .A(n170), .B(n262), .C(n272), .D(n283), .ICI(n167), .S(n166), 
        .ICO(n164), .CO(n165) );
  OAI22XL U574 ( .A0(n428), .A1(n346), .B0(n345), .B1(n434), .Y(n272) );
  OAI22XL U575 ( .A0(n427), .A1(n335), .B0(n433), .B1(n334), .Y(n262) );
  ADDFX2 U576 ( .A(n261), .B(n163), .CI(n164), .CO(n160), .S(n161) );
  OAI22XL U577 ( .A0(n427), .A1(n334), .B0(n433), .B1(n333), .Y(n261) );
  INVX1 U578 ( .A(n162), .Y(n163) );
  OAI22XL U579 ( .A0(n428), .A1(n345), .B0(n344), .B1(n434), .Y(n162) );
  INVX1 U580 ( .A(n448), .Y(n442) );
  NOR2BX1 U581 ( .AN(n1), .B(n437), .Y(n318) );
  XNOR2X1 U582 ( .A(n450), .B(n419), .Y(n406) );
  XNOR2X1 U583 ( .A(n450), .B(n1), .Y(n407) );
  INVX1 U584 ( .A(n450), .Y(n444) );
  XNOR2X1 U585 ( .A(n450), .B(n416), .Y(n403) );
  XNOR2X1 U586 ( .A(n450), .B(n418), .Y(n405) );
  XNOR2X1 U587 ( .A(n449), .B(n419), .Y(n393) );
  XNOR2X1 U588 ( .A(n450), .B(n417), .Y(n404) );
  XNOR2X1 U589 ( .A(n449), .B(n409), .Y(n383) );
  XNOR2X1 U590 ( .A(n450), .B(n415), .Y(n402) );
  XNOR2X1 U591 ( .A(n449), .B(n417), .Y(n391) );
  XNOR2X1 U592 ( .A(n449), .B(n418), .Y(n392) );
  XNOR2X1 U593 ( .A(n448), .B(n419), .Y(n380) );
  NOR2X1 U594 ( .A(n329), .B(n318), .Y(n132) );
  NAND2BX1 U596 ( .AN(n1), .B(n447), .Y(n369) );
  XNOR2X1 U597 ( .A(n450), .B(n414), .Y(n401) );
  XNOR2X1 U598 ( .A(n447), .B(n1), .Y(n368) );
  XNOR2X1 U599 ( .A(n449), .B(n416), .Y(n390) );
  XNOR2X1 U600 ( .A(n448), .B(n418), .Y(n379) );
  NAND2BX1 U601 ( .AN(n1), .B(n446), .Y(n356) );
  XNOR2X1 U602 ( .A(n446), .B(n1), .Y(n355) );
  XNOR2X1 U603 ( .A(n447), .B(n418), .Y(n366) );
  XNOR2X1 U604 ( .A(n450), .B(n412), .Y(n399) );
  XNOR2X1 U605 ( .A(n450), .B(n413), .Y(n400) );
  XNOR2X1 U606 ( .A(n447), .B(n419), .Y(n367) );
  XNOR2X1 U607 ( .A(n446), .B(n419), .Y(n354) );
  XNOR2X1 U608 ( .A(n447), .B(n417), .Y(n365) );
  XNOR2X1 U609 ( .A(n446), .B(n416), .Y(n351) );
  XNOR2X1 U610 ( .A(n447), .B(n416), .Y(n364) );
  XNOR2X1 U611 ( .A(n445), .B(n1), .Y(n342) );
  XNOR2X1 U612 ( .A(n450), .B(n409), .Y(n396) );
  NAND2BX1 U613 ( .AN(n1), .B(n445), .Y(n343) );
  XNOR2X1 U614 ( .A(n447), .B(n415), .Y(n363) );
  XNOR2X1 U615 ( .A(n449), .B(n411), .Y(n385) );
  XNOR2X1 U616 ( .A(n449), .B(n410), .Y(n384) );
  XNOR2X1 U617 ( .A(n448), .B(n412), .Y(n373) );
  XNOR2X1 U618 ( .A(n446), .B(n415), .Y(n350) );
  XNOR2X1 U620 ( .A(n448), .B(n409), .Y(n370) );
  XNOR2X1 U621 ( .A(n445), .B(n416), .Y(n338) );
  XNOR2X1 U622 ( .A(n445), .B(n415), .Y(n337) );
  XNOR2X1 U623 ( .A(n446), .B(n414), .Y(n349) );
  XNOR2X1 U624 ( .A(n447), .B(n409), .Y(n357) );
  NOR2X1 U626 ( .A(n245), .B(n246), .Y(n124) );
  XNOR2X1 U627 ( .A(n448), .B(n416), .Y(n377) );
  XNOR2X1 U628 ( .A(n449), .B(n415), .Y(n389) );
  XNOR2X1 U629 ( .A(n448), .B(n417), .Y(n378) );
  XNOR2X1 U630 ( .A(n449), .B(n414), .Y(n388) );
  XNOR2X1 U631 ( .A(n448), .B(n415), .Y(n376) );
  XNOR2X1 U632 ( .A(n449), .B(n413), .Y(n387) );
  XNOR2X1 U633 ( .A(n450), .B(n410), .Y(n397) );
  XNOR2X1 U634 ( .A(n450), .B(n411), .Y(n398) );
  XOR2X1 U635 ( .A(n450), .B(a[0]), .Y(n426) );
  CLKINVX3 U636 ( .A(a[0]), .Y(n462) );
  XNOR2X1 U637 ( .A(n449), .B(n412), .Y(n386) );
  XOR2X1 U638 ( .A(n449), .B(a[2]), .Y(n425) );
  XNOR2X1 U639 ( .A(n446), .B(n418), .Y(n353) );
  XNOR2X1 U640 ( .A(n448), .B(n414), .Y(n375) );
  XNOR2X1 U641 ( .A(n446), .B(n417), .Y(n352) );
  XNOR2X1 U642 ( .A(n448), .B(n413), .Y(n374) );
  XNOR2X1 U643 ( .A(n445), .B(n419), .Y(n341) );
  OAI22X1 U644 ( .A0(n430), .A1(n374), .B0(n373), .B1(n436), .Y(n298) );
  XNOR2X1 U645 ( .A(n447), .B(n414), .Y(n362) );
  XNOR2X1 U646 ( .A(n445), .B(n417), .Y(n339) );
  XNOR2X1 U647 ( .A(n445), .B(n418), .Y(n340) );
  XNOR2X1 U648 ( .A(n448), .B(n410), .Y(n371) );
  XOR2X1 U649 ( .A(n448), .B(a[4]), .Y(n424) );
  XNOR2X1 U650 ( .A(n448), .B(n411), .Y(n372) );
  XNOR2X1 U651 ( .A(n447), .B(n412), .Y(n360) );
  XNOR2X1 U652 ( .A(n447), .B(n413), .Y(n361) );
  CMPR42X1 U653 ( .A(n277), .B(n297), .C(n197), .D(n204), .ICI(n201), .S(n195), 
        .ICO(n193), .CO(n194) );
  OR2X2 U654 ( .A(n298), .B(n278), .Y(n204) );
  INVX1 U655 ( .A(n196), .Y(n197) );
  OAI22X1 U656 ( .A0(n430), .A1(n373), .B0(n372), .B1(n436), .Y(n297) );
  OAI22X1 U657 ( .A0(n430), .A1(n371), .B0(n370), .B1(n436), .Y(n182) );
  XNOR2X1 U658 ( .A(n445), .B(n414), .Y(n336) );
  XNOR2X1 U659 ( .A(n447), .B(n410), .Y(n358) );
  XNOR2X1 U660 ( .A(n446), .B(n412), .Y(n347) );
  XNOR2X1 U661 ( .A(n446), .B(n413), .Y(n348) );
  XNOR2X1 U662 ( .A(n447), .B(n411), .Y(n359) );
  XNOR2X1 U663 ( .A(n446), .B(n411), .Y(n346) );
  XNOR2X1 U664 ( .A(n445), .B(n413), .Y(n335) );
  XOR2X1 U665 ( .A(n447), .B(a[6]), .Y(n423) );
  XNOR2X1 U666 ( .A(n445), .B(n412), .Y(n334) );
  XNOR2X1 U667 ( .A(n446), .B(n410), .Y(n345) );
  NAND2X1 U668 ( .A(n229), .B(n233), .Y(n110) );
  NAND2X1 U669 ( .A(n234), .B(n238), .Y(n113) );
  NOR2X1 U670 ( .A(n229), .B(n233), .Y(n109) );
  NOR2X1 U671 ( .A(n234), .B(n238), .Y(n112) );
  NOR2X1 U672 ( .A(n239), .B(n240), .Y(n116) );
  NAND2X1 U673 ( .A(n239), .B(n240), .Y(n117) );
  CMPR42X1 U674 ( .A(n312), .B(n302), .C(n235), .D(n232), .ICI(n231), .S(n229), 
        .ICO(n227), .CO(n228) );
  OAI22X1 U675 ( .A0(n430), .A1(n378), .B0(n377), .B1(n436), .Y(n302) );
  CMPR42X1 U677 ( .A(n311), .B(n226), .C(n230), .D(n224), .ICI(n227), .S(n222), 
        .ICO(n220), .CO(n221) );
  CMPR42X1 U679 ( .A(n321), .B(n300), .C(n310), .D(n220), .ICI(n219), .S(n216), 
        .ICO(n214), .CO(n215) );
  OAI22X1 U680 ( .A0(n432), .A1(n398), .B0(n397), .B1(n462), .Y(n321) );
  OAI22X1 U681 ( .A0(n431), .A1(n387), .B0(n386), .B1(n437), .Y(n310) );
  OAI22X1 U682 ( .A0(n430), .A1(n376), .B0(n375), .B1(n436), .Y(n300) );
  NAND2X1 U683 ( .A(n519), .B(n524), .Y(n94) );
  AOI21X1 U684 ( .A0(n519), .A1(n520), .B0(n97), .Y(n95) );
  INVX1 U685 ( .A(n99), .Y(n97) );
  NOR2X1 U686 ( .A(n192), .B(n199), .Y(n81) );
  OAI22X1 U687 ( .A0(n429), .A1(n361), .B0(n360), .B1(n435), .Y(n286) );
  OAI22X1 U688 ( .A0(n430), .A1(n372), .B0(n371), .B1(n436), .Y(n296) );
  INVX1 U689 ( .A(n182), .Y(n183) );
  AOI21X1 U690 ( .A0(n52), .A1(n521), .B0(n47), .Y(n45) );
  INVX1 U691 ( .A(n49), .Y(n47) );
  NAND2X1 U692 ( .A(n525), .B(n521), .Y(n44) );
  XNOR2X1 U693 ( .A(n446), .B(n409), .Y(n344) );
  XNOR2X1 U694 ( .A(n445), .B(n411), .Y(n333) );
  XOR2X1 U695 ( .A(n446), .B(a[8]), .Y(n422) );
  XOR2X1 U696 ( .A(n445), .B(a[10]), .Y(n421) );
  XNOR2X1 U697 ( .A(n445), .B(n410), .Y(n332) );
  OAI21XL U698 ( .A0(n68), .A1(n60), .B0(n61), .Y(n59) );
  NOR2X1 U699 ( .A(n87), .B(n90), .Y(n85) );
  OAI21XL U700 ( .A0(n87), .A1(n91), .B0(n88), .Y(n86) );
  NAND2X1 U701 ( .A(n216), .B(n221), .Y(n99) );
  OAI21XL U702 ( .A0(n118), .A1(n116), .B0(n117), .Y(n115) );
  NOR2X1 U703 ( .A(n109), .B(n112), .Y(n107) );
  OAI21XL U704 ( .A0(n109), .A1(n113), .B0(n110), .Y(n108) );
  NOR2X2 U705 ( .A(n200), .B(n207), .Y(n87) );
  NAND2X1 U706 ( .A(n208), .B(n215), .Y(n91) );
  NAND2X1 U707 ( .A(n200), .B(n207), .Y(n88) );
  INVX1 U708 ( .A(n93), .Y(n92) );
  NAND2X1 U709 ( .A(n192), .B(n199), .Y(n82) );
  INVX1 U710 ( .A(n81), .Y(n79) );
  INVX1 U711 ( .A(n82), .Y(n80) );
  NAND2X1 U712 ( .A(n186), .B(n191), .Y(n77) );
  NAND2X1 U714 ( .A(n179), .B(n185), .Y(n68) );
  OAI21XL U715 ( .A0(n73), .A1(n65), .B0(n68), .Y(n64) );
  INVX1 U716 ( .A(n71), .Y(n73) );
  NAND2X1 U717 ( .A(n178), .B(n174), .Y(n61) );
  INVX1 U718 ( .A(n84), .Y(n83) );
  NAND2X1 U719 ( .A(n173), .B(n169), .Y(n54) );
  NAND2X1 U720 ( .A(n166), .B(n168), .Y(n49) );
  INVX1 U721 ( .A(n54), .Y(n52) );
  NOR2X1 U722 ( .A(n165), .B(n161), .Y(n39) );
  INVX1 U723 ( .A(n45), .Y(n43) );
  NAND2X1 U725 ( .A(n165), .B(n161), .Y(n40) );
  NAND2X1 U726 ( .A(n160), .B(n159), .Y(n35) );
  OAI21XL U727 ( .A0(n45), .A1(n39), .B0(n40), .Y(n38) );
  NOR2X1 U728 ( .A(n44), .B(n39), .Y(n37) );
  ADDFX2 U729 ( .A(n162), .B(n260), .CI(n271), .CO(n158), .S(n159) );
  OAI22X1 U730 ( .A0(n427), .A1(n333), .B0(n433), .B1(n332), .Y(n260) );
  OAI22X1 U731 ( .A0(n427), .A1(n332), .B0(n433), .B1(n331), .Y(n259) );
  XNOR2X1 U732 ( .A(n445), .B(n409), .Y(n331) );
  XOR2X1 U733 ( .A(n100), .B(n15), .Y(product[10]) );
  NAND2X1 U734 ( .A(n519), .B(n99), .Y(n15) );
  AOI21X1 U735 ( .A0(n105), .A1(n524), .B0(n520), .Y(n100) );
  INVX1 U736 ( .A(n106), .Y(n105) );
  XOR2X1 U737 ( .A(n92), .B(n14), .Y(product[11]) );
  XNOR2X1 U738 ( .A(n89), .B(n13), .Y(product[12]) );
  OAI21XL U739 ( .A0(n92), .A1(n90), .B0(n91), .Y(n89) );
  XNOR2X1 U740 ( .A(n83), .B(n12), .Y(product[13]) );
  NAND2X1 U741 ( .A(n79), .B(n82), .Y(n12) );
  XOR2X1 U742 ( .A(n78), .B(n11), .Y(product[14]) );
  AOI21X1 U743 ( .A0(n83), .A1(n79), .B0(n80), .Y(n78) );
  XOR2X1 U744 ( .A(n69), .B(n10), .Y(product[15]) );
  AOI21X1 U745 ( .A0(n83), .A1(n70), .B0(n71), .Y(n69) );
  XOR2X1 U746 ( .A(n62), .B(n9), .Y(product[16]) );
  XNOR2X1 U747 ( .A(n3), .B(n8), .Y(product[17]) );
  NAND2X1 U748 ( .A(n525), .B(n54), .Y(n8) );
  XOR2X1 U749 ( .A(n50), .B(n7), .Y(product[18]) );
  NAND2X1 U750 ( .A(n521), .B(n49), .Y(n7) );
  XOR2X1 U751 ( .A(n41), .B(n6), .Y(product[19]) );
  XOR2X1 U753 ( .A(n36), .B(n5), .Y(product[20]) );
  NAND2X1 U754 ( .A(n526), .B(n35), .Y(n5) );
  AOI21X1 U755 ( .A0(n3), .A1(n37), .B0(n38), .Y(n36) );
  XOR2X1 U756 ( .A(n27), .B(n4), .Y(product[21]) );
  OAI22XL U448 ( .A0(n431), .A1(n443), .B0(n437), .B1(n395), .Y(n257) );
  OAI22XL U457 ( .A0(n431), .A1(n388), .B0(n387), .B1(n437), .Y(n311) );
  AOI21XL U499 ( .A0(n437), .A1(n431), .B0(n383), .Y(n527) );
  OAI22XL U500 ( .A0(n431), .A1(n389), .B0(n388), .B1(n437), .Y(n312) );
  NAND2X2 U504 ( .A(n437), .B(n425), .Y(n431) );
  CMPR42X1 U505 ( .A(n268), .B(n212), .C(n205), .D(n210), .ICI(n203), .S(n200), 
        .ICO(n198), .CO(n199) );
  NOR2X1 U546 ( .A(n76), .B(n81), .Y(n70) );
  INVX1 U595 ( .A(n527), .Y(n307) );
  AOI21X2 U619 ( .A0(n85), .A1(n93), .B0(n86), .Y(n84) );
  NAND2X2 U625 ( .A(n433), .B(n421), .Y(n427) );
  OAI2BB2X1 U676 ( .B0(n132), .B1(n135), .A0N(n329), .A1N(n318), .Y(n131) );
  AOI31X1 U678 ( .A0(n3), .A1(n525), .A2(n521), .B0(n43), .Y(n41) );
  OAI21X4 U713 ( .A0(n56), .A1(n84), .B0(n57), .Y(n3) );
  XNOR2X4 U724 ( .A(n446), .B(a[10]), .Y(n433) );
  CMPR42X1 U752 ( .A(n270), .B(n280), .C(n290), .D(n225), .ICI(n223), .S(n219), 
        .ICO(n217), .CO(n218) );
  NAND2X2 U757 ( .A(n435), .B(n423), .Y(n429) );
  CMPR42X1 U758 ( .A(n183), .B(n187), .C(n181), .D(n188), .ICI(n184), .S(n179), 
        .ICO(n177), .CO(n178) );
  NAND2X2 U759 ( .A(n426), .B(n462), .Y(n432) );
  CMPR42X1 U760 ( .A(n289), .B(n269), .C(n309), .D(n214), .ICI(n217), .S(n211), 
        .ICO(n209), .CO(n210) );
  CMPR42X1 U761 ( .A(n284), .B(n274), .C(n180), .D(n176), .ICI(n177), .S(n174), 
        .ICO(n172), .CO(n173) );
  CMPR42X1 U763 ( .A(n288), .B(n308), .C(n319), .D(n209), .ICI(n206), .S(n203), 
        .ICO(n201), .CO(n202) );
  CMPR42X1 U764 ( .A(n296), .B(n286), .C(n190), .D(n194), .ICI(n189), .S(n186), 
        .ICO(n184), .CO(n185) );
  NAND2X4 U501 ( .A(n434), .B(n422), .Y(n428) );
  NAND2X4 U503 ( .A(n436), .B(n424), .Y(n430) );
  OAI21X1 U762 ( .A0(n76), .A1(n82), .B0(n77), .Y(n71) );
endmodule


module multiply_WIDTH12_1 ( clk, a_re, a_im, b_re, b_im, m_re, m_im );
  input [11:0] a_re;
  input [11:0] a_im;
  input [11:0] b_re;
  input [11:0] b_im;
  output [11:0] m_re;
  output [11:0] m_im;
  input clk;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N24, N25, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41,
         N42, N43, N44, N45, N46, N47, N60, N61, N62, N63, N64, N65, N66, N67,
         N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81,
         N82, N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95,
         N96, N97, N98, N99, N100, N101, N102, N103, N104, N105, N106, N107,
         N108, N109, N110, N111, N112, N113, N114, N115, N116, N117, N118,
         N119, N120, N121, N122, N123, N124, N125, N126, N127, N128, N129,
         N130, N131, N132, N133, N134, N135, N136, N137, N138, N139, N140,
         N141, N142, N143, N59, N58, N57, N56, N55, N54, N53, N52, N51, N50,
         N49, N48, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12;
  wire   [11:0] sub_ar_ai;
  wire   [11:0] sub_br_bi;
  wire   [11:0] add_br_bi;
  wire   [11:0] temp1_b_im;
  wire   [11:0] temp1_a_re;
  wire   [11:0] temp1_a_im;
  wire   [21:10] md;
  wire   [21:10] ma;
  wire   [21:10] mb;
  wire   [11:0] sc_md;
  wire   [11:0] sc_ma;
  wire   [11:0] sc_mb;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33, 
        SYNOPSYS_UNCONNECTED__34, SYNOPSYS_UNCONNECTED__35;

  DFFHQX4 \sub_br_bi_reg[7]  ( .D(N67), .CK(clk), .Q(sub_br_bi[7]) );
  DFFHQX4 \sub_br_bi_reg[5]  ( .D(N65), .CK(clk), .Q(sub_br_bi[5]) );
  DFFHQX4 \sub_br_bi_reg[3]  ( .D(N63), .CK(clk), .Q(sub_br_bi[3]) );
  DFFHQX4 \sub_br_bi_reg[1]  ( .D(N61), .CK(clk), .Q(sub_br_bi[1]) );
  DFFHQX4 \add_br_bi_reg[9]  ( .D(N81), .CK(clk), .Q(add_br_bi[9]) );
  DFFHQX4 \add_br_bi_reg[7]  ( .D(N79), .CK(clk), .Q(add_br_bi[7]) );
  DFFHQX4 \add_br_bi_reg[5]  ( .D(N77), .CK(clk), .Q(add_br_bi[5]) );
  DFFHQX4 \add_br_bi_reg[3]  ( .D(N75), .CK(clk), .Q(add_br_bi[3]) );
  DFFHQX4 \add_br_bi_reg[1]  ( .D(N73), .CK(clk), .Q(add_br_bi[1]) );
  DFFHQX4 \sub_ar_ai_reg[7]  ( .D(N31), .CK(clk), .Q(sub_ar_ai[7]) );
  DFFHQX4 \sub_ar_ai_reg[5]  ( .D(N29), .CK(clk), .Q(sub_ar_ai[5]) );
  DFFHQX4 \sub_ar_ai_reg[3]  ( .D(N27), .CK(clk), .Q(sub_ar_ai[3]) );
  DFFHQX4 \sub_ar_ai_reg[1]  ( .D(N25), .CK(clk), .Q(sub_ar_ai[1]) );
  INVX1 U3 ( .A(a_im[2]), .Y(N9) );
  INVX1 U4 ( .A(a_im[3]), .Y(N8) );
  INVX1 U5 ( .A(a_im[4]), .Y(N7) );
  INVX1 U6 ( .A(a_im[5]), .Y(N6) );
  INVX1 U7 ( .A(a_im[6]), .Y(N5) );
  INVX1 U8 ( .A(b_im[0]), .Y(N47) );
  INVX1 U9 ( .A(b_im[1]), .Y(N46) );
  INVX1 U10 ( .A(b_im[2]), .Y(N45) );
  INVX1 U11 ( .A(b_im[3]), .Y(N44) );
  INVX1 U12 ( .A(b_im[4]), .Y(N43) );
  INVX1 U13 ( .A(b_im[5]), .Y(N42) );
  INVX1 U14 ( .A(b_im[6]), .Y(N41) );
  INVX1 U15 ( .A(b_im[7]), .Y(N40) );
  INVX1 U16 ( .A(a_im[7]), .Y(N4) );
  INVX1 U17 ( .A(b_im[8]), .Y(N39) );
  INVX1 U18 ( .A(b_im[9]), .Y(N38) );
  INVX1 U19 ( .A(b_im[10]), .Y(N37) );
  INVX1 U20 ( .A(b_im[11]), .Y(N36) );
  INVX1 U21 ( .A(a_im[8]), .Y(N3) );
  INVX1 U22 ( .A(a_im[9]), .Y(N2) );
  INVX1 U23 ( .A(a_im[0]), .Y(N11) );
  INVX1 U24 ( .A(a_im[1]), .Y(N10) );
  INVX1 U25 ( .A(a_im[10]), .Y(N1) );
  INVX1 U26 ( .A(a_im[11]), .Y(N0) );
  DFFHQX2 \sub_br_bi_reg[11]  ( .D(N71), .CK(clk), .Q(sub_br_bi[11]) );
  DFFHQX1 \sub_br_bi_reg[10]  ( .D(N70), .CK(clk), .Q(sub_br_bi[10]) );
  DFFHQX1 \sub_br_bi_reg[8]  ( .D(N68), .CK(clk), .Q(sub_br_bi[8]) );
  DFFHQX1 \sub_br_bi_reg[6]  ( .D(N66), .CK(clk), .Q(sub_br_bi[6]) );
  DFFHQX1 \sub_br_bi_reg[4]  ( .D(N64), .CK(clk), .Q(sub_br_bi[4]) );
  DFFHQX1 \sub_br_bi_reg[2]  ( .D(N62), .CK(clk), .Q(sub_br_bi[2]) );
  DFFHQX1 \sub_br_bi_reg[0]  ( .D(N60), .CK(clk), .Q(sub_br_bi[0]) );
  DFFHQX1 \add_br_bi_reg[10]  ( .D(N82), .CK(clk), .Q(add_br_bi[10]) );
  DFFHQX1 \add_br_bi_reg[8]  ( .D(N80), .CK(clk), .Q(add_br_bi[8]) );
  DFFHQX1 \add_br_bi_reg[6]  ( .D(N78), .CK(clk), .Q(add_br_bi[6]) );
  DFFHQX1 \add_br_bi_reg[4]  ( .D(N76), .CK(clk), .Q(add_br_bi[4]) );
  DFFHQX1 \add_br_bi_reg[2]  ( .D(N74), .CK(clk), .Q(add_br_bi[2]) );
  DFFHQX1 \add_br_bi_reg[0]  ( .D(N72), .CK(clk), .Q(add_br_bi[0]) );
  DFFHQX2 \sub_ar_ai_reg[11]  ( .D(N35), .CK(clk), .Q(sub_ar_ai[11]) );
  DFFHQX1 \sub_ar_ai_reg[10]  ( .D(N34), .CK(clk), .Q(sub_ar_ai[10]) );
  DFFHQX1 \sub_ar_ai_reg[8]  ( .D(N32), .CK(clk), .Q(sub_ar_ai[8]) );
  DFFHQX1 \sub_ar_ai_reg[6]  ( .D(N30), .CK(clk), .Q(sub_ar_ai[6]) );
  DFFHQX1 \sub_ar_ai_reg[4]  ( .D(N28), .CK(clk), .Q(sub_ar_ai[4]) );
  DFFHQX1 \sub_ar_ai_reg[2]  ( .D(N26), .CK(clk), .Q(sub_ar_ai[2]) );
  DFFHQX1 \sub_ar_ai_reg[0]  ( .D(N24), .CK(clk), .Q(sub_ar_ai[0]) );
  DFFHQX1 \md_reg[17]  ( .D(N91), .CK(clk), .Q(md[17]) );
  DFFHQX1 \md_reg[13]  ( .D(N87), .CK(clk), .Q(md[13]) );
  DFFHQX1 \md_reg[12]  ( .D(N86), .CK(clk), .Q(md[12]) );
  DFFHQX1 \md_reg[11]  ( .D(N85), .CK(clk), .Q(md[11]) );
  DFFHQX1 \md_reg[10]  ( .D(N84), .CK(clk), .Q(md[10]) );
  DFFHQX1 \ma_reg[14]  ( .D(N100), .CK(clk), .Q(ma[14]) );
  DFFHQX1 \ma_reg[13]  ( .D(N99), .CK(clk), .Q(ma[13]) );
  DFFHQX1 \ma_reg[12]  ( .D(N98), .CK(clk), .Q(ma[12]) );
  DFFHQX1 \ma_reg[11]  ( .D(N97), .CK(clk), .Q(ma[11]) );
  DFFHQX1 \ma_reg[10]  ( .D(N96), .CK(clk), .Q(ma[10]) );
  DFFHQX1 \mb_reg[21]  ( .D(N119), .CK(clk), .Q(mb[21]) );
  DFFHQX1 \mb_reg[20]  ( .D(N118), .CK(clk), .Q(mb[20]) );
  DFFHQX1 \mb_reg[19]  ( .D(N117), .CK(clk), .Q(mb[19]) );
  DFFHQX1 \mb_reg[18]  ( .D(N116), .CK(clk), .Q(mb[18]) );
  DFFHQX1 \mb_reg[17]  ( .D(N115), .CK(clk), .Q(mb[17]) );
  DFFHQX1 \mb_reg[13]  ( .D(N111), .CK(clk), .Q(mb[13]) );
  DFFHQX1 \mb_reg[12]  ( .D(N110), .CK(clk), .Q(mb[12]) );
  DFFHQX1 \mb_reg[11]  ( .D(N109), .CK(clk), .Q(mb[11]) );
  DFFHQX1 \mb_reg[10]  ( .D(N108), .CK(clk), .Q(mb[10]) );
  DFFHQX1 \dout_im_reg[11]  ( .D(N143), .CK(clk), .Q(m_im[11]) );
  DFFHQX1 \dout_im_reg[10]  ( .D(N142), .CK(clk), .Q(m_im[10]) );
  DFFHQX1 \dout_im_reg[9]  ( .D(N141), .CK(clk), .Q(m_im[9]) );
  DFFHQX1 \dout_im_reg[8]  ( .D(N140), .CK(clk), .Q(m_im[8]) );
  DFFHQX1 \dout_im_reg[7]  ( .D(N139), .CK(clk), .Q(m_im[7]) );
  DFFHQX1 \dout_im_reg[6]  ( .D(N138), .CK(clk), .Q(m_im[6]) );
  DFFHQX1 \dout_im_reg[5]  ( .D(N137), .CK(clk), .Q(m_im[5]) );
  DFFHQX1 \dout_im_reg[4]  ( .D(N136), .CK(clk), .Q(m_im[4]) );
  DFFHQX1 \dout_im_reg[3]  ( .D(N135), .CK(clk), .Q(m_im[3]) );
  DFFHQX1 \dout_im_reg[2]  ( .D(N134), .CK(clk), .Q(m_im[2]) );
  DFFHQX1 \dout_im_reg[1]  ( .D(N133), .CK(clk), .Q(m_im[1]) );
  DFFHQX1 \dout_im_reg[0]  ( .D(N132), .CK(clk), .Q(m_im[0]) );
  DFFHQX1 \dout_re_reg[11]  ( .D(N131), .CK(clk), .Q(m_re[11]) );
  DFFHQX1 \dout_re_reg[10]  ( .D(N130), .CK(clk), .Q(m_re[10]) );
  DFFHQX1 \dout_re_reg[9]  ( .D(N129), .CK(clk), .Q(m_re[9]) );
  DFFHQX1 \dout_re_reg[8]  ( .D(N128), .CK(clk), .Q(m_re[8]) );
  DFFHQX1 \dout_re_reg[7]  ( .D(N127), .CK(clk), .Q(m_re[7]) );
  DFFHQX1 \dout_re_reg[6]  ( .D(N126), .CK(clk), .Q(m_re[6]) );
  DFFHQX1 \dout_re_reg[5]  ( .D(N125), .CK(clk), .Q(m_re[5]) );
  DFFHQX1 \dout_re_reg[4]  ( .D(N124), .CK(clk), .Q(m_re[4]) );
  DFFHQX1 \dout_re_reg[3]  ( .D(N123), .CK(clk), .Q(m_re[3]) );
  DFFHQX1 \dout_re_reg[2]  ( .D(N122), .CK(clk), .Q(m_re[2]) );
  DFFHQX1 \dout_re_reg[1]  ( .D(N121), .CK(clk), .Q(m_re[1]) );
  DFFHQX1 \dout_re_reg[0]  ( .D(N120), .CK(clk), .Q(m_re[0]) );
  DFFHQX1 \sc_md_reg[11]  ( .D(md[21]), .CK(clk), .Q(sc_md[11]) );
  DFFHQX1 \sc_mb_reg[11]  ( .D(mb[21]), .CK(clk), .Q(sc_mb[11]) );
  DFFHQX1 \sc_md_reg[10]  ( .D(md[20]), .CK(clk), .Q(sc_md[10]) );
  DFFHQX1 \sc_mb_reg[10]  ( .D(mb[20]), .CK(clk), .Q(sc_mb[10]) );
  DFFHQX1 \sc_md_reg[9]  ( .D(md[19]), .CK(clk), .Q(sc_md[9]) );
  DFFHQX1 \sc_mb_reg[9]  ( .D(mb[19]), .CK(clk), .Q(sc_mb[9]) );
  DFFHQX1 \sc_md_reg[8]  ( .D(md[18]), .CK(clk), .Q(sc_md[8]) );
  DFFHQX1 \sc_mb_reg[8]  ( .D(mb[18]), .CK(clk), .Q(sc_mb[8]) );
  DFFHQX1 \sc_md_reg[7]  ( .D(md[17]), .CK(clk), .Q(sc_md[7]) );
  DFFHQX1 \sc_mb_reg[7]  ( .D(mb[17]), .CK(clk), .Q(sc_mb[7]) );
  DFFHQX1 \sc_md_reg[6]  ( .D(md[16]), .CK(clk), .Q(sc_md[6]) );
  DFFHQX1 \sc_mb_reg[6]  ( .D(mb[16]), .CK(clk), .Q(sc_mb[6]) );
  DFFHQX1 \sc_md_reg[5]  ( .D(md[15]), .CK(clk), .Q(sc_md[5]) );
  DFFHQX1 \sc_mb_reg[5]  ( .D(mb[15]), .CK(clk), .Q(sc_mb[5]) );
  DFFHQX1 \sc_md_reg[4]  ( .D(md[14]), .CK(clk), .Q(sc_md[4]) );
  DFFHQX1 \sc_mb_reg[4]  ( .D(mb[14]), .CK(clk), .Q(sc_mb[4]) );
  DFFHQX1 \sc_md_reg[3]  ( .D(md[13]), .CK(clk), .Q(sc_md[3]) );
  DFFHQX1 \sc_mb_reg[3]  ( .D(mb[13]), .CK(clk), .Q(sc_mb[3]) );
  DFFHQX1 \sc_md_reg[2]  ( .D(md[12]), .CK(clk), .Q(sc_md[2]) );
  DFFHQX1 \sc_mb_reg[2]  ( .D(mb[12]), .CK(clk), .Q(sc_mb[2]) );
  DFFHQX1 \sc_md_reg[1]  ( .D(md[11]), .CK(clk), .Q(sc_md[1]) );
  DFFHQX1 \sc_mb_reg[1]  ( .D(mb[11]), .CK(clk), .Q(sc_mb[1]) );
  DFFHQX1 \sc_mb_reg[0]  ( .D(mb[10]), .CK(clk), .Q(sc_mb[0]) );
  DFFHQX1 \sc_md_reg[0]  ( .D(md[10]), .CK(clk), .Q(sc_md[0]) );
  DFFHQX1 \sc_ma_reg[11]  ( .D(ma[21]), .CK(clk), .Q(sc_ma[11]) );
  DFFHQX1 \sc_ma_reg[10]  ( .D(ma[20]), .CK(clk), .Q(sc_ma[10]) );
  DFFHQX1 \sc_ma_reg[9]  ( .D(ma[19]), .CK(clk), .Q(sc_ma[9]) );
  DFFHQX1 \sc_ma_reg[8]  ( .D(ma[18]), .CK(clk), .Q(sc_ma[8]) );
  DFFHQX1 \sc_ma_reg[7]  ( .D(ma[17]), .CK(clk), .Q(sc_ma[7]) );
  DFFHQX1 \sc_ma_reg[6]  ( .D(ma[16]), .CK(clk), .Q(sc_ma[6]) );
  DFFHQX1 \sc_ma_reg[5]  ( .D(ma[15]), .CK(clk), .Q(sc_ma[5]) );
  DFFHQX1 \sc_ma_reg[4]  ( .D(ma[14]), .CK(clk), .Q(sc_ma[4]) );
  DFFHQX1 \sc_ma_reg[3]  ( .D(ma[13]), .CK(clk), .Q(sc_ma[3]) );
  DFFHQX1 \sc_ma_reg[2]  ( .D(ma[12]), .CK(clk), .Q(sc_ma[2]) );
  DFFHQX1 \sc_ma_reg[1]  ( .D(ma[11]), .CK(clk), .Q(sc_ma[1]) );
  DFFHQX1 \sc_ma_reg[0]  ( .D(ma[10]), .CK(clk), .Q(sc_ma[0]) );
  DFFHQX1 \temp1_b_im_reg[11]  ( .D(b_im[11]), .CK(clk), .Q(temp1_b_im[11]) );
  DFFHQX1 \temp1_a_re_reg[11]  ( .D(a_re[11]), .CK(clk), .Q(temp1_a_re[11]) );
  DFFHQX1 \temp1_a_im_reg[11]  ( .D(a_im[11]), .CK(clk), .Q(temp1_a_im[11]) );
  DFFHQX1 \temp1_b_im_reg[10]  ( .D(b_im[10]), .CK(clk), .Q(temp1_b_im[10]) );
  DFFHQX1 \temp1_b_im_reg[9]  ( .D(b_im[9]), .CK(clk), .Q(temp1_b_im[9]) );
  DFFHQX1 \temp1_a_re_reg[10]  ( .D(a_re[10]), .CK(clk), .Q(temp1_a_re[10]) );
  DFFHQX1 \temp1_a_re_reg[9]  ( .D(a_re[9]), .CK(clk), .Q(temp1_a_re[9]) );
  DFFHQX1 \temp1_a_im_reg[10]  ( .D(a_im[10]), .CK(clk), .Q(temp1_a_im[10]) );
  DFFHQX1 \temp1_a_im_reg[9]  ( .D(a_im[9]), .CK(clk), .Q(temp1_a_im[9]) );
  DFFHQX1 \temp1_b_im_reg[8]  ( .D(b_im[8]), .CK(clk), .Q(temp1_b_im[8]) );
  DFFHQX1 \temp1_b_im_reg[7]  ( .D(b_im[7]), .CK(clk), .Q(temp1_b_im[7]) );
  DFFHQX1 \temp1_b_im_reg[6]  ( .D(b_im[6]), .CK(clk), .Q(temp1_b_im[6]) );
  DFFHQX1 \temp1_b_im_reg[2]  ( .D(b_im[2]), .CK(clk), .Q(temp1_b_im[2]) );
  DFFHQX1 \temp1_b_im_reg[3]  ( .D(b_im[3]), .CK(clk), .Q(temp1_b_im[3]) );
  DFFHQX1 \temp1_b_im_reg[1]  ( .D(b_im[1]), .CK(clk), .Q(temp1_b_im[1]) );
  DFFHQX2 \temp1_b_im_reg[0]  ( .D(b_im[0]), .CK(clk), .Q(temp1_b_im[0]) );
  DFFHQX1 \temp1_b_im_reg[5]  ( .D(b_im[5]), .CK(clk), .Q(temp1_b_im[5]) );
  DFFHQX1 \temp1_b_im_reg[4]  ( .D(b_im[4]), .CK(clk), .Q(temp1_b_im[4]) );
  DFFHQX1 \temp1_a_re_reg[8]  ( .D(a_re[8]), .CK(clk), .Q(temp1_a_re[8]) );
  DFFHQX1 \temp1_a_re_reg[7]  ( .D(a_re[7]), .CK(clk), .Q(temp1_a_re[7]) );
  DFFHQX1 \temp1_a_re_reg[6]  ( .D(a_re[6]), .CK(clk), .Q(temp1_a_re[6]) );
  DFFHQX1 \temp1_a_re_reg[2]  ( .D(a_re[2]), .CK(clk), .Q(temp1_a_re[2]) );
  DFFHQX1 \temp1_a_re_reg[3]  ( .D(a_re[3]), .CK(clk), .Q(temp1_a_re[3]) );
  DFFHQX1 \temp1_a_re_reg[1]  ( .D(a_re[1]), .CK(clk), .Q(temp1_a_re[1]) );
  DFFHQX2 \temp1_a_re_reg[0]  ( .D(a_re[0]), .CK(clk), .Q(temp1_a_re[0]) );
  DFFHQX1 \temp1_a_re_reg[5]  ( .D(a_re[5]), .CK(clk), .Q(temp1_a_re[5]) );
  DFFHQX1 \temp1_a_re_reg[4]  ( .D(a_re[4]), .CK(clk), .Q(temp1_a_re[4]) );
  DFFHQX1 \temp1_a_im_reg[8]  ( .D(a_im[8]), .CK(clk), .Q(temp1_a_im[8]) );
  DFFHQX1 \temp1_a_im_reg[7]  ( .D(a_im[7]), .CK(clk), .Q(temp1_a_im[7]) );
  DFFHQX1 \temp1_a_im_reg[6]  ( .D(a_im[6]), .CK(clk), .Q(temp1_a_im[6]) );
  DFFHQX1 \temp1_a_im_reg[2]  ( .D(a_im[2]), .CK(clk), .Q(temp1_a_im[2]) );
  DFFHQX1 \temp1_a_im_reg[3]  ( .D(a_im[3]), .CK(clk), .Q(temp1_a_im[3]) );
  DFFHQX1 \temp1_a_im_reg[1]  ( .D(a_im[1]), .CK(clk), .Q(temp1_a_im[1]) );
  DFFHQX2 \temp1_a_im_reg[0]  ( .D(a_im[0]), .CK(clk), .Q(temp1_a_im[0]) );
  DFFHQX1 \temp1_a_im_reg[5]  ( .D(a_im[5]), .CK(clk), .Q(temp1_a_im[5]) );
  DFFHQX1 \temp1_a_im_reg[4]  ( .D(a_im[4]), .CK(clk), .Q(temp1_a_im[4]) );
  DFFHQXL \ma_reg[17]  ( .D(N103), .CK(clk), .Q(ma[17]) );
  DFFHQXL \ma_reg[15]  ( .D(N101), .CK(clk), .Q(ma[15]) );
  DFFHQXL \md_reg[14]  ( .D(N88), .CK(clk), .Q(md[14]) );
  DFFHQXL \mb_reg[14]  ( .D(N112), .CK(clk), .Q(mb[14]) );
  DFFHQXL \mb_reg[15]  ( .D(N113), .CK(clk), .Q(mb[15]) );
  DFFHQXL \md_reg[15]  ( .D(N89), .CK(clk), .Q(md[15]) );
  DFFHQXL \mb_reg[16]  ( .D(N114), .CK(clk), .Q(mb[16]) );
  DFFHQXL \md_reg[16]  ( .D(N90), .CK(clk), .Q(md[16]) );
  DFFHQXL \md_reg[21]  ( .D(N95), .CK(clk), .Q(md[21]) );
  DFFHQXL \md_reg[19]  ( .D(N93), .CK(clk), .Q(md[19]) );
  DFFHQXL \md_reg[20]  ( .D(N94), .CK(clk), .Q(md[20]) );
  DFFHQXL \ma_reg[21]  ( .D(N107), .CK(clk), .Q(ma[21]) );
  DFFHQXL \ma_reg[19]  ( .D(N105), .CK(clk), .Q(ma[19]) );
  DFFHQXL \ma_reg[18]  ( .D(N104), .CK(clk), .Q(ma[18]) );
  DFFHQXL \ma_reg[20]  ( .D(N106), .CK(clk), .Q(ma[20]) );
  DFFHQXL \md_reg[18]  ( .D(N92), .CK(clk), .Q(md[18]) );
  DFFHQXL \ma_reg[16]  ( .D(N102), .CK(clk), .Q(ma[16]) );
  DFFHQX2 \sub_ar_ai_reg[9]  ( .D(N33), .CK(clk), .Q(sub_ar_ai[9]) );
  DFFHQX1 \sub_br_bi_reg[9]  ( .D(N69), .CK(clk), .Q(sub_br_bi[9]) );
  multiply_WIDTH12_1_DW01_add_0_DW01_add_51 add_77 ( .A(sc_md), .B(sc_mb), 
        .CI(1'b0), .SUM({N143, N142, N141, N140, N139, N138, N137, N136, N135, 
        N134, N133, N132}) );
  multiply_WIDTH12_1_DW01_add_1_DW01_add_52 add_76 ( .A(sc_md), .B(sc_ma), 
        .CI(1'b0), .SUM({N131, N130, N129, N128, N127, N126, N125, N124, N123, 
        N122, N121, N120}) );
  multiply_WIDTH12_1_DW01_add_2_DW01_add_53 add_47 ( .A(b_re), .B(b_im), .CI(
        1'b0), .SUM({N83, N82, N81, N80, N79, N78, N77, N76, N75, N74, N73, 
        N72}) );
  multiply_WIDTH12_1_DW01_inc_1_DW01_inc_31 add_46 ( .A({N36, N37, N38, N39, 
        N40, N41, N42, N43, N44, N45, N46, N47}), .SUM({N59, N58, N57, N56, 
        N55, N54, N53, N52, N51, N50, N49, N48}) );
  multiply_WIDTH12_1_DW01_add_4_DW01_add_81 add_46_2 ( .A(b_re), .B({N59, N58, 
        N57, N56, N55, N54, N53, N52, N51, N50, N49, N48}), .CI(1'b0), .SUM({
        N71, N70, N69, N68, N67, N66, N65, N64, N63, N62, N61, N60}) );
  multiply_WIDTH12_1_DW01_inc_0_DW01_inc_29 add_45 ( .A({N0, N1, N2, N3, N4, 
        N5, N6, N7, N8, N9, N10, N11}), .SUM({N23, N22, N21, N20, N19, N18, 
        N17, N16, N15, N14, N13, N12}) );
  multiply_WIDTH12_1_DW01_add_3_DW01_add_79 add_45_2 ( .A(a_re), .B({N23, N22, 
        N21, N20, N19, N18, N17, N16, N15, N14, N13, N12}), .CI(1'b0), .SUM({
        N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24}) );
  multiply_WIDTH12_1_DW_mult_tc_7 mult_62 ( .a(sub_ar_ai), .b(temp1_b_im), 
        .product({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, N95, N94, 
        N93, N92, N91, N90, N89, N88, N87, N86, N85, N84, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11}) );
  multiply_WIDTH12_1_DW_mult_tc_9 mult_63 ( .a(sub_br_bi), .b(temp1_a_re), 
        .product({SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, N107, 
        N106, N105, N104, N103, N102, N101, N100, N99, N98, N97, N96, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23}) );
  multiply_WIDTH12_1_DW_mult_tc_11 mult_64 ( .a(add_br_bi), .b(temp1_a_im), 
        .product({SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, N119, 
        N118, N117, N116, N115, N114, N113, N112, N111, N110, N109, N108, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33, 
        SYNOPSYS_UNCONNECTED__34, SYNOPSYS_UNCONNECTED__35}) );
  DFFHQX4 \add_br_bi_reg[11]  ( .D(N83), .CK(clk), .Q(add_br_bi[11]) );
endmodule


module sdfunit2_WIDTH12_DEPTH15_DW01_inc_0_DW01_inc_11 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module sdfunit2_WIDTH12_DEPTH15 ( clk, di_en, reset, x_re, x_im, y_re, y_im, 
        do_en );
  input [11:0] x_re;
  input [11:0] x_im;
  output [11:0] y_re;
  output [11:0] y_im;
  input clk, di_en, reset;
  output do_en;
  wire   N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18,
         N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, sel, N30, N31, N32,
         N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46,
         N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60,
         N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, N72, N73, N74,
         N75, N76, N77, N81, N82, N83, N84, N85, N86, N87, N108, N109, N110,
         N114, N115, N116, N117, N118, N120, N121, N122, N123, N124, N125,
         temp1_en, temp2_en, temp3_en, temp4_en, N131, en, N133, N134, N135,
         N136, N137, N138, N139, N140, N141, N142, N143, N144, N145, N146,
         N147, N148, N149, N150, N151, N152, N153, N154, N155, N156, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, \mult_143/n5 ,
         \mult_143/n4 , \mult_143/n3 , \mult_143/n2 , n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21;
  wire   [11:0] x_re_r;
  wire   [11:0] x_im_r;
  wire   [11:0] bf_y1_re;
  wire   [11:0] dx_re;
  wire   [11:0] bf_y1_im;
  wire   [11:0] dx_im;
  wire   [11:0] dy_re;
  wire   [11:0] dy_im;
  wire   [11:0] bf_y0_re;
  wire   [11:0] bf_y0_im;
  wire   [11:0] mux2_re;
  wire   [11:0] mux2_im;
  wire   [11:0] temp1_re;
  wire   [11:0] temp1_im;
  wire   [11:0] temp2_re;
  wire   [11:0] temp2_im;
  wire   [11:0] temp4_re;
  wire   [11:0] temp3_re;
  wire   [11:0] temp4_im;
  wire   [11:0] temp3_im;
  wire   [6:0] count;
  wire   [5:0] addr;
  wire   [11:0] tw_re;
  wire   [11:0] tw_im;
  wire   [11:0] dout_re;
  wire   [11:0] dout_im;
  assign N4 = di_en;

  ADDHXL \mult_143/U6  ( .A(N114), .B(N108), .CO(\mult_143/n5 ), .S(N115) );
  ADDFX2 \mult_143/U5  ( .A(N109), .B(N108), .CI(\mult_143/n5 ), .CO(
        \mult_143/n4 ), .S(N116) );
  ADDFX2 \mult_143/U4  ( .A(N110), .B(N109), .CI(\mult_143/n4 ), .CO(
        \mult_143/n3 ), .S(N117) );
  ADDFX2 \mult_143/U3  ( .A(count[4]), .B(N110), .CI(\mult_143/n3 ), .CO(
        \mult_143/n2 ), .S(N118) );
  DFFHQX1 \x_re_r_reg[11]  ( .D(N5), .CK(clk), .Q(x_re_r[11]) );
  DFFHQX1 \x_re_r_reg[10]  ( .D(N6), .CK(clk), .Q(x_re_r[10]) );
  DFFHQX1 \x_re_r_reg[9]  ( .D(N7), .CK(clk), .Q(x_re_r[9]) );
  DFFHQX1 \x_re_r_reg[8]  ( .D(N8), .CK(clk), .Q(x_re_r[8]) );
  DFFHQX1 \x_re_r_reg[7]  ( .D(N9), .CK(clk), .Q(x_re_r[7]) );
  DFFHQX1 \x_re_r_reg[6]  ( .D(N10), .CK(clk), .Q(x_re_r[6]) );
  DFFHQX1 \x_re_r_reg[5]  ( .D(N11), .CK(clk), .Q(x_re_r[5]) );
  DFFHQX1 \x_re_r_reg[4]  ( .D(N12), .CK(clk), .Q(x_re_r[4]) );
  DFFHQX1 \x_re_r_reg[3]  ( .D(N13), .CK(clk), .Q(x_re_r[3]) );
  DFFHQX1 \x_re_r_reg[2]  ( .D(N14), .CK(clk), .Q(x_re_r[2]) );
  DFFHQX1 \x_re_r_reg[1]  ( .D(N15), .CK(clk), .Q(x_re_r[1]) );
  DFFHQX1 \x_re_r_reg[0]  ( .D(N16), .CK(clk), .Q(x_re_r[0]) );
  DFFHQX1 \x_im_r_reg[11]  ( .D(N17), .CK(clk), .Q(x_im_r[11]) );
  DFFHQX1 \x_im_r_reg[10]  ( .D(N18), .CK(clk), .Q(x_im_r[10]) );
  DFFHQX1 \x_im_r_reg[9]  ( .D(N19), .CK(clk), .Q(x_im_r[9]) );
  DFFHQX1 \x_im_r_reg[8]  ( .D(N20), .CK(clk), .Q(x_im_r[8]) );
  DFFHQX1 \x_im_r_reg[7]  ( .D(N21), .CK(clk), .Q(x_im_r[7]) );
  DFFHQX1 \x_im_r_reg[6]  ( .D(N22), .CK(clk), .Q(x_im_r[6]) );
  DFFHQX1 \x_im_r_reg[5]  ( .D(N23), .CK(clk), .Q(x_im_r[5]) );
  DFFHQX1 \x_im_r_reg[4]  ( .D(N24), .CK(clk), .Q(x_im_r[4]) );
  DFFHQX1 \x_im_r_reg[3]  ( .D(N25), .CK(clk), .Q(x_im_r[3]) );
  DFFHQX1 \x_im_r_reg[2]  ( .D(N26), .CK(clk), .Q(x_im_r[2]) );
  DFFHQX1 \x_im_r_reg[1]  ( .D(N27), .CK(clk), .Q(x_im_r[1]) );
  DFFHQX1 \x_im_r_reg[0]  ( .D(N28), .CK(clk), .Q(x_im_r[0]) );
  DFFHQX1 \dx_im_reg[0]  ( .D(N53), .CK(clk), .Q(dx_im[0]) );
  DFFHQX1 \dx_im_reg[1]  ( .D(N52), .CK(clk), .Q(dx_im[1]) );
  DFFHQX1 \dx_im_reg[2]  ( .D(N51), .CK(clk), .Q(dx_im[2]) );
  DFFHQX1 \dx_im_reg[3]  ( .D(N50), .CK(clk), .Q(dx_im[3]) );
  DFFHQX1 \dx_im_reg[4]  ( .D(N49), .CK(clk), .Q(dx_im[4]) );
  DFFHQX1 \dx_im_reg[5]  ( .D(N48), .CK(clk), .Q(dx_im[5]) );
  DFFHQX1 \dx_im_reg[6]  ( .D(N47), .CK(clk), .Q(dx_im[6]) );
  DFFHQX1 \dx_im_reg[7]  ( .D(N46), .CK(clk), .Q(dx_im[7]) );
  DFFHQX1 \dx_im_reg[8]  ( .D(N45), .CK(clk), .Q(dx_im[8]) );
  DFFHQX1 \dx_im_reg[9]  ( .D(N44), .CK(clk), .Q(dx_im[9]) );
  DFFHQX1 \dx_im_reg[10]  ( .D(N43), .CK(clk), .Q(dx_im[10]) );
  DFFHQX1 \dx_re_reg[0]  ( .D(N41), .CK(clk), .Q(dx_re[0]) );
  DFFHQX1 \dx_re_reg[1]  ( .D(N40), .CK(clk), .Q(dx_re[1]) );
  DFFHQX1 \dx_re_reg[2]  ( .D(N39), .CK(clk), .Q(dx_re[2]) );
  DFFHQX1 \dx_re_reg[3]  ( .D(N38), .CK(clk), .Q(dx_re[3]) );
  DFFHQX1 \dx_re_reg[4]  ( .D(N37), .CK(clk), .Q(dx_re[4]) );
  DFFHQX1 \dx_re_reg[5]  ( .D(N36), .CK(clk), .Q(dx_re[5]) );
  DFFHQX1 \dx_re_reg[6]  ( .D(N35), .CK(clk), .Q(dx_re[6]) );
  DFFHQX1 \dx_re_reg[7]  ( .D(N34), .CK(clk), .Q(dx_re[7]) );
  DFFHQX1 \dx_re_reg[8]  ( .D(N33), .CK(clk), .Q(dx_re[8]) );
  DFFHQX1 \dx_re_reg[9]  ( .D(N32), .CK(clk), .Q(dx_re[9]) );
  DFFHQX1 \dx_re_reg[10]  ( .D(N31), .CK(clk), .Q(dx_re[10]) );
  DFFHQX1 \mux2_re_reg[11]  ( .D(N54), .CK(clk), .Q(mux2_re[11]) );
  DFFHQX1 \mux2_re_reg[10]  ( .D(N55), .CK(clk), .Q(mux2_re[10]) );
  DFFHQX1 \mux2_re_reg[9]  ( .D(N56), .CK(clk), .Q(mux2_re[9]) );
  DFFHQX1 \mux2_re_reg[8]  ( .D(N57), .CK(clk), .Q(mux2_re[8]) );
  DFFHQX1 \mux2_re_reg[7]  ( .D(N58), .CK(clk), .Q(mux2_re[7]) );
  DFFHQX1 \mux2_re_reg[6]  ( .D(N59), .CK(clk), .Q(mux2_re[6]) );
  DFFHQX1 \mux2_re_reg[5]  ( .D(N60), .CK(clk), .Q(mux2_re[5]) );
  DFFHQX1 \mux2_re_reg[4]  ( .D(N61), .CK(clk), .Q(mux2_re[4]) );
  DFFHQX1 \mux2_re_reg[3]  ( .D(N62), .CK(clk), .Q(mux2_re[3]) );
  DFFHQX1 \mux2_re_reg[2]  ( .D(N63), .CK(clk), .Q(mux2_re[2]) );
  DFFHQX1 \mux2_re_reg[1]  ( .D(N64), .CK(clk), .Q(mux2_re[1]) );
  DFFHQX1 \mux2_re_reg[0]  ( .D(N65), .CK(clk), .Q(mux2_re[0]) );
  DFFHQX1 \mux2_im_reg[11]  ( .D(N66), .CK(clk), .Q(mux2_im[11]) );
  DFFHQX1 \mux2_im_reg[10]  ( .D(N67), .CK(clk), .Q(mux2_im[10]) );
  DFFHQX1 \mux2_im_reg[9]  ( .D(N68), .CK(clk), .Q(mux2_im[9]) );
  DFFHQX1 \mux2_im_reg[8]  ( .D(N69), .CK(clk), .Q(mux2_im[8]) );
  DFFHQX1 \mux2_im_reg[7]  ( .D(N70), .CK(clk), .Q(mux2_im[7]) );
  DFFHQX1 \mux2_im_reg[6]  ( .D(N71), .CK(clk), .Q(mux2_im[6]) );
  DFFHQX1 \mux2_im_reg[5]  ( .D(N72), .CK(clk), .Q(mux2_im[5]) );
  DFFHQX1 \mux2_im_reg[4]  ( .D(N73), .CK(clk), .Q(mux2_im[4]) );
  DFFHQX1 \mux2_im_reg[3]  ( .D(N74), .CK(clk), .Q(mux2_im[3]) );
  DFFHQX1 \mux2_im_reg[2]  ( .D(N75), .CK(clk), .Q(mux2_im[2]) );
  DFFHQX1 \mux2_im_reg[1]  ( .D(N76), .CK(clk), .Q(mux2_im[1]) );
  DFFHQX1 \mux2_im_reg[0]  ( .D(N77), .CK(clk), .Q(mux2_im[0]) );
  DFFRHQX1 \count_reg[0]  ( .D(n120), .CK(clk), .RN(n121), .Q(N114) );
  DFFRHQX1 \count_reg[1]  ( .D(n119), .CK(clk), .RN(n121), .Q(N108) );
  DFFRHQX1 \count_reg[2]  ( .D(n118), .CK(clk), .RN(n121), .Q(N109) );
  DFFRHQX1 \count_reg[3]  ( .D(n117), .CK(clk), .RN(n121), .Q(N110) );
  DFFRHQX1 \count_reg[4]  ( .D(n116), .CK(clk), .RN(n121), .Q(count[4]) );
  DFFRHQX1 \count_reg[5]  ( .D(n115), .CK(clk), .RN(n121), .Q(count[5]) );
  DFFRHQX1 \count_reg[6]  ( .D(n114), .CK(clk), .RN(n121), .Q(count[6]) );
  DFFHQX1 \addr_reg[5]  ( .D(N125), .CK(clk), .Q(addr[5]) );
  DFFHQX1 \addr_reg[4]  ( .D(N124), .CK(clk), .Q(addr[4]) );
  DFFHQX1 \addr_reg[3]  ( .D(N123), .CK(clk), .Q(addr[3]) );
  DFFHQX1 \addr_reg[2]  ( .D(N122), .CK(clk), .Q(addr[2]) );
  DFFHQX1 \addr_reg[1]  ( .D(N121), .CK(clk), .Q(addr[1]) );
  DFFHQX1 \addr_reg[0]  ( .D(N120), .CK(clk), .Q(addr[0]) );
  DFFHQX1 temp1_en_reg ( .D(N131), .CK(clk), .Q(temp1_en) );
  DFFHQX1 \y_re_reg[11]  ( .D(N133), .CK(clk), .Q(y_re[11]) );
  DFFHQX1 \y_re_reg[10]  ( .D(N134), .CK(clk), .Q(y_re[10]) );
  DFFHQX1 \y_re_reg[9]  ( .D(N135), .CK(clk), .Q(y_re[9]) );
  DFFHQX1 \y_re_reg[8]  ( .D(N136), .CK(clk), .Q(y_re[8]) );
  DFFHQX1 \y_re_reg[7]  ( .D(N137), .CK(clk), .Q(y_re[7]) );
  DFFHQX1 \y_re_reg[6]  ( .D(N138), .CK(clk), .Q(y_re[6]) );
  DFFHQX1 \y_re_reg[5]  ( .D(N139), .CK(clk), .Q(y_re[5]) );
  DFFHQX1 \y_re_reg[4]  ( .D(N140), .CK(clk), .Q(y_re[4]) );
  DFFHQX1 \y_re_reg[3]  ( .D(N141), .CK(clk), .Q(y_re[3]) );
  DFFHQX1 \y_re_reg[2]  ( .D(N142), .CK(clk), .Q(y_re[2]) );
  DFFHQX1 \y_re_reg[1]  ( .D(N143), .CK(clk), .Q(y_re[1]) );
  DFFHQX1 \y_re_reg[0]  ( .D(N144), .CK(clk), .Q(y_re[0]) );
  DFFHQX1 \y_im_reg[11]  ( .D(N145), .CK(clk), .Q(y_im[11]) );
  DFFHQX1 \y_im_reg[10]  ( .D(N146), .CK(clk), .Q(y_im[10]) );
  DFFHQX1 \y_im_reg[9]  ( .D(N147), .CK(clk), .Q(y_im[9]) );
  DFFHQX1 \y_im_reg[8]  ( .D(N148), .CK(clk), .Q(y_im[8]) );
  DFFHQX1 \y_im_reg[7]  ( .D(N149), .CK(clk), .Q(y_im[7]) );
  DFFHQX1 \y_im_reg[6]  ( .D(N150), .CK(clk), .Q(y_im[6]) );
  DFFHQX1 \y_im_reg[5]  ( .D(N151), .CK(clk), .Q(y_im[5]) );
  DFFHQX1 \y_im_reg[4]  ( .D(N152), .CK(clk), .Q(y_im[4]) );
  DFFHQX1 \y_im_reg[3]  ( .D(N153), .CK(clk), .Q(y_im[3]) );
  DFFHQX1 \y_im_reg[2]  ( .D(N154), .CK(clk), .Q(y_im[2]) );
  DFFHQX1 \y_im_reg[1]  ( .D(N155), .CK(clk), .Q(y_im[1]) );
  DFFHQX1 \y_im_reg[0]  ( .D(N156), .CK(clk), .Q(y_im[0]) );
  DFFHQX1 \temp4_re_reg[11]  ( .D(temp3_re[11]), .CK(clk), .Q(temp4_re[11]) );
  DFFHQX1 \temp4_re_reg[10]  ( .D(temp3_re[10]), .CK(clk), .Q(temp4_re[10]) );
  DFFHQX1 \temp4_re_reg[9]  ( .D(temp3_re[9]), .CK(clk), .Q(temp4_re[9]) );
  DFFHQX1 \temp4_re_reg[8]  ( .D(temp3_re[8]), .CK(clk), .Q(temp4_re[8]) );
  DFFHQX1 \temp4_re_reg[7]  ( .D(temp3_re[7]), .CK(clk), .Q(temp4_re[7]) );
  DFFHQX1 \temp4_re_reg[6]  ( .D(temp3_re[6]), .CK(clk), .Q(temp4_re[6]) );
  DFFHQX1 \temp4_re_reg[5]  ( .D(temp3_re[5]), .CK(clk), .Q(temp4_re[5]) );
  DFFHQX1 \temp4_re_reg[4]  ( .D(temp3_re[4]), .CK(clk), .Q(temp4_re[4]) );
  DFFHQX1 \temp4_re_reg[3]  ( .D(temp3_re[3]), .CK(clk), .Q(temp4_re[3]) );
  DFFHQX1 \temp4_re_reg[2]  ( .D(temp3_re[2]), .CK(clk), .Q(temp4_re[2]) );
  DFFHQX1 \temp4_re_reg[1]  ( .D(temp3_re[1]), .CK(clk), .Q(temp4_re[1]) );
  DFFHQX1 \temp4_re_reg[0]  ( .D(temp3_re[0]), .CK(clk), .Q(temp4_re[0]) );
  DFFHQX1 \temp4_im_reg[11]  ( .D(temp3_im[11]), .CK(clk), .Q(temp4_im[11]) );
  DFFHQX1 \temp4_im_reg[10]  ( .D(temp3_im[10]), .CK(clk), .Q(temp4_im[10]) );
  DFFHQX1 \temp4_im_reg[9]  ( .D(temp3_im[9]), .CK(clk), .Q(temp4_im[9]) );
  DFFHQX1 \temp4_im_reg[8]  ( .D(temp3_im[8]), .CK(clk), .Q(temp4_im[8]) );
  DFFHQX1 \temp4_im_reg[7]  ( .D(temp3_im[7]), .CK(clk), .Q(temp4_im[7]) );
  DFFHQX1 \temp4_im_reg[6]  ( .D(temp3_im[6]), .CK(clk), .Q(temp4_im[6]) );
  DFFHQX1 \temp4_im_reg[5]  ( .D(temp3_im[5]), .CK(clk), .Q(temp4_im[5]) );
  DFFHQX1 \temp4_im_reg[4]  ( .D(temp3_im[4]), .CK(clk), .Q(temp4_im[4]) );
  DFFHQX1 \temp4_im_reg[3]  ( .D(temp3_im[3]), .CK(clk), .Q(temp4_im[3]) );
  DFFHQX1 \temp4_im_reg[2]  ( .D(temp3_im[2]), .CK(clk), .Q(temp4_im[2]) );
  DFFHQX1 \temp4_im_reg[1]  ( .D(temp3_im[1]), .CK(clk), .Q(temp4_im[1]) );
  DFFHQX1 \temp4_im_reg[0]  ( .D(temp3_im[0]), .CK(clk), .Q(temp4_im[0]) );
  DFFHQX1 \temp1_im_reg[11]  ( .D(mux2_im[11]), .CK(clk), .Q(temp1_im[11]) );
  DFFHQX1 \temp2_im_reg[11]  ( .D(temp1_im[11]), .CK(clk), .Q(temp2_im[11]) );
  DFFHQX1 \temp1_im_reg[10]  ( .D(mux2_im[10]), .CK(clk), .Q(temp1_im[10]) );
  DFFHQX1 \temp2_im_reg[10]  ( .D(temp1_im[10]), .CK(clk), .Q(temp2_im[10]) );
  DFFHQX1 \temp1_im_reg[9]  ( .D(mux2_im[9]), .CK(clk), .Q(temp1_im[9]) );
  DFFHQX1 \temp2_im_reg[9]  ( .D(temp1_im[9]), .CK(clk), .Q(temp2_im[9]) );
  DFFHQX1 \temp1_im_reg[8]  ( .D(mux2_im[8]), .CK(clk), .Q(temp1_im[8]) );
  DFFHQX1 \temp2_im_reg[8]  ( .D(temp1_im[8]), .CK(clk), .Q(temp2_im[8]) );
  DFFHQX1 \temp1_im_reg[7]  ( .D(mux2_im[7]), .CK(clk), .Q(temp1_im[7]) );
  DFFHQX1 \temp2_im_reg[7]  ( .D(temp1_im[7]), .CK(clk), .Q(temp2_im[7]) );
  DFFHQX1 \temp1_im_reg[6]  ( .D(mux2_im[6]), .CK(clk), .Q(temp1_im[6]) );
  DFFHQX1 \temp2_im_reg[6]  ( .D(temp1_im[6]), .CK(clk), .Q(temp2_im[6]) );
  DFFHQX1 \temp1_im_reg[5]  ( .D(mux2_im[5]), .CK(clk), .Q(temp1_im[5]) );
  DFFHQX1 \temp2_im_reg[5]  ( .D(temp1_im[5]), .CK(clk), .Q(temp2_im[5]) );
  DFFHQX1 \temp1_im_reg[4]  ( .D(mux2_im[4]), .CK(clk), .Q(temp1_im[4]) );
  DFFHQX1 \temp2_im_reg[4]  ( .D(temp1_im[4]), .CK(clk), .Q(temp2_im[4]) );
  DFFHQX1 \temp1_im_reg[3]  ( .D(mux2_im[3]), .CK(clk), .Q(temp1_im[3]) );
  DFFHQX1 \temp2_im_reg[3]  ( .D(temp1_im[3]), .CK(clk), .Q(temp2_im[3]) );
  DFFHQX1 \temp1_im_reg[2]  ( .D(mux2_im[2]), .CK(clk), .Q(temp1_im[2]) );
  DFFHQX1 \temp2_im_reg[2]  ( .D(temp1_im[2]), .CK(clk), .Q(temp2_im[2]) );
  DFFHQX1 \temp1_im_reg[1]  ( .D(mux2_im[1]), .CK(clk), .Q(temp1_im[1]) );
  DFFHQX1 \temp2_im_reg[1]  ( .D(temp1_im[1]), .CK(clk), .Q(temp2_im[1]) );
  DFFHQX1 \temp1_im_reg[0]  ( .D(mux2_im[0]), .CK(clk), .Q(temp1_im[0]) );
  DFFHQX1 \temp2_im_reg[0]  ( .D(temp1_im[0]), .CK(clk), .Q(temp2_im[0]) );
  DFFHQX1 \temp1_re_reg[11]  ( .D(mux2_re[11]), .CK(clk), .Q(temp1_re[11]) );
  DFFHQX1 \temp2_re_reg[11]  ( .D(temp1_re[11]), .CK(clk), .Q(temp2_re[11]) );
  DFFHQX1 \temp1_re_reg[10]  ( .D(mux2_re[10]), .CK(clk), .Q(temp1_re[10]) );
  DFFHQX1 \temp2_re_reg[10]  ( .D(temp1_re[10]), .CK(clk), .Q(temp2_re[10]) );
  DFFHQX1 \temp1_re_reg[9]  ( .D(mux2_re[9]), .CK(clk), .Q(temp1_re[9]) );
  DFFHQX1 \temp2_re_reg[9]  ( .D(temp1_re[9]), .CK(clk), .Q(temp2_re[9]) );
  DFFHQX1 \temp1_re_reg[8]  ( .D(mux2_re[8]), .CK(clk), .Q(temp1_re[8]) );
  DFFHQX1 \temp2_re_reg[8]  ( .D(temp1_re[8]), .CK(clk), .Q(temp2_re[8]) );
  DFFHQX1 \temp1_re_reg[7]  ( .D(mux2_re[7]), .CK(clk), .Q(temp1_re[7]) );
  DFFHQX1 \temp2_re_reg[7]  ( .D(temp1_re[7]), .CK(clk), .Q(temp2_re[7]) );
  DFFHQX1 \temp1_re_reg[6]  ( .D(mux2_re[6]), .CK(clk), .Q(temp1_re[6]) );
  DFFHQX1 \temp2_re_reg[6]  ( .D(temp1_re[6]), .CK(clk), .Q(temp2_re[6]) );
  DFFHQX1 \temp1_re_reg[5]  ( .D(mux2_re[5]), .CK(clk), .Q(temp1_re[5]) );
  DFFHQX1 \temp2_re_reg[5]  ( .D(temp1_re[5]), .CK(clk), .Q(temp2_re[5]) );
  DFFHQX1 \temp1_re_reg[4]  ( .D(mux2_re[4]), .CK(clk), .Q(temp1_re[4]) );
  DFFHQX1 \temp2_re_reg[4]  ( .D(temp1_re[4]), .CK(clk), .Q(temp2_re[4]) );
  DFFHQX1 \temp1_re_reg[3]  ( .D(mux2_re[3]), .CK(clk), .Q(temp1_re[3]) );
  DFFHQX1 \temp2_re_reg[3]  ( .D(temp1_re[3]), .CK(clk), .Q(temp2_re[3]) );
  DFFHQX1 \temp1_re_reg[2]  ( .D(mux2_re[2]), .CK(clk), .Q(temp1_re[2]) );
  DFFHQX1 \temp2_re_reg[2]  ( .D(temp1_re[2]), .CK(clk), .Q(temp2_re[2]) );
  DFFHQX1 \temp1_re_reg[1]  ( .D(mux2_re[1]), .CK(clk), .Q(temp1_re[1]) );
  DFFHQX1 \temp2_re_reg[1]  ( .D(temp1_re[1]), .CK(clk), .Q(temp2_re[1]) );
  DFFHQX1 \temp1_re_reg[0]  ( .D(mux2_re[0]), .CK(clk), .Q(temp1_re[0]) );
  DFFHQX1 \temp2_re_reg[0]  ( .D(temp1_re[0]), .CK(clk), .Q(temp2_re[0]) );
  DFFHQX1 temp2_en_reg ( .D(temp1_en), .CK(clk), .Q(temp2_en) );
  DFFHQX1 temp3_en_reg ( .D(temp2_en), .CK(clk), .Q(temp3_en) );
  DFFHQX1 \temp3_im_reg[11]  ( .D(temp2_im[11]), .CK(clk), .Q(temp3_im[11]) );
  DFFHQX1 \temp3_im_reg[10]  ( .D(temp2_im[10]), .CK(clk), .Q(temp3_im[10]) );
  DFFHQX1 \temp3_im_reg[9]  ( .D(temp2_im[9]), .CK(clk), .Q(temp3_im[9]) );
  DFFHQX1 \temp3_im_reg[8]  ( .D(temp2_im[8]), .CK(clk), .Q(temp3_im[8]) );
  DFFHQX1 \temp3_im_reg[7]  ( .D(temp2_im[7]), .CK(clk), .Q(temp3_im[7]) );
  DFFHQX1 \temp3_im_reg[6]  ( .D(temp2_im[6]), .CK(clk), .Q(temp3_im[6]) );
  DFFHQX1 \temp3_im_reg[5]  ( .D(temp2_im[5]), .CK(clk), .Q(temp3_im[5]) );
  DFFHQX1 \temp3_im_reg[4]  ( .D(temp2_im[4]), .CK(clk), .Q(temp3_im[4]) );
  DFFHQX1 \temp3_im_reg[3]  ( .D(temp2_im[3]), .CK(clk), .Q(temp3_im[3]) );
  DFFHQX1 \temp3_im_reg[2]  ( .D(temp2_im[2]), .CK(clk), .Q(temp3_im[2]) );
  DFFHQX1 \temp3_im_reg[1]  ( .D(temp2_im[1]), .CK(clk), .Q(temp3_im[1]) );
  DFFHQX1 \temp3_im_reg[0]  ( .D(temp2_im[0]), .CK(clk), .Q(temp3_im[0]) );
  DFFHQX1 \temp3_re_reg[11]  ( .D(temp2_re[11]), .CK(clk), .Q(temp3_re[11]) );
  DFFHQX1 \temp3_re_reg[10]  ( .D(temp2_re[10]), .CK(clk), .Q(temp3_re[10]) );
  DFFHQX1 \temp3_re_reg[9]  ( .D(temp2_re[9]), .CK(clk), .Q(temp3_re[9]) );
  DFFHQX1 \temp3_re_reg[8]  ( .D(temp2_re[8]), .CK(clk), .Q(temp3_re[8]) );
  DFFHQX1 \temp3_re_reg[7]  ( .D(temp2_re[7]), .CK(clk), .Q(temp3_re[7]) );
  DFFHQX1 \temp3_re_reg[6]  ( .D(temp2_re[6]), .CK(clk), .Q(temp3_re[6]) );
  DFFHQX1 \temp3_re_reg[5]  ( .D(temp2_re[5]), .CK(clk), .Q(temp3_re[5]) );
  DFFHQX1 \temp3_re_reg[4]  ( .D(temp2_re[4]), .CK(clk), .Q(temp3_re[4]) );
  DFFHQX1 \temp3_re_reg[3]  ( .D(temp2_re[3]), .CK(clk), .Q(temp3_re[3]) );
  DFFHQX1 \temp3_re_reg[2]  ( .D(temp2_re[2]), .CK(clk), .Q(temp3_re[2]) );
  DFFHQX1 \temp3_re_reg[1]  ( .D(temp2_re[1]), .CK(clk), .Q(temp3_re[1]) );
  DFFHQX1 \temp3_re_reg[0]  ( .D(temp2_re[0]), .CK(clk), .Q(temp3_re[0]) );
  DFFHQX1 temp4_en_reg ( .D(temp3_en), .CK(clk), .Q(temp4_en) );
  DFFNRX1 start_reg ( .D(n122), .CKN(clk), .RN(n121), .Q(n2), .QN(n21) );
  DFFHQXL \dx_re_reg[11]  ( .D(N30), .CK(clk), .Q(dx_re[11]) );
  DFFHQXL \dx_im_reg[11]  ( .D(N42), .CK(clk), .Q(dx_im[11]) );
  OAI21XL U3 ( .A0(n14), .A1(n15), .B0(N114), .Y(n1) );
  INVX1 U4 ( .A(n1), .Y(N120) );
  AND4X2 U5 ( .A(\mult_143/n2 ), .B(count[6]), .C(n8), .D(n9), .Y(N125) );
  NAND2BX1 U6 ( .AN(N4), .B(n21), .Y(n122) );
  INVX1 U7 ( .A(reset), .Y(n121) );
  OAI2BB2X1 U8 ( .B0(n2), .B1(n3), .A0N(N81), .A1N(n4), .Y(n120) );
  OAI2BB2X1 U9 ( .B0(n2), .B1(n5), .A0N(N82), .A1N(n4), .Y(n119) );
  OAI2BB2X1 U10 ( .B0(n2), .B1(n6), .A0N(N83), .A1N(n4), .Y(n118) );
  OAI2BB2X1 U11 ( .B0(n2), .B1(n7), .A0N(N84), .A1N(n4), .Y(n117) );
  OAI2BB2X1 U12 ( .B0(n2), .B1(n8), .A0N(N85), .A1N(n4), .Y(n116) );
  OAI2BB2X1 U13 ( .B0(n2), .B1(n9), .A0N(N86), .A1N(n4), .Y(n115) );
  OAI2BB2X1 U14 ( .B0(n2), .B1(n10), .A0N(N87), .A1N(n4), .Y(n114) );
  AOI2BB1X1 U15 ( .A0N(n11), .A1N(n12), .B0(n21), .Y(n4) );
  NAND3X1 U16 ( .A(count[5]), .B(N109), .C(count[6]), .Y(n12) );
  NAND4X1 U17 ( .A(n3), .B(n5), .C(n7), .D(n8), .Y(n11) );
  AND2X1 U18 ( .A(x_re[7]), .B(N4), .Y(N9) );
  AND2X1 U19 ( .A(x_re[8]), .B(N4), .Y(N8) );
  MX2X1 U20 ( .A(dy_im[0]), .B(bf_y0_im[0]), .S0(sel), .Y(N77) );
  MX2X1 U21 ( .A(dy_im[1]), .B(bf_y0_im[1]), .S0(sel), .Y(N76) );
  MX2X1 U22 ( .A(dy_im[2]), .B(bf_y0_im[2]), .S0(sel), .Y(N75) );
  MX2X1 U23 ( .A(dy_im[3]), .B(bf_y0_im[3]), .S0(sel), .Y(N74) );
  MX2X1 U24 ( .A(dy_im[4]), .B(bf_y0_im[4]), .S0(sel), .Y(N73) );
  MX2X1 U25 ( .A(dy_im[5]), .B(bf_y0_im[5]), .S0(sel), .Y(N72) );
  MX2X1 U26 ( .A(dy_im[6]), .B(bf_y0_im[6]), .S0(sel), .Y(N71) );
  MX2X1 U27 ( .A(dy_im[7]), .B(bf_y0_im[7]), .S0(sel), .Y(N70) );
  AND2X1 U28 ( .A(x_re[9]), .B(N4), .Y(N7) );
  MX2X1 U29 ( .A(dy_im[8]), .B(bf_y0_im[8]), .S0(sel), .Y(N69) );
  MX2X1 U30 ( .A(dy_im[9]), .B(bf_y0_im[9]), .S0(sel), .Y(N68) );
  MX2X1 U31 ( .A(dy_im[10]), .B(bf_y0_im[10]), .S0(sel), .Y(N67) );
  MX2X1 U32 ( .A(dy_im[11]), .B(bf_y0_im[11]), .S0(sel), .Y(N66) );
  MX2X1 U33 ( .A(dy_re[0]), .B(bf_y0_re[0]), .S0(sel), .Y(N65) );
  MX2X1 U34 ( .A(dy_re[1]), .B(bf_y0_re[1]), .S0(sel), .Y(N64) );
  MX2X1 U35 ( .A(dy_re[2]), .B(bf_y0_re[2]), .S0(sel), .Y(N63) );
  MX2X1 U36 ( .A(dy_re[3]), .B(bf_y0_re[3]), .S0(sel), .Y(N62) );
  MX2X1 U37 ( .A(dy_re[4]), .B(bf_y0_re[4]), .S0(sel), .Y(N61) );
  MX2X1 U38 ( .A(dy_re[5]), .B(bf_y0_re[5]), .S0(sel), .Y(N60) );
  AND2X1 U39 ( .A(x_re[10]), .B(N4), .Y(N6) );
  MX2X1 U40 ( .A(dy_re[6]), .B(bf_y0_re[6]), .S0(sel), .Y(N59) );
  MX2X1 U41 ( .A(dy_re[7]), .B(bf_y0_re[7]), .S0(sel), .Y(N58) );
  MX2X1 U42 ( .A(dy_re[8]), .B(bf_y0_re[8]), .S0(sel), .Y(N57) );
  MX2X1 U43 ( .A(dy_re[9]), .B(bf_y0_re[9]), .S0(sel), .Y(N56) );
  MX2X1 U44 ( .A(dy_re[10]), .B(bf_y0_re[10]), .S0(sel), .Y(N55) );
  MX2X1 U45 ( .A(dy_re[11]), .B(bf_y0_re[11]), .S0(sel), .Y(N54) );
  MX2X1 U46 ( .A(x_im_r[0]), .B(bf_y1_im[0]), .S0(sel), .Y(N53) );
  MX2X1 U47 ( .A(x_im_r[1]), .B(bf_y1_im[1]), .S0(sel), .Y(N52) );
  MX2X1 U48 ( .A(x_im_r[2]), .B(bf_y1_im[2]), .S0(sel), .Y(N51) );
  MX2X1 U49 ( .A(x_im_r[3]), .B(bf_y1_im[3]), .S0(sel), .Y(N50) );
  AND2X1 U50 ( .A(x_re[11]), .B(N4), .Y(N5) );
  MX2X1 U51 ( .A(x_im_r[4]), .B(bf_y1_im[4]), .S0(sel), .Y(N49) );
  MX2X1 U52 ( .A(x_im_r[5]), .B(bf_y1_im[5]), .S0(sel), .Y(N48) );
  MX2X1 U53 ( .A(x_im_r[6]), .B(bf_y1_im[6]), .S0(sel), .Y(N47) );
  MX2X1 U54 ( .A(x_im_r[7]), .B(bf_y1_im[7]), .S0(sel), .Y(N46) );
  MX2X1 U55 ( .A(x_im_r[8]), .B(bf_y1_im[8]), .S0(sel), .Y(N45) );
  MX2X1 U56 ( .A(x_im_r[9]), .B(bf_y1_im[9]), .S0(sel), .Y(N44) );
  MX2X1 U57 ( .A(x_im_r[10]), .B(bf_y1_im[10]), .S0(sel), .Y(N43) );
  MX2X1 U58 ( .A(x_im_r[11]), .B(bf_y1_im[11]), .S0(sel), .Y(N42) );
  MX2X1 U59 ( .A(x_re_r[0]), .B(bf_y1_re[0]), .S0(sel), .Y(N41) );
  MX2X1 U60 ( .A(x_re_r[1]), .B(bf_y1_re[1]), .S0(sel), .Y(N40) );
  MX2X1 U61 ( .A(x_re_r[2]), .B(bf_y1_re[2]), .S0(sel), .Y(N39) );
  MX2X1 U62 ( .A(x_re_r[3]), .B(bf_y1_re[3]), .S0(sel), .Y(N38) );
  MX2X1 U63 ( .A(x_re_r[4]), .B(bf_y1_re[4]), .S0(sel), .Y(N37) );
  MX2X1 U64 ( .A(x_re_r[5]), .B(bf_y1_re[5]), .S0(sel), .Y(N36) );
  MX2X1 U65 ( .A(x_re_r[6]), .B(bf_y1_re[6]), .S0(sel), .Y(N35) );
  MX2X1 U66 ( .A(x_re_r[7]), .B(bf_y1_re[7]), .S0(sel), .Y(N34) );
  MX2X1 U67 ( .A(x_re_r[8]), .B(bf_y1_re[8]), .S0(sel), .Y(N33) );
  MX2X1 U68 ( .A(x_re_r[9]), .B(bf_y1_re[9]), .S0(sel), .Y(N32) );
  MX2X1 U69 ( .A(x_re_r[10]), .B(bf_y1_re[10]), .S0(sel), .Y(N31) );
  MX2X1 U70 ( .A(x_re_r[11]), .B(bf_y1_re[11]), .S0(sel), .Y(N30) );
  AND2X1 U71 ( .A(x_im[0]), .B(N4), .Y(N28) );
  AND2X1 U72 ( .A(x_im[1]), .B(N4), .Y(N27) );
  AND2X1 U73 ( .A(x_im[2]), .B(N4), .Y(N26) );
  AND2X1 U74 ( .A(x_im[3]), .B(N4), .Y(N25) );
  AND2X1 U75 ( .A(x_im[4]), .B(N4), .Y(N24) );
  AND2X1 U76 ( .A(x_im[5]), .B(N4), .Y(N23) );
  AND2X1 U77 ( .A(x_im[6]), .B(N4), .Y(N22) );
  AND2X1 U78 ( .A(x_im[7]), .B(N4), .Y(N21) );
  AND2X1 U79 ( .A(x_im[8]), .B(N4), .Y(N20) );
  AND2X1 U80 ( .A(x_im[9]), .B(N4), .Y(N19) );
  AND2X1 U81 ( .A(x_im[10]), .B(N4), .Y(N18) );
  AND2X1 U82 ( .A(x_im[11]), .B(N4), .Y(N17) );
  AND2X1 U83 ( .A(x_re[0]), .B(N4), .Y(N16) );
  MX2X1 U84 ( .A(temp4_im[0]), .B(dout_im[0]), .S0(en), .Y(N156) );
  MX2X1 U85 ( .A(temp4_im[1]), .B(dout_im[1]), .S0(en), .Y(N155) );
  MX2X1 U86 ( .A(temp4_im[2]), .B(dout_im[2]), .S0(en), .Y(N154) );
  MX2X1 U87 ( .A(temp4_im[3]), .B(dout_im[3]), .S0(en), .Y(N153) );
  MX2X1 U88 ( .A(temp4_im[4]), .B(dout_im[4]), .S0(en), .Y(N152) );
  MX2X1 U89 ( .A(temp4_im[5]), .B(dout_im[5]), .S0(en), .Y(N151) );
  MX2X1 U90 ( .A(temp4_im[6]), .B(dout_im[6]), .S0(en), .Y(N150) );
  AND2X1 U91 ( .A(x_re[1]), .B(N4), .Y(N15) );
  MX2X1 U92 ( .A(temp4_im[7]), .B(dout_im[7]), .S0(en), .Y(N149) );
  MX2X1 U93 ( .A(temp4_im[8]), .B(dout_im[8]), .S0(en), .Y(N148) );
  MX2X1 U94 ( .A(temp4_im[9]), .B(dout_im[9]), .S0(en), .Y(N147) );
  MX2X1 U95 ( .A(temp4_im[10]), .B(dout_im[10]), .S0(en), .Y(N146) );
  MX2X1 U96 ( .A(temp4_im[11]), .B(dout_im[11]), .S0(en), .Y(N145) );
  MX2X1 U97 ( .A(temp4_re[0]), .B(dout_re[0]), .S0(en), .Y(N144) );
  MX2X1 U98 ( .A(temp4_re[1]), .B(dout_re[1]), .S0(en), .Y(N143) );
  MX2X1 U99 ( .A(temp4_re[2]), .B(dout_re[2]), .S0(en), .Y(N142) );
  MX2X1 U100 ( .A(temp4_re[3]), .B(dout_re[3]), .S0(en), .Y(N141) );
  MX2X1 U101 ( .A(temp4_re[4]), .B(dout_re[4]), .S0(en), .Y(N140) );
  AND2X1 U102 ( .A(x_re[2]), .B(N4), .Y(N14) );
  MX2X1 U103 ( .A(temp4_re[5]), .B(dout_re[5]), .S0(en), .Y(N139) );
  MX2X1 U104 ( .A(temp4_re[6]), .B(dout_re[6]), .S0(en), .Y(N138) );
  MX2X1 U105 ( .A(temp4_re[7]), .B(dout_re[7]), .S0(en), .Y(N137) );
  MX2X1 U106 ( .A(temp4_re[8]), .B(dout_re[8]), .S0(en), .Y(N136) );
  MX2X1 U107 ( .A(temp4_re[9]), .B(dout_re[9]), .S0(en), .Y(N135) );
  MX2X1 U108 ( .A(temp4_re[10]), .B(dout_re[10]), .S0(en), .Y(N134) );
  MX2X1 U109 ( .A(temp4_re[11]), .B(dout_re[11]), .S0(en), .Y(N133) );
  OR4X1 U110 ( .A(addr[2]), .B(addr[1]), .C(addr[0]), .D(n13), .Y(N131) );
  OR3XL U111 ( .A(addr[5]), .B(addr[4]), .C(addr[3]), .Y(n13) );
  AND2X1 U112 ( .A(x_re[3]), .B(N4), .Y(N13) );
  OAI21XL U113 ( .A0(n7), .A1(n16), .B0(n17), .Y(N124) );
  AOI22X1 U114 ( .A0(N118), .A1(n14), .B0(n8), .B1(n15), .Y(n17) );
  INVX1 U115 ( .A(N110), .Y(n7) );
  OAI21XL U116 ( .A0(n6), .A1(n16), .B0(n18), .Y(N123) );
  AOI22X1 U117 ( .A0(N117), .A1(n14), .B0(N110), .B1(n15), .Y(n18) );
  INVX1 U118 ( .A(N109), .Y(n6) );
  OAI21XL U119 ( .A0(n5), .A1(n16), .B0(n19), .Y(N122) );
  AOI22X1 U120 ( .A0(N116), .A1(n14), .B0(N109), .B1(n15), .Y(n19) );
  INVX1 U121 ( .A(N108), .Y(n5) );
  OAI21XL U122 ( .A0(n3), .A1(n16), .B0(n20), .Y(N121) );
  AOI22X1 U123 ( .A0(N115), .A1(n14), .B0(N108), .B1(n15), .Y(n20) );
  NAND3X1 U124 ( .A(n8), .B(n10), .C(count[5]), .Y(n16) );
  INVX1 U125 ( .A(N114), .Y(n3) );
  NOR3X1 U126 ( .A(n9), .B(count[6]), .C(n8), .Y(n15) );
  INVX1 U127 ( .A(count[4]), .Y(n8) );
  INVX1 U128 ( .A(count[5]), .Y(n9) );
  NOR3X1 U129 ( .A(count[4]), .B(count[5]), .C(n10), .Y(n14) );
  INVX1 U130 ( .A(count[6]), .Y(n10) );
  AND2X1 U131 ( .A(x_re[4]), .B(N4), .Y(N12) );
  AND2X1 U132 ( .A(x_re[5]), .B(N4), .Y(N11) );
  AND2X1 U133 ( .A(x_re[6]), .B(N4), .Y(N10) );
  DFFHQX2 en_reg ( .D(temp4_en), .CK(clk), .Q(en) );
  FSM2 f0 ( .clk(clk), .reset(reset), .di_en(N4), .sel(sel), .do_en(do_en) );
  delaybuffer_WIDTH12_DEPTH15 d0 ( .clk(clk), .reset(reset), .x_re(dx_re), 
        .x_im(dx_im), .y_re(dy_re), .y_im(dy_im) );
  butterfly2_WIDTH12_4 b0 ( .x0_re(dy_re), .x0_im(dy_im), .x1_re(x_re_r), 
        .x1_im(x_im_r), .y0_re(bf_y0_re), .y0_im(bf_y0_im), .y1_re(bf_y1_re), 
        .y1_im(bf_y1_im) );
  twiddle2 t0 ( .clk(clk), .addr(addr), .tw_re(tw_re), .tw_im(tw_im) );
  multiply_WIDTH12_1 m0 ( .clk(clk), .a_re(mux2_re), .a_im(mux2_im), .b_re(
        tw_re), .b_im(tw_im), .m_re(dout_re), .m_im(dout_im) );
  sdfunit2_WIDTH12_DEPTH15_DW01_inc_0_DW01_inc_11 add_132 ( .A({count[6:4], 
        N110, N109, N108, N114}), .SUM({N87, N86, N85, N84, N83, N82, N81}) );
endmodule


module signal_control_DW01_inc_0_DW01_inc_10 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module signal_control ( clk, reset, di_en, sel, bf_nj, do_en );
  input clk, reset, di_en;
  output sel, bf_nj, do_en;
  wire   start_count, N29, N30, N31, N32, N33, N34, N35, N51, N52, N53, N54,
         N59, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38;
  wire   [3:0] cnt;
  wire   [6:0] cnt2;
  wire   [3:0] cnt3;

  DFFRHQX1 \cnt2_reg[0]  ( .D(n58), .CK(clk), .RN(n59), .Q(cnt2[0]) );
  DFFRHQX1 \cnt2_reg[1]  ( .D(n57), .CK(clk), .RN(n59), .Q(cnt2[1]) );
  DFFRHQX1 \cnt2_reg[2]  ( .D(n56), .CK(clk), .RN(n59), .Q(cnt2[2]) );
  DFFRHQX1 \cnt2_reg[3]  ( .D(n55), .CK(clk), .RN(n59), .Q(cnt2[3]) );
  DFFRHQX1 \cnt2_reg[4]  ( .D(n54), .CK(clk), .RN(n59), .Q(cnt2[4]) );
  DFFRHQX1 \cnt2_reg[5]  ( .D(n53), .CK(clk), .RN(n59), .Q(cnt2[5]) );
  DFFRHQX1 \cnt2_reg[6]  ( .D(n52), .CK(clk), .RN(n59), .Q(cnt2[6]) );
  DFFRHQX2 do_en_r_reg ( .D(N59), .CK(clk), .RN(n59), .Q(do_en) );
  DFFNRX1 start_count_reg ( .D(n60), .CKN(clk), .RN(n59), .Q(start_count), 
        .QN(n13) );
  DFFRHQX1 \cnt_reg[2]  ( .D(n62), .CK(clk), .RN(n59), .Q(cnt[2]) );
  DFFRHQX1 \cnt_reg[3]  ( .D(n61), .CK(clk), .RN(n59), .Q(cnt[3]) );
  DFFHQX1 \cnt3_reg[0]  ( .D(N51), .CK(clk), .Q(cnt3[0]) );
  DFFHQX1 \cnt3_reg[1]  ( .D(N52), .CK(clk), .Q(cnt3[1]) );
  DFFHQX1 \cnt3_reg[2]  ( .D(N53), .CK(clk), .Q(cnt3[2]) );
  DFFHQX1 \cnt3_reg[3]  ( .D(N54), .CK(clk), .Q(cnt3[3]) );
  NAND2X1 U3 ( .A(n2), .B(n3), .Y(n1) );
  MXI2X4 U4 ( .A(n25), .B(n26), .S0(n27), .Y(bf_nj) );
  XNOR2X4 U5 ( .A(cnt[3]), .B(n1), .Y(sel) );
  MX2X1 U6 ( .A(n4), .B(n5), .S0(cnt[0]), .Y(n64) );
  OAI2BB2X1 U7 ( .B0(n6), .B1(n7), .A0N(cnt[1]), .A1N(n5), .Y(n63) );
  MXI2X1 U8 ( .A(n8), .B(n9), .S0(cnt[2]), .Y(n62) );
  AOI21X1 U9 ( .A0(n4), .A1(n3), .B0(n5), .Y(n9) );
  NOR2X1 U10 ( .A(n10), .B(start_count), .Y(n5) );
  NAND2BX1 U11 ( .AN(n3), .B(n4), .Y(n8) );
  MXI2X1 U12 ( .A(n11), .B(n12), .S0(cnt[3]), .Y(n61) );
  OAI31X1 U13 ( .A0(n3), .A1(n2), .A2(n13), .B0(n14), .Y(n12) );
  OR3XL U14 ( .A(n2), .B(n7), .C(n3), .Y(n11) );
  NAND2X1 U15 ( .A(cnt[1]), .B(cnt[0]), .Y(n3) );
  INVX1 U16 ( .A(n4), .Y(n7) );
  NOR2X1 U17 ( .A(n13), .B(n10), .Y(n4) );
  NOR2BX1 U18 ( .AN(n6), .B(cnt[2]), .Y(n2) );
  XNOR2X1 U19 ( .A(cnt[0]), .B(cnt[1]), .Y(n6) );
  NAND2BX1 U20 ( .AN(di_en), .B(n13), .Y(n60) );
  INVX1 U21 ( .A(reset), .Y(n59) );
  OAI2BB2X1 U22 ( .B0(start_count), .B1(n15), .A0N(N29), .A1N(n16), .Y(n58) );
  OAI2BB2X1 U23 ( .B0(start_count), .B1(n17), .A0N(N30), .A1N(n16), .Y(n57) );
  OAI2BB2X1 U24 ( .B0(start_count), .B1(n18), .A0N(N31), .A1N(n16), .Y(n56) );
  OAI2BB2X1 U25 ( .B0(start_count), .B1(n19), .A0N(N32), .A1N(n16), .Y(n55) );
  OAI2BB2X1 U26 ( .B0(start_count), .B1(n20), .A0N(N33), .A1N(n16), .Y(n54) );
  OAI2BB2X1 U27 ( .B0(start_count), .B1(n21), .A0N(N34), .A1N(n16), .Y(n53) );
  OAI2BB2X1 U28 ( .B0(start_count), .B1(n22), .A0N(N35), .A1N(n16), .Y(n52) );
  AOI2BB1X1 U29 ( .A0N(n23), .A1N(n24), .B0(n13), .Y(n16) );
  NAND3X1 U30 ( .A(cnt2[6]), .B(cnt2[2]), .C(cnt2[5]), .Y(n24) );
  NAND4X1 U31 ( .A(n15), .B(n17), .C(n19), .D(n20), .Y(n23) );
  INVX1 U32 ( .A(cnt2[4]), .Y(n20) );
  NAND2BX1 U33 ( .AN(cnt3[3]), .B(n28), .Y(n26) );
  NAND2X1 U34 ( .A(cnt3[3]), .B(cnt3[2]), .Y(n25) );
  AOI21X1 U35 ( .A0(n29), .A1(n30), .B0(n10), .Y(N59) );
  AOI31X1 U36 ( .A0(cnt2[0]), .A1(cnt2[3]), .A2(cnt2[1]), .B0(cnt2[6]), .Y(n29) );
  MXI2X1 U37 ( .A(n31), .B(n32), .S0(cnt3[3]), .Y(N54) );
  INVX1 U38 ( .A(n33), .Y(n32) );
  OAI21XL U39 ( .A0(n34), .A1(cnt3[2]), .B0(n35), .Y(n33) );
  NAND2BX1 U40 ( .AN(n36), .B(cnt3[2]), .Y(n31) );
  MXI2X1 U41 ( .A(n35), .B(n36), .S0(n28), .Y(N53) );
  INVX1 U42 ( .A(cnt3[2]), .Y(n28) );
  NAND3BX1 U43 ( .AN(n34), .B(cnt3[0]), .C(cnt3[1]), .Y(n36) );
  NOR2X1 U44 ( .A(n27), .B(n35), .Y(N52) );
  AOI2BB1X1 U45 ( .A0N(cnt3[1]), .A1N(n34), .B0(N51), .Y(n35) );
  NOR2X1 U46 ( .A(cnt3[0]), .B(cnt3[1]), .Y(n27) );
  NOR2X1 U47 ( .A(n34), .B(cnt3[0]), .Y(N51) );
  OAI31X1 U48 ( .A0(n37), .A1(cnt2[4]), .A2(n38), .B0(n14), .Y(n34) );
  INVX1 U49 ( .A(n10), .Y(n14) );
  NOR2X1 U50 ( .A(n22), .B(n30), .Y(n10) );
  AOI211X1 U51 ( .A0(cnt2[2]), .A1(cnt2[3]), .B0(cnt2[4]), .C0(cnt2[5]), .Y(
        n30) );
  AOI31X1 U52 ( .A0(n17), .A1(n18), .A2(n15), .B0(n19), .Y(n38) );
  INVX1 U53 ( .A(cnt2[3]), .Y(n19) );
  INVX1 U54 ( .A(cnt2[0]), .Y(n15) );
  INVX1 U55 ( .A(cnt2[2]), .Y(n18) );
  INVX1 U56 ( .A(cnt2[1]), .Y(n17) );
  NAND2X1 U57 ( .A(n21), .B(n22), .Y(n37) );
  INVX1 U58 ( .A(cnt2[6]), .Y(n22) );
  INVX1 U59 ( .A(cnt2[5]), .Y(n21) );
  DFFRHQX1 \cnt_reg[1]  ( .D(n63), .CK(clk), .RN(n59), .Q(cnt[1]) );
  DFFRHQX1 \cnt_reg[0]  ( .D(n64), .CK(clk), .RN(n59), .Q(cnt[0]) );
  signal_control_DW01_inc_0_DW01_inc_10 add_49 ( .A(cnt2), .SUM({N35, N34, N33, 
        N32, N31, N30, N29}) );
endmodule


module delaybuffer_WIDTH12_DEPTH7 ( clk, reset, x_re, x_im, y_re, y_im );
  input [11:0] x_re;
  input [11:0] x_im;
  output [11:0] y_re;
  output [11:0] y_im;
  input clk, reset;
  wire   \buf_im[6][11] , \buf_im[6][10] , \buf_im[6][9] , \buf_im[6][8] ,
         \buf_im[6][7] , \buf_im[6][6] , \buf_im[6][5] , \buf_im[6][4] ,
         \buf_im[6][3] , \buf_im[6][2] , \buf_im[6][1] , \buf_im[6][0] ,
         \buf_im[5][11] , \buf_im[5][10] , \buf_im[5][9] , \buf_im[5][8] ,
         \buf_im[5][7] , \buf_im[5][6] , \buf_im[5][5] , \buf_im[5][4] ,
         \buf_im[5][3] , \buf_im[5][2] , \buf_im[5][1] , \buf_im[5][0] ,
         \buf_im[4][11] , \buf_im[4][10] , \buf_im[4][9] , \buf_im[4][8] ,
         \buf_im[4][7] , \buf_im[4][6] , \buf_im[4][5] , \buf_im[4][4] ,
         \buf_im[4][3] , \buf_im[4][2] , \buf_im[4][1] , \buf_im[4][0] ,
         \buf_im[3][11] , \buf_im[3][10] , \buf_im[3][9] , \buf_im[3][8] ,
         \buf_im[3][7] , \buf_im[3][6] , \buf_im[3][5] , \buf_im[3][4] ,
         \buf_im[3][3] , \buf_im[3][2] , \buf_im[3][1] , \buf_im[3][0] ,
         \buf_im[2][11] , \buf_im[2][10] , \buf_im[2][9] , \buf_im[2][8] ,
         \buf_im[2][7] , \buf_im[2][6] , \buf_im[2][5] , \buf_im[2][4] ,
         \buf_im[2][3] , \buf_im[2][2] , \buf_im[2][1] , \buf_im[2][0] ,
         \buf_im[1][11] , \buf_im[1][10] , \buf_im[1][9] , \buf_im[1][8] ,
         \buf_im[1][7] , \buf_im[1][6] , \buf_im[1][5] , \buf_im[1][4] ,
         \buf_im[1][3] , \buf_im[1][2] , \buf_im[1][1] , \buf_im[1][0] ,
         \buf_re[6][11] , \buf_re[6][10] , \buf_re[6][9] , \buf_re[6][8] ,
         \buf_re[6][7] , \buf_re[6][6] , \buf_re[6][5] , \buf_re[6][4] ,
         \buf_re[6][3] , \buf_re[6][2] , \buf_re[6][1] , \buf_re[6][0] ,
         \buf_re[5][11] , \buf_re[5][10] , \buf_re[5][9] , \buf_re[5][8] ,
         \buf_re[5][7] , \buf_re[5][6] , \buf_re[5][5] , \buf_re[5][4] ,
         \buf_re[5][3] , \buf_re[5][2] , \buf_re[5][1] , \buf_re[5][0] ,
         \buf_re[4][11] , \buf_re[4][10] , \buf_re[4][9] , \buf_re[4][8] ,
         \buf_re[4][7] , \buf_re[4][6] , \buf_re[4][5] , \buf_re[4][4] ,
         \buf_re[4][3] , \buf_re[4][2] , \buf_re[4][1] , \buf_re[4][0] ,
         \buf_re[3][11] , \buf_re[3][10] , \buf_re[3][9] , \buf_re[3][8] ,
         \buf_re[3][7] , \buf_re[3][6] , \buf_re[3][5] , \buf_re[3][4] ,
         \buf_re[3][3] , \buf_re[3][2] , \buf_re[3][1] , \buf_re[3][0] ,
         \buf_re[2][11] , \buf_re[2][10] , \buf_re[2][9] , \buf_re[2][8] ,
         \buf_re[2][7] , \buf_re[2][6] , \buf_re[2][5] , \buf_re[2][4] ,
         \buf_re[2][3] , \buf_re[2][2] , \buf_re[2][1] , \buf_re[2][0] ,
         \buf_re[1][11] , \buf_re[1][10] , \buf_re[1][9] , \buf_re[1][8] ,
         \buf_re[1][7] , \buf_re[1][6] , \buf_re[1][5] , \buf_re[1][4] ,
         \buf_re[1][3] , \buf_re[1][2] , \buf_re[1][1] , \buf_re[1][0] , n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;

  INVX1 U3 ( .A(reset), .Y(n1) );
  DFFRHQX1 \buf_im_reg[1][11]  ( .D(x_im[11]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][11] ) );
  DFFRHQX1 \buf_im_reg[2][11]  ( .D(\buf_im[1][11] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][11] ) );
  DFFRHQX1 \buf_im_reg[3][11]  ( .D(\buf_im[2][11] ), .CK(clk), .RN(n1), .Q(
        \buf_im[3][11] ) );
  DFFRHQX1 \buf_im_reg[4][11]  ( .D(\buf_im[3][11] ), .CK(clk), .RN(n1), .Q(
        \buf_im[4][11] ) );
  DFFRHQX1 \buf_im_reg[5][11]  ( .D(\buf_im[4][11] ), .CK(clk), .RN(n1), .Q(
        \buf_im[5][11] ) );
  DFFRHQX1 \buf_im_reg[6][11]  ( .D(\buf_im[5][11] ), .CK(clk), .RN(n1), .Q(
        \buf_im[6][11] ) );
  DFFRHQX1 \buf_im_reg[1][10]  ( .D(x_im[10]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][10] ) );
  DFFRHQX1 \buf_im_reg[2][10]  ( .D(\buf_im[1][10] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][10] ) );
  DFFRHQX1 \buf_im_reg[3][10]  ( .D(\buf_im[2][10] ), .CK(clk), .RN(n1), .Q(
        \buf_im[3][10] ) );
  DFFRHQX1 \buf_im_reg[4][10]  ( .D(\buf_im[3][10] ), .CK(clk), .RN(n1), .Q(
        \buf_im[4][10] ) );
  DFFRHQX1 \buf_im_reg[5][10]  ( .D(\buf_im[4][10] ), .CK(clk), .RN(n1), .Q(
        \buf_im[5][10] ) );
  DFFRHQX1 \buf_im_reg[6][10]  ( .D(\buf_im[5][10] ), .CK(clk), .RN(n1), .Q(
        \buf_im[6][10] ) );
  DFFRHQX1 \buf_im_reg[1][9]  ( .D(x_im[9]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][9] ) );
  DFFRHQX1 \buf_im_reg[2][9]  ( .D(\buf_im[1][9] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][9] ) );
  DFFRHQX1 \buf_im_reg[3][9]  ( .D(\buf_im[2][9] ), .CK(clk), .RN(n12), .Q(
        \buf_im[3][9] ) );
  DFFRHQX1 \buf_im_reg[4][9]  ( .D(\buf_im[3][9] ), .CK(clk), .RN(n12), .Q(
        \buf_im[4][9] ) );
  DFFRHQX1 \buf_im_reg[5][9]  ( .D(\buf_im[4][9] ), .CK(clk), .RN(n12), .Q(
        \buf_im[5][9] ) );
  DFFRHQX1 \buf_im_reg[6][9]  ( .D(\buf_im[5][9] ), .CK(clk), .RN(n12), .Q(
        \buf_im[6][9] ) );
  DFFRHQX1 \buf_im_reg[1][8]  ( .D(x_im[8]), .CK(clk), .RN(n12), .Q(
        \buf_im[1][8] ) );
  DFFRHQX1 \buf_im_reg[2][8]  ( .D(\buf_im[1][8] ), .CK(clk), .RN(n12), .Q(
        \buf_im[2][8] ) );
  DFFRHQX1 \buf_im_reg[3][8]  ( .D(\buf_im[2][8] ), .CK(clk), .RN(n12), .Q(
        \buf_im[3][8] ) );
  DFFRHQX1 \buf_im_reg[4][8]  ( .D(\buf_im[3][8] ), .CK(clk), .RN(n12), .Q(
        \buf_im[4][8] ) );
  DFFRHQX1 \buf_im_reg[5][8]  ( .D(\buf_im[4][8] ), .CK(clk), .RN(n12), .Q(
        \buf_im[5][8] ) );
  DFFRHQX1 \buf_im_reg[6][8]  ( .D(\buf_im[5][8] ), .CK(clk), .RN(n12), .Q(
        \buf_im[6][8] ) );
  DFFRHQX1 \buf_im_reg[1][7]  ( .D(x_im[7]), .CK(clk), .RN(n12), .Q(
        \buf_im[1][7] ) );
  DFFRHQX1 \buf_im_reg[2][7]  ( .D(\buf_im[1][7] ), .CK(clk), .RN(n12), .Q(
        \buf_im[2][7] ) );
  DFFRHQX1 \buf_im_reg[3][7]  ( .D(\buf_im[2][7] ), .CK(clk), .RN(n12), .Q(
        \buf_im[3][7] ) );
  DFFRHQX1 \buf_im_reg[4][7]  ( .D(\buf_im[3][7] ), .CK(clk), .RN(n11), .Q(
        \buf_im[4][7] ) );
  DFFRHQX1 \buf_im_reg[5][7]  ( .D(\buf_im[4][7] ), .CK(clk), .RN(n11), .Q(
        \buf_im[5][7] ) );
  DFFRHQX1 \buf_im_reg[6][7]  ( .D(\buf_im[5][7] ), .CK(clk), .RN(n11), .Q(
        \buf_im[6][7] ) );
  DFFRHQX1 \buf_im_reg[1][6]  ( .D(x_im[6]), .CK(clk), .RN(n11), .Q(
        \buf_im[1][6] ) );
  DFFRHQX1 \buf_im_reg[2][6]  ( .D(\buf_im[1][6] ), .CK(clk), .RN(n11), .Q(
        \buf_im[2][6] ) );
  DFFRHQX1 \buf_im_reg[3][6]  ( .D(\buf_im[2][6] ), .CK(clk), .RN(n11), .Q(
        \buf_im[3][6] ) );
  DFFRHQX1 \buf_im_reg[4][6]  ( .D(\buf_im[3][6] ), .CK(clk), .RN(n11), .Q(
        \buf_im[4][6] ) );
  DFFRHQX1 \buf_im_reg[5][6]  ( .D(\buf_im[4][6] ), .CK(clk), .RN(n11), .Q(
        \buf_im[5][6] ) );
  DFFRHQX1 \buf_im_reg[6][6]  ( .D(\buf_im[5][6] ), .CK(clk), .RN(n11), .Q(
        \buf_im[6][6] ) );
  DFFRHQX1 \buf_im_reg[1][5]  ( .D(x_im[5]), .CK(clk), .RN(n11), .Q(
        \buf_im[1][5] ) );
  DFFRHQX1 \buf_im_reg[2][5]  ( .D(\buf_im[1][5] ), .CK(clk), .RN(n11), .Q(
        \buf_im[2][5] ) );
  DFFRHQX1 \buf_im_reg[3][5]  ( .D(\buf_im[2][5] ), .CK(clk), .RN(n11), .Q(
        \buf_im[3][5] ) );
  DFFRHQX1 \buf_im_reg[4][5]  ( .D(\buf_im[3][5] ), .CK(clk), .RN(n11), .Q(
        \buf_im[4][5] ) );
  DFFRHQX1 \buf_im_reg[5][5]  ( .D(\buf_im[4][5] ), .CK(clk), .RN(n10), .Q(
        \buf_im[5][5] ) );
  DFFRHQX1 \buf_im_reg[6][5]  ( .D(\buf_im[5][5] ), .CK(clk), .RN(n10), .Q(
        \buf_im[6][5] ) );
  DFFRHQX1 \buf_im_reg[1][4]  ( .D(x_im[4]), .CK(clk), .RN(n10), .Q(
        \buf_im[1][4] ) );
  DFFRHQX1 \buf_im_reg[2][4]  ( .D(\buf_im[1][4] ), .CK(clk), .RN(n10), .Q(
        \buf_im[2][4] ) );
  DFFRHQX1 \buf_im_reg[3][4]  ( .D(\buf_im[2][4] ), .CK(clk), .RN(n10), .Q(
        \buf_im[3][4] ) );
  DFFRHQX1 \buf_im_reg[4][4]  ( .D(\buf_im[3][4] ), .CK(clk), .RN(n10), .Q(
        \buf_im[4][4] ) );
  DFFRHQX1 \buf_im_reg[5][4]  ( .D(\buf_im[4][4] ), .CK(clk), .RN(n10), .Q(
        \buf_im[5][4] ) );
  DFFRHQX1 \buf_im_reg[6][4]  ( .D(\buf_im[5][4] ), .CK(clk), .RN(n10), .Q(
        \buf_im[6][4] ) );
  DFFRHQX1 \buf_im_reg[1][3]  ( .D(x_im[3]), .CK(clk), .RN(n10), .Q(
        \buf_im[1][3] ) );
  DFFRHQX1 \buf_im_reg[2][3]  ( .D(\buf_im[1][3] ), .CK(clk), .RN(n10), .Q(
        \buf_im[2][3] ) );
  DFFRHQX1 \buf_im_reg[3][3]  ( .D(\buf_im[2][3] ), .CK(clk), .RN(n10), .Q(
        \buf_im[3][3] ) );
  DFFRHQX1 \buf_im_reg[4][3]  ( .D(\buf_im[3][3] ), .CK(clk), .RN(n10), .Q(
        \buf_im[4][3] ) );
  DFFRHQX1 \buf_im_reg[5][3]  ( .D(\buf_im[4][3] ), .CK(clk), .RN(n10), .Q(
        \buf_im[5][3] ) );
  DFFRHQX1 \buf_im_reg[6][3]  ( .D(\buf_im[5][3] ), .CK(clk), .RN(n9), .Q(
        \buf_im[6][3] ) );
  DFFRHQX1 \buf_im_reg[1][2]  ( .D(x_im[2]), .CK(clk), .RN(n9), .Q(
        \buf_im[1][2] ) );
  DFFRHQX1 \buf_im_reg[2][2]  ( .D(\buf_im[1][2] ), .CK(clk), .RN(n9), .Q(
        \buf_im[2][2] ) );
  DFFRHQX1 \buf_im_reg[3][2]  ( .D(\buf_im[2][2] ), .CK(clk), .RN(n9), .Q(
        \buf_im[3][2] ) );
  DFFRHQX1 \buf_im_reg[4][2]  ( .D(\buf_im[3][2] ), .CK(clk), .RN(n9), .Q(
        \buf_im[4][2] ) );
  DFFRHQX1 \buf_im_reg[5][2]  ( .D(\buf_im[4][2] ), .CK(clk), .RN(n9), .Q(
        \buf_im[5][2] ) );
  DFFRHQX1 \buf_im_reg[6][2]  ( .D(\buf_im[5][2] ), .CK(clk), .RN(n9), .Q(
        \buf_im[6][2] ) );
  DFFRHQX1 \buf_im_reg[1][1]  ( .D(x_im[1]), .CK(clk), .RN(n9), .Q(
        \buf_im[1][1] ) );
  DFFRHQX1 \buf_im_reg[2][1]  ( .D(\buf_im[1][1] ), .CK(clk), .RN(n9), .Q(
        \buf_im[2][1] ) );
  DFFRHQX1 \buf_im_reg[3][1]  ( .D(\buf_im[2][1] ), .CK(clk), .RN(n9), .Q(
        \buf_im[3][1] ) );
  DFFRHQX1 \buf_im_reg[4][1]  ( .D(\buf_im[3][1] ), .CK(clk), .RN(n9), .Q(
        \buf_im[4][1] ) );
  DFFRHQX1 \buf_im_reg[5][1]  ( .D(\buf_im[4][1] ), .CK(clk), .RN(n9), .Q(
        \buf_im[5][1] ) );
  DFFRHQX1 \buf_im_reg[6][1]  ( .D(\buf_im[5][1] ), .CK(clk), .RN(n9), .Q(
        \buf_im[6][1] ) );
  DFFRHQX1 \buf_im_reg[1][0]  ( .D(x_im[0]), .CK(clk), .RN(n8), .Q(
        \buf_im[1][0] ) );
  DFFRHQX1 \buf_im_reg[2][0]  ( .D(\buf_im[1][0] ), .CK(clk), .RN(n8), .Q(
        \buf_im[2][0] ) );
  DFFRHQX1 \buf_im_reg[3][0]  ( .D(\buf_im[2][0] ), .CK(clk), .RN(n8), .Q(
        \buf_im[3][0] ) );
  DFFRHQX1 \buf_im_reg[4][0]  ( .D(\buf_im[3][0] ), .CK(clk), .RN(n8), .Q(
        \buf_im[4][0] ) );
  DFFRHQX1 \buf_im_reg[5][0]  ( .D(\buf_im[4][0] ), .CK(clk), .RN(n8), .Q(
        \buf_im[5][0] ) );
  DFFRHQX1 \buf_im_reg[6][0]  ( .D(\buf_im[5][0] ), .CK(clk), .RN(n8), .Q(
        \buf_im[6][0] ) );
  DFFRHQX1 \buf_re_reg[1][11]  ( .D(x_re[11]), .CK(clk), .RN(n5), .Q(
        \buf_re[1][11] ) );
  DFFRHQX1 \buf_re_reg[2][11]  ( .D(\buf_re[1][11] ), .CK(clk), .RN(n5), .Q(
        \buf_re[2][11] ) );
  DFFRHQX1 \buf_re_reg[3][11]  ( .D(\buf_re[2][11] ), .CK(clk), .RN(n5), .Q(
        \buf_re[3][11] ) );
  DFFRHQX1 \buf_re_reg[4][11]  ( .D(\buf_re[3][11] ), .CK(clk), .RN(n5), .Q(
        \buf_re[4][11] ) );
  DFFRHQX1 \buf_re_reg[5][11]  ( .D(\buf_re[4][11] ), .CK(clk), .RN(n5), .Q(
        \buf_re[5][11] ) );
  DFFRHQX1 \buf_re_reg[6][11]  ( .D(\buf_re[5][11] ), .CK(clk), .RN(n5), .Q(
        \buf_re[6][11] ) );
  DFFRHQX1 \buf_re_reg[1][10]  ( .D(x_re[10]), .CK(clk), .RN(n6), .Q(
        \buf_re[1][10] ) );
  DFFRHQX1 \buf_re_reg[2][10]  ( .D(\buf_re[1][10] ), .CK(clk), .RN(n6), .Q(
        \buf_re[2][10] ) );
  DFFRHQX1 \buf_re_reg[3][10]  ( .D(\buf_re[2][10] ), .CK(clk), .RN(n6), .Q(
        \buf_re[3][10] ) );
  DFFRHQX1 \buf_re_reg[4][10]  ( .D(\buf_re[3][10] ), .CK(clk), .RN(n5), .Q(
        \buf_re[4][10] ) );
  DFFRHQX1 \buf_re_reg[5][10]  ( .D(\buf_re[4][10] ), .CK(clk), .RN(n5), .Q(
        \buf_re[5][10] ) );
  DFFRHQX1 \buf_re_reg[6][10]  ( .D(\buf_re[5][10] ), .CK(clk), .RN(n5), .Q(
        \buf_re[6][10] ) );
  DFFRHQX1 \buf_re_reg[1][9]  ( .D(x_re[9]), .CK(clk), .RN(n6), .Q(
        \buf_re[1][9] ) );
  DFFRHQX1 \buf_re_reg[2][9]  ( .D(\buf_re[1][9] ), .CK(clk), .RN(n6), .Q(
        \buf_re[2][9] ) );
  DFFRHQX1 \buf_re_reg[3][9]  ( .D(\buf_re[2][9] ), .CK(clk), .RN(n6), .Q(
        \buf_re[3][9] ) );
  DFFRHQX1 \buf_re_reg[4][9]  ( .D(\buf_re[3][9] ), .CK(clk), .RN(n6), .Q(
        \buf_re[4][9] ) );
  DFFRHQX1 \buf_re_reg[5][9]  ( .D(\buf_re[4][9] ), .CK(clk), .RN(n6), .Q(
        \buf_re[5][9] ) );
  DFFRHQX1 \buf_re_reg[6][9]  ( .D(\buf_re[5][9] ), .CK(clk), .RN(n6), .Q(
        \buf_re[6][9] ) );
  DFFRHQX1 \buf_re_reg[1][8]  ( .D(x_re[8]), .CK(clk), .RN(n8), .Q(
        \buf_re[1][8] ) );
  DFFRHQX1 \buf_re_reg[2][8]  ( .D(\buf_re[1][8] ), .CK(clk), .RN(n7), .Q(
        \buf_re[2][8] ) );
  DFFRHQX1 \buf_re_reg[3][8]  ( .D(\buf_re[2][8] ), .CK(clk), .RN(n7), .Q(
        \buf_re[3][8] ) );
  DFFRHQX1 \buf_re_reg[4][8]  ( .D(\buf_re[3][8] ), .CK(clk), .RN(n7), .Q(
        \buf_re[4][8] ) );
  DFFRHQX1 \buf_re_reg[5][8]  ( .D(\buf_re[4][8] ), .CK(clk), .RN(n7), .Q(
        \buf_re[5][8] ) );
  DFFRHQX1 \buf_re_reg[6][8]  ( .D(\buf_re[5][8] ), .CK(clk), .RN(n7), .Q(
        \buf_re[6][8] ) );
  DFFRHQX1 \buf_re_reg[1][7]  ( .D(x_re[7]), .CK(clk), .RN(n7), .Q(
        \buf_re[1][7] ) );
  DFFRHQX1 \buf_re_reg[2][7]  ( .D(\buf_re[1][7] ), .CK(clk), .RN(n7), .Q(
        \buf_re[2][7] ) );
  DFFRHQX1 \buf_re_reg[3][7]  ( .D(\buf_re[2][7] ), .CK(clk), .RN(n7), .Q(
        \buf_re[3][7] ) );
  DFFRHQX1 \buf_re_reg[4][7]  ( .D(\buf_re[3][7] ), .CK(clk), .RN(n7), .Q(
        \buf_re[4][7] ) );
  DFFRHQX1 \buf_re_reg[5][7]  ( .D(\buf_re[4][7] ), .CK(clk), .RN(n7), .Q(
        \buf_re[5][7] ) );
  DFFRHQX1 \buf_re_reg[6][7]  ( .D(\buf_re[5][7] ), .CK(clk), .RN(n7), .Q(
        \buf_re[6][7] ) );
  DFFRHQX1 \buf_re_reg[1][6]  ( .D(x_re[6]), .CK(clk), .RN(n7), .Q(
        \buf_re[1][6] ) );
  DFFRHQX1 \buf_re_reg[2][6]  ( .D(\buf_re[1][6] ), .CK(clk), .RN(n7), .Q(
        \buf_re[2][6] ) );
  DFFRHQX1 \buf_re_reg[3][6]  ( .D(\buf_re[2][6] ), .CK(clk), .RN(n6), .Q(
        \buf_re[3][6] ) );
  DFFRHQX1 \buf_re_reg[4][6]  ( .D(\buf_re[3][6] ), .CK(clk), .RN(n6), .Q(
        \buf_re[4][6] ) );
  DFFRHQX1 \buf_re_reg[5][6]  ( .D(\buf_re[4][6] ), .CK(clk), .RN(n6), .Q(
        \buf_re[5][6] ) );
  DFFRHQX1 \buf_re_reg[6][6]  ( .D(\buf_re[5][6] ), .CK(clk), .RN(n6), .Q(
        \buf_re[6][6] ) );
  DFFRHQX1 \buf_re_reg[1][5]  ( .D(x_re[5]), .CK(clk), .RN(n5), .Q(
        \buf_re[1][5] ) );
  DFFRHQX1 \buf_re_reg[2][5]  ( .D(\buf_re[1][5] ), .CK(clk), .RN(n5), .Q(
        \buf_re[2][5] ) );
  DFFRHQX1 \buf_re_reg[3][5]  ( .D(\buf_re[2][5] ), .CK(clk), .RN(n5), .Q(
        \buf_re[3][5] ) );
  DFFRHQX1 \buf_re_reg[4][5]  ( .D(\buf_re[3][5] ), .CK(clk), .RN(n5), .Q(
        \buf_re[4][5] ) );
  DFFRHQX1 \buf_re_reg[5][5]  ( .D(\buf_re[4][5] ), .CK(clk), .RN(n4), .Q(
        \buf_re[5][5] ) );
  DFFRHQX1 \buf_re_reg[6][5]  ( .D(\buf_re[5][5] ), .CK(clk), .RN(n4), .Q(
        \buf_re[6][5] ) );
  DFFRHQX1 \buf_re_reg[1][4]  ( .D(x_re[4]), .CK(clk), .RN(n4), .Q(
        \buf_re[1][4] ) );
  DFFRHQX1 \buf_re_reg[2][4]  ( .D(\buf_re[1][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[2][4] ) );
  DFFRHQX1 \buf_re_reg[3][4]  ( .D(\buf_re[2][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[3][4] ) );
  DFFRHQX1 \buf_re_reg[4][4]  ( .D(\buf_re[3][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[4][4] ) );
  DFFRHQX1 \buf_re_reg[5][4]  ( .D(\buf_re[4][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[5][4] ) );
  DFFRHQX1 \buf_re_reg[6][4]  ( .D(\buf_re[5][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[6][4] ) );
  DFFRHQX1 \buf_re_reg[1][3]  ( .D(x_re[3]), .CK(clk), .RN(n4), .Q(
        \buf_re[1][3] ) );
  DFFRHQX1 \buf_re_reg[2][3]  ( .D(\buf_re[1][3] ), .CK(clk), .RN(n4), .Q(
        \buf_re[2][3] ) );
  DFFRHQX1 \buf_re_reg[3][3]  ( .D(\buf_re[2][3] ), .CK(clk), .RN(n4), .Q(
        \buf_re[3][3] ) );
  DFFRHQX1 \buf_re_reg[4][3]  ( .D(\buf_re[3][3] ), .CK(clk), .RN(n4), .Q(
        \buf_re[4][3] ) );
  DFFRHQX1 \buf_re_reg[5][3]  ( .D(\buf_re[4][3] ), .CK(clk), .RN(n4), .Q(
        \buf_re[5][3] ) );
  DFFRHQX1 \buf_re_reg[6][3]  ( .D(\buf_re[5][3] ), .CK(clk), .RN(n3), .Q(
        \buf_re[6][3] ) );
  DFFRHQX1 \buf_re_reg[1][2]  ( .D(x_re[2]), .CK(clk), .RN(n3), .Q(
        \buf_re[1][2] ) );
  DFFRHQX1 \buf_re_reg[2][2]  ( .D(\buf_re[1][2] ), .CK(clk), .RN(n3), .Q(
        \buf_re[2][2] ) );
  DFFRHQX1 \buf_re_reg[3][2]  ( .D(\buf_re[2][2] ), .CK(clk), .RN(n3), .Q(
        \buf_re[3][2] ) );
  DFFRHQX1 \buf_re_reg[4][2]  ( .D(\buf_re[3][2] ), .CK(clk), .RN(n3), .Q(
        \buf_re[4][2] ) );
  DFFRHQX1 \buf_re_reg[5][2]  ( .D(\buf_re[4][2] ), .CK(clk), .RN(n3), .Q(
        \buf_re[5][2] ) );
  DFFRHQX1 \buf_re_reg[6][2]  ( .D(\buf_re[5][2] ), .CK(clk), .RN(n3), .Q(
        \buf_re[6][2] ) );
  DFFRHQX1 \buf_re_reg[1][1]  ( .D(x_re[1]), .CK(clk), .RN(n3), .Q(
        \buf_re[1][1] ) );
  DFFRHQX1 \buf_re_reg[2][1]  ( .D(\buf_re[1][1] ), .CK(clk), .RN(n3), .Q(
        \buf_re[2][1] ) );
  DFFRHQX1 \buf_re_reg[3][1]  ( .D(\buf_re[2][1] ), .CK(clk), .RN(n3), .Q(
        \buf_re[3][1] ) );
  DFFRHQX1 \buf_re_reg[4][1]  ( .D(\buf_re[3][1] ), .CK(clk), .RN(n3), .Q(
        \buf_re[4][1] ) );
  DFFRHQX1 \buf_re_reg[5][1]  ( .D(\buf_re[4][1] ), .CK(clk), .RN(n3), .Q(
        \buf_re[5][1] ) );
  DFFRHQX1 \buf_re_reg[6][1]  ( .D(\buf_re[5][1] ), .CK(clk), .RN(n3), .Q(
        \buf_re[6][1] ) );
  DFFRHQX1 \buf_re_reg[1][0]  ( .D(x_re[0]), .CK(clk), .RN(n8), .Q(
        \buf_re[1][0] ) );
  DFFRHQX1 \buf_re_reg[2][0]  ( .D(\buf_re[1][0] ), .CK(clk), .RN(n8), .Q(
        \buf_re[2][0] ) );
  DFFRHQX1 \buf_re_reg[3][0]  ( .D(\buf_re[2][0] ), .CK(clk), .RN(n8), .Q(
        \buf_re[3][0] ) );
  DFFRHQX1 \buf_re_reg[4][0]  ( .D(\buf_re[3][0] ), .CK(clk), .RN(n8), .Q(
        \buf_re[4][0] ) );
  DFFRHQX1 \buf_re_reg[5][0]  ( .D(\buf_re[4][0] ), .CK(clk), .RN(n8), .Q(
        \buf_re[5][0] ) );
  DFFRHQX1 \buf_re_reg[6][0]  ( .D(\buf_re[5][0] ), .CK(clk), .RN(n8), .Q(
        \buf_re[6][0] ) );
  DFFHQX1 \y_re_r_reg[10]  ( .D(\buf_re[6][10] ), .CK(clk), .Q(y_re[10]) );
  DFFHQX1 \y_re_r_reg[9]  ( .D(\buf_re[6][9] ), .CK(clk), .Q(y_re[9]) );
  DFFHQX1 \y_re_r_reg[8]  ( .D(\buf_re[6][8] ), .CK(clk), .Q(y_re[8]) );
  DFFHQX1 \y_re_r_reg[7]  ( .D(\buf_re[6][7] ), .CK(clk), .Q(y_re[7]) );
  DFFHQX1 \y_re_r_reg[6]  ( .D(\buf_re[6][6] ), .CK(clk), .Q(y_re[6]) );
  DFFHQX1 \y_re_r_reg[5]  ( .D(\buf_re[6][5] ), .CK(clk), .Q(y_re[5]) );
  DFFHQX1 \y_re_r_reg[4]  ( .D(\buf_re[6][4] ), .CK(clk), .Q(y_re[4]) );
  DFFHQX1 \y_re_r_reg[3]  ( .D(\buf_re[6][3] ), .CK(clk), .Q(y_re[3]) );
  DFFHQX1 \y_re_r_reg[2]  ( .D(\buf_re[6][2] ), .CK(clk), .Q(y_re[2]) );
  DFFHQX1 \y_im_r_reg[10]  ( .D(\buf_im[6][10] ), .CK(clk), .Q(y_im[10]) );
  DFFHQX1 \y_im_r_reg[9]  ( .D(\buf_im[6][9] ), .CK(clk), .Q(y_im[9]) );
  DFFHQX1 \y_im_r_reg[8]  ( .D(\buf_im[6][8] ), .CK(clk), .Q(y_im[8]) );
  DFFHQX1 \y_im_r_reg[7]  ( .D(\buf_im[6][7] ), .CK(clk), .Q(y_im[7]) );
  DFFHQX1 \y_im_r_reg[6]  ( .D(\buf_im[6][6] ), .CK(clk), .Q(y_im[6]) );
  DFFHQX1 \y_im_r_reg[5]  ( .D(\buf_im[6][5] ), .CK(clk), .Q(y_im[5]) );
  DFFHQX1 \y_im_r_reg[4]  ( .D(\buf_im[6][4] ), .CK(clk), .Q(y_im[4]) );
  DFFHQX1 \y_im_r_reg[3]  ( .D(\buf_im[6][3] ), .CK(clk), .Q(y_im[3]) );
  DFFHQX1 \y_im_r_reg[2]  ( .D(\buf_im[6][2] ), .CK(clk), .Q(y_im[2]) );
  DFFHQX1 \y_im_r_reg[11]  ( .D(\buf_im[6][11] ), .CK(clk), .Q(y_im[11]) );
  DFFHQX1 \y_re_r_reg[11]  ( .D(\buf_re[6][11] ), .CK(clk), .Q(y_re[11]) );
  DFFHQX1 \y_re_r_reg[1]  ( .D(\buf_re[6][1] ), .CK(clk), .Q(y_re[1]) );
  DFFHQX1 \y_re_r_reg[0]  ( .D(\buf_re[6][0] ), .CK(clk), .Q(y_re[0]) );
  DFFHQX1 \y_im_r_reg[1]  ( .D(\buf_im[6][1] ), .CK(clk), .Q(y_im[1]) );
  DFFHQX1 \y_im_r_reg[0]  ( .D(\buf_im[6][0] ), .CK(clk), .Q(y_im[0]) );
  INVX1 U4 ( .A(n1), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n3) );
  INVX1 U6 ( .A(n2), .Y(n4) );
  INVX1 U7 ( .A(n2), .Y(n7) );
  INVX1 U8 ( .A(n2), .Y(n6) );
  INVX1 U9 ( .A(n2), .Y(n5) );
  INVX1 U10 ( .A(n2), .Y(n8) );
  INVX1 U11 ( .A(n2), .Y(n9) );
  INVX1 U12 ( .A(n2), .Y(n10) );
  INVX1 U13 ( .A(n2), .Y(n11) );
  INVX1 U14 ( .A(n2), .Y(n12) );
endmodule


module carry_select_adder2_WIDTH12_15 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U5 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U8 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_14 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U5 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U6 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U7 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U8 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_13 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U5 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U8 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X1 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_12 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U5 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U8 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X1 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module butterfly2_WIDTH12_3_DW01_inc_0_DW01_inc_22 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module butterfly2_WIDTH12_3_DW01_inc_1_DW01_inc_23 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module butterfly2_WIDTH12_3 ( x0_re, x0_im, x1_re, x1_im, y0_re, y0_im, y1_re, 
        y1_im );
  input [11:0] x0_re;
  input [11:0] x0_im;
  input [11:0] x1_re;
  input [11:0] x1_im;
  output [11:0] y0_re;
  output [11:0] y0_im;
  output [11:0] y1_re;
  output [11:0] y1_im;
  wire   N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N9, N8,
         N7, N6, N5, N4, N3, N2, N11, N10, N1, N0;
  wire   [11:0] x1_re_neg;
  wire   [11:0] x1_im_neg;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  INVX1 U3 ( .A(x1_re[10]), .Y(N1) );
  INVX1 U4 ( .A(x1_re[11]), .Y(N0) );
  INVX1 U5 ( .A(x1_re[1]), .Y(N10) );
  INVX1 U6 ( .A(x1_re[2]), .Y(N9) );
  INVX1 U7 ( .A(x1_re[3]), .Y(N8) );
  INVX1 U8 ( .A(x1_re[4]), .Y(N7) );
  INVX1 U9 ( .A(x1_re[5]), .Y(N6) );
  INVX1 U10 ( .A(x1_re[6]), .Y(N5) );
  INVX1 U11 ( .A(x1_re[7]), .Y(N4) );
  INVX1 U12 ( .A(x1_re[8]), .Y(N3) );
  INVX1 U13 ( .A(x1_re[9]), .Y(N2) );
  INVX1 U14 ( .A(x1_re[0]), .Y(N11) );
  INVX1 U15 ( .A(x1_im[10]), .Y(N13) );
  INVX1 U16 ( .A(x1_im[11]), .Y(N12) );
  INVX1 U17 ( .A(x1_im[1]), .Y(N22) );
  INVX1 U18 ( .A(x1_im[2]), .Y(N21) );
  INVX1 U19 ( .A(x1_im[3]), .Y(N20) );
  INVX1 U20 ( .A(x1_im[4]), .Y(N19) );
  INVX1 U21 ( .A(x1_im[5]), .Y(N18) );
  INVX1 U22 ( .A(x1_im[6]), .Y(N17) );
  INVX1 U23 ( .A(x1_im[7]), .Y(N16) );
  INVX1 U24 ( .A(x1_im[8]), .Y(N15) );
  INVX1 U25 ( .A(x1_im[9]), .Y(N14) );
  INVX1 U26 ( .A(x1_im[0]), .Y(N23) );
  carry_select_adder2_WIDTH12_15 c0 ( .x(x0_re), .y(x1_re), .z({y0_re, 
        SYNOPSYS_UNCONNECTED__0}) );
  carry_select_adder2_WIDTH12_14 c1 ( .x(x0_im), .y(x1_im), .z({y0_im, 
        SYNOPSYS_UNCONNECTED__1}) );
  carry_select_adder2_WIDTH12_13 c2 ( .x(x0_re), .y(x1_re_neg), .z({y1_re, 
        SYNOPSYS_UNCONNECTED__2}) );
  carry_select_adder2_WIDTH12_12 c3 ( .x(x0_im), .y(x1_im_neg), .z({y1_im, 
        SYNOPSYS_UNCONNECTED__3}) );
  butterfly2_WIDTH12_3_DW01_inc_0_DW01_inc_22 add_0_root_add_22_ni ( .A({N12, 
        N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23}), .SUM(
        x1_im_neg) );
  butterfly2_WIDTH12_3_DW01_inc_1_DW01_inc_23 add_0_root_add_21_ni ( .A({N0, 
        N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11}), .SUM(x1_re_neg) );
endmodule


module sdfunit3_WIDTH12_DEPTH7_DW01_inc_0_DW01_inc_9 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module sdfunit3_WIDTH12_DEPTH7 ( clk, di_en, reset, x_re, x_im, y_re, y_im, 
        do_en );
  input [11:0] x_re;
  input [11:0] x_im;
  output [11:0] y_re;
  output [11:0] y_im;
  input clk, di_en, reset;
  output do_en;
  wire   sel, bf_nj, N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12,
         N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N25, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41,
         N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55,
         N56, N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69,
         N70, N71, N72, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84,
         N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98,
         N99, N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N116, N117, N118, N119, N120, N121, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62;
  wire   [11:0] x_re_r;
  wire   [11:0] x_im_r;
  wire   [11:0] bf_y1_re;
  wire   [11:0] dx_re;
  wire   [11:0] bf_y1_im;
  wire   [11:0] dx_im;
  wire   [11:0] dy_re;
  wire   [11:0] dy_im;
  wire   [11:0] bf_y0_re;
  wire   [11:0] bf_y0_im;
  wire   [11:0] mux2_im;
  wire   [11:0] dout_re;
  wire   [11:0] dout_im;

  AND2X1 U3 ( .A(x_re[2]), .B(di_en), .Y(N9) );
  OAI2BB2X1 U4 ( .B0(bf_nj), .B1(N97), .A0N(bf_nj), .A1N(mux2_im[0]), .Y(N85)
         );
  OAI2BB2X1 U5 ( .B0(bf_nj), .B1(N96), .A0N(bf_nj), .A1N(mux2_im[1]), .Y(N84)
         );
  OAI2BB2X1 U6 ( .B0(bf_nj), .B1(N95), .A0N(bf_nj), .A1N(mux2_im[2]), .Y(N83)
         );
  OAI2BB2X1 U7 ( .B0(bf_nj), .B1(N94), .A0N(bf_nj), .A1N(mux2_im[3]), .Y(N82)
         );
  OAI2BB2X1 U8 ( .B0(bf_nj), .B1(N93), .A0N(bf_nj), .A1N(mux2_im[4]), .Y(N81)
         );
  OAI2BB2X1 U9 ( .B0(bf_nj), .B1(N92), .A0N(bf_nj), .A1N(mux2_im[5]), .Y(N80)
         );
  AND2X1 U10 ( .A(x_re[3]), .B(di_en), .Y(N8) );
  OAI2BB2X1 U11 ( .B0(bf_nj), .B1(N91), .A0N(bf_nj), .A1N(mux2_im[6]), .Y(N79)
         );
  OAI2BB2X1 U12 ( .B0(bf_nj), .B1(N90), .A0N(bf_nj), .A1N(mux2_im[7]), .Y(N78)
         );
  OAI2BB2X1 U13 ( .B0(bf_nj), .B1(N89), .A0N(bf_nj), .A1N(mux2_im[8]), .Y(N77)
         );
  OAI2BB2X1 U14 ( .B0(bf_nj), .B1(N88), .A0N(bf_nj), .A1N(mux2_im[9]), .Y(N76)
         );
  OAI2BB2X1 U15 ( .B0(bf_nj), .B1(N87), .A0N(bf_nj), .A1N(mux2_im[10]), .Y(N75) );
  OAI2BB2X1 U16 ( .B0(bf_nj), .B1(N86), .A0N(bf_nj), .A1N(mux2_im[11]), .Y(N74) );
  INVX1 U17 ( .A(n1), .Y(N72) );
  AOI22X1 U18 ( .A0(sel), .A1(bf_y0_im[0]), .B0(dy_im[0]), .B1(n2), .Y(n1) );
  INVX1 U19 ( .A(n3), .Y(N71) );
  AOI22X1 U20 ( .A0(bf_y0_im[1]), .A1(sel), .B0(dy_im[1]), .B1(n2), .Y(n3) );
  INVX1 U21 ( .A(n4), .Y(N70) );
  AOI22X1 U22 ( .A0(bf_y0_im[2]), .A1(sel), .B0(dy_im[2]), .B1(n2), .Y(n4) );
  AND2X1 U23 ( .A(x_re[4]), .B(di_en), .Y(N7) );
  INVX1 U24 ( .A(n5), .Y(N69) );
  AOI22X1 U25 ( .A0(bf_y0_im[3]), .A1(sel), .B0(dy_im[3]), .B1(n2), .Y(n5) );
  INVX1 U26 ( .A(n6), .Y(N68) );
  AOI22X1 U27 ( .A0(bf_y0_im[4]), .A1(sel), .B0(dy_im[4]), .B1(n2), .Y(n6) );
  INVX1 U28 ( .A(n7), .Y(N67) );
  AOI22X1 U29 ( .A0(bf_y0_im[5]), .A1(sel), .B0(dy_im[5]), .B1(n2), .Y(n7) );
  INVX1 U30 ( .A(n8), .Y(N66) );
  AOI22X1 U31 ( .A0(bf_y0_im[6]), .A1(sel), .B0(dy_im[6]), .B1(n2), .Y(n8) );
  INVX1 U32 ( .A(n9), .Y(N65) );
  AOI22X1 U33 ( .A0(bf_y0_im[7]), .A1(sel), .B0(dy_im[7]), .B1(n2), .Y(n9) );
  INVX1 U34 ( .A(n10), .Y(N64) );
  AOI22X1 U35 ( .A0(bf_y0_im[8]), .A1(sel), .B0(dy_im[8]), .B1(n2), .Y(n10) );
  INVX1 U36 ( .A(n11), .Y(N63) );
  AOI22X1 U37 ( .A0(bf_y0_im[9]), .A1(sel), .B0(dy_im[9]), .B1(n2), .Y(n11) );
  INVX1 U38 ( .A(n12), .Y(N62) );
  AOI22X1 U39 ( .A0(bf_y0_im[10]), .A1(sel), .B0(dy_im[10]), .B1(n2), .Y(n12)
         );
  INVX1 U40 ( .A(n13), .Y(N61) );
  AOI22X1 U41 ( .A0(bf_y0_im[11]), .A1(sel), .B0(dy_im[11]), .B1(n2), .Y(n13)
         );
  INVX1 U42 ( .A(n14), .Y(N60) );
  AOI22X1 U43 ( .A0(bf_y0_re[0]), .A1(sel), .B0(dy_re[0]), .B1(n2), .Y(n14) );
  AND2X1 U44 ( .A(x_re[5]), .B(di_en), .Y(N6) );
  INVX1 U45 ( .A(n15), .Y(N59) );
  AOI22X1 U46 ( .A0(bf_y0_re[1]), .A1(sel), .B0(dy_re[1]), .B1(n2), .Y(n15) );
  INVX1 U47 ( .A(n16), .Y(N58) );
  AOI22X1 U48 ( .A0(bf_y0_re[2]), .A1(sel), .B0(dy_re[2]), .B1(n2), .Y(n16) );
  INVX1 U49 ( .A(n17), .Y(N57) );
  AOI22X1 U50 ( .A0(bf_y0_re[3]), .A1(sel), .B0(dy_re[3]), .B1(n2), .Y(n17) );
  INVX1 U51 ( .A(n18), .Y(N56) );
  AOI22X1 U52 ( .A0(bf_y0_re[4]), .A1(sel), .B0(dy_re[4]), .B1(n2), .Y(n18) );
  INVX1 U53 ( .A(n19), .Y(N55) );
  AOI22X1 U54 ( .A0(bf_y0_re[5]), .A1(sel), .B0(dy_re[5]), .B1(n2), .Y(n19) );
  INVX1 U55 ( .A(n20), .Y(N54) );
  AOI22X1 U56 ( .A0(bf_y0_re[6]), .A1(sel), .B0(dy_re[6]), .B1(n2), .Y(n20) );
  INVX1 U57 ( .A(n21), .Y(N53) );
  AOI22X1 U58 ( .A0(bf_y0_re[7]), .A1(sel), .B0(dy_re[7]), .B1(n2), .Y(n21) );
  INVX1 U59 ( .A(n22), .Y(N52) );
  AOI22X1 U60 ( .A0(bf_y0_re[8]), .A1(sel), .B0(dy_re[8]), .B1(n2), .Y(n22) );
  INVX1 U61 ( .A(n23), .Y(N51) );
  AOI22X1 U62 ( .A0(bf_y0_re[9]), .A1(sel), .B0(dy_re[9]), .B1(n2), .Y(n23) );
  INVX1 U63 ( .A(n24), .Y(N50) );
  AOI22X1 U64 ( .A0(bf_y0_re[10]), .A1(sel), .B0(dy_re[10]), .B1(n2), .Y(n24)
         );
  AND2X1 U65 ( .A(x_re[6]), .B(di_en), .Y(N5) );
  INVX1 U66 ( .A(n25), .Y(N49) );
  AOI22X1 U67 ( .A0(bf_y0_re[11]), .A1(sel), .B0(dy_re[11]), .B1(n2), .Y(n25)
         );
  INVX1 U68 ( .A(n26), .Y(N48) );
  AOI22X1 U69 ( .A0(bf_y1_im[0]), .A1(sel), .B0(x_im_r[0]), .B1(n2), .Y(n26)
         );
  INVX1 U70 ( .A(n27), .Y(N47) );
  AOI22X1 U71 ( .A0(bf_y1_im[1]), .A1(sel), .B0(x_im_r[1]), .B1(n2), .Y(n27)
         );
  INVX1 U72 ( .A(n28), .Y(N46) );
  AOI22X1 U73 ( .A0(bf_y1_im[2]), .A1(sel), .B0(x_im_r[2]), .B1(n2), .Y(n28)
         );
  INVX1 U74 ( .A(n29), .Y(N45) );
  AOI22X1 U75 ( .A0(bf_y1_im[3]), .A1(sel), .B0(x_im_r[3]), .B1(n2), .Y(n29)
         );
  INVX1 U76 ( .A(n30), .Y(N44) );
  AOI22X1 U77 ( .A0(bf_y1_im[4]), .A1(sel), .B0(x_im_r[4]), .B1(n2), .Y(n30)
         );
  INVX1 U78 ( .A(n31), .Y(N43) );
  AOI22X1 U79 ( .A0(bf_y1_im[5]), .A1(sel), .B0(x_im_r[5]), .B1(n2), .Y(n31)
         );
  INVX1 U80 ( .A(n32), .Y(N42) );
  AOI22X1 U81 ( .A0(bf_y1_im[6]), .A1(sel), .B0(x_im_r[6]), .B1(n2), .Y(n32)
         );
  INVX1 U82 ( .A(n33), .Y(N41) );
  AOI22X1 U83 ( .A0(bf_y1_im[7]), .A1(sel), .B0(x_im_r[7]), .B1(n2), .Y(n33)
         );
  INVX1 U84 ( .A(n34), .Y(N40) );
  AOI22X1 U85 ( .A0(bf_y1_im[8]), .A1(sel), .B0(x_im_r[8]), .B1(n2), .Y(n34)
         );
  AND2X1 U86 ( .A(x_re[7]), .B(di_en), .Y(N4) );
  INVX1 U87 ( .A(n35), .Y(N39) );
  AOI22X1 U88 ( .A0(bf_y1_im[9]), .A1(sel), .B0(x_im_r[9]), .B1(n2), .Y(n35)
         );
  INVX1 U89 ( .A(n36), .Y(N38) );
  AOI22X1 U90 ( .A0(bf_y1_im[10]), .A1(sel), .B0(x_im_r[10]), .B1(n2), .Y(n36)
         );
  INVX1 U91 ( .A(n37), .Y(N37) );
  AOI22X1 U92 ( .A0(bf_y1_im[11]), .A1(sel), .B0(x_im_r[11]), .B1(n2), .Y(n37)
         );
  INVX1 U93 ( .A(n38), .Y(N36) );
  AOI22X1 U94 ( .A0(bf_y1_re[0]), .A1(sel), .B0(x_re_r[0]), .B1(n2), .Y(n38)
         );
  INVX1 U95 ( .A(n39), .Y(N35) );
  AOI22X1 U96 ( .A0(bf_y1_re[1]), .A1(sel), .B0(x_re_r[1]), .B1(n2), .Y(n39)
         );
  INVX1 U97 ( .A(n40), .Y(N34) );
  AOI22X1 U98 ( .A0(bf_y1_re[2]), .A1(sel), .B0(x_re_r[2]), .B1(n2), .Y(n40)
         );
  INVX1 U99 ( .A(n41), .Y(N33) );
  AOI22X1 U100 ( .A0(bf_y1_re[3]), .A1(sel), .B0(x_re_r[3]), .B1(n2), .Y(n41)
         );
  INVX1 U101 ( .A(n42), .Y(N32) );
  AOI22X1 U102 ( .A0(bf_y1_re[4]), .A1(sel), .B0(x_re_r[4]), .B1(n2), .Y(n42)
         );
  INVX1 U103 ( .A(n43), .Y(N31) );
  AOI22X1 U104 ( .A0(bf_y1_re[5]), .A1(sel), .B0(x_re_r[5]), .B1(n2), .Y(n43)
         );
  INVX1 U105 ( .A(n44), .Y(N30) );
  AOI22X1 U106 ( .A0(bf_y1_re[6]), .A1(sel), .B0(x_re_r[6]), .B1(n2), .Y(n44)
         );
  AND2X1 U107 ( .A(x_re[8]), .B(di_en), .Y(N3) );
  INVX1 U108 ( .A(n45), .Y(N29) );
  AOI22X1 U109 ( .A0(bf_y1_re[7]), .A1(sel), .B0(x_re_r[7]), .B1(n2), .Y(n45)
         );
  INVX1 U110 ( .A(n46), .Y(N28) );
  AOI22X1 U111 ( .A0(bf_y1_re[8]), .A1(sel), .B0(x_re_r[8]), .B1(n2), .Y(n46)
         );
  INVX1 U112 ( .A(n47), .Y(N27) );
  AOI22X1 U113 ( .A0(bf_y1_re[9]), .A1(sel), .B0(x_re_r[9]), .B1(n2), .Y(n47)
         );
  INVX1 U114 ( .A(n48), .Y(N26) );
  AOI22X1 U115 ( .A0(bf_y1_re[10]), .A1(sel), .B0(x_re_r[10]), .B1(n2), .Y(n48) );
  INVX1 U116 ( .A(n49), .Y(N25) );
  AOI22X1 U117 ( .A0(bf_y1_re[11]), .A1(sel), .B0(x_re_r[11]), .B1(n2), .Y(n49) );
  AND2X1 U119 ( .A(x_im[0]), .B(di_en), .Y(N23) );
  AND2X1 U120 ( .A(x_im[1]), .B(di_en), .Y(N22) );
  AND2X1 U121 ( .A(x_im[2]), .B(di_en), .Y(N21) );
  AND2X1 U122 ( .A(x_im[3]), .B(di_en), .Y(N20) );
  AND2X1 U123 ( .A(x_re[9]), .B(di_en), .Y(N2) );
  AND2X1 U124 ( .A(x_im[4]), .B(di_en), .Y(N19) );
  AND2X1 U125 ( .A(x_im[5]), .B(di_en), .Y(N18) );
  AND2X1 U126 ( .A(x_im[6]), .B(di_en), .Y(N17) );
  AND2X1 U127 ( .A(x_im[7]), .B(di_en), .Y(N16) );
  AND2X1 U128 ( .A(x_im[8]), .B(di_en), .Y(N15) );
  AND2X1 U129 ( .A(x_im[9]), .B(di_en), .Y(N14) );
  AND2X1 U130 ( .A(x_im[10]), .B(di_en), .Y(N13) );
  INVX1 U131 ( .A(n50), .Y(N121) );
  AOI22X1 U132 ( .A0(n51), .A1(mux2_im[0]), .B0(N98), .B1(bf_nj), .Y(n50) );
  INVX1 U133 ( .A(n52), .Y(N120) );
  AOI22X1 U134 ( .A0(n51), .A1(mux2_im[1]), .B0(N99), .B1(bf_nj), .Y(n52) );
  AND2X1 U135 ( .A(x_im[11]), .B(di_en), .Y(N12) );
  INVX1 U136 ( .A(n53), .Y(N119) );
  AOI22X1 U137 ( .A0(n51), .A1(mux2_im[2]), .B0(N100), .B1(bf_nj), .Y(n53) );
  INVX1 U138 ( .A(n54), .Y(N118) );
  AOI22X1 U139 ( .A0(n51), .A1(mux2_im[3]), .B0(N101), .B1(bf_nj), .Y(n54) );
  INVX1 U140 ( .A(n55), .Y(N117) );
  AOI22X1 U141 ( .A0(n51), .A1(mux2_im[4]), .B0(N102), .B1(bf_nj), .Y(n55) );
  INVX1 U142 ( .A(n56), .Y(N116) );
  AOI22X1 U143 ( .A0(n51), .A1(mux2_im[5]), .B0(N103), .B1(bf_nj), .Y(n56) );
  INVX1 U144 ( .A(n57), .Y(N115) );
  AOI22X1 U145 ( .A0(n51), .A1(mux2_im[6]), .B0(N104), .B1(bf_nj), .Y(n57) );
  INVX1 U146 ( .A(n58), .Y(N114) );
  AOI22X1 U147 ( .A0(n51), .A1(mux2_im[7]), .B0(N105), .B1(bf_nj), .Y(n58) );
  INVX1 U148 ( .A(n59), .Y(N113) );
  AOI22X1 U149 ( .A0(n51), .A1(mux2_im[8]), .B0(N106), .B1(bf_nj), .Y(n59) );
  INVX1 U150 ( .A(n60), .Y(N112) );
  AOI22X1 U151 ( .A0(n51), .A1(mux2_im[9]), .B0(N107), .B1(bf_nj), .Y(n60) );
  INVX1 U152 ( .A(n61), .Y(N111) );
  AOI22X1 U153 ( .A0(n51), .A1(mux2_im[10]), .B0(N108), .B1(bf_nj), .Y(n61) );
  INVX1 U154 ( .A(n62), .Y(N110) );
  AOI22X1 U155 ( .A0(n51), .A1(mux2_im[11]), .B0(N109), .B1(bf_nj), .Y(n62) );
  INVX1 U156 ( .A(bf_nj), .Y(n51) );
  AND2X1 U157 ( .A(x_re[0]), .B(di_en), .Y(N11) );
  AND2X1 U158 ( .A(x_re[1]), .B(di_en), .Y(N10) );
  AND2X1 U159 ( .A(x_re[10]), .B(di_en), .Y(N1) );
  AND2X1 U160 ( .A(x_re[11]), .B(di_en), .Y(N0) );
  DFFHQX1 \x_re_r_reg[11]  ( .D(N0), .CK(clk), .Q(x_re_r[11]) );
  DFFHQX1 \x_re_r_reg[10]  ( .D(N1), .CK(clk), .Q(x_re_r[10]) );
  DFFHQX1 \x_re_r_reg[9]  ( .D(N2), .CK(clk), .Q(x_re_r[9]) );
  DFFHQX1 \x_re_r_reg[8]  ( .D(N3), .CK(clk), .Q(x_re_r[8]) );
  DFFHQX1 \x_re_r_reg[7]  ( .D(N4), .CK(clk), .Q(x_re_r[7]) );
  DFFHQX1 \x_re_r_reg[6]  ( .D(N5), .CK(clk), .Q(x_re_r[6]) );
  DFFHQX1 \x_re_r_reg[5]  ( .D(N6), .CK(clk), .Q(x_re_r[5]) );
  DFFHQX1 \x_re_r_reg[4]  ( .D(N7), .CK(clk), .Q(x_re_r[4]) );
  DFFHQX1 \x_re_r_reg[3]  ( .D(N8), .CK(clk), .Q(x_re_r[3]) );
  DFFHQX1 \x_re_r_reg[2]  ( .D(N9), .CK(clk), .Q(x_re_r[2]) );
  DFFHQX1 \x_re_r_reg[1]  ( .D(N10), .CK(clk), .Q(x_re_r[1]) );
  DFFHQX1 \x_re_r_reg[0]  ( .D(N11), .CK(clk), .Q(x_re_r[0]) );
  DFFHQX1 \x_im_r_reg[11]  ( .D(N12), .CK(clk), .Q(x_im_r[11]) );
  DFFHQX1 \x_im_r_reg[10]  ( .D(N13), .CK(clk), .Q(x_im_r[10]) );
  DFFHQX1 \x_im_r_reg[9]  ( .D(N14), .CK(clk), .Q(x_im_r[9]) );
  DFFHQX1 \x_im_r_reg[8]  ( .D(N15), .CK(clk), .Q(x_im_r[8]) );
  DFFHQX1 \x_im_r_reg[7]  ( .D(N16), .CK(clk), .Q(x_im_r[7]) );
  DFFHQX1 \x_im_r_reg[6]  ( .D(N17), .CK(clk), .Q(x_im_r[6]) );
  DFFHQX1 \x_im_r_reg[5]  ( .D(N18), .CK(clk), .Q(x_im_r[5]) );
  DFFHQX1 \x_im_r_reg[4]  ( .D(N19), .CK(clk), .Q(x_im_r[4]) );
  DFFHQX1 \x_im_r_reg[3]  ( .D(N20), .CK(clk), .Q(x_im_r[3]) );
  DFFHQX1 \x_im_r_reg[2]  ( .D(N21), .CK(clk), .Q(x_im_r[2]) );
  DFFHQX1 \x_im_r_reg[1]  ( .D(N22), .CK(clk), .Q(x_im_r[1]) );
  DFFHQX1 \x_im_r_reg[0]  ( .D(N23), .CK(clk), .Q(x_im_r[0]) );
  DFFHQXL \dx_im_reg[0]  ( .D(N48), .CK(clk), .Q(dx_im[0]) );
  DFFHQXL \dx_im_reg[1]  ( .D(N47), .CK(clk), .Q(dx_im[1]) );
  DFFHQXL \dx_im_reg[2]  ( .D(N46), .CK(clk), .Q(dx_im[2]) );
  DFFHQXL \dx_im_reg[3]  ( .D(N45), .CK(clk), .Q(dx_im[3]) );
  DFFHQXL \dx_im_reg[4]  ( .D(N44), .CK(clk), .Q(dx_im[4]) );
  DFFHQXL \dx_im_reg[5]  ( .D(N43), .CK(clk), .Q(dx_im[5]) );
  DFFHQXL \dx_im_reg[6]  ( .D(N42), .CK(clk), .Q(dx_im[6]) );
  DFFHQXL \dx_im_reg[7]  ( .D(N41), .CK(clk), .Q(dx_im[7]) );
  DFFHQXL \dx_im_reg[8]  ( .D(N40), .CK(clk), .Q(dx_im[8]) );
  DFFHQXL \dx_im_reg[9]  ( .D(N39), .CK(clk), .Q(dx_im[9]) );
  DFFHQXL \dx_im_reg[10]  ( .D(N38), .CK(clk), .Q(dx_im[10]) );
  DFFHQXL \dx_im_reg[11]  ( .D(N37), .CK(clk), .Q(dx_im[11]) );
  DFFHQXL \dx_re_reg[0]  ( .D(N36), .CK(clk), .Q(dx_re[0]) );
  DFFHQXL \dx_re_reg[1]  ( .D(N35), .CK(clk), .Q(dx_re[1]) );
  DFFHQXL \dx_re_reg[2]  ( .D(N34), .CK(clk), .Q(dx_re[2]) );
  DFFHQXL \dx_re_reg[3]  ( .D(N33), .CK(clk), .Q(dx_re[3]) );
  DFFHQXL \dx_re_reg[4]  ( .D(N32), .CK(clk), .Q(dx_re[4]) );
  DFFHQXL \dx_re_reg[5]  ( .D(N31), .CK(clk), .Q(dx_re[5]) );
  DFFHQXL \dx_re_reg[6]  ( .D(N30), .CK(clk), .Q(dx_re[6]) );
  DFFHQXL \dx_re_reg[7]  ( .D(N29), .CK(clk), .Q(dx_re[7]) );
  DFFHQXL \dx_re_reg[8]  ( .D(N28), .CK(clk), .Q(dx_re[8]) );
  DFFHQXL \dx_re_reg[9]  ( .D(N27), .CK(clk), .Q(dx_re[9]) );
  DFFHQXL \dx_re_reg[10]  ( .D(N26), .CK(clk), .Q(dx_re[10]) );
  DFFHQXL \dx_re_reg[11]  ( .D(N25), .CK(clk), .Q(dx_re[11]) );
  DFFXL \mux2_re_reg[11]  ( .D(N49), .CK(clk), .QN(N86) );
  DFFXL \mux2_re_reg[10]  ( .D(N50), .CK(clk), .QN(N87) );
  DFFXL \mux2_re_reg[9]  ( .D(N51), .CK(clk), .QN(N88) );
  DFFXL \mux2_re_reg[8]  ( .D(N52), .CK(clk), .QN(N89) );
  DFFXL \mux2_re_reg[7]  ( .D(N53), .CK(clk), .QN(N90) );
  DFFXL \mux2_re_reg[6]  ( .D(N54), .CK(clk), .QN(N91) );
  DFFXL \mux2_re_reg[5]  ( .D(N55), .CK(clk), .QN(N92) );
  DFFXL \mux2_re_reg[4]  ( .D(N56), .CK(clk), .QN(N93) );
  DFFXL \mux2_re_reg[3]  ( .D(N57), .CK(clk), .QN(N94) );
  DFFXL \mux2_re_reg[2]  ( .D(N58), .CK(clk), .QN(N95) );
  DFFXL \mux2_re_reg[1]  ( .D(N59), .CK(clk), .QN(N96) );
  DFFXL \mux2_re_reg[0]  ( .D(N60), .CK(clk), .QN(N97) );
  DFFHQXL \mux2_im_reg[11]  ( .D(N61), .CK(clk), .Q(mux2_im[11]) );
  DFFHQXL \mux2_im_reg[10]  ( .D(N62), .CK(clk), .Q(mux2_im[10]) );
  DFFHQXL \mux2_im_reg[9]  ( .D(N63), .CK(clk), .Q(mux2_im[9]) );
  DFFHQXL \mux2_im_reg[8]  ( .D(N64), .CK(clk), .Q(mux2_im[8]) );
  DFFHQXL \mux2_im_reg[7]  ( .D(N65), .CK(clk), .Q(mux2_im[7]) );
  DFFHQXL \mux2_im_reg[6]  ( .D(N66), .CK(clk), .Q(mux2_im[6]) );
  DFFHQXL \mux2_im_reg[5]  ( .D(N67), .CK(clk), .Q(mux2_im[5]) );
  DFFHQXL \mux2_im_reg[4]  ( .D(N68), .CK(clk), .Q(mux2_im[4]) );
  DFFHQXL \mux2_im_reg[3]  ( .D(N69), .CK(clk), .Q(mux2_im[3]) );
  DFFHQXL \mux2_im_reg[2]  ( .D(N70), .CK(clk), .Q(mux2_im[2]) );
  DFFHQXL \mux2_im_reg[1]  ( .D(N71), .CK(clk), .Q(mux2_im[1]) );
  DFFHQXL \mux2_im_reg[0]  ( .D(N72), .CK(clk), .Q(mux2_im[0]) );
  DFFHQX1 \dout_re_reg[11]  ( .D(N74), .CK(clk), .Q(dout_re[11]) );
  DFFHQX1 \dout_re_reg[10]  ( .D(N75), .CK(clk), .Q(dout_re[10]) );
  DFFHQX1 \dout_re_reg[9]  ( .D(N76), .CK(clk), .Q(dout_re[9]) );
  DFFHQX1 \dout_re_reg[8]  ( .D(N77), .CK(clk), .Q(dout_re[8]) );
  DFFHQX1 \dout_re_reg[7]  ( .D(N78), .CK(clk), .Q(dout_re[7]) );
  DFFHQX1 \dout_re_reg[6]  ( .D(N79), .CK(clk), .Q(dout_re[6]) );
  DFFHQX1 \dout_re_reg[5]  ( .D(N80), .CK(clk), .Q(dout_re[5]) );
  DFFHQX1 \dout_re_reg[4]  ( .D(N81), .CK(clk), .Q(dout_re[4]) );
  DFFHQX1 \dout_re_reg[3]  ( .D(N82), .CK(clk), .Q(dout_re[3]) );
  DFFHQX1 \dout_re_reg[2]  ( .D(N83), .CK(clk), .Q(dout_re[2]) );
  DFFHQX1 \dout_re_reg[1]  ( .D(N84), .CK(clk), .Q(dout_re[1]) );
  DFFHQX1 \dout_re_reg[0]  ( .D(N85), .CK(clk), .Q(dout_re[0]) );
  DFFHQXL \dout_im_reg[11]  ( .D(N110), .CK(clk), .Q(dout_im[11]) );
  DFFHQXL \dout_im_reg[10]  ( .D(N111), .CK(clk), .Q(dout_im[10]) );
  DFFHQXL \dout_im_reg[9]  ( .D(N112), .CK(clk), .Q(dout_im[9]) );
  DFFHQXL \dout_im_reg[8]  ( .D(N113), .CK(clk), .Q(dout_im[8]) );
  DFFHQXL \dout_im_reg[7]  ( .D(N114), .CK(clk), .Q(dout_im[7]) );
  DFFHQXL \dout_im_reg[6]  ( .D(N115), .CK(clk), .Q(dout_im[6]) );
  DFFHQXL \dout_im_reg[5]  ( .D(N116), .CK(clk), .Q(dout_im[5]) );
  DFFHQXL \dout_im_reg[4]  ( .D(N117), .CK(clk), .Q(dout_im[4]) );
  DFFHQXL \dout_im_reg[3]  ( .D(N118), .CK(clk), .Q(dout_im[3]) );
  DFFHQXL \dout_im_reg[2]  ( .D(N119), .CK(clk), .Q(dout_im[2]) );
  DFFHQXL \dout_im_reg[1]  ( .D(N120), .CK(clk), .Q(dout_im[1]) );
  DFFHQXL \dout_im_reg[0]  ( .D(N121), .CK(clk), .Q(dout_im[0]) );
  DFFHQX1 \y_re_reg[11]  ( .D(dout_re[11]), .CK(clk), .Q(y_re[11]) );
  DFFHQX1 \y_re_reg[10]  ( .D(dout_re[10]), .CK(clk), .Q(y_re[10]) );
  DFFHQX1 \y_re_reg[9]  ( .D(dout_re[9]), .CK(clk), .Q(y_re[9]) );
  DFFHQX1 \y_re_reg[8]  ( .D(dout_re[8]), .CK(clk), .Q(y_re[8]) );
  DFFHQX1 \y_re_reg[7]  ( .D(dout_re[7]), .CK(clk), .Q(y_re[7]) );
  DFFHQX1 \y_re_reg[6]  ( .D(dout_re[6]), .CK(clk), .Q(y_re[6]) );
  DFFHQX1 \y_re_reg[5]  ( .D(dout_re[5]), .CK(clk), .Q(y_re[5]) );
  DFFHQX1 \y_re_reg[4]  ( .D(dout_re[4]), .CK(clk), .Q(y_re[4]) );
  DFFHQX1 \y_re_reg[3]  ( .D(dout_re[3]), .CK(clk), .Q(y_re[3]) );
  DFFHQX1 \y_re_reg[2]  ( .D(dout_re[2]), .CK(clk), .Q(y_re[2]) );
  DFFHQX1 \y_re_reg[1]  ( .D(dout_re[1]), .CK(clk), .Q(y_re[1]) );
  DFFHQX1 \y_re_reg[0]  ( .D(dout_re[0]), .CK(clk), .Q(y_re[0]) );
  DFFHQX1 \y_im_reg[11]  ( .D(dout_im[11]), .CK(clk), .Q(y_im[11]) );
  DFFHQX1 \y_im_reg[10]  ( .D(dout_im[10]), .CK(clk), .Q(y_im[10]) );
  DFFHQX1 \y_im_reg[9]  ( .D(dout_im[9]), .CK(clk), .Q(y_im[9]) );
  DFFHQX1 \y_im_reg[8]  ( .D(dout_im[8]), .CK(clk), .Q(y_im[8]) );
  DFFHQX1 \y_im_reg[7]  ( .D(dout_im[7]), .CK(clk), .Q(y_im[7]) );
  DFFHQX1 \y_im_reg[6]  ( .D(dout_im[6]), .CK(clk), .Q(y_im[6]) );
  DFFHQX1 \y_im_reg[5]  ( .D(dout_im[5]), .CK(clk), .Q(y_im[5]) );
  DFFHQX1 \y_im_reg[4]  ( .D(dout_im[4]), .CK(clk), .Q(y_im[4]) );
  DFFHQX1 \y_im_reg[3]  ( .D(dout_im[3]), .CK(clk), .Q(y_im[3]) );
  DFFHQX1 \y_im_reg[2]  ( .D(dout_im[2]), .CK(clk), .Q(y_im[2]) );
  DFFHQX1 \y_im_reg[1]  ( .D(dout_im[1]), .CK(clk), .Q(y_im[1]) );
  DFFHQX1 \y_im_reg[0]  ( .D(dout_im[0]), .CK(clk), .Q(y_im[0]) );
  signal_control s0 ( .clk(clk), .reset(reset), .di_en(di_en), .sel(sel), 
        .bf_nj(bf_nj), .do_en(do_en) );
  delaybuffer_WIDTH12_DEPTH7 d0 ( .clk(clk), .reset(reset), .x_re(dx_re), 
        .x_im(dx_im), .y_re(dy_re), .y_im(dy_im) );
  butterfly2_WIDTH12_3 b0 ( .x0_re(dy_re), .x0_im(dy_im), .x1_re(x_re_r), 
        .x1_im(x_im_r), .y0_re(bf_y0_re), .y0_im(bf_y0_im), .y1_re(bf_y1_re), 
        .y1_im(bf_y1_im) );
  sdfunit3_WIDTH12_DEPTH7_DW01_inc_0_DW01_inc_9 add_97 ( .A({N86, N87, N88, 
        N89, N90, N91, N92, N93, N94, N95, N96, N97}), .SUM({N109, N108, N107, 
        N106, N105, N104, N103, N102, N101, N100, N99, N98}) );
  INVX4 U118 ( .A(sel), .Y(n2) );
endmodule


module signal_control2_DW01_inc_0_DW01_inc_8 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module signal_control2 ( clk, reset, di_en, sel, do_en, addr );
  output [3:0] addr;
  input clk, reset, di_en;
  output sel, do_en;
  wire   N5, N6, N7, N10, N11, N12, N13, N14, N15, N16, N31, N32, N33,
         \cnt3[3] , N42, N43, N44, N45, N59, N64, N71, N72, N73, N92, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, N69,
         \mult_74/n3 , \mult_74/n2 , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39;
  wire   [6:0] cnt;

  ADDHXL \mult_74/U4  ( .A(N71), .B(N59), .CO(\mult_74/n3 ), .S(N72) );
  ADDFX2 \mult_74/U3  ( .A(N69), .B(N59), .CI(\mult_74/n3 ), .CO(\mult_74/n2 ), 
        .S(N73) );
  DFFRHQXL \cnt_reg[0]  ( .D(n75), .CK(clk), .RN(n76), .Q(cnt[0]) );
  DFFRHQXL \cnt_reg[1]  ( .D(n74), .CK(clk), .RN(n76), .Q(cnt[1]) );
  DFFRHQXL \cnt_reg[2]  ( .D(n73), .CK(clk), .RN(n76), .Q(cnt[2]) );
  DFFRHQXL \cnt_reg[3]  ( .D(n72), .CK(clk), .RN(n76), .Q(cnt[3]) );
  DFFRHQXL \cnt_reg[4]  ( .D(n71), .CK(clk), .RN(n76), .Q(cnt[4]) );
  DFFRHQXL \cnt_reg[5]  ( .D(n70), .CK(clk), .RN(n76), .Q(cnt[5]) );
  DFFRHQXL \cnt_reg[6]  ( .D(n69), .CK(clk), .RN(n76), .Q(cnt[6]) );
  DFFRHQXL \cnt3_reg[0]  ( .D(N42), .CK(clk), .RN(n76), .Q(N71) );
  DFFRHQXL \cnt3_reg[1]  ( .D(N43), .CK(clk), .RN(n76), .Q(N59) );
  DFFRHQX1 \cnt3_reg[2]  ( .D(N44), .CK(clk), .RN(n76), .Q(N64) );
  DFFRHQX1 \cnt3_reg[3]  ( .D(N45), .CK(clk), .RN(n76), .Q(\cnt3[3] ) );
  DFFRHQX1 \addr_r_reg[3]  ( .D(n81), .CK(clk), .RN(n76), .Q(addr[3]) );
  DFFRHQX1 \addr_r_reg[2]  ( .D(n80), .CK(clk), .RN(n76), .Q(addr[2]) );
  DFFRHQX1 \addr_r_reg[1]  ( .D(n79), .CK(clk), .RN(n76), .Q(addr[1]) );
  DFFRHQX1 \addr_r_reg[0]  ( .D(n78), .CK(clk), .RN(n76), .Q(addr[0]) );
  DFFRHQX2 do_en_r_reg ( .D(N92), .CK(clk), .RN(n76), .Q(do_en) );
  DFFNRX1 start_count_reg ( .D(n77), .CKN(clk), .RN(n76), .Q(n9), .QN(n39) );
  DFFRHQX1 \cnt2_reg[0]  ( .D(N31), .CK(clk), .RN(n76), .Q(N5) );
  DFFRHQX1 \cnt2_reg[1]  ( .D(N32), .CK(clk), .RN(n76), .Q(N6) );
  DFFRHQX1 \cnt2_reg[2]  ( .D(N33), .CK(clk), .RN(n76), .Q(N7) );
  OAI21XL U3 ( .A0(n7), .A1(n3), .B0(N71), .Y(n1) );
  INVX1 U4 ( .A(n1), .Y(n78) );
  NOR2X1 U5 ( .A(N5), .B(N6), .Y(n2) );
  AND3X2 U6 ( .A(N64), .B(\mult_74/n2 ), .C(\cnt3[3] ), .Y(n81) );
  XNOR2X4 U7 ( .A(N7), .B(n2), .Y(sel) );
  INVX1 U8 ( .A(n4), .Y(n80) );
  AOI22X1 U9 ( .A0(n5), .A1(N59), .B0(N73), .B1(n3), .Y(n4) );
  OAI2BB1X1 U10 ( .A0N(N72), .A1N(n3), .B0(n6), .Y(n79) );
  AOI22X1 U11 ( .A0(N71), .A1(n5), .B0(n7), .B1(N59), .Y(n6) );
  NOR2X1 U12 ( .A(n8), .B(N69), .Y(n3) );
  OR2X1 U13 ( .A(di_en), .B(n9), .Y(n77) );
  INVX1 U14 ( .A(reset), .Y(n76) );
  OAI2BB2X1 U15 ( .B0(n9), .B1(n10), .A0N(N10), .A1N(n11), .Y(n75) );
  OAI2BB2X1 U16 ( .B0(n9), .B1(n12), .A0N(N11), .A1N(n11), .Y(n74) );
  OAI2BB2X1 U17 ( .B0(n9), .B1(n13), .A0N(N12), .A1N(n11), .Y(n73) );
  OAI2BB2X1 U18 ( .B0(n9), .B1(n14), .A0N(N13), .A1N(n11), .Y(n72) );
  OAI2BB2X1 U19 ( .B0(n9), .B1(n15), .A0N(N14), .A1N(n11), .Y(n71) );
  OAI2BB2X1 U20 ( .B0(n9), .B1(n16), .A0N(N15), .A1N(n11), .Y(n70) );
  INVX1 U21 ( .A(n17), .Y(n69) );
  AOI22X1 U22 ( .A0(n39), .A1(cnt[6]), .B0(N16), .B1(n11), .Y(n17) );
  AOI2BB1X1 U23 ( .A0N(n18), .A1N(n19), .B0(n39), .Y(n11) );
  NAND3X1 U24 ( .A(cnt[5]), .B(cnt[2]), .C(cnt[6]), .Y(n19) );
  NAND4X1 U25 ( .A(n10), .B(n12), .C(n14), .D(n15), .Y(n18) );
  INVX1 U26 ( .A(cnt[1]), .Y(n12) );
  INVX1 U27 ( .A(cnt[0]), .Y(n10) );
  MXI2X1 U28 ( .A(n20), .B(n21), .S0(cnt[6]), .Y(N92) );
  OAI211X1 U29 ( .A0(n22), .A1(n14), .B0(n15), .C0(n16), .Y(n21) );
  AOI21X1 U30 ( .A0(cnt[1]), .A1(cnt[0]), .B0(cnt[2]), .Y(n22) );
  AOI21X1 U31 ( .A0(cnt[3]), .A1(cnt[1]), .B0(n23), .Y(n20) );
  OAI22X1 U32 ( .A0(n8), .A1(n24), .B0(n25), .B1(n26), .Y(N45) );
  AOI21X1 U33 ( .A0(n27), .A1(n5), .B0(n7), .Y(n25) );
  NOR2X1 U34 ( .A(n8), .B(N64), .Y(n7) );
  NOR2X1 U35 ( .A(N69), .B(\cnt3[3] ), .Y(n5) );
  INVX1 U36 ( .A(\cnt3[3] ), .Y(n8) );
  MXI2X1 U37 ( .A(n24), .B(n28), .S0(N69), .Y(N44) );
  INVX1 U38 ( .A(N64), .Y(N69) );
  NAND2X1 U39 ( .A(n27), .B(n29), .Y(n28) );
  INVX1 U40 ( .A(n30), .Y(n27) );
  NAND2X1 U41 ( .A(n29), .B(n30), .Y(n24) );
  NAND2X1 U42 ( .A(N71), .B(N59), .Y(n30) );
  MXI2X1 U43 ( .A(n31), .B(n32), .S0(N59), .Y(N43) );
  INVX1 U44 ( .A(N42), .Y(n32) );
  NAND2X1 U45 ( .A(N71), .B(n29), .Y(n31) );
  NOR2X1 U46 ( .A(n26), .B(N71), .Y(N42) );
  MXI2X1 U47 ( .A(n33), .B(n34), .S0(N7), .Y(N33) );
  AOI2BB1X1 U48 ( .A0N(n26), .A1N(N6), .B0(N31), .Y(n34) );
  NAND3X1 U49 ( .A(n29), .B(N5), .C(N6), .Y(n33) );
  MXI2X1 U50 ( .A(n35), .B(n36), .S0(N6), .Y(N32) );
  INVX1 U51 ( .A(N31), .Y(n36) );
  NAND2X1 U52 ( .A(N5), .B(n29), .Y(n35) );
  INVX1 U53 ( .A(n26), .Y(n29) );
  NOR2X1 U54 ( .A(n26), .B(N5), .Y(N31) );
  MXI2X1 U55 ( .A(n37), .B(n38), .S0(cnt[6]), .Y(n26) );
  AOI31X1 U56 ( .A0(cnt[1]), .A1(cnt[0]), .A2(cnt[3]), .B0(n23), .Y(n38) );
  OAI211X1 U57 ( .A0(n13), .A1(n14), .B0(n15), .C0(n16), .Y(n23) );
  NAND4X1 U58 ( .A(n13), .B(n14), .C(n15), .D(n16), .Y(n37) );
  INVX1 U59 ( .A(cnt[5]), .Y(n16) );
  INVX1 U60 ( .A(cnt[4]), .Y(n15) );
  INVX1 U61 ( .A(cnt[3]), .Y(n14) );
  INVX1 U62 ( .A(cnt[2]), .Y(n13) );
  signal_control2_DW01_inc_0_DW01_inc_8 add_36 ( .A(cnt), .SUM({N16, N15, N14, 
        N13, N12, N11, N10}) );
endmodule


module delaybuffer_WIDTH12_DEPTH3 ( clk, reset, x_re, x_im, y_re, y_im );
  input [11:0] x_re;
  input [11:0] x_im;
  output [11:0] y_re;
  output [11:0] y_im;
  input clk, reset;
  wire   \buf_im[2][11] , \buf_im[2][10] , \buf_im[2][9] , \buf_im[2][8] ,
         \buf_im[2][7] , \buf_im[2][6] , \buf_im[2][5] , \buf_im[2][4] ,
         \buf_im[2][3] , \buf_im[2][2] , \buf_im[2][1] , \buf_im[2][0] ,
         \buf_im[1][11] , \buf_im[1][10] , \buf_im[1][9] , \buf_im[1][8] ,
         \buf_im[1][7] , \buf_im[1][6] , \buf_im[1][5] , \buf_im[1][4] ,
         \buf_im[1][3] , \buf_im[1][2] , \buf_im[1][1] , \buf_im[1][0] ,
         \buf_re[2][11] , \buf_re[2][10] , \buf_re[2][9] , \buf_re[2][8] ,
         \buf_re[2][7] , \buf_re[2][6] , \buf_re[2][5] , \buf_re[2][4] ,
         \buf_re[2][3] , \buf_re[2][2] , \buf_re[2][1] , \buf_re[2][0] ,
         \buf_re[1][11] , \buf_re[1][10] , \buf_re[1][9] , \buf_re[1][8] ,
         \buf_re[1][7] , \buf_re[1][6] , \buf_re[1][5] , \buf_re[1][4] ,
         \buf_re[1][3] , \buf_re[1][2] , \buf_re[1][1] , \buf_re[1][0] , n1;

  DFFRHQXL \buf_im_reg[1][11]  ( .D(x_im[11]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][11] ) );
  DFFRHQXL \buf_im_reg[2][11]  ( .D(\buf_im[1][11] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][11] ) );
  DFFRHQXL \buf_im_reg[1][10]  ( .D(x_im[10]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][10] ) );
  DFFRHQXL \buf_im_reg[2][10]  ( .D(\buf_im[1][10] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][10] ) );
  DFFRHQXL \buf_im_reg[1][9]  ( .D(x_im[9]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][9] ) );
  DFFRHQXL \buf_im_reg[2][9]  ( .D(\buf_im[1][9] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][9] ) );
  DFFRHQXL \buf_im_reg[1][8]  ( .D(x_im[8]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][8] ) );
  DFFRHQXL \buf_im_reg[2][8]  ( .D(\buf_im[1][8] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][8] ) );
  DFFRHQXL \buf_im_reg[1][7]  ( .D(x_im[7]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][7] ) );
  DFFRHQXL \buf_im_reg[2][7]  ( .D(\buf_im[1][7] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][7] ) );
  DFFRHQXL \buf_im_reg[1][6]  ( .D(x_im[6]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][6] ) );
  DFFRHQXL \buf_im_reg[2][6]  ( .D(\buf_im[1][6] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][6] ) );
  DFFRHQXL \buf_im_reg[1][5]  ( .D(x_im[5]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][5] ) );
  DFFRHQXL \buf_im_reg[2][5]  ( .D(\buf_im[1][5] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][5] ) );
  DFFRHQXL \buf_im_reg[1][4]  ( .D(x_im[4]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][4] ) );
  DFFRHQXL \buf_im_reg[2][4]  ( .D(\buf_im[1][4] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][4] ) );
  DFFRHQXL \buf_im_reg[1][3]  ( .D(x_im[3]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][3] ) );
  DFFRHQXL \buf_im_reg[2][3]  ( .D(\buf_im[1][3] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][3] ) );
  DFFRHQXL \buf_im_reg[1][2]  ( .D(x_im[2]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][2] ) );
  DFFRHQXL \buf_im_reg[2][2]  ( .D(\buf_im[1][2] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][2] ) );
  DFFRHQXL \buf_im_reg[1][1]  ( .D(x_im[1]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][1] ) );
  DFFRHQXL \buf_im_reg[2][1]  ( .D(\buf_im[1][1] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][1] ) );
  DFFRHQXL \buf_im_reg[1][0]  ( .D(x_im[0]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][0] ) );
  DFFRHQXL \buf_im_reg[2][0]  ( .D(\buf_im[1][0] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][0] ) );
  DFFRHQXL \buf_re_reg[1][11]  ( .D(x_re[11]), .CK(clk), .RN(n1), .Q(
        \buf_re[1][11] ) );
  DFFRHQXL \buf_re_reg[2][11]  ( .D(\buf_re[1][11] ), .CK(clk), .RN(n1), .Q(
        \buf_re[2][11] ) );
  DFFRHQXL \buf_re_reg[1][10]  ( .D(x_re[10]), .CK(clk), .RN(n1), .Q(
        \buf_re[1][10] ) );
  DFFRHQXL \buf_re_reg[2][10]  ( .D(\buf_re[1][10] ), .CK(clk), .RN(n1), .Q(
        \buf_re[2][10] ) );
  DFFRHQXL \buf_re_reg[1][9]  ( .D(x_re[9]), .CK(clk), .RN(n1), .Q(
        \buf_re[1][9] ) );
  DFFRHQXL \buf_re_reg[2][9]  ( .D(\buf_re[1][9] ), .CK(clk), .RN(n1), .Q(
        \buf_re[2][9] ) );
  DFFRHQXL \buf_re_reg[1][8]  ( .D(x_re[8]), .CK(clk), .RN(n1), .Q(
        \buf_re[1][8] ) );
  DFFRHQXL \buf_re_reg[2][8]  ( .D(\buf_re[1][8] ), .CK(clk), .RN(n1), .Q(
        \buf_re[2][8] ) );
  DFFRHQXL \buf_re_reg[1][7]  ( .D(x_re[7]), .CK(clk), .RN(n1), .Q(
        \buf_re[1][7] ) );
  DFFRHQXL \buf_re_reg[2][7]  ( .D(\buf_re[1][7] ), .CK(clk), .RN(n1), .Q(
        \buf_re[2][7] ) );
  DFFRHQXL \buf_re_reg[1][6]  ( .D(x_re[6]), .CK(clk), .RN(n1), .Q(
        \buf_re[1][6] ) );
  DFFRHQXL \buf_re_reg[2][6]  ( .D(\buf_re[1][6] ), .CK(clk), .RN(n1), .Q(
        \buf_re[2][6] ) );
  DFFRHQXL \buf_re_reg[1][5]  ( .D(x_re[5]), .CK(clk), .RN(n1), .Q(
        \buf_re[1][5] ) );
  DFFRHQXL \buf_re_reg[2][5]  ( .D(\buf_re[1][5] ), .CK(clk), .RN(n1), .Q(
        \buf_re[2][5] ) );
  DFFRHQXL \buf_re_reg[1][4]  ( .D(x_re[4]), .CK(clk), .RN(n1), .Q(
        \buf_re[1][4] ) );
  DFFRHQXL \buf_re_reg[2][4]  ( .D(\buf_re[1][4] ), .CK(clk), .RN(n1), .Q(
        \buf_re[2][4] ) );
  DFFRHQXL \buf_re_reg[1][3]  ( .D(x_re[3]), .CK(clk), .RN(n1), .Q(
        \buf_re[1][3] ) );
  DFFRHQXL \buf_re_reg[2][3]  ( .D(\buf_re[1][3] ), .CK(clk), .RN(n1), .Q(
        \buf_re[2][3] ) );
  DFFRHQXL \buf_re_reg[1][2]  ( .D(x_re[2]), .CK(clk), .RN(n1), .Q(
        \buf_re[1][2] ) );
  DFFRHQXL \buf_re_reg[2][2]  ( .D(\buf_re[1][2] ), .CK(clk), .RN(n1), .Q(
        \buf_re[2][2] ) );
  DFFRHQXL \buf_re_reg[1][1]  ( .D(x_re[1]), .CK(clk), .RN(n1), .Q(
        \buf_re[1][1] ) );
  DFFRHQXL \buf_re_reg[2][1]  ( .D(\buf_re[1][1] ), .CK(clk), .RN(n1), .Q(
        \buf_re[2][1] ) );
  DFFRHQXL \buf_re_reg[1][0]  ( .D(x_re[0]), .CK(clk), .RN(n1), .Q(
        \buf_re[1][0] ) );
  DFFRHQXL \buf_re_reg[2][0]  ( .D(\buf_re[1][0] ), .CK(clk), .RN(n1), .Q(
        \buf_re[2][0] ) );
  DFFHQX1 \y_re_r_reg[10]  ( .D(\buf_re[2][10] ), .CK(clk), .Q(y_re[10]) );
  DFFHQX1 \y_re_r_reg[9]  ( .D(\buf_re[2][9] ), .CK(clk), .Q(y_re[9]) );
  DFFHQX1 \y_re_r_reg[8]  ( .D(\buf_re[2][8] ), .CK(clk), .Q(y_re[8]) );
  DFFHQX1 \y_re_r_reg[7]  ( .D(\buf_re[2][7] ), .CK(clk), .Q(y_re[7]) );
  DFFHQX1 \y_re_r_reg[6]  ( .D(\buf_re[2][6] ), .CK(clk), .Q(y_re[6]) );
  DFFHQX1 \y_re_r_reg[5]  ( .D(\buf_re[2][5] ), .CK(clk), .Q(y_re[5]) );
  DFFHQX1 \y_re_r_reg[4]  ( .D(\buf_re[2][4] ), .CK(clk), .Q(y_re[4]) );
  DFFHQX1 \y_re_r_reg[3]  ( .D(\buf_re[2][3] ), .CK(clk), .Q(y_re[3]) );
  DFFHQX1 \y_re_r_reg[2]  ( .D(\buf_re[2][2] ), .CK(clk), .Q(y_re[2]) );
  DFFHQX1 \y_im_r_reg[10]  ( .D(\buf_im[2][10] ), .CK(clk), .Q(y_im[10]) );
  DFFHQX1 \y_im_r_reg[9]  ( .D(\buf_im[2][9] ), .CK(clk), .Q(y_im[9]) );
  DFFHQX1 \y_im_r_reg[8]  ( .D(\buf_im[2][8] ), .CK(clk), .Q(y_im[8]) );
  DFFHQX1 \y_im_r_reg[7]  ( .D(\buf_im[2][7] ), .CK(clk), .Q(y_im[7]) );
  DFFHQX1 \y_im_r_reg[6]  ( .D(\buf_im[2][6] ), .CK(clk), .Q(y_im[6]) );
  DFFHQX1 \y_im_r_reg[5]  ( .D(\buf_im[2][5] ), .CK(clk), .Q(y_im[5]) );
  DFFHQX1 \y_im_r_reg[4]  ( .D(\buf_im[2][4] ), .CK(clk), .Q(y_im[4]) );
  DFFHQX1 \y_im_r_reg[3]  ( .D(\buf_im[2][3] ), .CK(clk), .Q(y_im[3]) );
  DFFHQX1 \y_im_r_reg[2]  ( .D(\buf_im[2][2] ), .CK(clk), .Q(y_im[2]) );
  DFFHQX1 \y_im_r_reg[11]  ( .D(\buf_im[2][11] ), .CK(clk), .Q(y_im[11]) );
  DFFHQX1 \y_re_r_reg[11]  ( .D(\buf_re[2][11] ), .CK(clk), .Q(y_re[11]) );
  DFFHQX1 \y_re_r_reg[1]  ( .D(\buf_re[2][1] ), .CK(clk), .Q(y_re[1]) );
  DFFHQX1 \y_re_r_reg[0]  ( .D(\buf_re[2][0] ), .CK(clk), .Q(y_re[0]) );
  DFFHQX1 \y_im_r_reg[1]  ( .D(\buf_im[2][1] ), .CK(clk), .Q(y_im[1]) );
  DFFHQX1 \y_im_r_reg[0]  ( .D(\buf_im[2][0] ), .CK(clk), .Q(y_im[0]) );
  CLKINVX3 U3 ( .A(reset), .Y(n1) );
endmodule


module carry_select_adder2_WIDTH12_11 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U5 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U8 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_10 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U5 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U8 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_9 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U5 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U8 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X1 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_8 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U5 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U8 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X1 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module butterfly2_WIDTH12_2_DW01_inc_0_DW01_inc_20 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module butterfly2_WIDTH12_2_DW01_inc_1_DW01_inc_21 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module butterfly2_WIDTH12_2 ( x0_re, x0_im, x1_re, x1_im, y0_re, y0_im, y1_re, 
        y1_im );
  input [11:0] x0_re;
  input [11:0] x0_im;
  input [11:0] x1_re;
  input [11:0] x1_im;
  output [11:0] y0_re;
  output [11:0] y0_im;
  output [11:0] y1_re;
  output [11:0] y1_im;
  wire   N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N9, N8,
         N7, N6, N5, N4, N3, N2, N11, N10, N1, N0;
  wire   [11:0] x1_re_neg;
  wire   [11:0] x1_im_neg;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  INVX1 U3 ( .A(x1_re[10]), .Y(N1) );
  INVX1 U4 ( .A(x1_re[11]), .Y(N0) );
  INVX1 U5 ( .A(x1_re[1]), .Y(N10) );
  INVX1 U6 ( .A(x1_re[2]), .Y(N9) );
  INVX1 U7 ( .A(x1_re[3]), .Y(N8) );
  INVX1 U8 ( .A(x1_re[4]), .Y(N7) );
  INVX1 U9 ( .A(x1_re[5]), .Y(N6) );
  INVX1 U10 ( .A(x1_re[6]), .Y(N5) );
  INVX1 U11 ( .A(x1_re[7]), .Y(N4) );
  INVX1 U12 ( .A(x1_re[8]), .Y(N3) );
  INVX1 U13 ( .A(x1_re[9]), .Y(N2) );
  INVX1 U14 ( .A(x1_re[0]), .Y(N11) );
  INVX1 U15 ( .A(x1_im[10]), .Y(N13) );
  INVX1 U16 ( .A(x1_im[11]), .Y(N12) );
  INVX1 U17 ( .A(x1_im[1]), .Y(N22) );
  INVX1 U18 ( .A(x1_im[2]), .Y(N21) );
  INVX1 U19 ( .A(x1_im[3]), .Y(N20) );
  INVX1 U20 ( .A(x1_im[4]), .Y(N19) );
  INVX1 U21 ( .A(x1_im[5]), .Y(N18) );
  INVX1 U22 ( .A(x1_im[6]), .Y(N17) );
  INVX1 U23 ( .A(x1_im[7]), .Y(N16) );
  INVX1 U24 ( .A(x1_im[8]), .Y(N15) );
  INVX1 U25 ( .A(x1_im[9]), .Y(N14) );
  INVX1 U26 ( .A(x1_im[0]), .Y(N23) );
  carry_select_adder2_WIDTH12_11 c0 ( .x(x0_re), .y(x1_re), .z({y0_re, 
        SYNOPSYS_UNCONNECTED__0}) );
  carry_select_adder2_WIDTH12_10 c1 ( .x(x0_im), .y(x1_im), .z({y0_im, 
        SYNOPSYS_UNCONNECTED__1}) );
  carry_select_adder2_WIDTH12_9 c2 ( .x(x0_re), .y(x1_re_neg), .z({y1_re, 
        SYNOPSYS_UNCONNECTED__2}) );
  carry_select_adder2_WIDTH12_8 c3 ( .x(x0_im), .y(x1_im_neg), .z({y1_im, 
        SYNOPSYS_UNCONNECTED__3}) );
  butterfly2_WIDTH12_2_DW01_inc_0_DW01_inc_20 add_0_root_add_22_ni ( .A({N12, 
        N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23}), .SUM(
        x1_im_neg) );
  butterfly2_WIDTH12_2_DW01_inc_1_DW01_inc_21 add_0_root_add_21_ni ( .A({N0, 
        N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11}), .SUM(x1_re_neg) );
endmodule


module twiddle3 ( clk, addr, tw_re, tw_im );
  input [3:0] addr;
  output [11:0] tw_re;
  output [11:0] tw_im;
  input clk;
  wire   N26, N28, N29, N30, N31, N32, N33, N34, N35, N47, N49, N50, N51, N52,
         N53, N54, N55, N56, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14;

  OR2X1 U5 ( .A(N35), .B(N55), .Y(N54) );
  NAND2X1 U6 ( .A(n1), .B(n2), .Y(N52) );
  NAND2X1 U7 ( .A(n2), .B(n3), .Y(N51) );
  INVX1 U8 ( .A(n4), .Y(N50) );
  OR3XL U9 ( .A(N55), .B(addr[2]), .C(N53), .Y(N47) );
  NAND2X1 U10 ( .A(n1), .B(n3), .Y(N55) );
  INVX1 U11 ( .A(N56), .Y(n3) );
  NAND2X1 U12 ( .A(n5), .B(n6), .Y(N56) );
  NAND2X1 U13 ( .A(n4), .B(n2), .Y(N35) );
  INVX1 U14 ( .A(N53), .Y(n2) );
  NAND2X1 U15 ( .A(n7), .B(n8), .Y(N53) );
  NAND3BX1 U16 ( .AN(N49), .B(n8), .C(n9), .Y(N34) );
  NAND2X1 U17 ( .A(n1), .B(n4), .Y(N49) );
  AND2X1 U18 ( .A(n10), .B(n11), .Y(n1) );
  NAND2BX1 U19 ( .AN(N26), .B(n5), .Y(N33) );
  NAND2X1 U20 ( .A(n12), .B(n7), .Y(N31) );
  NAND4X1 U21 ( .A(n4), .B(n8), .C(n6), .D(n10), .Y(N30) );
  NAND3X1 U22 ( .A(n10), .B(n7), .C(n5), .Y(N29) );
  NAND4X1 U23 ( .A(n9), .B(n11), .C(n5), .D(n7), .Y(N28) );
  NAND3X1 U24 ( .A(addr[0]), .B(n13), .C(addr[1]), .Y(n5) );
  NAND3X1 U25 ( .A(n10), .B(n7), .C(n6), .Y(N32) );
  OR4X1 U26 ( .A(addr[3]), .B(n14), .C(addr[1]), .D(addr[2]), .Y(n7) );
  NAND3X1 U27 ( .A(n14), .B(n13), .C(addr[1]), .Y(n10) );
  INVX1 U28 ( .A(addr[2]), .Y(n13) );
  NAND3X1 U29 ( .A(n4), .B(n8), .C(n12), .Y(N26) );
  AND3X1 U30 ( .A(n11), .B(n6), .C(n9), .Y(n12) );
  NAND2X1 U31 ( .A(addr[3]), .B(n14), .Y(n9) );
  NAND3BX1 U32 ( .AN(addr[1]), .B(addr[0]), .C(addr[2]), .Y(n6) );
  NAND3X1 U33 ( .A(addr[2]), .B(n14), .C(addr[1]), .Y(n11) );
  INVX1 U34 ( .A(addr[0]), .Y(n14) );
  NAND3X1 U35 ( .A(addr[2]), .B(addr[0]), .C(addr[1]), .Y(n8) );
  NAND2X1 U36 ( .A(addr[3]), .B(addr[0]), .Y(n4) );
  DFFHQX1 \temp_im_reg[11]  ( .D(N47), .CK(clk), .Q(tw_im[11]) );
  DFFHQX1 \temp_im_reg[10]  ( .D(N47), .CK(clk), .Q(tw_im[10]) );
  DFFHQX1 \temp_im_reg[9]  ( .D(N53), .CK(clk), .Q(tw_im[9]) );
  DFFHQX1 \temp_im_reg[8]  ( .D(N49), .CK(clk), .Q(tw_im[8]) );
  DFFHQX1 \temp_im_reg[7]  ( .D(N50), .CK(clk), .Q(tw_im[7]) );
  DFFHQX1 \temp_im_reg[6]  ( .D(N51), .CK(clk), .Q(tw_im[6]) );
  DFFHQX1 \temp_im_reg[5]  ( .D(N52), .CK(clk), .Q(tw_im[5]) );
  DFFHQX1 \temp_im_reg[4]  ( .D(N53), .CK(clk), .Q(tw_im[4]) );
  DFFHQX1 \temp_im_reg[3]  ( .D(N54), .CK(clk), .Q(tw_im[3]) );
  DFFHQX1 \temp_im_reg[2]  ( .D(N55), .CK(clk), .Q(tw_im[2]) );
  DFFHQX1 \temp_im_reg[1]  ( .D(N56), .CK(clk), .Q(tw_im[1]) );
  DFFHQX1 \temp_re_reg[11]  ( .D(N26), .CK(clk), .Q(tw_re[11]) );
  DFFHQX1 \temp_re_reg[10]  ( .D(N26), .CK(clk), .Q(tw_re[10]) );
  DFFHQX1 \temp_re_reg[9]  ( .D(N32), .CK(clk), .Q(tw_re[9]) );
  DFFHQX1 \temp_re_reg[8]  ( .D(N28), .CK(clk), .Q(tw_re[8]) );
  DFFHQX1 \temp_re_reg[7]  ( .D(N29), .CK(clk), .Q(tw_re[7]) );
  DFFHQX1 \temp_re_reg[6]  ( .D(N30), .CK(clk), .Q(tw_re[6]) );
  DFFHQX1 \temp_re_reg[5]  ( .D(N31), .CK(clk), .Q(tw_re[5]) );
  DFFHQX1 \temp_re_reg[4]  ( .D(N32), .CK(clk), .Q(tw_re[4]) );
  DFFHQX1 \temp_re_reg[3]  ( .D(N33), .CK(clk), .Q(tw_re[3]) );
  DFFHQX1 \temp_re_reg[2]  ( .D(N34), .CK(clk), .Q(tw_re[2]) );
  DFFHQX1 \temp_re_reg[1]  ( .D(N35), .CK(clk), .Q(tw_re[1]) );
  INVX1 U3 ( .A(1'b1), .Y(tw_re[0]) );
  INVX1 U37 ( .A(1'b1), .Y(tw_im[0]) );
endmodule


module multiply_WIDTH12_0_DW01_add_0_DW01_add_24 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  XOR3X2 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_0_DW01_add_1_DW01_add_25 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  XOR3X2 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_0_DW01_add_2_DW01_add_26 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  XOR3X2 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_0_DW01_inc_1_DW01_inc_30 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_0_DW01_add_4_DW01_add_80 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  XOR3X2 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_0_DW01_inc_0_DW01_inc_28 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_0_DW01_add_3_DW01_add_78 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  XOR3X2 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_0_DW_mult_tc_7 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n27,
         n29, n36, n37, n38, n39, n40, n41, n43, n44, n45, n47, n49, n50, n52,
         n54, n56, n57, n58, n59, n60, n61, n62, n64, n65, n68, n69, n70, n71,
         n73, n76, n77, n78, n79, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n97, n99, n100, n105, n106, n107, n108,
         n109, n110, n112, n113, n115, n116, n117, n118, n123, n124, n126,
         n131, n132, n135, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n253, n254, n255, n256, n257, n258,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n462, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n524, n525, n526, n528, n529, n530, n531, n532;
  assign n1 = b[0];
  assign n409 = b[11];
  assign n410 = b[10];
  assign n411 = b[9];
  assign n412 = b[8];
  assign n413 = b[7];
  assign n414 = b[6];
  assign n415 = b[5];
  assign n416 = b[4];
  assign n417 = b[3];
  assign n418 = b[2];
  assign n419 = b[1];
  assign n445 = a[11];
  assign n446 = a[9];
  assign n447 = a[7];
  assign n448 = a[5];
  assign n449 = a[3];
  assign n450 = a[1];

  NAND2X4 U417 ( .A(n433), .B(n421), .Y(n427) );
  NAND2X4 U420 ( .A(n434), .B(n422), .Y(n428) );
  XNOR2X4 U422 ( .A(n447), .B(a[8]), .Y(n434) );
  XNOR2X4 U425 ( .A(n448), .B(a[6]), .Y(n435) );
  XNOR2X4 U431 ( .A(n450), .B(a[2]), .Y(n437) );
  ADDHXL U437 ( .A(n326), .B(n256), .CO(n242), .S(n243) );
  CMPR42X1 U439 ( .A(n294), .B(n325), .C(n314), .D(n304), .ICI(n242), .S(n239), 
        .ICO(n237), .CO(n238) );
  ADDHXL U440 ( .A(n324), .B(n255), .CO(n235), .S(n236) );
  INVX1 U441 ( .A(n447), .Y(n441) );
  ADDFX2 U442 ( .A(n291), .B(n281), .CI(n301), .CO(n223), .S(n224) );
  INVX1 U443 ( .A(n196), .Y(n197) );
  CMPR42X1 U444 ( .A(n284), .B(n274), .C(n180), .D(n176), .ICI(n177), .S(n174), 
        .ICO(n172), .CO(n173) );
  ADDHXL U445 ( .A(n328), .B(n317), .CO(n246), .S(n247) );
  ADDFX2 U446 ( .A(n306), .B(n327), .CI(n316), .CO(n244), .S(n245) );
  ADDFX2 U447 ( .A(n315), .B(n305), .CI(n243), .CO(n240), .S(n241) );
  CMPR42X1 U448 ( .A(n313), .B(n293), .C(n303), .D(n236), .ICI(n237), .S(n234), 
        .ICO(n232), .CO(n233) );
  ADDFX2 U449 ( .A(n282), .B(n323), .CI(n292), .CO(n230), .S(n231) );
  NOR2BX1 U450 ( .AN(n1), .B(n434), .Y(n282) );
  OAI22X1 U451 ( .A0(n428), .A1(n352), .B0(n351), .B1(n434), .Y(n278) );
  CMPR42X1 U452 ( .A(n289), .B(n269), .C(n309), .D(n214), .ICI(n217), .S(n211), 
        .ICO(n209), .CO(n210) );
  ADDHXL U453 ( .A(n320), .B(n253), .CO(n212), .S(n213) );
  CMPR42X1 U455 ( .A(n273), .B(n263), .C(n171), .D(n175), .ICI(n172), .S(n169), 
        .ICO(n167), .CO(n168) );
  OAI22X1 U459 ( .A0(n429), .A1(n367), .B0(n366), .B1(n435), .Y(n292) );
  OAI22X1 U460 ( .A0(n432), .A1(n400), .B0(n399), .B1(n462), .Y(n323) );
  AOI21X1 U461 ( .A0(n462), .A1(n432), .B0(n396), .Y(n514) );
  INVX1 U462 ( .A(n514), .Y(n319) );
  NAND2X1 U464 ( .A(n330), .B(n258), .Y(n135) );
  OAI21X1 U465 ( .A0(n76), .A1(n82), .B0(n77), .Y(n71) );
  NAND2BX1 U468 ( .AN(n65), .B(n68), .Y(n10) );
  AOI22X1 U469 ( .A0(n520), .A1(n131), .B0(n247), .B1(n257), .Y(n126) );
  AOI21X1 U470 ( .A0(n435), .A1(n429), .B0(n357), .Y(n515) );
  INVX1 U471 ( .A(n515), .Y(n283) );
  XOR2X1 U472 ( .A(n158), .B(n516), .Y(n4) );
  NAND2XL U473 ( .A(n518), .B(n99), .Y(n15) );
  OAI2BB2X1 U474 ( .B0(n126), .B1(n124), .A0N(n245), .A1N(n246), .Y(n123) );
  OAI22XL U475 ( .A0(n427), .A1(n333), .B0(n433), .B1(n332), .Y(n260) );
  NAND2BX1 U476 ( .AN(n39), .B(n40), .Y(n6) );
  NAND2BX1 U477 ( .AN(n90), .B(n91), .Y(n14) );
  AOI22X1 U478 ( .A0(n522), .A1(n123), .B0(n241), .B1(n244), .Y(n118) );
  OAI22XL U479 ( .A0(n427), .A1(n332), .B0(n433), .B1(n331), .Y(n516) );
  XNOR2X1 U481 ( .A(n160), .B(n159), .Y(n5) );
  OAI21XL U482 ( .A0(n92), .A1(n90), .B0(n91), .Y(n89) );
  INVXL U483 ( .A(n93), .Y(n92) );
  OAI22XL U484 ( .A0(n430), .A1(n378), .B0(n377), .B1(n436), .Y(n302) );
  AOI22X1 U485 ( .A0(n38), .A1(n526), .B0(n160), .B1(n159), .Y(n517) );
  INVX1 U486 ( .A(n517), .Y(n29) );
  NAND2BXL U487 ( .AN(n87), .B(n88), .Y(n13) );
  NAND2BX1 U488 ( .AN(n60), .B(n61), .Y(n9) );
  OR2X2 U489 ( .A(n216), .B(n221), .Y(n518) );
  AND2X2 U490 ( .A(n222), .B(n228), .Y(n519) );
  OR2X2 U491 ( .A(n247), .B(n257), .Y(n520) );
  OR2X2 U492 ( .A(n166), .B(n168), .Y(n521) );
  OR2X2 U493 ( .A(n241), .B(n244), .Y(n522) );
  OR2XL U495 ( .A(n222), .B(n228), .Y(n524) );
  OR2X2 U496 ( .A(n173), .B(n169), .Y(n525) );
  OR2X2 U497 ( .A(n160), .B(n159), .Y(n526) );
  AOI21XL U498 ( .A0(n83), .A1(n70), .B0(n71), .Y(n69) );
  CMPR42X1 U500 ( .A(n266), .B(n196), .C(n276), .D(n307), .ICI(n193), .S(n189), 
        .ICO(n187), .CO(n188) );
  INVX1 U502 ( .A(n82), .Y(n528) );
  XNOR2XL U507 ( .A(n447), .B(n412), .Y(n360) );
  XNOR2XL U508 ( .A(n447), .B(n411), .Y(n359) );
  NAND2BXL U509 ( .AN(n1), .B(n447), .Y(n369) );
  NAND2X4 U510 ( .A(n436), .B(n424), .Y(n430) );
  XNOR2X4 U511 ( .A(n449), .B(a[4]), .Y(n436) );
  OAI22XL U513 ( .A0(n431), .A1(n386), .B0(n385), .B1(n437), .Y(n309) );
  OAI22XL U514 ( .A0(n429), .A1(n364), .B0(n363), .B1(n435), .Y(n289) );
  OAI22XL U515 ( .A0(n431), .A1(n391), .B0(n390), .B1(n437), .Y(n314) );
  OAI22XL U516 ( .A0(n432), .A1(n403), .B0(n402), .B1(n462), .Y(n326) );
  OAI22XL U517 ( .A0(n430), .A1(n442), .B0(n436), .B1(n382), .Y(n256) );
  NAND2BXL U518 ( .AN(n1), .B(n448), .Y(n382) );
  OAI22XL U519 ( .A0(n432), .A1(n399), .B0(n398), .B1(n462), .Y(n322) );
  OAI22XL U520 ( .A0(n428), .A1(n440), .B0(n434), .B1(n356), .Y(n254) );
  INVXL U521 ( .A(n446), .Y(n440) );
  OAI22XL U522 ( .A0(n430), .A1(n377), .B0(n376), .B1(n436), .Y(n301) );
  OAI22XL U523 ( .A0(n428), .A1(n355), .B0(n354), .B1(n434), .Y(n281) );
  OAI22XL U524 ( .A0(n429), .A1(n366), .B0(n365), .B1(n435), .Y(n291) );
  OAI22XL U525 ( .A0(n432), .A1(n397), .B0(n396), .B1(n462), .Y(n320) );
  INVXL U527 ( .A(n445), .Y(n439) );
  OAI22XL U528 ( .A0(n431), .A1(n385), .B0(n384), .B1(n437), .Y(n308) );
  OAI22XL U529 ( .A0(n429), .A1(n363), .B0(n362), .B1(n435), .Y(n288) );
  ADDFX2 U530 ( .A(n264), .B(n182), .CI(n295), .CO(n175), .S(n176) );
  OAI22XL U532 ( .A0(n427), .A1(n337), .B0(n433), .B1(n336), .Y(n264) );
  OAI22XL U534 ( .A0(n429), .A1(n360), .B0(n359), .B1(n435), .Y(n285) );
  OAI22XL U535 ( .A0(n428), .A1(n349), .B0(n348), .B1(n434), .Y(n275) );
  OAI22XL U536 ( .A0(n427), .A1(n338), .B0(n433), .B1(n337), .Y(n265) );
  OAI22XL U537 ( .A0(n428), .A1(n351), .B0(n350), .B1(n434), .Y(n277) );
  OAI22X1 U538 ( .A0(n431), .A1(n384), .B0(n383), .B1(n437), .Y(n196) );
  OAI22XL U539 ( .A0(n432), .A1(n402), .B0(n401), .B1(n462), .Y(n325) );
  NOR2BXL U540 ( .AN(n1), .B(n435), .Y(n294) );
  OAI22XL U541 ( .A0(n430), .A1(n380), .B0(n379), .B1(n436), .Y(n304) );
  OAI22XL U542 ( .A0(n432), .A1(n401), .B0(n400), .B1(n462), .Y(n324) );
  OAI22XL U543 ( .A0(n429), .A1(n441), .B0(n435), .B1(n369), .Y(n255) );
  NOR2BXL U544 ( .AN(n1), .B(n433), .Y(n270) );
  OAI22XL U545 ( .A0(n429), .A1(n365), .B0(n364), .B1(n435), .Y(n290) );
  OAI22XL U546 ( .A0(n428), .A1(n354), .B0(n353), .B1(n434), .Y(n280) );
  OAI22XL U547 ( .A0(n427), .A1(n341), .B0(n433), .B1(n340), .Y(n268) );
  XNOR2X1 U548 ( .A(n298), .B(n278), .Y(n205) );
  OAI22XL U549 ( .A0(n427), .A1(n336), .B0(n433), .B1(n335), .Y(n263) );
  INVXL U550 ( .A(n170), .Y(n171) );
  OAI22XL U551 ( .A0(n428), .A1(n347), .B0(n346), .B1(n434), .Y(n273) );
  OAI22X1 U552 ( .A0(n431), .A1(n443), .B0(n437), .B1(n395), .Y(n257) );
  INVXL U553 ( .A(n449), .Y(n443) );
  NAND2BXL U554 ( .AN(n1), .B(n449), .Y(n395) );
  OAI22X1 U555 ( .A0(n432), .A1(n406), .B0(n405), .B1(n462), .Y(n329) );
  OAI22XL U556 ( .A0(n432), .A1(n444), .B0(n408), .B1(n462), .Y(n258) );
  OAI22XL U557 ( .A0(n432), .A1(n407), .B0(n406), .B1(n462), .Y(n330) );
  NAND2BXL U558 ( .AN(n1), .B(n450), .Y(n408) );
  OAI22XL U559 ( .A0(n432), .A1(n404), .B0(n403), .B1(n462), .Y(n327) );
  NOR2BXL U560 ( .AN(n1), .B(n436), .Y(n306) );
  OAI22XL U561 ( .A0(n431), .A1(n393), .B0(n392), .B1(n437), .Y(n316) );
  OAI22XL U562 ( .A0(n432), .A1(n405), .B0(n404), .B1(n462), .Y(n328) );
  OAI22XL U563 ( .A0(n431), .A1(n394), .B0(n393), .B1(n437), .Y(n317) );
  XNOR2X1 U564 ( .A(n449), .B(n1), .Y(n394) );
  OAI22XL U565 ( .A0(n430), .A1(n381), .B0(n380), .B1(n436), .Y(n305) );
  OAI22XL U566 ( .A0(n431), .A1(n392), .B0(n391), .B1(n437), .Y(n315) );
  XNOR2X1 U567 ( .A(n448), .B(n1), .Y(n381) );
  OAI22XL U568 ( .A0(n430), .A1(n379), .B0(n378), .B1(n436), .Y(n303) );
  OAI22XL U569 ( .A0(n429), .A1(n368), .B0(n367), .B1(n435), .Y(n293) );
  OAI22XL U570 ( .A0(n431), .A1(n390), .B0(n389), .B1(n437), .Y(n313) );
  OAI22XL U571 ( .A0(n428), .A1(n350), .B0(n349), .B1(n434), .Y(n276) );
  OAI22XL U572 ( .A0(n429), .A1(n358), .B0(n357), .B1(n435), .Y(n170) );
  OAI22XL U573 ( .A0(n430), .A1(n375), .B0(n374), .B1(n436), .Y(n299) );
  OAI22XL U574 ( .A0(n428), .A1(n353), .B0(n352), .B1(n434), .Y(n279) );
  OAI22XL U575 ( .A0(n427), .A1(n340), .B0(n433), .B1(n339), .Y(n267) );
  OAI22XL U576 ( .A0(n429), .A1(n362), .B0(n361), .B1(n435), .Y(n287) );
  OAI22XL U577 ( .A0(n428), .A1(n348), .B0(n347), .B1(n434), .Y(n274) );
  OAI22XL U578 ( .A0(n429), .A1(n359), .B0(n358), .B1(n435), .Y(n284) );
  CMPR42X1 U579 ( .A(n170), .B(n262), .C(n272), .D(n283), .ICI(n167), .S(n166), 
        .ICO(n164), .CO(n165) );
  OAI22XL U580 ( .A0(n428), .A1(n346), .B0(n345), .B1(n434), .Y(n272) );
  OAI22XL U581 ( .A0(n427), .A1(n335), .B0(n433), .B1(n334), .Y(n262) );
  ADDFX2 U582 ( .A(n261), .B(n163), .CI(n164), .CO(n160), .S(n161) );
  OAI22XL U583 ( .A0(n427), .A1(n334), .B0(n433), .B1(n333), .Y(n261) );
  INVX1 U584 ( .A(n162), .Y(n163) );
  OAI22XL U585 ( .A0(n428), .A1(n345), .B0(n344), .B1(n434), .Y(n162) );
  INVX1 U586 ( .A(n448), .Y(n442) );
  NOR2BX1 U587 ( .AN(n1), .B(n437), .Y(n318) );
  XNOR2X1 U588 ( .A(n450), .B(n419), .Y(n406) );
  XNOR2X1 U589 ( .A(n450), .B(n1), .Y(n407) );
  INVX1 U590 ( .A(n450), .Y(n444) );
  XNOR2X1 U591 ( .A(n450), .B(n416), .Y(n403) );
  XNOR2X1 U592 ( .A(n450), .B(n418), .Y(n405) );
  XNOR2X1 U593 ( .A(n449), .B(n419), .Y(n393) );
  XNOR2X1 U594 ( .A(n450), .B(n417), .Y(n404) );
  XNOR2X1 U595 ( .A(n449), .B(n409), .Y(n383) );
  XNOR2X1 U596 ( .A(n450), .B(n415), .Y(n402) );
  XNOR2X1 U597 ( .A(n449), .B(n417), .Y(n391) );
  XNOR2X1 U598 ( .A(n449), .B(n418), .Y(n392) );
  XNOR2X1 U599 ( .A(n448), .B(n419), .Y(n380) );
  NOR2X1 U600 ( .A(n329), .B(n318), .Y(n132) );
  XNOR2X1 U602 ( .A(n450), .B(n414), .Y(n401) );
  XNOR2X1 U603 ( .A(n447), .B(n1), .Y(n368) );
  XNOR2X1 U604 ( .A(n449), .B(n416), .Y(n390) );
  XNOR2X1 U605 ( .A(n448), .B(n418), .Y(n379) );
  NAND2BX1 U606 ( .AN(n1), .B(n446), .Y(n356) );
  XNOR2X1 U607 ( .A(n446), .B(n1), .Y(n355) );
  XNOR2X1 U608 ( .A(n447), .B(n418), .Y(n366) );
  XNOR2X1 U609 ( .A(n450), .B(n412), .Y(n399) );
  XNOR2X1 U610 ( .A(n450), .B(n413), .Y(n400) );
  XNOR2X1 U611 ( .A(n447), .B(n419), .Y(n367) );
  XNOR2X1 U612 ( .A(n446), .B(n419), .Y(n354) );
  XNOR2X1 U613 ( .A(n447), .B(n417), .Y(n365) );
  XNOR2X1 U614 ( .A(n446), .B(n416), .Y(n351) );
  XNOR2X1 U615 ( .A(n447), .B(n416), .Y(n364) );
  XNOR2X1 U616 ( .A(n445), .B(n1), .Y(n342) );
  XNOR2X1 U617 ( .A(n450), .B(n409), .Y(n396) );
  NAND2BX1 U618 ( .AN(n1), .B(n445), .Y(n343) );
  XNOR2X1 U619 ( .A(n447), .B(n415), .Y(n363) );
  XNOR2X1 U620 ( .A(n449), .B(n411), .Y(n385) );
  XNOR2X1 U621 ( .A(n449), .B(n410), .Y(n384) );
  XNOR2X1 U622 ( .A(n448), .B(n412), .Y(n373) );
  XNOR2X1 U623 ( .A(n446), .B(n415), .Y(n350) );
  XNOR2X1 U625 ( .A(n448), .B(n409), .Y(n370) );
  XNOR2X1 U626 ( .A(n445), .B(n416), .Y(n338) );
  XNOR2X1 U627 ( .A(n445), .B(n415), .Y(n337) );
  XNOR2X1 U628 ( .A(n446), .B(n414), .Y(n349) );
  XNOR2X1 U629 ( .A(n447), .B(n409), .Y(n357) );
  NOR2X1 U631 ( .A(n245), .B(n246), .Y(n124) );
  XNOR2X1 U632 ( .A(n448), .B(n416), .Y(n377) );
  XNOR2X1 U633 ( .A(n449), .B(n415), .Y(n389) );
  XNOR2X1 U634 ( .A(n448), .B(n417), .Y(n378) );
  XNOR2X1 U635 ( .A(n449), .B(n414), .Y(n388) );
  XNOR2X1 U636 ( .A(n448), .B(n415), .Y(n376) );
  XNOR2X1 U637 ( .A(n449), .B(n413), .Y(n387) );
  XNOR2X1 U638 ( .A(n450), .B(n410), .Y(n397) );
  XNOR2X1 U639 ( .A(n450), .B(n411), .Y(n398) );
  XOR2X1 U640 ( .A(n450), .B(a[0]), .Y(n426) );
  CLKINVX3 U641 ( .A(a[0]), .Y(n462) );
  XNOR2X1 U642 ( .A(n449), .B(n412), .Y(n386) );
  XOR2X1 U643 ( .A(n449), .B(a[2]), .Y(n425) );
  XNOR2X1 U644 ( .A(n446), .B(n418), .Y(n353) );
  XNOR2X1 U645 ( .A(n448), .B(n414), .Y(n375) );
  XNOR2X1 U646 ( .A(n446), .B(n417), .Y(n352) );
  XNOR2X1 U647 ( .A(n448), .B(n413), .Y(n374) );
  XNOR2X1 U648 ( .A(n445), .B(n419), .Y(n341) );
  OAI22X1 U649 ( .A0(n430), .A1(n374), .B0(n373), .B1(n436), .Y(n298) );
  XNOR2X1 U650 ( .A(n447), .B(n414), .Y(n362) );
  XNOR2X1 U651 ( .A(n445), .B(n417), .Y(n339) );
  XNOR2X1 U652 ( .A(n445), .B(n418), .Y(n340) );
  XNOR2X1 U653 ( .A(n448), .B(n410), .Y(n371) );
  XOR2X1 U654 ( .A(n448), .B(a[4]), .Y(n424) );
  XNOR2X1 U655 ( .A(n448), .B(n411), .Y(n372) );
  XNOR2X1 U656 ( .A(n447), .B(n413), .Y(n361) );
  CMPR42X1 U657 ( .A(n277), .B(n297), .C(n197), .D(n204), .ICI(n201), .S(n195), 
        .ICO(n193), .CO(n194) );
  OR2X2 U658 ( .A(n298), .B(n278), .Y(n204) );
  OAI22X1 U659 ( .A0(n430), .A1(n373), .B0(n372), .B1(n436), .Y(n297) );
  OAI22X1 U660 ( .A0(n430), .A1(n371), .B0(n370), .B1(n436), .Y(n182) );
  XNOR2X1 U661 ( .A(n445), .B(n414), .Y(n336) );
  XNOR2X1 U662 ( .A(n447), .B(n410), .Y(n358) );
  XNOR2X1 U663 ( .A(n446), .B(n412), .Y(n347) );
  XNOR2X1 U664 ( .A(n446), .B(n413), .Y(n348) );
  XNOR2X1 U665 ( .A(n446), .B(n411), .Y(n346) );
  XNOR2X1 U666 ( .A(n445), .B(n413), .Y(n335) );
  XOR2X1 U667 ( .A(n447), .B(a[6]), .Y(n423) );
  XNOR2X1 U668 ( .A(n445), .B(n412), .Y(n334) );
  XNOR2X1 U669 ( .A(n446), .B(n410), .Y(n345) );
  NAND2X1 U670 ( .A(n229), .B(n233), .Y(n110) );
  NAND2X1 U671 ( .A(n234), .B(n238), .Y(n113) );
  NOR2X1 U672 ( .A(n229), .B(n233), .Y(n109) );
  NOR2X1 U673 ( .A(n234), .B(n238), .Y(n112) );
  NOR2X1 U674 ( .A(n239), .B(n240), .Y(n116) );
  NAND2X1 U675 ( .A(n239), .B(n240), .Y(n117) );
  CMPR42X1 U676 ( .A(n312), .B(n302), .C(n235), .D(n232), .ICI(n231), .S(n229), 
        .ICO(n227), .CO(n228) );
  OAI22X1 U677 ( .A0(n431), .A1(n389), .B0(n388), .B1(n437), .Y(n312) );
  CMPR42X1 U678 ( .A(n311), .B(n226), .C(n230), .D(n224), .ICI(n227), .S(n222), 
        .ICO(n220), .CO(n221) );
  OAI22X1 U679 ( .A0(n431), .A1(n388), .B0(n387), .B1(n437), .Y(n311) );
  CMPR42X1 U680 ( .A(n321), .B(n300), .C(n310), .D(n220), .ICI(n219), .S(n216), 
        .ICO(n214), .CO(n215) );
  OAI22X1 U681 ( .A0(n432), .A1(n398), .B0(n397), .B1(n462), .Y(n321) );
  OAI22X1 U682 ( .A0(n431), .A1(n387), .B0(n386), .B1(n437), .Y(n310) );
  OAI22X1 U683 ( .A0(n430), .A1(n376), .B0(n375), .B1(n436), .Y(n300) );
  NAND2X1 U684 ( .A(n518), .B(n524), .Y(n94) );
  AOI21X1 U685 ( .A0(n518), .A1(n519), .B0(n97), .Y(n95) );
  INVX1 U686 ( .A(n99), .Y(n97) );
  NOR2X1 U687 ( .A(n192), .B(n199), .Y(n81) );
  CMPR42X1 U688 ( .A(n296), .B(n286), .C(n190), .D(n194), .ICI(n189), .S(n186), 
        .ICO(n184), .CO(n185) );
  OAI22X1 U689 ( .A0(n429), .A1(n361), .B0(n360), .B1(n435), .Y(n286) );
  OAI22X1 U690 ( .A0(n430), .A1(n372), .B0(n371), .B1(n436), .Y(n296) );
  CMPR42X1 U691 ( .A(n183), .B(n187), .C(n181), .D(n188), .ICI(n184), .S(n179), 
        .ICO(n177), .CO(n178) );
  INVX1 U692 ( .A(n182), .Y(n183) );
  AOI21X1 U693 ( .A0(n52), .A1(n521), .B0(n47), .Y(n45) );
  INVX1 U694 ( .A(n49), .Y(n47) );
  NAND2X1 U695 ( .A(n525), .B(n521), .Y(n44) );
  XNOR2X1 U696 ( .A(n446), .B(n409), .Y(n344) );
  XNOR2X1 U697 ( .A(n445), .B(n411), .Y(n333) );
  XOR2X1 U698 ( .A(n446), .B(a[8]), .Y(n422) );
  XOR2X1 U699 ( .A(n445), .B(a[10]), .Y(n421) );
  XNOR2X1 U700 ( .A(n445), .B(n410), .Y(n332) );
  OAI21XL U701 ( .A0(n68), .A1(n60), .B0(n61), .Y(n59) );
  NOR2X1 U703 ( .A(n87), .B(n90), .Y(n85) );
  OAI21XL U704 ( .A0(n87), .A1(n91), .B0(n88), .Y(n86) );
  NAND2X1 U705 ( .A(n216), .B(n221), .Y(n99) );
  OAI21XL U706 ( .A0(n118), .A1(n116), .B0(n117), .Y(n115) );
  NOR2X1 U707 ( .A(n109), .B(n112), .Y(n107) );
  OAI21XL U708 ( .A0(n109), .A1(n113), .B0(n110), .Y(n108) );
  NAND2X1 U711 ( .A(n208), .B(n215), .Y(n91) );
  NAND2X1 U712 ( .A(n200), .B(n207), .Y(n88) );
  NAND2X1 U713 ( .A(n192), .B(n199), .Y(n82) );
  NOR2X1 U714 ( .A(n186), .B(n191), .Y(n76) );
  INVX1 U715 ( .A(n81), .Y(n79) );
  NAND2X1 U716 ( .A(n186), .B(n191), .Y(n77) );
  NOR2X1 U717 ( .A(n76), .B(n81), .Y(n70) );
  NAND2X1 U718 ( .A(n179), .B(n185), .Y(n68) );
  NOR2X1 U719 ( .A(n178), .B(n174), .Y(n60) );
  OAI21XL U720 ( .A0(n73), .A1(n65), .B0(n68), .Y(n64) );
  INVX1 U721 ( .A(n71), .Y(n73) );
  NAND2X1 U722 ( .A(n178), .B(n174), .Y(n61) );
  NAND2X1 U723 ( .A(n173), .B(n169), .Y(n54) );
  NAND2X1 U724 ( .A(n166), .B(n168), .Y(n49) );
  INVX1 U725 ( .A(n54), .Y(n52) );
  NOR2X1 U726 ( .A(n165), .B(n161), .Y(n39) );
  INVX1 U727 ( .A(n45), .Y(n43) );
  NAND2X1 U729 ( .A(n165), .B(n161), .Y(n40) );
  OAI21XL U730 ( .A0(n45), .A1(n39), .B0(n40), .Y(n38) );
  NOR2X1 U731 ( .A(n44), .B(n39), .Y(n37) );
  ADDFX2 U732 ( .A(n162), .B(n260), .CI(n271), .CO(n158), .S(n159) );
  XNOR2X1 U735 ( .A(n445), .B(n409), .Y(n331) );
  NOR2X1 U736 ( .A(n65), .B(n60), .Y(n58) );
  XOR2X1 U737 ( .A(n100), .B(n15), .Y(product[10]) );
  AOI21X1 U738 ( .A0(n105), .A1(n524), .B0(n519), .Y(n100) );
  INVX1 U739 ( .A(n106), .Y(n105) );
  XOR2X1 U740 ( .A(n92), .B(n14), .Y(product[11]) );
  XNOR2X1 U741 ( .A(n89), .B(n13), .Y(product[12]) );
  XNOR2X1 U742 ( .A(n83), .B(n12), .Y(product[13]) );
  NAND2X1 U743 ( .A(n79), .B(n82), .Y(n12) );
  XOR2X1 U744 ( .A(n78), .B(n11), .Y(product[14]) );
  AOI21X1 U746 ( .A0(n83), .A1(n79), .B0(n528), .Y(n78) );
  XOR2X1 U747 ( .A(n69), .B(n10), .Y(product[15]) );
  XOR2X1 U748 ( .A(n62), .B(n9), .Y(product[16]) );
  XNOR2X1 U749 ( .A(n3), .B(n8), .Y(product[17]) );
  NAND2X1 U750 ( .A(n525), .B(n54), .Y(n8) );
  XOR2X1 U751 ( .A(n50), .B(n7), .Y(product[18]) );
  NAND2X1 U752 ( .A(n521), .B(n49), .Y(n7) );
  AOI21X1 U753 ( .A0(n3), .A1(n525), .B0(n52), .Y(n50) );
  XOR2X1 U754 ( .A(n41), .B(n6), .Y(product[19]) );
  XOR2X1 U756 ( .A(n36), .B(n5), .Y(product[20]) );
  AOI21X1 U757 ( .A0(n3), .A1(n37), .B0(n38), .Y(n36) );
  XOR2X1 U758 ( .A(n27), .B(n4), .Y(product[21]) );
  NAND2X4 U454 ( .A(n435), .B(n423), .Y(n429) );
  OAI21X2 U456 ( .A0(n56), .A1(n84), .B0(n57), .Y(n3) );
  NOR2X1 U458 ( .A(n179), .B(n185), .Y(n65) );
  NAND2X1 U466 ( .A(n70), .B(n58), .Y(n56) );
  AOI21X1 U480 ( .A0(n436), .A1(n430), .B0(n370), .Y(n529) );
  INVX1 U494 ( .A(n529), .Y(n295) );
  NAND2BX1 U499 ( .AN(n76), .B(n77), .Y(n11) );
  AOI31X1 U501 ( .A0(n3), .A1(n37), .A2(n526), .B0(n29), .Y(n27) );
  AOI21X1 U503 ( .A0(n437), .A1(n431), .B0(n383), .Y(n530) );
  INVX1 U504 ( .A(n530), .Y(n307) );
  AOI31X1 U505 ( .A0(n3), .A1(n525), .A2(n521), .B0(n43), .Y(n41) );
  OAI2BB2X1 U506 ( .B0(n132), .B1(n135), .A0N(n329), .A1N(n318), .Y(n131) );
  AOI21X1 U531 ( .A0(n434), .A1(n428), .B0(n344), .Y(n531) );
  INVX1 U533 ( .A(n531), .Y(n271) );
  AOI31X1 U601 ( .A0(n532), .A1(n83), .A2(n70), .B0(n64), .Y(n62) );
  INVX1 U624 ( .A(n65), .Y(n532) );
  NAND2X4 U630 ( .A(n437), .B(n425), .Y(n431) );
  ADDHXL U709 ( .A(n322), .B(n254), .CO(n225), .S(n226) );
  CMPR42X1 U710 ( .A(n270), .B(n280), .C(n290), .D(n225), .ICI(n223), .S(n219), 
        .ICO(n217), .CO(n218) );
  ADDFX2 U733 ( .A(n265), .B(n275), .CI(n285), .CO(n180), .S(n181) );
  CMPR42X1 U734 ( .A(n299), .B(n279), .C(n213), .D(n218), .ICI(n211), .S(n208), 
        .ICO(n206), .CO(n207) );
  CMPR42X1 U745 ( .A(n287), .B(n267), .C(n198), .D(n202), .ICI(n195), .S(n192), 
        .ICO(n190), .CO(n191) );
  AOI21X1 U755 ( .A0(n107), .A1(n115), .B0(n108), .Y(n106) );
  NOR2X1 U759 ( .A(n200), .B(n207), .Y(n87) );
  NOR2X1 U760 ( .A(n208), .B(n215), .Y(n90) );
  INVX1 U761 ( .A(n84), .Y(n83) );
  AOI21X2 U438 ( .A0(n85), .A1(n93), .B0(n86), .Y(n84) );
  NAND2X4 U457 ( .A(n426), .B(n462), .Y(n432) );
  OAI22X2 U463 ( .A0(n427), .A1(n342), .B0(n433), .B1(n341), .Y(n269) );
  OAI22X2 U467 ( .A0(n427), .A1(n439), .B0(n433), .B1(n343), .Y(n253) );
  OAI22XL U512 ( .A0(n427), .A1(n339), .B0(n433), .B1(n338), .Y(n266) );
  XNOR2X4 U526 ( .A(n446), .B(a[10]), .Y(n433) );
  CMPR42X1 U702 ( .A(n288), .B(n308), .C(n319), .D(n209), .ICI(n206), .S(n203), 
        .ICO(n201), .CO(n202) );
  AOI21X2 U728 ( .A0(n71), .A1(n58), .B0(n59), .Y(n57) );
  OAI21XL U762 ( .A0(n106), .A1(n94), .B0(n95), .Y(n93) );
  CMPR42X1 U763 ( .A(n268), .B(n212), .C(n205), .D(n210), .ICI(n203), .S(n200), 
        .ICO(n198), .CO(n199) );
endmodule


module multiply_WIDTH12_0_DW_mult_tc_9 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n27,
         n29, n36, n37, n38, n39, n40, n41, n43, n44, n45, n47, n49, n50, n52,
         n54, n56, n57, n58, n59, n60, n61, n62, n64, n65, n68, n69, n70, n71,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n97, n99, n100, n105, n106, n107, n108,
         n109, n110, n112, n113, n115, n116, n117, n118, n123, n124, n126,
         n131, n132, n135, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n253, n254, n255, n256, n257, n258,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n462, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n525, n526, n527, n528, n529, n530, n532;
  assign n1 = b[0];
  assign n409 = b[11];
  assign n410 = b[10];
  assign n411 = b[9];
  assign n412 = b[8];
  assign n413 = b[7];
  assign n414 = b[6];
  assign n415 = b[5];
  assign n416 = b[4];
  assign n417 = b[3];
  assign n418 = b[2];
  assign n419 = b[1];
  assign n445 = a[11];
  assign n446 = a[9];
  assign n447 = a[7];
  assign n448 = a[5];
  assign n449 = a[3];
  assign n450 = a[1];

  CMPR42X2 U195 ( .A(n268), .B(n212), .C(n205), .D(n210), .ICI(n203), .S(n200), 
        .ICO(n198), .CO(n199) );
  XNOR2X4 U419 ( .A(n532), .B(a[10]), .Y(n433) );
  XNOR2X4 U422 ( .A(n447), .B(a[8]), .Y(n434) );
  XNOR2X4 U425 ( .A(n448), .B(a[6]), .Y(n435) );
  XNOR2X4 U431 ( .A(n450), .B(a[2]), .Y(n437) );
  ADDHXL U437 ( .A(n326), .B(n256), .CO(n242), .S(n243) );
  ADDHXL U438 ( .A(n322), .B(n254), .CO(n225), .S(n226) );
  ADDFX2 U439 ( .A(n291), .B(n281), .CI(n301), .CO(n223), .S(n224) );
  ADDFX2 U440 ( .A(n265), .B(n275), .CI(n285), .CO(n180), .S(n181) );
  CMPR42X1 U441 ( .A(n294), .B(n325), .C(n314), .D(n304), .ICI(n242), .S(n239), 
        .ICO(n237), .CO(n238) );
  ADDHXL U442 ( .A(n324), .B(n255), .CO(n235), .S(n236) );
  CMPR42X1 U443 ( .A(n270), .B(n280), .C(n290), .D(n225), .ICI(n223), .S(n219), 
        .ICO(n217), .CO(n218) );
  CMPR42X1 U444 ( .A(n273), .B(n263), .C(n171), .D(n175), .ICI(n172), .S(n169), 
        .ICO(n167), .CO(n168) );
  ADDHXL U445 ( .A(n328), .B(n317), .CO(n246), .S(n247) );
  ADDFX2 U446 ( .A(n306), .B(n327), .CI(n316), .CO(n244), .S(n245) );
  ADDFX2 U447 ( .A(n315), .B(n305), .CI(n243), .CO(n240), .S(n241) );
  CMPR42X1 U448 ( .A(n313), .B(n293), .C(n303), .D(n236), .ICI(n237), .S(n234), 
        .ICO(n232), .CO(n233) );
  ADDFX2 U449 ( .A(n282), .B(n323), .CI(n292), .CO(n230), .S(n231) );
  NOR2BX1 U450 ( .AN(n1), .B(n434), .Y(n282) );
  OAI22X1 U451 ( .A0(n429), .A1(n367), .B0(n366), .B1(n435), .Y(n292) );
  OAI22X1 U452 ( .A0(n428), .A1(n352), .B0(n351), .B1(n434), .Y(n278) );
  ADDHXL U453 ( .A(n320), .B(n253), .CO(n212), .S(n213) );
  CMPR42X1 U454 ( .A(n289), .B(n269), .C(n309), .D(n214), .ICI(n217), .S(n211), 
        .ICO(n209), .CO(n210) );
  CMPR42X1 U455 ( .A(n266), .B(n196), .C(n276), .D(n307), .ICI(n193), .S(n189), 
        .ICO(n187), .CO(n188) );
  CMPR42X1 U456 ( .A(n284), .B(n274), .C(n180), .D(n176), .ICI(n177), .S(n174), 
        .ICO(n172), .CO(n173) );
  NOR2X1 U457 ( .A(n208), .B(n215), .Y(n90) );
  OAI22X1 U458 ( .A0(n432), .A1(n400), .B0(n399), .B1(n462), .Y(n323) );
  AOI21X1 U459 ( .A0(n462), .A1(n432), .B0(n396), .Y(n514) );
  INVX1 U460 ( .A(n514), .Y(n319) );
  AOI21X1 U461 ( .A0(n436), .A1(n430), .B0(n370), .Y(n515) );
  INVX1 U462 ( .A(n515), .Y(n295) );
  NAND2X1 U463 ( .A(n330), .B(n258), .Y(n135) );
  AOI21X1 U464 ( .A0(n435), .A1(n429), .B0(n357), .Y(n516) );
  INVX1 U465 ( .A(n516), .Y(n283) );
  INVX1 U468 ( .A(n517), .Y(n307) );
  AOI21X1 U469 ( .A0(n107), .A1(n115), .B0(n108), .Y(n106) );
  OAI22X1 U470 ( .A0(n427), .A1(n339), .B0(n433), .B1(n338), .Y(n266) );
  AOI21X1 U471 ( .A0(n3), .A1(n527), .B0(n52), .Y(n50) );
  XNOR2X1 U472 ( .A(n160), .B(n159), .Y(n5) );
  OAI22XL U473 ( .A0(n431), .A1(n388), .B0(n387), .B1(n437), .Y(n311) );
  NAND2BX1 U475 ( .AN(n39), .B(n40), .Y(n6) );
  AOI22X1 U476 ( .A0(n523), .A1(n131), .B0(n247), .B1(n257), .Y(n126) );
  OAI22XL U477 ( .A0(n430), .A1(n372), .B0(n371), .B1(n436), .Y(n296) );
  XOR2X1 U478 ( .A(n158), .B(n518), .Y(n4) );
  OAI22XL U479 ( .A0(n430), .A1(n376), .B0(n375), .B1(n436), .Y(n300) );
  NAND2BX1 U480 ( .AN(n60), .B(n61), .Y(n9) );
  OAI2BB2X1 U481 ( .B0(n126), .B1(n124), .A0N(n245), .A1N(n246), .Y(n123) );
  AOI21XL U483 ( .A0(n83), .A1(n70), .B0(n71), .Y(n69) );
  AOI22X1 U484 ( .A0(n525), .A1(n123), .B0(n241), .B1(n244), .Y(n118) );
  OAI22XL U485 ( .A0(n430), .A1(n378), .B0(n377), .B1(n436), .Y(n302) );
  OAI22XL U486 ( .A0(n427), .A1(n332), .B0(n433), .B1(n331), .Y(n518) );
  NAND2BXL U487 ( .AN(n76), .B(n77), .Y(n11) );
  NAND2BX1 U488 ( .AN(n87), .B(n88), .Y(n13) );
  OAI22XL U489 ( .A0(n431), .A1(n389), .B0(n388), .B1(n437), .Y(n312) );
  AOI22X1 U490 ( .A0(n38), .A1(n528), .B0(n160), .B1(n159), .Y(n519) );
  INVX1 U491 ( .A(n519), .Y(n29) );
  NAND2BX1 U492 ( .AN(n90), .B(n91), .Y(n14) );
  NAND2XL U493 ( .A(n79), .B(n82), .Y(n12) );
  OR2X2 U494 ( .A(n216), .B(n221), .Y(n520) );
  AND2X2 U495 ( .A(n222), .B(n228), .Y(n521) );
  OR2X2 U496 ( .A(n166), .B(n168), .Y(n522) );
  OR2X2 U497 ( .A(n247), .B(n257), .Y(n523) );
  OR2X2 U499 ( .A(n241), .B(n244), .Y(n525) );
  OR2X2 U500 ( .A(n222), .B(n228), .Y(n526) );
  OR2X2 U501 ( .A(n173), .B(n169), .Y(n527) );
  OR2X2 U502 ( .A(n160), .B(n159), .Y(n528) );
  OR2XL U503 ( .A(n179), .B(n185), .Y(n529) );
  NAND2X4 U507 ( .A(n436), .B(n424), .Y(n430) );
  XNOR2X4 U508 ( .A(n449), .B(a[4]), .Y(n436) );
  OAI22XL U512 ( .A0(n431), .A1(n386), .B0(n385), .B1(n437), .Y(n309) );
  OAI22XL U514 ( .A0(n429), .A1(n364), .B0(n363), .B1(n435), .Y(n289) );
  OAI22XL U515 ( .A0(n431), .A1(n391), .B0(n390), .B1(n437), .Y(n314) );
  OAI22XL U516 ( .A0(n432), .A1(n403), .B0(n402), .B1(n462), .Y(n326) );
  OAI22XL U517 ( .A0(n430), .A1(n442), .B0(n436), .B1(n382), .Y(n256) );
  NAND2BXL U518 ( .AN(n1), .B(n448), .Y(n382) );
  OAI22XL U519 ( .A0(n432), .A1(n399), .B0(n398), .B1(n462), .Y(n322) );
  INVXL U521 ( .A(n532), .Y(n440) );
  OAI22XL U522 ( .A0(n430), .A1(n377), .B0(n376), .B1(n436), .Y(n301) );
  OAI22XL U524 ( .A0(n429), .A1(n366), .B0(n365), .B1(n435), .Y(n291) );
  OAI22XL U525 ( .A0(n432), .A1(n397), .B0(n396), .B1(n462), .Y(n320) );
  OAI22X1 U526 ( .A0(n427), .A1(n439), .B0(n433), .B1(n343), .Y(n253) );
  INVXL U527 ( .A(n445), .Y(n439) );
  OAI22XL U528 ( .A0(n431), .A1(n385), .B0(n384), .B1(n437), .Y(n308) );
  OAI22XL U529 ( .A0(n429), .A1(n363), .B0(n362), .B1(n435), .Y(n288) );
  ADDFX2 U530 ( .A(n264), .B(n182), .CI(n295), .CO(n175), .S(n176) );
  OAI22XL U531 ( .A0(n427), .A1(n337), .B0(n433), .B1(n336), .Y(n264) );
  OAI22XL U532 ( .A0(n429), .A1(n360), .B0(n359), .B1(n435), .Y(n285) );
  OAI22XL U533 ( .A0(n428), .A1(n349), .B0(n348), .B1(n434), .Y(n275) );
  OAI22XL U534 ( .A0(n427), .A1(n338), .B0(n433), .B1(n337), .Y(n265) );
  OAI22XL U535 ( .A0(n428), .A1(n351), .B0(n350), .B1(n434), .Y(n277) );
  OAI22X1 U536 ( .A0(n431), .A1(n384), .B0(n383), .B1(n437), .Y(n196) );
  OAI22XL U537 ( .A0(n432), .A1(n402), .B0(n401), .B1(n462), .Y(n325) );
  NOR2BXL U538 ( .AN(n1), .B(n435), .Y(n294) );
  OAI22XL U539 ( .A0(n430), .A1(n380), .B0(n379), .B1(n436), .Y(n304) );
  OAI22XL U540 ( .A0(n432), .A1(n401), .B0(n400), .B1(n462), .Y(n324) );
  OAI22XL U541 ( .A0(n429), .A1(n441), .B0(n435), .B1(n369), .Y(n255) );
  INVXL U542 ( .A(n447), .Y(n441) );
  NOR2BXL U543 ( .AN(n1), .B(n433), .Y(n270) );
  OAI22XL U544 ( .A0(n429), .A1(n365), .B0(n364), .B1(n435), .Y(n290) );
  OAI22XL U546 ( .A0(n427), .A1(n341), .B0(n433), .B1(n340), .Y(n268) );
  XNOR2X1 U547 ( .A(n298), .B(n278), .Y(n205) );
  OAI22XL U548 ( .A0(n427), .A1(n336), .B0(n433), .B1(n335), .Y(n263) );
  INVXL U549 ( .A(n170), .Y(n171) );
  OAI22XL U550 ( .A0(n428), .A1(n347), .B0(n346), .B1(n434), .Y(n273) );
  INVXL U552 ( .A(n449), .Y(n443) );
  NAND2BXL U553 ( .AN(n1), .B(n449), .Y(n395) );
  OAI22X1 U554 ( .A0(n432), .A1(n406), .B0(n405), .B1(n462), .Y(n329) );
  OAI22XL U555 ( .A0(n432), .A1(n444), .B0(n408), .B1(n462), .Y(n258) );
  OAI22XL U556 ( .A0(n432), .A1(n407), .B0(n406), .B1(n462), .Y(n330) );
  NAND2BXL U557 ( .AN(n1), .B(n450), .Y(n408) );
  OAI22XL U558 ( .A0(n432), .A1(n404), .B0(n403), .B1(n462), .Y(n327) );
  NOR2BXL U559 ( .AN(n1), .B(n436), .Y(n306) );
  OAI22XL U560 ( .A0(n431), .A1(n393), .B0(n392), .B1(n437), .Y(n316) );
  OAI22XL U561 ( .A0(n432), .A1(n405), .B0(n404), .B1(n462), .Y(n328) );
  OAI22XL U562 ( .A0(n431), .A1(n394), .B0(n393), .B1(n437), .Y(n317) );
  XNOR2X1 U563 ( .A(n449), .B(n1), .Y(n394) );
  OAI22XL U564 ( .A0(n430), .A1(n381), .B0(n380), .B1(n436), .Y(n305) );
  OAI22XL U565 ( .A0(n431), .A1(n392), .B0(n391), .B1(n437), .Y(n315) );
  XNOR2X1 U566 ( .A(n448), .B(n1), .Y(n381) );
  OAI22XL U567 ( .A0(n430), .A1(n379), .B0(n378), .B1(n436), .Y(n303) );
  OAI22XL U568 ( .A0(n429), .A1(n368), .B0(n367), .B1(n435), .Y(n293) );
  OAI22XL U569 ( .A0(n431), .A1(n390), .B0(n389), .B1(n437), .Y(n313) );
  OAI22XL U570 ( .A0(n428), .A1(n350), .B0(n349), .B1(n434), .Y(n276) );
  OAI22XL U571 ( .A0(n429), .A1(n358), .B0(n357), .B1(n435), .Y(n170) );
  OAI22XL U572 ( .A0(n430), .A1(n375), .B0(n374), .B1(n436), .Y(n299) );
  OAI22XL U573 ( .A0(n428), .A1(n353), .B0(n352), .B1(n434), .Y(n279) );
  OAI22XL U574 ( .A0(n427), .A1(n340), .B0(n433), .B1(n339), .Y(n267) );
  OAI22XL U575 ( .A0(n429), .A1(n362), .B0(n361), .B1(n435), .Y(n287) );
  OAI22XL U576 ( .A0(n428), .A1(n348), .B0(n347), .B1(n434), .Y(n274) );
  OAI22XL U577 ( .A0(n429), .A1(n359), .B0(n358), .B1(n435), .Y(n284) );
  CMPR42X1 U578 ( .A(n170), .B(n262), .C(n272), .D(n283), .ICI(n167), .S(n166), 
        .ICO(n164), .CO(n165) );
  OAI22XL U579 ( .A0(n428), .A1(n346), .B0(n345), .B1(n434), .Y(n272) );
  OAI22XL U580 ( .A0(n427), .A1(n335), .B0(n433), .B1(n334), .Y(n262) );
  ADDFX2 U581 ( .A(n261), .B(n163), .CI(n164), .CO(n160), .S(n161) );
  OAI22XL U582 ( .A0(n427), .A1(n334), .B0(n433), .B1(n333), .Y(n261) );
  INVX1 U583 ( .A(n162), .Y(n163) );
  OAI22XL U584 ( .A0(n428), .A1(n345), .B0(n344), .B1(n434), .Y(n162) );
  INVX1 U585 ( .A(n448), .Y(n442) );
  NOR2BX1 U586 ( .AN(n1), .B(n437), .Y(n318) );
  XNOR2X1 U587 ( .A(n450), .B(n419), .Y(n406) );
  XNOR2X1 U588 ( .A(n450), .B(n1), .Y(n407) );
  INVX1 U589 ( .A(n450), .Y(n444) );
  XNOR2X1 U590 ( .A(n450), .B(n416), .Y(n403) );
  XNOR2X1 U591 ( .A(n450), .B(n418), .Y(n405) );
  XNOR2X1 U592 ( .A(n449), .B(n419), .Y(n393) );
  XNOR2X1 U593 ( .A(n450), .B(n417), .Y(n404) );
  XNOR2X1 U594 ( .A(n449), .B(n409), .Y(n383) );
  XNOR2X1 U595 ( .A(n450), .B(n415), .Y(n402) );
  XNOR2X1 U596 ( .A(n449), .B(n417), .Y(n391) );
  XNOR2X1 U597 ( .A(n449), .B(n418), .Y(n392) );
  XNOR2X1 U598 ( .A(n448), .B(n419), .Y(n380) );
  NOR2X1 U599 ( .A(n329), .B(n318), .Y(n132) );
  NAND2BX1 U601 ( .AN(n1), .B(n447), .Y(n369) );
  XNOR2X1 U602 ( .A(n450), .B(n414), .Y(n401) );
  XNOR2X1 U603 ( .A(n447), .B(n1), .Y(n368) );
  XNOR2X1 U604 ( .A(n449), .B(n416), .Y(n390) );
  XNOR2X1 U605 ( .A(n448), .B(n418), .Y(n379) );
  NAND2BX1 U606 ( .AN(n1), .B(n532), .Y(n356) );
  XNOR2X1 U607 ( .A(n532), .B(n1), .Y(n355) );
  XNOR2X1 U608 ( .A(n447), .B(n418), .Y(n366) );
  XNOR2X1 U609 ( .A(n450), .B(n412), .Y(n399) );
  XNOR2X1 U610 ( .A(n450), .B(n413), .Y(n400) );
  XNOR2X1 U611 ( .A(n447), .B(n419), .Y(n367) );
  XNOR2X1 U612 ( .A(n532), .B(n419), .Y(n354) );
  XNOR2X1 U613 ( .A(n447), .B(n417), .Y(n365) );
  XNOR2X1 U614 ( .A(n532), .B(n416), .Y(n351) );
  XNOR2X1 U615 ( .A(n447), .B(n416), .Y(n364) );
  XNOR2X1 U616 ( .A(n445), .B(n1), .Y(n342) );
  XNOR2X1 U617 ( .A(n450), .B(n409), .Y(n396) );
  NAND2BX1 U618 ( .AN(n1), .B(n445), .Y(n343) );
  XNOR2X1 U619 ( .A(n447), .B(n415), .Y(n363) );
  XNOR2X1 U620 ( .A(n449), .B(n411), .Y(n385) );
  XNOR2X1 U621 ( .A(n449), .B(n410), .Y(n384) );
  XNOR2X1 U622 ( .A(n448), .B(n412), .Y(n373) );
  XNOR2X1 U623 ( .A(n532), .B(n415), .Y(n350) );
  XNOR2X1 U624 ( .A(n448), .B(n409), .Y(n370) );
  XNOR2X1 U625 ( .A(n445), .B(n416), .Y(n338) );
  XNOR2X1 U626 ( .A(n445), .B(n415), .Y(n337) );
  XNOR2X1 U627 ( .A(n532), .B(n414), .Y(n349) );
  XNOR2X1 U628 ( .A(n447), .B(n409), .Y(n357) );
  NOR2X1 U630 ( .A(n245), .B(n246), .Y(n124) );
  XNOR2X1 U631 ( .A(n448), .B(n416), .Y(n377) );
  XNOR2X1 U632 ( .A(n449), .B(n415), .Y(n389) );
  XNOR2X1 U633 ( .A(n448), .B(n417), .Y(n378) );
  XNOR2X1 U634 ( .A(n449), .B(n414), .Y(n388) );
  XNOR2X1 U635 ( .A(n448), .B(n415), .Y(n376) );
  XNOR2X1 U636 ( .A(n449), .B(n413), .Y(n387) );
  XNOR2X1 U637 ( .A(n450), .B(n410), .Y(n397) );
  XNOR2X1 U638 ( .A(n450), .B(n411), .Y(n398) );
  XOR2X1 U639 ( .A(n450), .B(a[0]), .Y(n426) );
  CLKINVX3 U640 ( .A(a[0]), .Y(n462) );
  XNOR2X1 U641 ( .A(n449), .B(n412), .Y(n386) );
  XOR2X1 U642 ( .A(n449), .B(a[2]), .Y(n425) );
  XNOR2X1 U643 ( .A(n532), .B(n418), .Y(n353) );
  XNOR2X1 U644 ( .A(n448), .B(n414), .Y(n375) );
  XNOR2X1 U645 ( .A(n532), .B(n417), .Y(n352) );
  XNOR2X1 U646 ( .A(n448), .B(n413), .Y(n374) );
  XNOR2X1 U647 ( .A(n445), .B(n419), .Y(n341) );
  OAI22X1 U648 ( .A0(n430), .A1(n374), .B0(n373), .B1(n436), .Y(n298) );
  XNOR2X1 U649 ( .A(n447), .B(n414), .Y(n362) );
  XNOR2X1 U650 ( .A(n445), .B(n417), .Y(n339) );
  XNOR2X1 U651 ( .A(n445), .B(n418), .Y(n340) );
  XNOR2X1 U652 ( .A(n448), .B(n410), .Y(n371) );
  XOR2X1 U653 ( .A(n448), .B(a[4]), .Y(n424) );
  XNOR2X1 U654 ( .A(n448), .B(n411), .Y(n372) );
  XNOR2X1 U655 ( .A(n447), .B(n412), .Y(n360) );
  XNOR2X1 U656 ( .A(n447), .B(n413), .Y(n361) );
  CMPR42X1 U657 ( .A(n277), .B(n297), .C(n197), .D(n204), .ICI(n201), .S(n195), 
        .ICO(n193), .CO(n194) );
  OR2X2 U658 ( .A(n298), .B(n278), .Y(n204) );
  INVX1 U659 ( .A(n196), .Y(n197) );
  OAI22X1 U660 ( .A0(n430), .A1(n373), .B0(n372), .B1(n436), .Y(n297) );
  OAI22X1 U661 ( .A0(n430), .A1(n371), .B0(n370), .B1(n436), .Y(n182) );
  XNOR2X1 U662 ( .A(n445), .B(n414), .Y(n336) );
  XNOR2X1 U663 ( .A(n447), .B(n410), .Y(n358) );
  XNOR2X1 U664 ( .A(n532), .B(n412), .Y(n347) );
  XNOR2X1 U665 ( .A(n532), .B(n413), .Y(n348) );
  XNOR2X1 U666 ( .A(n447), .B(n411), .Y(n359) );
  XNOR2X1 U667 ( .A(n532), .B(n411), .Y(n346) );
  XNOR2X1 U668 ( .A(n445), .B(n413), .Y(n335) );
  XOR2X1 U669 ( .A(n447), .B(a[6]), .Y(n423) );
  XNOR2X1 U670 ( .A(n445), .B(n412), .Y(n334) );
  XNOR2X1 U671 ( .A(n532), .B(n410), .Y(n345) );
  NAND2X1 U672 ( .A(n229), .B(n233), .Y(n110) );
  NAND2X1 U673 ( .A(n234), .B(n238), .Y(n113) );
  NOR2X1 U674 ( .A(n229), .B(n233), .Y(n109) );
  NOR2X1 U675 ( .A(n234), .B(n238), .Y(n112) );
  NOR2X1 U676 ( .A(n239), .B(n240), .Y(n116) );
  NAND2X1 U677 ( .A(n239), .B(n240), .Y(n117) );
  CMPR42X1 U678 ( .A(n312), .B(n302), .C(n235), .D(n232), .ICI(n231), .S(n229), 
        .ICO(n227), .CO(n228) );
  CMPR42X1 U679 ( .A(n311), .B(n226), .C(n230), .D(n224), .ICI(n227), .S(n222), 
        .ICO(n220), .CO(n221) );
  CMPR42X1 U680 ( .A(n321), .B(n300), .C(n310), .D(n220), .ICI(n219), .S(n216), 
        .ICO(n214), .CO(n215) );
  OAI22X1 U681 ( .A0(n432), .A1(n398), .B0(n397), .B1(n462), .Y(n321) );
  NAND2X1 U682 ( .A(n520), .B(n526), .Y(n94) );
  AOI21X1 U683 ( .A0(n520), .A1(n521), .B0(n97), .Y(n95) );
  INVX1 U684 ( .A(n99), .Y(n97) );
  NOR2X1 U685 ( .A(n192), .B(n199), .Y(n81) );
  OAI22X1 U686 ( .A0(n429), .A1(n361), .B0(n360), .B1(n435), .Y(n286) );
  INVX1 U687 ( .A(n182), .Y(n183) );
  AOI21X1 U688 ( .A0(n52), .A1(n522), .B0(n47), .Y(n45) );
  INVX1 U689 ( .A(n49), .Y(n47) );
  NAND2X1 U690 ( .A(n527), .B(n522), .Y(n44) );
  XNOR2X1 U691 ( .A(n446), .B(n409), .Y(n344) );
  XNOR2X1 U692 ( .A(n445), .B(n411), .Y(n333) );
  XOR2X1 U693 ( .A(n532), .B(a[8]), .Y(n422) );
  XOR2X1 U694 ( .A(n445), .B(a[10]), .Y(n421) );
  XNOR2X1 U695 ( .A(n445), .B(n410), .Y(n332) );
  OAI21XL U696 ( .A0(n68), .A1(n60), .B0(n61), .Y(n59) );
  NOR2X1 U697 ( .A(n87), .B(n90), .Y(n85) );
  OAI21XL U698 ( .A0(n87), .A1(n91), .B0(n88), .Y(n86) );
  NAND2X1 U699 ( .A(n216), .B(n221), .Y(n99) );
  OAI21XL U700 ( .A0(n118), .A1(n116), .B0(n117), .Y(n115) );
  NOR2X1 U701 ( .A(n109), .B(n112), .Y(n107) );
  OAI21XL U702 ( .A0(n109), .A1(n113), .B0(n110), .Y(n108) );
  NAND2X1 U704 ( .A(n208), .B(n215), .Y(n91) );
  NAND2X1 U705 ( .A(n200), .B(n207), .Y(n88) );
  INVX1 U706 ( .A(n93), .Y(n92) );
  NAND2X1 U707 ( .A(n192), .B(n199), .Y(n82) );
  NOR2X1 U708 ( .A(n186), .B(n191), .Y(n76) );
  INVX1 U709 ( .A(n81), .Y(n79) );
  INVX1 U710 ( .A(n82), .Y(n80) );
  NAND2X1 U711 ( .A(n186), .B(n191), .Y(n77) );
  NOR2X1 U712 ( .A(n179), .B(n185), .Y(n65) );
  NOR2X1 U714 ( .A(n76), .B(n81), .Y(n70) );
  NAND2X1 U715 ( .A(n179), .B(n185), .Y(n68) );
  NOR2X1 U716 ( .A(n178), .B(n174), .Y(n60) );
  NAND2X1 U719 ( .A(n178), .B(n174), .Y(n61) );
  INVX1 U720 ( .A(n84), .Y(n83) );
  NAND2X1 U721 ( .A(n173), .B(n169), .Y(n54) );
  NAND2X1 U722 ( .A(n166), .B(n168), .Y(n49) );
  INVX1 U723 ( .A(n54), .Y(n52) );
  NOR2X1 U724 ( .A(n165), .B(n161), .Y(n39) );
  INVX1 U725 ( .A(n45), .Y(n43) );
  NAND2X1 U727 ( .A(n165), .B(n161), .Y(n40) );
  OAI21XL U728 ( .A0(n45), .A1(n39), .B0(n40), .Y(n38) );
  NOR2X1 U729 ( .A(n44), .B(n39), .Y(n37) );
  ADDFX2 U730 ( .A(n162), .B(n260), .CI(n271), .CO(n158), .S(n159) );
  OAI22X1 U732 ( .A0(n427), .A1(n333), .B0(n433), .B1(n332), .Y(n260) );
  XNOR2X1 U734 ( .A(n445), .B(n409), .Y(n331) );
  NOR2X1 U735 ( .A(n65), .B(n60), .Y(n58) );
  XOR2X1 U736 ( .A(n100), .B(n15), .Y(product[10]) );
  NAND2X1 U737 ( .A(n520), .B(n99), .Y(n15) );
  AOI21X1 U738 ( .A0(n105), .A1(n526), .B0(n521), .Y(n100) );
  INVX1 U739 ( .A(n106), .Y(n105) );
  XOR2X1 U740 ( .A(n92), .B(n14), .Y(product[11]) );
  XNOR2X1 U741 ( .A(n89), .B(n13), .Y(product[12]) );
  OAI21XL U742 ( .A0(n92), .A1(n90), .B0(n91), .Y(n89) );
  XNOR2X1 U743 ( .A(n83), .B(n12), .Y(product[13]) );
  XOR2X1 U744 ( .A(n78), .B(n11), .Y(product[14]) );
  AOI21X1 U745 ( .A0(n83), .A1(n79), .B0(n80), .Y(n78) );
  XOR2X1 U746 ( .A(n69), .B(n10), .Y(product[15]) );
  NAND2X1 U747 ( .A(n529), .B(n68), .Y(n10) );
  XOR2X1 U748 ( .A(n62), .B(n9), .Y(product[16]) );
  XNOR2X1 U750 ( .A(n3), .B(n8), .Y(product[17]) );
  NAND2X1 U751 ( .A(n527), .B(n54), .Y(n8) );
  XOR2X1 U752 ( .A(n50), .B(n7), .Y(product[18]) );
  NAND2X1 U753 ( .A(n522), .B(n49), .Y(n7) );
  XOR2X1 U754 ( .A(n41), .B(n6), .Y(product[19]) );
  XOR2X1 U756 ( .A(n36), .B(n5), .Y(product[20]) );
  AOI21X1 U757 ( .A0(n3), .A1(n37), .B0(n38), .Y(n36) );
  XOR2X1 U758 ( .A(n27), .B(n4), .Y(product[21]) );
  OAI22XL U466 ( .A0(n431), .A1(n443), .B0(n437), .B1(n395), .Y(n257) );
  AOI21XL U467 ( .A0(n437), .A1(n431), .B0(n383), .Y(n517) );
  BUFX4 U482 ( .A(n446), .Y(n532) );
  OAI22X1 U498 ( .A0(n428), .A1(n440), .B0(n434), .B1(n356), .Y(n254) );
  OAI22X1 U504 ( .A0(n428), .A1(n355), .B0(n354), .B1(n434), .Y(n281) );
  OAI22X1 U505 ( .A0(n428), .A1(n354), .B0(n353), .B1(n434), .Y(n280) );
  CMPR42X1 U509 ( .A(n287), .B(n267), .C(n198), .D(n202), .ICI(n195), .S(n192), 
        .ICO(n190), .CO(n191) );
  AOI21X2 U510 ( .A0(n85), .A1(n93), .B0(n86), .Y(n84) );
  CMPR42X1 U511 ( .A(n183), .B(n187), .C(n181), .D(n188), .ICI(n184), .S(n179), 
        .ICO(n177), .CO(n178) );
  OAI21X1 U513 ( .A0(n106), .A1(n94), .B0(n95), .Y(n93) );
  AOI31X1 U520 ( .A0(n3), .A1(n527), .A2(n522), .B0(n43), .Y(n41) );
  AOI31X1 U523 ( .A0(n3), .A1(n37), .A2(n528), .B0(n29), .Y(n27) );
  OAI2BB2X1 U545 ( .B0(n132), .B1(n135), .A0N(n329), .A1N(n318), .Y(n131) );
  AOI21X1 U551 ( .A0(n434), .A1(n428), .B0(n344), .Y(n530) );
  INVX1 U600 ( .A(n530), .Y(n271) );
  AOI31X1 U629 ( .A0(n529), .A1(n83), .A2(n70), .B0(n64), .Y(n62) );
  NAND2X4 U713 ( .A(n433), .B(n421), .Y(n427) );
  OAI22X1 U726 ( .A0(n427), .A1(n342), .B0(n433), .B1(n341), .Y(n269) );
  OAI22X1 U731 ( .A0(n431), .A1(n387), .B0(n386), .B1(n437), .Y(n310) );
  OAI21X1 U733 ( .A0(n76), .A1(n82), .B0(n77), .Y(n71) );
  OAI21X4 U749 ( .A0(n56), .A1(n84), .B0(n57), .Y(n3) );
  NAND2X1 U755 ( .A(n70), .B(n58), .Y(n56) );
  AOI21X2 U759 ( .A0(n71), .A1(n58), .B0(n59), .Y(n57) );
  NAND2X2 U760 ( .A(n426), .B(n462), .Y(n432) );
  NAND2X2 U761 ( .A(n437), .B(n425), .Y(n431) );
  CMPR42X1 U762 ( .A(n299), .B(n279), .C(n213), .D(n218), .ICI(n211), .S(n208), 
        .ICO(n206), .CO(n207) );
  CMPR42X1 U763 ( .A(n296), .B(n286), .C(n190), .D(n194), .ICI(n189), .S(n186), 
        .ICO(n184), .CO(n185) );
  NOR2X1 U764 ( .A(n200), .B(n207), .Y(n87) );
  NAND2X4 U474 ( .A(n435), .B(n423), .Y(n429) );
  NAND2X4 U506 ( .A(n434), .B(n422), .Y(n428) );
  OAI2BB1X1 U703 ( .A0N(n71), .A1N(n529), .B0(n68), .Y(n64) );
  CMPR42X1 U717 ( .A(n288), .B(n308), .C(n319), .D(n209), .ICI(n206), .S(n203), 
        .ICO(n201), .CO(n202) );
endmodule


module multiply_WIDTH12_0_DW_mult_tc_11 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n27,
         n29, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n47, n49, n50,
         n52, n54, n56, n57, n58, n59, n60, n61, n62, n64, n65, n68, n69, n70,
         n71, n73, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n97, n99, n100, n105, n106,
         n107, n108, n109, n110, n112, n113, n115, n116, n117, n118, n123,
         n124, n126, n131, n132, n135, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n462, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529;
  assign n1 = b[0];
  assign n409 = b[11];
  assign n410 = b[10];
  assign n411 = b[9];
  assign n412 = b[8];
  assign n413 = b[7];
  assign n414 = b[6];
  assign n415 = b[5];
  assign n416 = b[4];
  assign n417 = b[3];
  assign n418 = b[2];
  assign n419 = b[1];
  assign n445 = a[11];
  assign n446 = a[9];
  assign n447 = a[7];
  assign n448 = a[5];
  assign n449 = a[3];
  assign n450 = a[1];

  CMPR42X2 U192 ( .A(n287), .B(n267), .C(n198), .D(n202), .ICI(n195), .S(n192), 
        .ICO(n190), .CO(n191) );
  CMPR42X2 U195 ( .A(n268), .B(n212), .C(n205), .D(n210), .ICI(n203), .S(n200), 
        .ICO(n198), .CO(n199) );
  XNOR2X4 U422 ( .A(n447), .B(a[8]), .Y(n434) );
  XNOR2X4 U431 ( .A(n450), .B(a[2]), .Y(n437) );
  ADDHXL U437 ( .A(n326), .B(n256), .CO(n242), .S(n243) );
  ADDHXL U438 ( .A(n322), .B(n254), .CO(n225), .S(n226) );
  ADDFX2 U439 ( .A(n291), .B(n281), .CI(n301), .CO(n223), .S(n224) );
  ADDFX2 U440 ( .A(n265), .B(n275), .CI(n285), .CO(n180), .S(n181) );
  OAI22X1 U441 ( .A0(n431), .A1(n384), .B0(n383), .B1(n437), .Y(n196) );
  CMPR42X1 U442 ( .A(n294), .B(n325), .C(n314), .D(n304), .ICI(n242), .S(n239), 
        .ICO(n237), .CO(n238) );
  ADDHXL U443 ( .A(n324), .B(n255), .CO(n235), .S(n236) );
  CMPR42X1 U444 ( .A(n270), .B(n280), .C(n290), .D(n225), .ICI(n223), .S(n219), 
        .ICO(n217), .CO(n218) );
  CMPR42X1 U445 ( .A(n273), .B(n263), .C(n171), .D(n175), .ICI(n172), .S(n169), 
        .ICO(n167), .CO(n168) );
  ADDHXL U446 ( .A(n328), .B(n317), .CO(n246), .S(n247) );
  ADDFX2 U447 ( .A(n306), .B(n327), .CI(n316), .CO(n244), .S(n245) );
  ADDFX2 U448 ( .A(n315), .B(n305), .CI(n243), .CO(n240), .S(n241) );
  CMPR42X1 U449 ( .A(n313), .B(n293), .C(n303), .D(n236), .ICI(n237), .S(n234), 
        .ICO(n232), .CO(n233) );
  ADDFX2 U450 ( .A(n282), .B(n323), .CI(n292), .CO(n230), .S(n231) );
  NOR2BXL U451 ( .AN(n1), .B(n434), .Y(n282) );
  ADDHXL U452 ( .A(n320), .B(n253), .CO(n212), .S(n213) );
  CMPR42X1 U453 ( .A(n289), .B(n269), .C(n309), .D(n214), .ICI(n217), .S(n211), 
        .ICO(n209), .CO(n210) );
  CMPR42X1 U454 ( .A(n266), .B(n196), .C(n276), .D(n307), .ICI(n193), .S(n189), 
        .ICO(n187), .CO(n188) );
  CMPR42X1 U457 ( .A(n284), .B(n274), .C(n180), .D(n176), .ICI(n177), .S(n174), 
        .ICO(n172), .CO(n173) );
  NOR2X1 U458 ( .A(n208), .B(n215), .Y(n90) );
  OAI22XL U459 ( .A0(n430), .A1(n381), .B0(n380), .B1(n436), .Y(n305) );
  OAI22X1 U460 ( .A0(n429), .A1(n367), .B0(n366), .B1(n435), .Y(n292) );
  OR2X1 U461 ( .A(n298), .B(n278), .Y(n204) );
  OAI22X1 U462 ( .A0(n427), .A1(n341), .B0(n433), .B1(n340), .Y(n268) );
  OAI22XL U463 ( .A0(n430), .A1(n372), .B0(n371), .B1(n436), .Y(n296) );
  NAND2X1 U464 ( .A(n330), .B(n258), .Y(n135) );
  AOI21X1 U465 ( .A0(n107), .A1(n115), .B0(n108), .Y(n106) );
  AOI21X1 U466 ( .A0(n462), .A1(n432), .B0(n396), .Y(n514) );
  INVX1 U467 ( .A(n514), .Y(n319) );
  XNOR2X1 U468 ( .A(n160), .B(n159), .Y(n5) );
  NAND2BX1 U470 ( .AN(n39), .B(n40), .Y(n6) );
  OAI22X1 U471 ( .A0(n432), .A1(n400), .B0(n399), .B1(n462), .Y(n323) );
  XOR2X1 U473 ( .A(n158), .B(n259), .Y(n4) );
  AOI22X1 U474 ( .A0(n520), .A1(n131), .B0(n247), .B1(n257), .Y(n126) );
  OAI22X1 U475 ( .A0(n427), .A1(n340), .B0(n433), .B1(n339), .Y(n267) );
  NAND2BX1 U476 ( .AN(n60), .B(n61), .Y(n9) );
  OAI2BB2X1 U477 ( .B0(n126), .B1(n124), .A0N(n245), .A1N(n246), .Y(n123) );
  OAI22XL U478 ( .A0(n430), .A1(n376), .B0(n375), .B1(n436), .Y(n300) );
  NAND2BX1 U479 ( .AN(n65), .B(n68), .Y(n10) );
  AOI21X1 U480 ( .A0(n435), .A1(n429), .B0(n357), .Y(n515) );
  INVX1 U481 ( .A(n515), .Y(n283) );
  AOI22X1 U482 ( .A0(n522), .A1(n123), .B0(n241), .B1(n244), .Y(n118) );
  NAND2BX1 U483 ( .AN(n90), .B(n91), .Y(n14) );
  AOI21X1 U484 ( .A0(n83), .A1(n79), .B0(n80), .Y(n78) );
  INVX1 U485 ( .A(n84), .Y(n83) );
  OAI22XL U486 ( .A0(n430), .A1(n378), .B0(n377), .B1(n436), .Y(n302) );
  AOI22X1 U487 ( .A0(n38), .A1(n525), .B0(n160), .B1(n159), .Y(n516) );
  INVX1 U488 ( .A(n516), .Y(n29) );
  NAND2BX1 U489 ( .AN(n87), .B(n88), .Y(n13) );
  NAND2BXL U490 ( .AN(n76), .B(n77), .Y(n11) );
  OR2X2 U491 ( .A(n216), .B(n221), .Y(n517) );
  AND2X2 U492 ( .A(n222), .B(n228), .Y(n518) );
  OR2X2 U493 ( .A(n166), .B(n168), .Y(n519) );
  OR2X2 U494 ( .A(n247), .B(n257), .Y(n520) );
  AND2X2 U495 ( .A(n37), .B(n525), .Y(n521) );
  OR2X2 U496 ( .A(n241), .B(n244), .Y(n522) );
  OR2X2 U497 ( .A(n222), .B(n228), .Y(n523) );
  OR2X2 U498 ( .A(n173), .B(n169), .Y(n524) );
  OR2X2 U499 ( .A(n160), .B(n159), .Y(n525) );
  NOR2X2 U500 ( .A(n179), .B(n185), .Y(n65) );
  AOI21XL U502 ( .A0(n83), .A1(n70), .B0(n71), .Y(n69) );
  XNOR2X4 U505 ( .A(n449), .B(a[4]), .Y(n436) );
  OAI22XL U509 ( .A0(n431), .A1(n386), .B0(n385), .B1(n437), .Y(n309) );
  OAI22XL U510 ( .A0(n427), .A1(n342), .B0(n433), .B1(n341), .Y(n269) );
  OAI22XL U511 ( .A0(n429), .A1(n364), .B0(n363), .B1(n435), .Y(n289) );
  OAI22XL U512 ( .A0(n431), .A1(n391), .B0(n390), .B1(n437), .Y(n314) );
  OAI22XL U513 ( .A0(n432), .A1(n403), .B0(n402), .B1(n462), .Y(n326) );
  OAI22XL U514 ( .A0(n430), .A1(n442), .B0(n436), .B1(n382), .Y(n256) );
  NAND2BXL U515 ( .AN(n1), .B(n448), .Y(n382) );
  OAI22XL U516 ( .A0(n432), .A1(n399), .B0(n398), .B1(n462), .Y(n322) );
  OAI22XL U517 ( .A0(n428), .A1(n440), .B0(n434), .B1(n356), .Y(n254) );
  INVXL U518 ( .A(n446), .Y(n440) );
  OAI22XL U519 ( .A0(n430), .A1(n377), .B0(n376), .B1(n436), .Y(n301) );
  OAI22XL U520 ( .A0(n428), .A1(n355), .B0(n354), .B1(n434), .Y(n281) );
  OAI22XL U521 ( .A0(n429), .A1(n366), .B0(n365), .B1(n435), .Y(n291) );
  OAI22XL U522 ( .A0(n432), .A1(n397), .B0(n396), .B1(n462), .Y(n320) );
  INVXL U524 ( .A(n445), .Y(n439) );
  OAI22XL U525 ( .A0(n431), .A1(n385), .B0(n384), .B1(n437), .Y(n308) );
  OAI22XL U526 ( .A0(n429), .A1(n363), .B0(n362), .B1(n435), .Y(n288) );
  ADDFX2 U527 ( .A(n264), .B(n182), .CI(n295), .CO(n175), .S(n176) );
  OAI22XL U529 ( .A0(n427), .A1(n337), .B0(n433), .B1(n336), .Y(n264) );
  OAI22XL U531 ( .A0(n429), .A1(n360), .B0(n359), .B1(n435), .Y(n285) );
  OAI22XL U532 ( .A0(n428), .A1(n349), .B0(n348), .B1(n434), .Y(n275) );
  OAI22XL U533 ( .A0(n427), .A1(n338), .B0(n433), .B1(n337), .Y(n265) );
  OAI22XL U534 ( .A0(n428), .A1(n351), .B0(n350), .B1(n434), .Y(n277) );
  OAI22XL U535 ( .A0(n432), .A1(n402), .B0(n401), .B1(n462), .Y(n325) );
  NOR2BXL U536 ( .AN(n1), .B(n435), .Y(n294) );
  OAI22XL U537 ( .A0(n430), .A1(n380), .B0(n379), .B1(n436), .Y(n304) );
  OAI22XL U538 ( .A0(n432), .A1(n401), .B0(n400), .B1(n462), .Y(n324) );
  OAI22XL U539 ( .A0(n429), .A1(n441), .B0(n435), .B1(n369), .Y(n255) );
  INVXL U540 ( .A(n447), .Y(n441) );
  NOR2BXL U541 ( .AN(n1), .B(n433), .Y(n270) );
  OAI22XL U542 ( .A0(n429), .A1(n365), .B0(n364), .B1(n435), .Y(n290) );
  OAI22XL U543 ( .A0(n428), .A1(n354), .B0(n353), .B1(n434), .Y(n280) );
  XNOR2X1 U544 ( .A(n298), .B(n278), .Y(n205) );
  OAI22XL U545 ( .A0(n427), .A1(n336), .B0(n433), .B1(n335), .Y(n263) );
  INVXL U546 ( .A(n170), .Y(n171) );
  OAI22XL U547 ( .A0(n428), .A1(n347), .B0(n346), .B1(n434), .Y(n273) );
  OAI22X1 U548 ( .A0(n431), .A1(n443), .B0(n437), .B1(n395), .Y(n257) );
  INVXL U549 ( .A(n449), .Y(n443) );
  NAND2BXL U550 ( .AN(n1), .B(n449), .Y(n395) );
  OAI22X1 U551 ( .A0(n432), .A1(n406), .B0(n405), .B1(n462), .Y(n329) );
  OAI22XL U552 ( .A0(n432), .A1(n444), .B0(n408), .B1(n462), .Y(n258) );
  OAI22XL U553 ( .A0(n432), .A1(n407), .B0(n406), .B1(n462), .Y(n330) );
  NAND2BXL U554 ( .AN(n1), .B(n450), .Y(n408) );
  OAI22XL U555 ( .A0(n432), .A1(n404), .B0(n403), .B1(n462), .Y(n327) );
  NOR2BXL U556 ( .AN(n1), .B(n436), .Y(n306) );
  OAI22XL U557 ( .A0(n431), .A1(n393), .B0(n392), .B1(n437), .Y(n316) );
  OAI22XL U558 ( .A0(n432), .A1(n405), .B0(n404), .B1(n462), .Y(n328) );
  OAI22XL U559 ( .A0(n431), .A1(n394), .B0(n393), .B1(n437), .Y(n317) );
  XNOR2X1 U560 ( .A(n449), .B(n1), .Y(n394) );
  OAI22XL U561 ( .A0(n431), .A1(n392), .B0(n391), .B1(n437), .Y(n315) );
  XNOR2X1 U562 ( .A(n448), .B(n1), .Y(n381) );
  OAI22XL U563 ( .A0(n430), .A1(n379), .B0(n378), .B1(n436), .Y(n303) );
  OAI22XL U564 ( .A0(n429), .A1(n368), .B0(n367), .B1(n435), .Y(n293) );
  OAI22XL U565 ( .A0(n431), .A1(n390), .B0(n389), .B1(n437), .Y(n313) );
  OAI22XL U567 ( .A0(n428), .A1(n350), .B0(n349), .B1(n434), .Y(n276) );
  OAI22XL U568 ( .A0(n429), .A1(n358), .B0(n357), .B1(n435), .Y(n170) );
  OAI22XL U569 ( .A0(n430), .A1(n375), .B0(n374), .B1(n436), .Y(n299) );
  OAI22XL U570 ( .A0(n428), .A1(n353), .B0(n352), .B1(n434), .Y(n279) );
  OAI22XL U571 ( .A0(n429), .A1(n362), .B0(n361), .B1(n435), .Y(n287) );
  OAI22XL U572 ( .A0(n428), .A1(n348), .B0(n347), .B1(n434), .Y(n274) );
  OAI22XL U573 ( .A0(n429), .A1(n359), .B0(n358), .B1(n435), .Y(n284) );
  CMPR42X1 U574 ( .A(n170), .B(n262), .C(n272), .D(n283), .ICI(n167), .S(n166), 
        .ICO(n164), .CO(n165) );
  OAI22XL U575 ( .A0(n428), .A1(n346), .B0(n345), .B1(n434), .Y(n272) );
  OAI22XL U576 ( .A0(n427), .A1(n335), .B0(n433), .B1(n334), .Y(n262) );
  ADDFX2 U577 ( .A(n261), .B(n163), .CI(n164), .CO(n160), .S(n161) );
  OAI22XL U578 ( .A0(n427), .A1(n334), .B0(n433), .B1(n333), .Y(n261) );
  INVX1 U579 ( .A(n162), .Y(n163) );
  OAI22XL U580 ( .A0(n428), .A1(n345), .B0(n344), .B1(n434), .Y(n162) );
  INVX1 U581 ( .A(n448), .Y(n442) );
  NOR2BX1 U582 ( .AN(n1), .B(n437), .Y(n318) );
  XNOR2X1 U583 ( .A(n450), .B(n419), .Y(n406) );
  XNOR2X1 U584 ( .A(n450), .B(n1), .Y(n407) );
  INVX1 U585 ( .A(n450), .Y(n444) );
  XNOR2X1 U586 ( .A(n450), .B(n416), .Y(n403) );
  XNOR2X1 U587 ( .A(n450), .B(n418), .Y(n405) );
  XNOR2X1 U588 ( .A(n449), .B(n419), .Y(n393) );
  XNOR2X1 U589 ( .A(n450), .B(n417), .Y(n404) );
  XNOR2X1 U590 ( .A(n449), .B(n409), .Y(n383) );
  XNOR2X1 U591 ( .A(n450), .B(n415), .Y(n402) );
  XNOR2X1 U592 ( .A(n449), .B(n417), .Y(n391) );
  XNOR2X1 U593 ( .A(n449), .B(n418), .Y(n392) );
  XNOR2X1 U594 ( .A(n448), .B(n419), .Y(n380) );
  NOR2X1 U595 ( .A(n329), .B(n318), .Y(n132) );
  NAND2BX1 U597 ( .AN(n1), .B(n447), .Y(n369) );
  XNOR2X1 U598 ( .A(n450), .B(n414), .Y(n401) );
  XNOR2X1 U599 ( .A(n447), .B(n1), .Y(n368) );
  XNOR2X1 U600 ( .A(n449), .B(n416), .Y(n390) );
  XNOR2X1 U601 ( .A(n448), .B(n418), .Y(n379) );
  NAND2BX1 U602 ( .AN(n1), .B(n446), .Y(n356) );
  XNOR2X1 U603 ( .A(n446), .B(n1), .Y(n355) );
  XNOR2X1 U604 ( .A(n447), .B(n418), .Y(n366) );
  XNOR2X1 U605 ( .A(n450), .B(n412), .Y(n399) );
  XNOR2X1 U606 ( .A(n450), .B(n413), .Y(n400) );
  XNOR2X1 U607 ( .A(n447), .B(n419), .Y(n367) );
  XNOR2X1 U608 ( .A(n446), .B(n419), .Y(n354) );
  XNOR2X1 U609 ( .A(n447), .B(n417), .Y(n365) );
  XNOR2X1 U610 ( .A(n446), .B(n416), .Y(n351) );
  XNOR2X1 U611 ( .A(n447), .B(n416), .Y(n364) );
  XNOR2X1 U612 ( .A(n445), .B(n1), .Y(n342) );
  XNOR2X1 U613 ( .A(n450), .B(n409), .Y(n396) );
  NAND2BX1 U614 ( .AN(n1), .B(n445), .Y(n343) );
  XNOR2X1 U615 ( .A(n447), .B(n415), .Y(n363) );
  XNOR2X1 U616 ( .A(n449), .B(n411), .Y(n385) );
  XNOR2X1 U617 ( .A(n449), .B(n410), .Y(n384) );
  XNOR2X1 U618 ( .A(n448), .B(n412), .Y(n373) );
  XNOR2X1 U619 ( .A(n446), .B(n415), .Y(n350) );
  XNOR2X1 U621 ( .A(n448), .B(n409), .Y(n370) );
  XNOR2X1 U622 ( .A(n445), .B(n416), .Y(n338) );
  XNOR2X1 U623 ( .A(n445), .B(n415), .Y(n337) );
  XNOR2X1 U624 ( .A(n446), .B(n414), .Y(n349) );
  XNOR2X1 U625 ( .A(n447), .B(n409), .Y(n357) );
  NOR2X1 U627 ( .A(n245), .B(n246), .Y(n124) );
  XNOR2X1 U628 ( .A(n448), .B(n416), .Y(n377) );
  XNOR2X1 U629 ( .A(n449), .B(n415), .Y(n389) );
  XNOR2X1 U630 ( .A(n448), .B(n417), .Y(n378) );
  XNOR2X1 U631 ( .A(n449), .B(n414), .Y(n388) );
  XNOR2X1 U632 ( .A(n448), .B(n415), .Y(n376) );
  XNOR2X1 U633 ( .A(n449), .B(n413), .Y(n387) );
  XNOR2X1 U634 ( .A(n450), .B(n410), .Y(n397) );
  XNOR2X1 U635 ( .A(n450), .B(n411), .Y(n398) );
  XOR2X1 U636 ( .A(n450), .B(a[0]), .Y(n426) );
  CLKINVX3 U637 ( .A(a[0]), .Y(n462) );
  XNOR2X1 U638 ( .A(n449), .B(n412), .Y(n386) );
  XOR2X1 U639 ( .A(n449), .B(a[2]), .Y(n425) );
  XNOR2X1 U640 ( .A(n446), .B(n418), .Y(n353) );
  XNOR2X1 U641 ( .A(n448), .B(n414), .Y(n375) );
  XNOR2X1 U642 ( .A(n446), .B(n417), .Y(n352) );
  XNOR2X1 U643 ( .A(n448), .B(n413), .Y(n374) );
  XNOR2X1 U644 ( .A(n445), .B(n419), .Y(n341) );
  OAI22X1 U645 ( .A0(n430), .A1(n374), .B0(n373), .B1(n436), .Y(n298) );
  XNOR2X1 U646 ( .A(n447), .B(n414), .Y(n362) );
  XNOR2X1 U647 ( .A(n445), .B(n417), .Y(n339) );
  XNOR2X1 U648 ( .A(n445), .B(n418), .Y(n340) );
  XNOR2X1 U649 ( .A(n448), .B(n410), .Y(n371) );
  XOR2X1 U650 ( .A(n448), .B(a[4]), .Y(n424) );
  XNOR2X1 U651 ( .A(n448), .B(n411), .Y(n372) );
  XNOR2X1 U652 ( .A(n447), .B(n412), .Y(n360) );
  XNOR2X1 U653 ( .A(n447), .B(n413), .Y(n361) );
  CMPR42X1 U654 ( .A(n277), .B(n297), .C(n197), .D(n204), .ICI(n201), .S(n195), 
        .ICO(n193), .CO(n194) );
  INVX1 U655 ( .A(n196), .Y(n197) );
  OAI22X1 U656 ( .A0(n430), .A1(n373), .B0(n372), .B1(n436), .Y(n297) );
  OAI22X1 U657 ( .A0(n430), .A1(n371), .B0(n370), .B1(n436), .Y(n182) );
  XNOR2X1 U658 ( .A(n445), .B(n414), .Y(n336) );
  XNOR2X1 U659 ( .A(n447), .B(n410), .Y(n358) );
  XNOR2X1 U660 ( .A(n446), .B(n412), .Y(n347) );
  XNOR2X1 U661 ( .A(n446), .B(n413), .Y(n348) );
  XNOR2X1 U662 ( .A(n447), .B(n411), .Y(n359) );
  XNOR2X1 U663 ( .A(n446), .B(n411), .Y(n346) );
  XNOR2X1 U664 ( .A(n445), .B(n413), .Y(n335) );
  XOR2X1 U665 ( .A(n447), .B(a[6]), .Y(n423) );
  XNOR2X1 U666 ( .A(n445), .B(n412), .Y(n334) );
  XNOR2X1 U667 ( .A(n446), .B(n410), .Y(n345) );
  NAND2X1 U668 ( .A(n229), .B(n233), .Y(n110) );
  NAND2X1 U669 ( .A(n234), .B(n238), .Y(n113) );
  NOR2X1 U670 ( .A(n229), .B(n233), .Y(n109) );
  NOR2X1 U671 ( .A(n234), .B(n238), .Y(n112) );
  NOR2X1 U672 ( .A(n239), .B(n240), .Y(n116) );
  NAND2X1 U673 ( .A(n239), .B(n240), .Y(n117) );
  CMPR42X1 U674 ( .A(n312), .B(n302), .C(n235), .D(n232), .ICI(n231), .S(n229), 
        .ICO(n227), .CO(n228) );
  OAI22X1 U675 ( .A0(n431), .A1(n389), .B0(n388), .B1(n437), .Y(n312) );
  CMPR42X1 U676 ( .A(n311), .B(n226), .C(n230), .D(n224), .ICI(n227), .S(n222), 
        .ICO(n220), .CO(n221) );
  OAI22X1 U677 ( .A0(n431), .A1(n388), .B0(n387), .B1(n437), .Y(n311) );
  CMPR42X1 U678 ( .A(n321), .B(n300), .C(n310), .D(n220), .ICI(n219), .S(n216), 
        .ICO(n214), .CO(n215) );
  OAI22X1 U679 ( .A0(n432), .A1(n398), .B0(n397), .B1(n462), .Y(n321) );
  OAI22X1 U680 ( .A0(n431), .A1(n387), .B0(n386), .B1(n437), .Y(n310) );
  NAND2X1 U681 ( .A(n517), .B(n523), .Y(n94) );
  AOI21X1 U682 ( .A0(n517), .A1(n518), .B0(n97), .Y(n95) );
  INVX1 U683 ( .A(n99), .Y(n97) );
  NOR2X1 U684 ( .A(n192), .B(n199), .Y(n81) );
  CMPR42X1 U685 ( .A(n296), .B(n286), .C(n190), .D(n194), .ICI(n189), .S(n186), 
        .ICO(n184), .CO(n185) );
  OAI22X1 U686 ( .A0(n429), .A1(n361), .B0(n360), .B1(n435), .Y(n286) );
  CMPR42X1 U687 ( .A(n183), .B(n187), .C(n181), .D(n188), .ICI(n184), .S(n179), 
        .ICO(n177), .CO(n178) );
  INVX1 U688 ( .A(n182), .Y(n183) );
  AOI21X1 U689 ( .A0(n52), .A1(n519), .B0(n47), .Y(n45) );
  INVX1 U690 ( .A(n49), .Y(n47) );
  NAND2X1 U691 ( .A(n524), .B(n519), .Y(n44) );
  XNOR2X1 U692 ( .A(n446), .B(n409), .Y(n344) );
  XNOR2X1 U693 ( .A(n445), .B(n411), .Y(n333) );
  XOR2X1 U694 ( .A(n446), .B(a[8]), .Y(n422) );
  XOR2X1 U695 ( .A(n445), .B(a[10]), .Y(n421) );
  XNOR2X1 U696 ( .A(n445), .B(n410), .Y(n332) );
  OAI21XL U697 ( .A0(n68), .A1(n60), .B0(n61), .Y(n59) );
  NOR2X1 U698 ( .A(n87), .B(n90), .Y(n85) );
  OAI21XL U699 ( .A0(n87), .A1(n91), .B0(n88), .Y(n86) );
  NAND2X1 U700 ( .A(n216), .B(n221), .Y(n99) );
  OAI21XL U701 ( .A0(n118), .A1(n116), .B0(n117), .Y(n115) );
  NOR2X1 U702 ( .A(n109), .B(n112), .Y(n107) );
  OAI21XL U703 ( .A0(n109), .A1(n113), .B0(n110), .Y(n108) );
  NAND2X1 U705 ( .A(n208), .B(n215), .Y(n91) );
  NAND2X1 U706 ( .A(n200), .B(n207), .Y(n88) );
  INVX1 U707 ( .A(n93), .Y(n92) );
  INVX1 U710 ( .A(n81), .Y(n79) );
  INVX1 U711 ( .A(n82), .Y(n80) );
  NAND2X1 U712 ( .A(n186), .B(n191), .Y(n77) );
  NOR2X1 U714 ( .A(n76), .B(n81), .Y(n70) );
  NAND2X1 U715 ( .A(n179), .B(n185), .Y(n68) );
  NOR2X1 U716 ( .A(n178), .B(n174), .Y(n60) );
  OAI21XL U717 ( .A0(n73), .A1(n65), .B0(n68), .Y(n64) );
  INVX1 U718 ( .A(n71), .Y(n73) );
  NAND2X1 U719 ( .A(n178), .B(n174), .Y(n61) );
  NAND2X1 U720 ( .A(n173), .B(n169), .Y(n54) );
  NAND2X1 U721 ( .A(n166), .B(n168), .Y(n49) );
  INVX1 U722 ( .A(n54), .Y(n52) );
  NOR2X1 U723 ( .A(n165), .B(n161), .Y(n39) );
  INVX1 U724 ( .A(n45), .Y(n43) );
  INVX1 U725 ( .A(n44), .Y(n42) );
  NAND2X1 U726 ( .A(n165), .B(n161), .Y(n40) );
  OAI21XL U727 ( .A0(n45), .A1(n39), .B0(n40), .Y(n38) );
  NOR2X1 U728 ( .A(n44), .B(n39), .Y(n37) );
  ADDFX2 U729 ( .A(n162), .B(n260), .CI(n271), .CO(n158), .S(n159) );
  OAI22X1 U731 ( .A0(n427), .A1(n333), .B0(n433), .B1(n332), .Y(n260) );
  OAI22X1 U733 ( .A0(n427), .A1(n332), .B0(n433), .B1(n331), .Y(n259) );
  XNOR2X1 U734 ( .A(n445), .B(n409), .Y(n331) );
  NOR2X1 U735 ( .A(n65), .B(n60), .Y(n58) );
  XOR2X1 U736 ( .A(n100), .B(n15), .Y(product[10]) );
  NAND2X1 U737 ( .A(n517), .B(n99), .Y(n15) );
  AOI21X1 U738 ( .A0(n105), .A1(n523), .B0(n518), .Y(n100) );
  INVX1 U739 ( .A(n106), .Y(n105) );
  XOR2X1 U740 ( .A(n92), .B(n14), .Y(product[11]) );
  XNOR2X1 U741 ( .A(n89), .B(n13), .Y(product[12]) );
  OAI21XL U742 ( .A0(n92), .A1(n90), .B0(n91), .Y(n89) );
  XNOR2X1 U743 ( .A(n83), .B(n12), .Y(product[13]) );
  NAND2X1 U744 ( .A(n79), .B(n82), .Y(n12) );
  XOR2X1 U745 ( .A(n78), .B(n11), .Y(product[14]) );
  XOR2X1 U746 ( .A(n69), .B(n10), .Y(product[15]) );
  XOR2X1 U747 ( .A(n62), .B(n9), .Y(product[16]) );
  XNOR2X1 U748 ( .A(n3), .B(n8), .Y(product[17]) );
  NAND2X1 U749 ( .A(n524), .B(n54), .Y(n8) );
  XOR2X1 U750 ( .A(n50), .B(n7), .Y(product[18]) );
  NAND2X1 U751 ( .A(n519), .B(n49), .Y(n7) );
  AOI21X1 U752 ( .A0(n3), .A1(n524), .B0(n52), .Y(n50) );
  XOR2X1 U753 ( .A(n41), .B(n6), .Y(product[19]) );
  AOI21X1 U754 ( .A0(n3), .A1(n42), .B0(n43), .Y(n41) );
  XOR2X1 U755 ( .A(n36), .B(n5), .Y(product[20]) );
  AOI21X1 U756 ( .A0(n3), .A1(n37), .B0(n38), .Y(n36) );
  XOR2X1 U757 ( .A(n27), .B(n4), .Y(product[21]) );
  AOI21X1 U758 ( .A0(n3), .A1(n521), .B0(n29), .Y(n27) );
  OAI22XL U472 ( .A0(n427), .A1(n439), .B0(n433), .B1(n343), .Y(n253) );
  CMPR42X1 U503 ( .A(n288), .B(n308), .C(n319), .D(n209), .ICI(n206), .S(n203), 
        .ICO(n201), .CO(n202) );
  NAND2X1 U504 ( .A(n192), .B(n199), .Y(n82) );
  AOI21XL U506 ( .A0(n437), .A1(n431), .B0(n383), .Y(n526) );
  INVX1 U507 ( .A(n526), .Y(n307) );
  AOI21X1 U508 ( .A0(n436), .A1(n430), .B0(n370), .Y(n527) );
  INVX1 U523 ( .A(n527), .Y(n295) );
  OAI21X1 U528 ( .A0(n106), .A1(n94), .B0(n95), .Y(n93) );
  NAND2X2 U530 ( .A(n435), .B(n423), .Y(n429) );
  AOI21X2 U566 ( .A0(n85), .A1(n93), .B0(n86), .Y(n84) );
  OAI2BB2X1 U596 ( .B0(n132), .B1(n135), .A0N(n329), .A1N(n318), .Y(n131) );
  AOI21X1 U620 ( .A0(n434), .A1(n428), .B0(n344), .Y(n528) );
  INVX1 U626 ( .A(n528), .Y(n271) );
  AOI31X1 U704 ( .A0(n529), .A1(n83), .A2(n70), .B0(n64), .Y(n62) );
  INVX1 U708 ( .A(n65), .Y(n529) );
  NOR2X2 U709 ( .A(n186), .B(n191), .Y(n76) );
  NAND2X1 U713 ( .A(n70), .B(n58), .Y(n56) );
  XNOR2X4 U730 ( .A(n448), .B(a[6]), .Y(n435) );
  OAI21X1 U732 ( .A0(n76), .A1(n82), .B0(n77), .Y(n71) );
  OAI22XL U759 ( .A0(n427), .A1(n339), .B0(n433), .B1(n338), .Y(n266) );
  NAND2X2 U760 ( .A(n426), .B(n462), .Y(n432) );
  NAND2X2 U761 ( .A(n437), .B(n425), .Y(n431) );
  OAI22X1 U762 ( .A0(n428), .A1(n352), .B0(n351), .B1(n434), .Y(n278) );
  CMPR42X1 U763 ( .A(n299), .B(n279), .C(n213), .D(n218), .ICI(n211), .S(n208), 
        .ICO(n206), .CO(n207) );
  NOR2X1 U764 ( .A(n200), .B(n207), .Y(n87) );
  OAI21X2 U765 ( .A0(n56), .A1(n84), .B0(n57), .Y(n3) );
  AOI21X1 U766 ( .A0(n71), .A1(n58), .B0(n59), .Y(n57) );
  NAND2X4 U455 ( .A(n434), .B(n422), .Y(n428) );
  NAND2X4 U456 ( .A(n436), .B(n424), .Y(n430) );
  NAND2X4 U469 ( .A(n433), .B(n421), .Y(n427) );
  XNOR2X4 U501 ( .A(n446), .B(a[10]), .Y(n433) );
endmodule


module multiply_WIDTH12_0 ( clk, a_re, a_im, b_re, b_im, m_re, m_im );
  input [11:0] a_re;
  input [11:0] a_im;
  input [11:0] b_re;
  input [11:0] b_im;
  output [11:0] m_re;
  output [11:0] m_im;
  input clk;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N24, N25, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41,
         N42, N43, N44, N45, N46, N47, N60, N61, N62, N63, N64, N65, N66, N67,
         N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81,
         N82, N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95,
         N96, N97, N98, N99, N100, N101, N102, N103, N104, N105, N106, N107,
         N108, N109, N110, N111, N112, N113, N114, N115, N116, N117, N118,
         N119, N120, N121, N122, N123, N124, N125, N126, N127, N128, N129,
         N130, N131, N132, N133, N134, N135, N136, N137, N138, N139, N140,
         N141, N142, N143, N59, N58, N57, N56, N55, N54, N53, N52, N51, N50,
         N49, N48, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12;
  wire   [11:0] sub_ar_ai;
  wire   [11:0] sub_br_bi;
  wire   [11:0] add_br_bi;
  wire   [11:0] temp1_b_im;
  wire   [11:0] temp1_a_re;
  wire   [11:0] temp1_a_im;
  wire   [21:10] md;
  wire   [21:10] ma;
  wire   [21:10] mb;
  wire   [11:0] sc_md;
  wire   [11:0] sc_ma;
  wire   [11:0] sc_mb;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33, 
        SYNOPSYS_UNCONNECTED__34, SYNOPSYS_UNCONNECTED__35;

  DFFHQX4 \sub_br_bi_reg[7]  ( .D(N67), .CK(clk), .Q(sub_br_bi[7]) );
  DFFHQX4 \sub_br_bi_reg[5]  ( .D(N65), .CK(clk), .Q(sub_br_bi[5]) );
  DFFHQX4 \sub_br_bi_reg[3]  ( .D(N63), .CK(clk), .Q(sub_br_bi[3]) );
  DFFHQX4 \sub_br_bi_reg[1]  ( .D(N61), .CK(clk), .Q(sub_br_bi[1]) );
  DFFHQX4 \add_br_bi_reg[9]  ( .D(N81), .CK(clk), .Q(add_br_bi[9]) );
  DFFHQX4 \add_br_bi_reg[7]  ( .D(N79), .CK(clk), .Q(add_br_bi[7]) );
  DFFHQX4 \add_br_bi_reg[5]  ( .D(N77), .CK(clk), .Q(add_br_bi[5]) );
  DFFHQX4 \add_br_bi_reg[3]  ( .D(N75), .CK(clk), .Q(add_br_bi[3]) );
  DFFHQX4 \add_br_bi_reg[1]  ( .D(N73), .CK(clk), .Q(add_br_bi[1]) );
  DFFHQX4 \sub_ar_ai_reg[9]  ( .D(N33), .CK(clk), .Q(sub_ar_ai[9]) );
  DFFHQX4 \sub_ar_ai_reg[7]  ( .D(N31), .CK(clk), .Q(sub_ar_ai[7]) );
  DFFHQX4 \sub_ar_ai_reg[5]  ( .D(N29), .CK(clk), .Q(sub_ar_ai[5]) );
  DFFHQX4 \sub_ar_ai_reg[3]  ( .D(N27), .CK(clk), .Q(sub_ar_ai[3]) );
  DFFHQX4 \sub_ar_ai_reg[1]  ( .D(N25), .CK(clk), .Q(sub_ar_ai[1]) );
  INVX1 U3 ( .A(a_im[2]), .Y(N9) );
  INVX1 U4 ( .A(a_im[3]), .Y(N8) );
  INVX1 U5 ( .A(a_im[4]), .Y(N7) );
  INVX1 U6 ( .A(a_im[5]), .Y(N6) );
  INVX1 U7 ( .A(a_im[6]), .Y(N5) );
  INVX1 U8 ( .A(b_im[0]), .Y(N47) );
  INVX1 U9 ( .A(b_im[1]), .Y(N46) );
  INVX1 U10 ( .A(b_im[2]), .Y(N45) );
  INVX1 U11 ( .A(b_im[3]), .Y(N44) );
  INVX1 U12 ( .A(b_im[4]), .Y(N43) );
  INVX1 U13 ( .A(b_im[5]), .Y(N42) );
  INVX1 U14 ( .A(b_im[6]), .Y(N41) );
  INVX1 U15 ( .A(b_im[7]), .Y(N40) );
  INVX1 U16 ( .A(a_im[7]), .Y(N4) );
  INVX1 U17 ( .A(b_im[8]), .Y(N39) );
  INVX1 U18 ( .A(b_im[9]), .Y(N38) );
  INVX1 U19 ( .A(b_im[10]), .Y(N37) );
  INVX1 U20 ( .A(b_im[11]), .Y(N36) );
  INVX1 U21 ( .A(a_im[8]), .Y(N3) );
  INVX1 U22 ( .A(a_im[9]), .Y(N2) );
  INVX1 U23 ( .A(a_im[0]), .Y(N11) );
  INVX1 U24 ( .A(a_im[1]), .Y(N10) );
  INVX1 U25 ( .A(a_im[10]), .Y(N1) );
  INVX1 U26 ( .A(a_im[11]), .Y(N0) );
  DFFHQX2 \sub_br_bi_reg[11]  ( .D(N71), .CK(clk), .Q(sub_br_bi[11]) );
  DFFHQX1 \sub_br_bi_reg[10]  ( .D(N70), .CK(clk), .Q(sub_br_bi[10]) );
  DFFHQX1 \sub_br_bi_reg[8]  ( .D(N68), .CK(clk), .Q(sub_br_bi[8]) );
  DFFHQX1 \sub_br_bi_reg[6]  ( .D(N66), .CK(clk), .Q(sub_br_bi[6]) );
  DFFHQX1 \sub_br_bi_reg[4]  ( .D(N64), .CK(clk), .Q(sub_br_bi[4]) );
  DFFHQX1 \sub_br_bi_reg[2]  ( .D(N62), .CK(clk), .Q(sub_br_bi[2]) );
  DFFHQX1 \sub_br_bi_reg[0]  ( .D(N60), .CK(clk), .Q(sub_br_bi[0]) );
  DFFHQX2 \add_br_bi_reg[11]  ( .D(N83), .CK(clk), .Q(add_br_bi[11]) );
  DFFHQX1 \add_br_bi_reg[10]  ( .D(N82), .CK(clk), .Q(add_br_bi[10]) );
  DFFHQX1 \add_br_bi_reg[8]  ( .D(N80), .CK(clk), .Q(add_br_bi[8]) );
  DFFHQX1 \add_br_bi_reg[6]  ( .D(N78), .CK(clk), .Q(add_br_bi[6]) );
  DFFHQX1 \add_br_bi_reg[4]  ( .D(N76), .CK(clk), .Q(add_br_bi[4]) );
  DFFHQX1 \add_br_bi_reg[2]  ( .D(N74), .CK(clk), .Q(add_br_bi[2]) );
  DFFHQX1 \add_br_bi_reg[0]  ( .D(N72), .CK(clk), .Q(add_br_bi[0]) );
  DFFHQX1 \sub_ar_ai_reg[10]  ( .D(N34), .CK(clk), .Q(sub_ar_ai[10]) );
  DFFHQX1 \sub_ar_ai_reg[8]  ( .D(N32), .CK(clk), .Q(sub_ar_ai[8]) );
  DFFHQX1 \sub_ar_ai_reg[6]  ( .D(N30), .CK(clk), .Q(sub_ar_ai[6]) );
  DFFHQX1 \sub_ar_ai_reg[4]  ( .D(N28), .CK(clk), .Q(sub_ar_ai[4]) );
  DFFHQX1 \sub_ar_ai_reg[2]  ( .D(N26), .CK(clk), .Q(sub_ar_ai[2]) );
  DFFHQX1 \sub_ar_ai_reg[0]  ( .D(N24), .CK(clk), .Q(sub_ar_ai[0]) );
  DFFHQX1 \md_reg[16]  ( .D(N90), .CK(clk), .Q(md[16]) );
  DFFHQX1 \md_reg[13]  ( .D(N87), .CK(clk), .Q(md[13]) );
  DFFHQX1 \md_reg[12]  ( .D(N86), .CK(clk), .Q(md[12]) );
  DFFHQX1 \md_reg[11]  ( .D(N85), .CK(clk), .Q(md[11]) );
  DFFHQX1 \md_reg[10]  ( .D(N84), .CK(clk), .Q(md[10]) );
  DFFHQX1 \ma_reg[17]  ( .D(N103), .CK(clk), .Q(ma[17]) );
  DFFHQX1 \ma_reg[13]  ( .D(N99), .CK(clk), .Q(ma[13]) );
  DFFHQX1 \ma_reg[12]  ( .D(N98), .CK(clk), .Q(ma[12]) );
  DFFHQX1 \ma_reg[11]  ( .D(N97), .CK(clk), .Q(ma[11]) );
  DFFHQX1 \ma_reg[10]  ( .D(N96), .CK(clk), .Q(ma[10]) );
  DFFHQX1 \mb_reg[17]  ( .D(N115), .CK(clk), .Q(mb[17]) );
  DFFHQX1 \mb_reg[14]  ( .D(N112), .CK(clk), .Q(mb[14]) );
  DFFHQX1 \mb_reg[13]  ( .D(N111), .CK(clk), .Q(mb[13]) );
  DFFHQX1 \mb_reg[12]  ( .D(N110), .CK(clk), .Q(mb[12]) );
  DFFHQX1 \mb_reg[11]  ( .D(N109), .CK(clk), .Q(mb[11]) );
  DFFHQX1 \mb_reg[10]  ( .D(N108), .CK(clk), .Q(mb[10]) );
  DFFHQX1 \dout_im_reg[11]  ( .D(N143), .CK(clk), .Q(m_im[11]) );
  DFFHQX1 \dout_im_reg[10]  ( .D(N142), .CK(clk), .Q(m_im[10]) );
  DFFHQX1 \dout_im_reg[9]  ( .D(N141), .CK(clk), .Q(m_im[9]) );
  DFFHQX1 \dout_im_reg[8]  ( .D(N140), .CK(clk), .Q(m_im[8]) );
  DFFHQX1 \dout_im_reg[7]  ( .D(N139), .CK(clk), .Q(m_im[7]) );
  DFFHQX1 \dout_im_reg[6]  ( .D(N138), .CK(clk), .Q(m_im[6]) );
  DFFHQX1 \dout_im_reg[5]  ( .D(N137), .CK(clk), .Q(m_im[5]) );
  DFFHQX1 \dout_im_reg[4]  ( .D(N136), .CK(clk), .Q(m_im[4]) );
  DFFHQX1 \dout_im_reg[3]  ( .D(N135), .CK(clk), .Q(m_im[3]) );
  DFFHQX1 \dout_im_reg[2]  ( .D(N134), .CK(clk), .Q(m_im[2]) );
  DFFHQX1 \dout_im_reg[1]  ( .D(N133), .CK(clk), .Q(m_im[1]) );
  DFFHQX1 \dout_im_reg[0]  ( .D(N132), .CK(clk), .Q(m_im[0]) );
  DFFHQX1 \dout_re_reg[11]  ( .D(N131), .CK(clk), .Q(m_re[11]) );
  DFFHQX1 \dout_re_reg[10]  ( .D(N130), .CK(clk), .Q(m_re[10]) );
  DFFHQX1 \dout_re_reg[9]  ( .D(N129), .CK(clk), .Q(m_re[9]) );
  DFFHQX1 \dout_re_reg[8]  ( .D(N128), .CK(clk), .Q(m_re[8]) );
  DFFHQX1 \dout_re_reg[7]  ( .D(N127), .CK(clk), .Q(m_re[7]) );
  DFFHQX1 \dout_re_reg[6]  ( .D(N126), .CK(clk), .Q(m_re[6]) );
  DFFHQX1 \dout_re_reg[5]  ( .D(N125), .CK(clk), .Q(m_re[5]) );
  DFFHQX1 \dout_re_reg[4]  ( .D(N124), .CK(clk), .Q(m_re[4]) );
  DFFHQX1 \dout_re_reg[3]  ( .D(N123), .CK(clk), .Q(m_re[3]) );
  DFFHQX1 \dout_re_reg[2]  ( .D(N122), .CK(clk), .Q(m_re[2]) );
  DFFHQX1 \dout_re_reg[1]  ( .D(N121), .CK(clk), .Q(m_re[1]) );
  DFFHQX1 \dout_re_reg[0]  ( .D(N120), .CK(clk), .Q(m_re[0]) );
  DFFHQX1 \sc_md_reg[11]  ( .D(md[21]), .CK(clk), .Q(sc_md[11]) );
  DFFHQX1 \sc_mb_reg[11]  ( .D(mb[21]), .CK(clk), .Q(sc_mb[11]) );
  DFFHQX1 \sc_md_reg[10]  ( .D(md[20]), .CK(clk), .Q(sc_md[10]) );
  DFFHQX1 \sc_mb_reg[10]  ( .D(mb[20]), .CK(clk), .Q(sc_mb[10]) );
  DFFHQX1 \sc_md_reg[9]  ( .D(md[19]), .CK(clk), .Q(sc_md[9]) );
  DFFHQX1 \sc_mb_reg[9]  ( .D(mb[19]), .CK(clk), .Q(sc_mb[9]) );
  DFFHQX1 \sc_md_reg[8]  ( .D(md[18]), .CK(clk), .Q(sc_md[8]) );
  DFFHQX1 \sc_mb_reg[8]  ( .D(mb[18]), .CK(clk), .Q(sc_mb[8]) );
  DFFHQX1 \sc_md_reg[7]  ( .D(md[17]), .CK(clk), .Q(sc_md[7]) );
  DFFHQX1 \sc_mb_reg[7]  ( .D(mb[17]), .CK(clk), .Q(sc_mb[7]) );
  DFFHQX1 \sc_md_reg[6]  ( .D(md[16]), .CK(clk), .Q(sc_md[6]) );
  DFFHQX1 \sc_mb_reg[6]  ( .D(mb[16]), .CK(clk), .Q(sc_mb[6]) );
  DFFHQX1 \sc_md_reg[5]  ( .D(md[15]), .CK(clk), .Q(sc_md[5]) );
  DFFHQX1 \sc_mb_reg[5]  ( .D(mb[15]), .CK(clk), .Q(sc_mb[5]) );
  DFFHQX1 \sc_md_reg[4]  ( .D(md[14]), .CK(clk), .Q(sc_md[4]) );
  DFFHQX1 \sc_mb_reg[4]  ( .D(mb[14]), .CK(clk), .Q(sc_mb[4]) );
  DFFHQX1 \sc_md_reg[3]  ( .D(md[13]), .CK(clk), .Q(sc_md[3]) );
  DFFHQX1 \sc_mb_reg[3]  ( .D(mb[13]), .CK(clk), .Q(sc_mb[3]) );
  DFFHQX1 \sc_md_reg[2]  ( .D(md[12]), .CK(clk), .Q(sc_md[2]) );
  DFFHQX1 \sc_mb_reg[2]  ( .D(mb[12]), .CK(clk), .Q(sc_mb[2]) );
  DFFHQX1 \sc_md_reg[1]  ( .D(md[11]), .CK(clk), .Q(sc_md[1]) );
  DFFHQX1 \sc_mb_reg[1]  ( .D(mb[11]), .CK(clk), .Q(sc_mb[1]) );
  DFFHQX1 \sc_mb_reg[0]  ( .D(mb[10]), .CK(clk), .Q(sc_mb[0]) );
  DFFHQX1 \sc_md_reg[0]  ( .D(md[10]), .CK(clk), .Q(sc_md[0]) );
  DFFHQX1 \sc_ma_reg[11]  ( .D(ma[21]), .CK(clk), .Q(sc_ma[11]) );
  DFFHQX1 \sc_ma_reg[10]  ( .D(ma[20]), .CK(clk), .Q(sc_ma[10]) );
  DFFHQX1 \sc_ma_reg[9]  ( .D(ma[19]), .CK(clk), .Q(sc_ma[9]) );
  DFFHQX1 \sc_ma_reg[8]  ( .D(ma[18]), .CK(clk), .Q(sc_ma[8]) );
  DFFHQX1 \sc_ma_reg[7]  ( .D(ma[17]), .CK(clk), .Q(sc_ma[7]) );
  DFFHQX1 \sc_ma_reg[6]  ( .D(ma[16]), .CK(clk), .Q(sc_ma[6]) );
  DFFHQX1 \sc_ma_reg[5]  ( .D(ma[15]), .CK(clk), .Q(sc_ma[5]) );
  DFFHQX1 \sc_ma_reg[4]  ( .D(ma[14]), .CK(clk), .Q(sc_ma[4]) );
  DFFHQX1 \sc_ma_reg[3]  ( .D(ma[13]), .CK(clk), .Q(sc_ma[3]) );
  DFFHQX1 \sc_ma_reg[2]  ( .D(ma[12]), .CK(clk), .Q(sc_ma[2]) );
  DFFHQX1 \sc_ma_reg[1]  ( .D(ma[11]), .CK(clk), .Q(sc_ma[1]) );
  DFFHQX1 \sc_ma_reg[0]  ( .D(ma[10]), .CK(clk), .Q(sc_ma[0]) );
  DFFHQX1 \temp1_b_im_reg[11]  ( .D(b_im[11]), .CK(clk), .Q(temp1_b_im[11]) );
  DFFHQX1 \temp1_a_re_reg[11]  ( .D(a_re[11]), .CK(clk), .Q(temp1_a_re[11]) );
  DFFHQX1 \temp1_a_im_reg[11]  ( .D(a_im[11]), .CK(clk), .Q(temp1_a_im[11]) );
  DFFHQX1 \temp1_b_im_reg[10]  ( .D(b_im[10]), .CK(clk), .Q(temp1_b_im[10]) );
  DFFHQX1 \temp1_b_im_reg[9]  ( .D(b_im[9]), .CK(clk), .Q(temp1_b_im[9]) );
  DFFHQX1 \temp1_a_re_reg[10]  ( .D(a_re[10]), .CK(clk), .Q(temp1_a_re[10]) );
  DFFHQX1 \temp1_a_re_reg[9]  ( .D(a_re[9]), .CK(clk), .Q(temp1_a_re[9]) );
  DFFHQX1 \temp1_a_im_reg[10]  ( .D(a_im[10]), .CK(clk), .Q(temp1_a_im[10]) );
  DFFHQX1 \temp1_a_im_reg[9]  ( .D(a_im[9]), .CK(clk), .Q(temp1_a_im[9]) );
  DFFHQX1 \temp1_b_im_reg[8]  ( .D(b_im[8]), .CK(clk), .Q(temp1_b_im[8]) );
  DFFHQX1 \temp1_b_im_reg[7]  ( .D(b_im[7]), .CK(clk), .Q(temp1_b_im[7]) );
  DFFHQX1 \temp1_b_im_reg[6]  ( .D(b_im[6]), .CK(clk), .Q(temp1_b_im[6]) );
  DFFHQX1 \temp1_b_im_reg[2]  ( .D(b_im[2]), .CK(clk), .Q(temp1_b_im[2]) );
  DFFHQX1 \temp1_b_im_reg[3]  ( .D(b_im[3]), .CK(clk), .Q(temp1_b_im[3]) );
  DFFHQX1 \temp1_b_im_reg[1]  ( .D(b_im[1]), .CK(clk), .Q(temp1_b_im[1]) );
  DFFHQX2 \temp1_b_im_reg[0]  ( .D(b_im[0]), .CK(clk), .Q(temp1_b_im[0]) );
  DFFHQX1 \temp1_b_im_reg[5]  ( .D(b_im[5]), .CK(clk), .Q(temp1_b_im[5]) );
  DFFHQX1 \temp1_b_im_reg[4]  ( .D(b_im[4]), .CK(clk), .Q(temp1_b_im[4]) );
  DFFHQX1 \temp1_a_re_reg[8]  ( .D(a_re[8]), .CK(clk), .Q(temp1_a_re[8]) );
  DFFHQX1 \temp1_a_re_reg[7]  ( .D(a_re[7]), .CK(clk), .Q(temp1_a_re[7]) );
  DFFHQX1 \temp1_a_re_reg[6]  ( .D(a_re[6]), .CK(clk), .Q(temp1_a_re[6]) );
  DFFHQX1 \temp1_a_re_reg[2]  ( .D(a_re[2]), .CK(clk), .Q(temp1_a_re[2]) );
  DFFHQX1 \temp1_a_re_reg[3]  ( .D(a_re[3]), .CK(clk), .Q(temp1_a_re[3]) );
  DFFHQX1 \temp1_a_re_reg[1]  ( .D(a_re[1]), .CK(clk), .Q(temp1_a_re[1]) );
  DFFHQX2 \temp1_a_re_reg[0]  ( .D(a_re[0]), .CK(clk), .Q(temp1_a_re[0]) );
  DFFHQX1 \temp1_a_re_reg[5]  ( .D(a_re[5]), .CK(clk), .Q(temp1_a_re[5]) );
  DFFHQX1 \temp1_a_re_reg[4]  ( .D(a_re[4]), .CK(clk), .Q(temp1_a_re[4]) );
  DFFHQX1 \temp1_a_im_reg[8]  ( .D(a_im[8]), .CK(clk), .Q(temp1_a_im[8]) );
  DFFHQX1 \temp1_a_im_reg[7]  ( .D(a_im[7]), .CK(clk), .Q(temp1_a_im[7]) );
  DFFHQX1 \temp1_a_im_reg[6]  ( .D(a_im[6]), .CK(clk), .Q(temp1_a_im[6]) );
  DFFHQX1 \temp1_a_im_reg[2]  ( .D(a_im[2]), .CK(clk), .Q(temp1_a_im[2]) );
  DFFHQX1 \temp1_a_im_reg[3]  ( .D(a_im[3]), .CK(clk), .Q(temp1_a_im[3]) );
  DFFHQX1 \temp1_a_im_reg[1]  ( .D(a_im[1]), .CK(clk), .Q(temp1_a_im[1]) );
  DFFHQX2 \temp1_a_im_reg[0]  ( .D(a_im[0]), .CK(clk), .Q(temp1_a_im[0]) );
  DFFHQX1 \temp1_a_im_reg[5]  ( .D(a_im[5]), .CK(clk), .Q(temp1_a_im[5]) );
  DFFHQX1 \temp1_a_im_reg[4]  ( .D(a_im[4]), .CK(clk), .Q(temp1_a_im[4]) );
  DFFHQXL \md_reg[20]  ( .D(N94), .CK(clk), .Q(md[20]) );
  DFFHQXL \md_reg[18]  ( .D(N92), .CK(clk), .Q(md[18]) );
  DFFHQXL \md_reg[19]  ( .D(N93), .CK(clk), .Q(md[19]) );
  DFFHQXL \md_reg[21]  ( .D(N95), .CK(clk), .Q(md[21]) );
  DFFHQXL \mb_reg[15]  ( .D(N113), .CK(clk), .Q(mb[15]) );
  DFFHQXL \ma_reg[14]  ( .D(N100), .CK(clk), .Q(ma[14]) );
  DFFHQXL \ma_reg[15]  ( .D(N101), .CK(clk), .Q(ma[15]) );
  DFFHQXL \ma_reg[16]  ( .D(N102), .CK(clk), .Q(ma[16]) );
  DFFHQXL \md_reg[14]  ( .D(N88), .CK(clk), .Q(md[14]) );
  DFFHQXL \md_reg[15]  ( .D(N89), .CK(clk), .Q(md[15]) );
  DFFHQXL \ma_reg[21]  ( .D(N107), .CK(clk), .Q(ma[21]) );
  DFFHQXL \ma_reg[19]  ( .D(N105), .CK(clk), .Q(ma[19]) );
  DFFHQXL \ma_reg[20]  ( .D(N106), .CK(clk), .Q(ma[20]) );
  DFFHQXL \mb_reg[16]  ( .D(N114), .CK(clk), .Q(mb[16]) );
  DFFHQXL \mb_reg[21]  ( .D(N119), .CK(clk), .Q(mb[21]) );
  DFFHQXL \mb_reg[19]  ( .D(N117), .CK(clk), .Q(mb[19]) );
  DFFHQXL \mb_reg[18]  ( .D(N116), .CK(clk), .Q(mb[18]) );
  DFFHQXL \mb_reg[20]  ( .D(N118), .CK(clk), .Q(mb[20]) );
  DFFHQXL \md_reg[17]  ( .D(N91), .CK(clk), .Q(md[17]) );
  DFFHQXL \ma_reg[18]  ( .D(N104), .CK(clk), .Q(ma[18]) );
  DFFHQX1 \sub_br_bi_reg[9]  ( .D(N69), .CK(clk), .Q(sub_br_bi[9]) );
  multiply_WIDTH12_0_DW01_add_0_DW01_add_24 add_77 ( .A(sc_md), .B(sc_mb), 
        .CI(1'b0), .SUM({N143, N142, N141, N140, N139, N138, N137, N136, N135, 
        N134, N133, N132}) );
  multiply_WIDTH12_0_DW01_add_1_DW01_add_25 add_76 ( .A(sc_md), .B(sc_ma), 
        .CI(1'b0), .SUM({N131, N130, N129, N128, N127, N126, N125, N124, N123, 
        N122, N121, N120}) );
  multiply_WIDTH12_0_DW01_add_2_DW01_add_26 add_47 ( .A(b_re), .B(b_im), .CI(
        1'b0), .SUM({N83, N82, N81, N80, N79, N78, N77, N76, N75, N74, N73, 
        N72}) );
  multiply_WIDTH12_0_DW01_inc_1_DW01_inc_30 add_46 ( .A({N36, N37, N38, N39, 
        N40, N41, N42, N43, N44, N45, N46, N47}), .SUM({N59, N58, N57, N56, 
        N55, N54, N53, N52, N51, N50, N49, N48}) );
  multiply_WIDTH12_0_DW01_add_4_DW01_add_80 add_46_2 ( .A(b_re), .B({N59, N58, 
        N57, N56, N55, N54, N53, N52, N51, N50, N49, N48}), .CI(1'b0), .SUM({
        N71, N70, N69, N68, N67, N66, N65, N64, N63, N62, N61, N60}) );
  multiply_WIDTH12_0_DW01_inc_0_DW01_inc_28 add_45 ( .A({N0, N1, N2, N3, N4, 
        N5, N6, N7, N8, N9, N10, N11}), .SUM({N23, N22, N21, N20, N19, N18, 
        N17, N16, N15, N14, N13, N12}) );
  multiply_WIDTH12_0_DW01_add_3_DW01_add_78 add_45_2 ( .A(a_re), .B({N23, N22, 
        N21, N20, N19, N18, N17, N16, N15, N14, N13, N12}), .CI(1'b0), .SUM({
        N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24}) );
  multiply_WIDTH12_0_DW_mult_tc_7 mult_62 ( .a(sub_ar_ai), .b(temp1_b_im), 
        .product({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, N95, N94, 
        N93, N92, N91, N90, N89, N88, N87, N86, N85, N84, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11}) );
  multiply_WIDTH12_0_DW_mult_tc_9 mult_63 ( .a(sub_br_bi), .b(temp1_a_re), 
        .product({SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, N107, 
        N106, N105, N104, N103, N102, N101, N100, N99, N98, N97, N96, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23}) );
  multiply_WIDTH12_0_DW_mult_tc_11 mult_64 ( .a(add_br_bi), .b(temp1_a_im), 
        .product({SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, N119, 
        N118, N117, N116, N115, N114, N113, N112, N111, N110, N109, N108, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33, 
        SYNOPSYS_UNCONNECTED__34, SYNOPSYS_UNCONNECTED__35}) );
  DFFHQX4 \sub_ar_ai_reg[11]  ( .D(N35), .CK(clk), .Q(sub_ar_ai[11]) );
endmodule


module sdfunit4_WIDTH12_DEPTH3 ( clk, di_en, reset, x_re, x_im, y_re, y_im, 
        do_en );
  input [11:0] x_re;
  input [11:0] x_im;
  output [11:0] y_re;
  output [11:0] y_im;
  input clk, di_en, reset;
  output do_en;
  wire   sel, N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14,
         N15, N16, N17, N18, N19, N20, N21, N22, N23, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, \temp1_en[0] , \temp2_en[0] , \temp3_en[0] , \temp4_en[0] , N73,
         en, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87,
         N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74;
  wire   [3:0] addr;
  wire   [11:0] x_re_r;
  wire   [11:0] x_im_r;
  wire   [11:0] bf_y1_re;
  wire   [11:0] dx_re;
  wire   [11:0] bf_y1_im;
  wire   [11:0] dx_im;
  wire   [11:0] dy_re;
  wire   [11:0] dy_im;
  wire   [11:0] bf_y0_re;
  wire   [11:0] bf_y0_im;
  wire   [11:0] mux2_re;
  wire   [11:0] mux2_im;
  wire   [11:0] tw_re;
  wire   [11:0] tw_im;
  wire   [11:0] dout_re;
  wire   [11:0] dout_im;
  wire   [11:0] temp1_re;
  wire   [11:0] temp1_im;
  wire   [11:0] temp2_re;
  wire   [11:0] temp2_im;
  wire   [11:0] temp4_re;
  wire   [11:0] temp3_re;
  wire   [11:0] temp4_im;
  wire   [11:0] temp3_im;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;

  INVX1 U3 ( .A(n1), .Y(N98) );
  AOI22X1 U4 ( .A0(en), .A1(dout_im[0]), .B0(temp4_im[0]), .B1(n2), .Y(n1) );
  INVX1 U5 ( .A(n3), .Y(N97) );
  INVX1 U7 ( .A(n4), .Y(N96) );
  INVX1 U9 ( .A(n5), .Y(N95) );
  INVX1 U11 ( .A(n6), .Y(N94) );
  INVX1 U13 ( .A(n7), .Y(N93) );
  INVX1 U15 ( .A(n8), .Y(N92) );
  AOI22X1 U16 ( .A0(dout_im[6]), .A1(en), .B0(temp4_im[6]), .B1(n2), .Y(n8) );
  INVX1 U17 ( .A(n9), .Y(N91) );
  AOI22X1 U18 ( .A0(dout_im[7]), .A1(en), .B0(temp4_im[7]), .B1(n2), .Y(n9) );
  INVX1 U19 ( .A(n10), .Y(N90) );
  AOI22X1 U20 ( .A0(dout_im[8]), .A1(en), .B0(temp4_im[8]), .B1(n2), .Y(n10)
         );
  AND2X1 U21 ( .A(x_re[2]), .B(di_en), .Y(N9) );
  INVX1 U22 ( .A(n11), .Y(N89) );
  AOI22X1 U23 ( .A0(dout_im[9]), .A1(en), .B0(temp4_im[9]), .B1(n2), .Y(n11)
         );
  INVX1 U24 ( .A(n12), .Y(N88) );
  AOI22X1 U25 ( .A0(dout_im[10]), .A1(en), .B0(temp4_im[10]), .B1(n2), .Y(n12)
         );
  INVX1 U26 ( .A(n13), .Y(N87) );
  AOI22X1 U27 ( .A0(dout_im[11]), .A1(en), .B0(temp4_im[11]), .B1(n2), .Y(n13)
         );
  INVX1 U28 ( .A(n14), .Y(N86) );
  AOI22X1 U29 ( .A0(dout_re[0]), .A1(en), .B0(temp4_re[0]), .B1(n2), .Y(n14)
         );
  INVX1 U30 ( .A(n15), .Y(N85) );
  AOI22X1 U31 ( .A0(dout_re[1]), .A1(en), .B0(temp4_re[1]), .B1(n2), .Y(n15)
         );
  INVX1 U32 ( .A(n16), .Y(N84) );
  AOI22X1 U33 ( .A0(dout_re[2]), .A1(en), .B0(temp4_re[2]), .B1(n2), .Y(n16)
         );
  INVX1 U34 ( .A(n17), .Y(N83) );
  AOI22X1 U35 ( .A0(dout_re[3]), .A1(en), .B0(temp4_re[3]), .B1(n2), .Y(n17)
         );
  INVX1 U36 ( .A(n18), .Y(N82) );
  AOI22X1 U37 ( .A0(dout_re[4]), .A1(en), .B0(temp4_re[4]), .B1(n2), .Y(n18)
         );
  INVX1 U38 ( .A(n19), .Y(N81) );
  AOI22X1 U39 ( .A0(dout_re[5]), .A1(en), .B0(temp4_re[5]), .B1(n2), .Y(n19)
         );
  INVX1 U40 ( .A(n20), .Y(N80) );
  AOI22X1 U41 ( .A0(dout_re[6]), .A1(en), .B0(temp4_re[6]), .B1(n2), .Y(n20)
         );
  AND2X1 U42 ( .A(x_re[3]), .B(di_en), .Y(N8) );
  INVX1 U43 ( .A(n21), .Y(N79) );
  AOI22X1 U44 ( .A0(dout_re[7]), .A1(en), .B0(temp4_re[7]), .B1(n2), .Y(n21)
         );
  INVX1 U45 ( .A(n22), .Y(N78) );
  AOI22X1 U46 ( .A0(dout_re[8]), .A1(en), .B0(temp4_re[8]), .B1(n2), .Y(n22)
         );
  INVX1 U47 ( .A(n23), .Y(N77) );
  AOI22X1 U48 ( .A0(dout_re[9]), .A1(en), .B0(temp4_re[9]), .B1(n2), .Y(n23)
         );
  INVX1 U49 ( .A(n24), .Y(N76) );
  AOI22X1 U50 ( .A0(dout_re[10]), .A1(en), .B0(temp4_re[10]), .B1(n2), .Y(n24)
         );
  INVX1 U51 ( .A(n25), .Y(N75) );
  AOI22X1 U52 ( .A0(dout_re[11]), .A1(en), .B0(temp4_re[11]), .B1(n2), .Y(n25)
         );
  OR4X1 U54 ( .A(addr[1]), .B(addr[0]), .C(addr[3]), .D(addr[2]), .Y(N73) );
  INVX1 U55 ( .A(n26), .Y(N72) );
  AOI22X1 U56 ( .A0(sel), .A1(bf_y0_im[0]), .B0(dy_im[0]), .B1(n27), .Y(n26)
         );
  INVX1 U57 ( .A(n28), .Y(N71) );
  AOI22X1 U58 ( .A0(bf_y0_im[1]), .A1(sel), .B0(dy_im[1]), .B1(n27), .Y(n28)
         );
  INVX1 U59 ( .A(n29), .Y(N70) );
  AOI22X1 U60 ( .A0(bf_y0_im[2]), .A1(sel), .B0(dy_im[2]), .B1(n27), .Y(n29)
         );
  AND2X1 U61 ( .A(x_re[4]), .B(di_en), .Y(N7) );
  INVX1 U62 ( .A(n30), .Y(N69) );
  AOI22X1 U63 ( .A0(bf_y0_im[3]), .A1(sel), .B0(dy_im[3]), .B1(n27), .Y(n30)
         );
  INVX1 U64 ( .A(n31), .Y(N68) );
  AOI22X1 U65 ( .A0(bf_y0_im[4]), .A1(sel), .B0(dy_im[4]), .B1(n27), .Y(n31)
         );
  INVX1 U66 ( .A(n32), .Y(N67) );
  AOI22X1 U67 ( .A0(bf_y0_im[5]), .A1(sel), .B0(dy_im[5]), .B1(n27), .Y(n32)
         );
  INVX1 U68 ( .A(n33), .Y(N66) );
  AOI22X1 U69 ( .A0(bf_y0_im[6]), .A1(sel), .B0(dy_im[6]), .B1(n27), .Y(n33)
         );
  INVX1 U70 ( .A(n34), .Y(N65) );
  AOI22X1 U71 ( .A0(bf_y0_im[7]), .A1(sel), .B0(dy_im[7]), .B1(n27), .Y(n34)
         );
  INVX1 U72 ( .A(n35), .Y(N64) );
  AOI22X1 U73 ( .A0(bf_y0_im[8]), .A1(sel), .B0(dy_im[8]), .B1(n27), .Y(n35)
         );
  INVX1 U74 ( .A(n36), .Y(N63) );
  AOI22X1 U75 ( .A0(bf_y0_im[9]), .A1(sel), .B0(dy_im[9]), .B1(n27), .Y(n36)
         );
  INVX1 U76 ( .A(n37), .Y(N62) );
  AOI22X1 U77 ( .A0(bf_y0_im[10]), .A1(sel), .B0(dy_im[10]), .B1(n27), .Y(n37)
         );
  INVX1 U78 ( .A(n38), .Y(N61) );
  AOI22X1 U79 ( .A0(bf_y0_im[11]), .A1(sel), .B0(dy_im[11]), .B1(n27), .Y(n38)
         );
  INVX1 U80 ( .A(n39), .Y(N60) );
  AOI22X1 U81 ( .A0(bf_y0_re[0]), .A1(sel), .B0(dy_re[0]), .B1(n27), .Y(n39)
         );
  AND2X1 U82 ( .A(x_re[5]), .B(di_en), .Y(N6) );
  INVX1 U83 ( .A(n40), .Y(N59) );
  AOI22X1 U84 ( .A0(bf_y0_re[1]), .A1(sel), .B0(dy_re[1]), .B1(n27), .Y(n40)
         );
  INVX1 U85 ( .A(n41), .Y(N58) );
  AOI22X1 U86 ( .A0(bf_y0_re[2]), .A1(sel), .B0(dy_re[2]), .B1(n27), .Y(n41)
         );
  INVX1 U87 ( .A(n42), .Y(N57) );
  AOI22X1 U88 ( .A0(bf_y0_re[3]), .A1(sel), .B0(dy_re[3]), .B1(n27), .Y(n42)
         );
  INVX1 U89 ( .A(n43), .Y(N56) );
  AOI22X1 U90 ( .A0(bf_y0_re[4]), .A1(sel), .B0(dy_re[4]), .B1(n27), .Y(n43)
         );
  INVX1 U91 ( .A(n44), .Y(N55) );
  AOI22X1 U92 ( .A0(bf_y0_re[5]), .A1(sel), .B0(dy_re[5]), .B1(n27), .Y(n44)
         );
  INVX1 U93 ( .A(n45), .Y(N54) );
  AOI22X1 U94 ( .A0(bf_y0_re[6]), .A1(sel), .B0(dy_re[6]), .B1(n27), .Y(n45)
         );
  INVX1 U95 ( .A(n46), .Y(N53) );
  AOI22X1 U96 ( .A0(bf_y0_re[7]), .A1(sel), .B0(dy_re[7]), .B1(n27), .Y(n46)
         );
  INVX1 U97 ( .A(n47), .Y(N52) );
  AOI22X1 U98 ( .A0(bf_y0_re[8]), .A1(sel), .B0(dy_re[8]), .B1(n27), .Y(n47)
         );
  INVX1 U99 ( .A(n48), .Y(N51) );
  AOI22X1 U100 ( .A0(bf_y0_re[9]), .A1(sel), .B0(dy_re[9]), .B1(n27), .Y(n48)
         );
  INVX1 U101 ( .A(n49), .Y(N50) );
  AOI22X1 U102 ( .A0(bf_y0_re[10]), .A1(sel), .B0(dy_re[10]), .B1(n27), .Y(n49) );
  AND2X1 U103 ( .A(x_re[6]), .B(di_en), .Y(N5) );
  INVX1 U104 ( .A(n50), .Y(N49) );
  AOI22X1 U105 ( .A0(bf_y0_re[11]), .A1(sel), .B0(dy_re[11]), .B1(n27), .Y(n50) );
  INVX1 U106 ( .A(n51), .Y(N48) );
  AOI22X1 U107 ( .A0(bf_y1_im[0]), .A1(sel), .B0(x_im_r[0]), .B1(n27), .Y(n51)
         );
  INVX1 U108 ( .A(n52), .Y(N47) );
  AOI22X1 U109 ( .A0(bf_y1_im[1]), .A1(sel), .B0(x_im_r[1]), .B1(n27), .Y(n52)
         );
  INVX1 U110 ( .A(n53), .Y(N46) );
  AOI22X1 U111 ( .A0(bf_y1_im[2]), .A1(sel), .B0(x_im_r[2]), .B1(n27), .Y(n53)
         );
  INVX1 U112 ( .A(n54), .Y(N45) );
  AOI22X1 U113 ( .A0(bf_y1_im[3]), .A1(sel), .B0(x_im_r[3]), .B1(n27), .Y(n54)
         );
  INVX1 U114 ( .A(n55), .Y(N44) );
  AOI22X1 U115 ( .A0(bf_y1_im[4]), .A1(sel), .B0(x_im_r[4]), .B1(n27), .Y(n55)
         );
  INVX1 U116 ( .A(n56), .Y(N43) );
  AOI22X1 U117 ( .A0(bf_y1_im[5]), .A1(sel), .B0(x_im_r[5]), .B1(n27), .Y(n56)
         );
  INVX1 U118 ( .A(n57), .Y(N42) );
  AOI22X1 U119 ( .A0(bf_y1_im[6]), .A1(sel), .B0(x_im_r[6]), .B1(n27), .Y(n57)
         );
  INVX1 U120 ( .A(n58), .Y(N41) );
  AOI22X1 U121 ( .A0(bf_y1_im[7]), .A1(sel), .B0(x_im_r[7]), .B1(n27), .Y(n58)
         );
  INVX1 U122 ( .A(n59), .Y(N40) );
  AOI22X1 U123 ( .A0(bf_y1_im[8]), .A1(sel), .B0(x_im_r[8]), .B1(n27), .Y(n59)
         );
  AND2X1 U124 ( .A(x_re[7]), .B(di_en), .Y(N4) );
  INVX1 U125 ( .A(n60), .Y(N39) );
  AOI22X1 U126 ( .A0(bf_y1_im[9]), .A1(sel), .B0(x_im_r[9]), .B1(n27), .Y(n60)
         );
  INVX1 U127 ( .A(n61), .Y(N38) );
  AOI22X1 U128 ( .A0(bf_y1_im[10]), .A1(sel), .B0(x_im_r[10]), .B1(n27), .Y(
        n61) );
  INVX1 U129 ( .A(n62), .Y(N37) );
  AOI22X1 U130 ( .A0(bf_y1_im[11]), .A1(sel), .B0(x_im_r[11]), .B1(n27), .Y(
        n62) );
  INVX1 U131 ( .A(n63), .Y(N36) );
  AOI22X1 U132 ( .A0(bf_y1_re[0]), .A1(sel), .B0(x_re_r[0]), .B1(n27), .Y(n63)
         );
  INVX1 U133 ( .A(n64), .Y(N35) );
  AOI22X1 U134 ( .A0(bf_y1_re[1]), .A1(sel), .B0(x_re_r[1]), .B1(n27), .Y(n64)
         );
  INVX1 U135 ( .A(n65), .Y(N34) );
  AOI22X1 U136 ( .A0(bf_y1_re[2]), .A1(sel), .B0(x_re_r[2]), .B1(n27), .Y(n65)
         );
  INVX1 U137 ( .A(n66), .Y(N33) );
  AOI22X1 U138 ( .A0(bf_y1_re[3]), .A1(sel), .B0(x_re_r[3]), .B1(n27), .Y(n66)
         );
  INVX1 U139 ( .A(n67), .Y(N32) );
  AOI22X1 U140 ( .A0(bf_y1_re[4]), .A1(sel), .B0(x_re_r[4]), .B1(n27), .Y(n67)
         );
  INVX1 U141 ( .A(n68), .Y(N31) );
  AOI22X1 U142 ( .A0(bf_y1_re[5]), .A1(sel), .B0(x_re_r[5]), .B1(n27), .Y(n68)
         );
  INVX1 U143 ( .A(n69), .Y(N30) );
  AOI22X1 U144 ( .A0(bf_y1_re[6]), .A1(sel), .B0(x_re_r[6]), .B1(n27), .Y(n69)
         );
  AND2X1 U145 ( .A(x_re[8]), .B(di_en), .Y(N3) );
  INVX1 U146 ( .A(n70), .Y(N29) );
  AOI22X1 U147 ( .A0(bf_y1_re[7]), .A1(sel), .B0(x_re_r[7]), .B1(n27), .Y(n70)
         );
  INVX1 U148 ( .A(n71), .Y(N28) );
  AOI22X1 U149 ( .A0(bf_y1_re[8]), .A1(sel), .B0(x_re_r[8]), .B1(n27), .Y(n71)
         );
  INVX1 U150 ( .A(n72), .Y(N27) );
  AOI22X1 U151 ( .A0(bf_y1_re[9]), .A1(sel), .B0(x_re_r[9]), .B1(n27), .Y(n72)
         );
  INVX1 U152 ( .A(n73), .Y(N26) );
  AOI22X1 U153 ( .A0(bf_y1_re[10]), .A1(sel), .B0(x_re_r[10]), .B1(n27), .Y(
        n73) );
  INVX1 U154 ( .A(n74), .Y(N25) );
  AOI22X1 U155 ( .A0(bf_y1_re[11]), .A1(sel), .B0(x_re_r[11]), .B1(n27), .Y(
        n74) );
  AND2X1 U157 ( .A(x_im[0]), .B(di_en), .Y(N23) );
  AND2X1 U158 ( .A(x_im[1]), .B(di_en), .Y(N22) );
  AND2X1 U159 ( .A(x_im[2]), .B(di_en), .Y(N21) );
  AND2X1 U160 ( .A(x_im[3]), .B(di_en), .Y(N20) );
  AND2X1 U161 ( .A(x_re[9]), .B(di_en), .Y(N2) );
  AND2X1 U162 ( .A(x_im[4]), .B(di_en), .Y(N19) );
  AND2X1 U163 ( .A(x_im[5]), .B(di_en), .Y(N18) );
  AND2X1 U164 ( .A(x_im[6]), .B(di_en), .Y(N17) );
  AND2X1 U165 ( .A(x_im[7]), .B(di_en), .Y(N16) );
  AND2X1 U166 ( .A(x_im[8]), .B(di_en), .Y(N15) );
  AND2X1 U167 ( .A(x_im[9]), .B(di_en), .Y(N14) );
  AND2X1 U168 ( .A(x_im[10]), .B(di_en), .Y(N13) );
  AND2X1 U169 ( .A(x_im[11]), .B(di_en), .Y(N12) );
  AND2X1 U170 ( .A(x_re[0]), .B(di_en), .Y(N11) );
  AND2X1 U171 ( .A(x_re[1]), .B(di_en), .Y(N10) );
  AND2X1 U172 ( .A(x_re[10]), .B(di_en), .Y(N1) );
  AND2X1 U173 ( .A(x_re[11]), .B(di_en), .Y(N0) );
  DFFHQX1 \x_re_r_reg[11]  ( .D(N0), .CK(clk), .Q(x_re_r[11]) );
  DFFHQX1 \x_re_r_reg[10]  ( .D(N1), .CK(clk), .Q(x_re_r[10]) );
  DFFHQX1 \x_re_r_reg[9]  ( .D(N2), .CK(clk), .Q(x_re_r[9]) );
  DFFHQX1 \x_re_r_reg[8]  ( .D(N3), .CK(clk), .Q(x_re_r[8]) );
  DFFHQX1 \x_re_r_reg[7]  ( .D(N4), .CK(clk), .Q(x_re_r[7]) );
  DFFHQX1 \x_re_r_reg[6]  ( .D(N5), .CK(clk), .Q(x_re_r[6]) );
  DFFHQX1 \x_re_r_reg[5]  ( .D(N6), .CK(clk), .Q(x_re_r[5]) );
  DFFHQX1 \x_re_r_reg[4]  ( .D(N7), .CK(clk), .Q(x_re_r[4]) );
  DFFHQX1 \x_re_r_reg[3]  ( .D(N8), .CK(clk), .Q(x_re_r[3]) );
  DFFHQX1 \x_re_r_reg[2]  ( .D(N9), .CK(clk), .Q(x_re_r[2]) );
  DFFHQX1 \x_re_r_reg[1]  ( .D(N10), .CK(clk), .Q(x_re_r[1]) );
  DFFHQX1 \x_re_r_reg[0]  ( .D(N11), .CK(clk), .Q(x_re_r[0]) );
  DFFHQX1 \x_im_r_reg[11]  ( .D(N12), .CK(clk), .Q(x_im_r[11]) );
  DFFHQX1 \x_im_r_reg[10]  ( .D(N13), .CK(clk), .Q(x_im_r[10]) );
  DFFHQX1 \x_im_r_reg[9]  ( .D(N14), .CK(clk), .Q(x_im_r[9]) );
  DFFHQX1 \x_im_r_reg[8]  ( .D(N15), .CK(clk), .Q(x_im_r[8]) );
  DFFHQX1 \x_im_r_reg[7]  ( .D(N16), .CK(clk), .Q(x_im_r[7]) );
  DFFHQX1 \x_im_r_reg[6]  ( .D(N17), .CK(clk), .Q(x_im_r[6]) );
  DFFHQX1 \x_im_r_reg[5]  ( .D(N18), .CK(clk), .Q(x_im_r[5]) );
  DFFHQX1 \x_im_r_reg[4]  ( .D(N19), .CK(clk), .Q(x_im_r[4]) );
  DFFHQX1 \x_im_r_reg[3]  ( .D(N20), .CK(clk), .Q(x_im_r[3]) );
  DFFHQX1 \x_im_r_reg[2]  ( .D(N21), .CK(clk), .Q(x_im_r[2]) );
  DFFHQX1 \x_im_r_reg[1]  ( .D(N22), .CK(clk), .Q(x_im_r[1]) );
  DFFHQX1 \x_im_r_reg[0]  ( .D(N23), .CK(clk), .Q(x_im_r[0]) );
  DFFHQXL \dx_im_reg[0]  ( .D(N48), .CK(clk), .Q(dx_im[0]) );
  DFFHQXL \dx_im_reg[1]  ( .D(N47), .CK(clk), .Q(dx_im[1]) );
  DFFHQXL \dx_im_reg[2]  ( .D(N46), .CK(clk), .Q(dx_im[2]) );
  DFFHQXL \dx_im_reg[3]  ( .D(N45), .CK(clk), .Q(dx_im[3]) );
  DFFHQXL \dx_im_reg[4]  ( .D(N44), .CK(clk), .Q(dx_im[4]) );
  DFFHQXL \dx_im_reg[5]  ( .D(N43), .CK(clk), .Q(dx_im[5]) );
  DFFHQXL \dx_im_reg[6]  ( .D(N42), .CK(clk), .Q(dx_im[6]) );
  DFFHQXL \dx_im_reg[7]  ( .D(N41), .CK(clk), .Q(dx_im[7]) );
  DFFHQXL \dx_im_reg[8]  ( .D(N40), .CK(clk), .Q(dx_im[8]) );
  DFFHQXL \dx_im_reg[9]  ( .D(N39), .CK(clk), .Q(dx_im[9]) );
  DFFHQXL \dx_im_reg[10]  ( .D(N38), .CK(clk), .Q(dx_im[10]) );
  DFFHQXL \dx_im_reg[11]  ( .D(N37), .CK(clk), .Q(dx_im[11]) );
  DFFHQXL \dx_re_reg[0]  ( .D(N36), .CK(clk), .Q(dx_re[0]) );
  DFFHQXL \dx_re_reg[1]  ( .D(N35), .CK(clk), .Q(dx_re[1]) );
  DFFHQXL \dx_re_reg[2]  ( .D(N34), .CK(clk), .Q(dx_re[2]) );
  DFFHQXL \dx_re_reg[3]  ( .D(N33), .CK(clk), .Q(dx_re[3]) );
  DFFHQXL \dx_re_reg[4]  ( .D(N32), .CK(clk), .Q(dx_re[4]) );
  DFFHQXL \dx_re_reg[5]  ( .D(N31), .CK(clk), .Q(dx_re[5]) );
  DFFHQXL \dx_re_reg[6]  ( .D(N30), .CK(clk), .Q(dx_re[6]) );
  DFFHQXL \dx_re_reg[7]  ( .D(N29), .CK(clk), .Q(dx_re[7]) );
  DFFHQXL \dx_re_reg[8]  ( .D(N28), .CK(clk), .Q(dx_re[8]) );
  DFFHQXL \dx_re_reg[9]  ( .D(N27), .CK(clk), .Q(dx_re[9]) );
  DFFHQXL \dx_re_reg[11]  ( .D(N25), .CK(clk), .Q(dx_re[11]) );
  DFFHQXL \mux2_re_reg[11]  ( .D(N49), .CK(clk), .Q(mux2_re[11]) );
  DFFHQXL \mux2_re_reg[10]  ( .D(N50), .CK(clk), .Q(mux2_re[10]) );
  DFFHQXL \mux2_re_reg[9]  ( .D(N51), .CK(clk), .Q(mux2_re[9]) );
  DFFHQXL \mux2_re_reg[8]  ( .D(N52), .CK(clk), .Q(mux2_re[8]) );
  DFFHQXL \mux2_re_reg[7]  ( .D(N53), .CK(clk), .Q(mux2_re[7]) );
  DFFHQXL \mux2_re_reg[6]  ( .D(N54), .CK(clk), .Q(mux2_re[6]) );
  DFFHQXL \mux2_re_reg[5]  ( .D(N55), .CK(clk), .Q(mux2_re[5]) );
  DFFHQXL \mux2_re_reg[4]  ( .D(N56), .CK(clk), .Q(mux2_re[4]) );
  DFFHQXL \mux2_re_reg[3]  ( .D(N57), .CK(clk), .Q(mux2_re[3]) );
  DFFHQXL \mux2_re_reg[2]  ( .D(N58), .CK(clk), .Q(mux2_re[2]) );
  DFFHQXL \mux2_re_reg[1]  ( .D(N59), .CK(clk), .Q(mux2_re[1]) );
  DFFHQXL \mux2_re_reg[0]  ( .D(N60), .CK(clk), .Q(mux2_re[0]) );
  DFFHQXL \mux2_im_reg[11]  ( .D(N61), .CK(clk), .Q(mux2_im[11]) );
  DFFHQXL \mux2_im_reg[10]  ( .D(N62), .CK(clk), .Q(mux2_im[10]) );
  DFFHQXL \mux2_im_reg[9]  ( .D(N63), .CK(clk), .Q(mux2_im[9]) );
  DFFHQXL \mux2_im_reg[8]  ( .D(N64), .CK(clk), .Q(mux2_im[8]) );
  DFFHQXL \mux2_im_reg[7]  ( .D(N65), .CK(clk), .Q(mux2_im[7]) );
  DFFHQXL \mux2_im_reg[6]  ( .D(N66), .CK(clk), .Q(mux2_im[6]) );
  DFFHQXL \mux2_im_reg[5]  ( .D(N67), .CK(clk), .Q(mux2_im[5]) );
  DFFHQXL \mux2_im_reg[4]  ( .D(N68), .CK(clk), .Q(mux2_im[4]) );
  DFFHQXL \mux2_im_reg[3]  ( .D(N69), .CK(clk), .Q(mux2_im[3]) );
  DFFHQXL \mux2_im_reg[2]  ( .D(N70), .CK(clk), .Q(mux2_im[2]) );
  DFFHQXL \mux2_im_reg[1]  ( .D(N71), .CK(clk), .Q(mux2_im[1]) );
  DFFHQXL \mux2_im_reg[0]  ( .D(N72), .CK(clk), .Q(mux2_im[0]) );
  DFFHQX1 \temp1_en_reg[0]  ( .D(N73), .CK(clk), .Q(\temp1_en[0] ) );
  DFFHQX1 \y_re_reg[11]  ( .D(N75), .CK(clk), .Q(y_re[11]) );
  DFFHQX1 \y_re_reg[10]  ( .D(N76), .CK(clk), .Q(y_re[10]) );
  DFFHQX1 \y_re_reg[9]  ( .D(N77), .CK(clk), .Q(y_re[9]) );
  DFFHQX1 \y_re_reg[8]  ( .D(N78), .CK(clk), .Q(y_re[8]) );
  DFFHQX1 \y_re_reg[7]  ( .D(N79), .CK(clk), .Q(y_re[7]) );
  DFFHQX1 \y_re_reg[6]  ( .D(N80), .CK(clk), .Q(y_re[6]) );
  DFFHQX1 \y_re_reg[5]  ( .D(N81), .CK(clk), .Q(y_re[5]) );
  DFFHQX1 \y_re_reg[4]  ( .D(N82), .CK(clk), .Q(y_re[4]) );
  DFFHQX1 \y_re_reg[3]  ( .D(N83), .CK(clk), .Q(y_re[3]) );
  DFFHQX1 \y_re_reg[2]  ( .D(N84), .CK(clk), .Q(y_re[2]) );
  DFFHQX1 \y_re_reg[1]  ( .D(N85), .CK(clk), .Q(y_re[1]) );
  DFFHQX1 \y_re_reg[0]  ( .D(N86), .CK(clk), .Q(y_re[0]) );
  DFFHQX1 \y_im_reg[11]  ( .D(N87), .CK(clk), .Q(y_im[11]) );
  DFFHQX1 \y_im_reg[10]  ( .D(N88), .CK(clk), .Q(y_im[10]) );
  DFFHQX1 \y_im_reg[9]  ( .D(N89), .CK(clk), .Q(y_im[9]) );
  DFFHQX1 \y_im_reg[8]  ( .D(N90), .CK(clk), .Q(y_im[8]) );
  DFFHQX1 \y_im_reg[7]  ( .D(N91), .CK(clk), .Q(y_im[7]) );
  DFFHQX1 \y_im_reg[6]  ( .D(N92), .CK(clk), .Q(y_im[6]) );
  DFFHQX1 \y_im_reg[5]  ( .D(N93), .CK(clk), .Q(y_im[5]) );
  DFFHQX1 \y_im_reg[4]  ( .D(N94), .CK(clk), .Q(y_im[4]) );
  DFFHQX1 \y_im_reg[3]  ( .D(N95), .CK(clk), .Q(y_im[3]) );
  DFFHQX1 \y_im_reg[2]  ( .D(N96), .CK(clk), .Q(y_im[2]) );
  DFFHQX1 \y_im_reg[1]  ( .D(N97), .CK(clk), .Q(y_im[1]) );
  DFFHQX1 \y_im_reg[0]  ( .D(N98), .CK(clk), .Q(y_im[0]) );
  DFFHQX1 \temp4_re_reg[11]  ( .D(temp3_re[11]), .CK(clk), .Q(temp4_re[11]) );
  DFFHQX1 \temp4_re_reg[10]  ( .D(temp3_re[10]), .CK(clk), .Q(temp4_re[10]) );
  DFFHQX1 \temp4_re_reg[9]  ( .D(temp3_re[9]), .CK(clk), .Q(temp4_re[9]) );
  DFFHQX1 \temp4_re_reg[8]  ( .D(temp3_re[8]), .CK(clk), .Q(temp4_re[8]) );
  DFFHQX1 \temp4_re_reg[7]  ( .D(temp3_re[7]), .CK(clk), .Q(temp4_re[7]) );
  DFFHQX1 \temp4_re_reg[6]  ( .D(temp3_re[6]), .CK(clk), .Q(temp4_re[6]) );
  DFFHQX1 \temp4_re_reg[5]  ( .D(temp3_re[5]), .CK(clk), .Q(temp4_re[5]) );
  DFFHQX1 \temp4_re_reg[4]  ( .D(temp3_re[4]), .CK(clk), .Q(temp4_re[4]) );
  DFFHQX1 \temp4_re_reg[3]  ( .D(temp3_re[3]), .CK(clk), .Q(temp4_re[3]) );
  DFFHQX1 \temp4_re_reg[2]  ( .D(temp3_re[2]), .CK(clk), .Q(temp4_re[2]) );
  DFFHQX1 \temp4_re_reg[1]  ( .D(temp3_re[1]), .CK(clk), .Q(temp4_re[1]) );
  DFFHQX1 \temp4_re_reg[0]  ( .D(temp3_re[0]), .CK(clk), .Q(temp4_re[0]) );
  DFFHQX1 \temp4_im_reg[11]  ( .D(temp3_im[11]), .CK(clk), .Q(temp4_im[11]) );
  DFFHQX1 \temp4_im_reg[10]  ( .D(temp3_im[10]), .CK(clk), .Q(temp4_im[10]) );
  DFFHQX1 \temp4_im_reg[9]  ( .D(temp3_im[9]), .CK(clk), .Q(temp4_im[9]) );
  DFFHQX1 \temp4_im_reg[8]  ( .D(temp3_im[8]), .CK(clk), .Q(temp4_im[8]) );
  DFFHQX1 \temp4_im_reg[7]  ( .D(temp3_im[7]), .CK(clk), .Q(temp4_im[7]) );
  DFFHQX1 \temp4_im_reg[6]  ( .D(temp3_im[6]), .CK(clk), .Q(temp4_im[6]) );
  DFFHQX1 \temp4_im_reg[5]  ( .D(temp3_im[5]), .CK(clk), .Q(temp4_im[5]) );
  DFFHQX1 \temp4_im_reg[4]  ( .D(temp3_im[4]), .CK(clk), .Q(temp4_im[4]) );
  DFFHQX1 \temp4_im_reg[3]  ( .D(temp3_im[3]), .CK(clk), .Q(temp4_im[3]) );
  DFFHQX1 \temp4_im_reg[2]  ( .D(temp3_im[2]), .CK(clk), .Q(temp4_im[2]) );
  DFFHQX1 \temp4_im_reg[1]  ( .D(temp3_im[1]), .CK(clk), .Q(temp4_im[1]) );
  DFFHQX1 \temp4_im_reg[0]  ( .D(temp3_im[0]), .CK(clk), .Q(temp4_im[0]) );
  DFFHQX1 \temp1_im_reg[11]  ( .D(mux2_im[11]), .CK(clk), .Q(temp1_im[11]) );
  DFFHQX1 \temp2_im_reg[11]  ( .D(temp1_im[11]), .CK(clk), .Q(temp2_im[11]) );
  DFFHQX1 \temp1_im_reg[10]  ( .D(mux2_im[10]), .CK(clk), .Q(temp1_im[10]) );
  DFFHQX1 \temp2_im_reg[10]  ( .D(temp1_im[10]), .CK(clk), .Q(temp2_im[10]) );
  DFFHQX1 \temp1_im_reg[9]  ( .D(mux2_im[9]), .CK(clk), .Q(temp1_im[9]) );
  DFFHQX1 \temp2_im_reg[9]  ( .D(temp1_im[9]), .CK(clk), .Q(temp2_im[9]) );
  DFFHQX1 \temp1_im_reg[8]  ( .D(mux2_im[8]), .CK(clk), .Q(temp1_im[8]) );
  DFFHQX1 \temp2_im_reg[8]  ( .D(temp1_im[8]), .CK(clk), .Q(temp2_im[8]) );
  DFFHQX1 \temp1_im_reg[7]  ( .D(mux2_im[7]), .CK(clk), .Q(temp1_im[7]) );
  DFFHQX1 \temp2_im_reg[7]  ( .D(temp1_im[7]), .CK(clk), .Q(temp2_im[7]) );
  DFFHQX1 \temp1_im_reg[6]  ( .D(mux2_im[6]), .CK(clk), .Q(temp1_im[6]) );
  DFFHQX1 \temp2_im_reg[6]  ( .D(temp1_im[6]), .CK(clk), .Q(temp2_im[6]) );
  DFFHQX1 \temp1_im_reg[5]  ( .D(mux2_im[5]), .CK(clk), .Q(temp1_im[5]) );
  DFFHQX1 \temp2_im_reg[5]  ( .D(temp1_im[5]), .CK(clk), .Q(temp2_im[5]) );
  DFFHQX1 \temp1_im_reg[4]  ( .D(mux2_im[4]), .CK(clk), .Q(temp1_im[4]) );
  DFFHQX1 \temp2_im_reg[4]  ( .D(temp1_im[4]), .CK(clk), .Q(temp2_im[4]) );
  DFFHQX1 \temp1_im_reg[3]  ( .D(mux2_im[3]), .CK(clk), .Q(temp1_im[3]) );
  DFFHQX1 \temp2_im_reg[3]  ( .D(temp1_im[3]), .CK(clk), .Q(temp2_im[3]) );
  DFFHQX1 \temp1_im_reg[2]  ( .D(mux2_im[2]), .CK(clk), .Q(temp1_im[2]) );
  DFFHQX1 \temp2_im_reg[2]  ( .D(temp1_im[2]), .CK(clk), .Q(temp2_im[2]) );
  DFFHQX1 \temp1_im_reg[1]  ( .D(mux2_im[1]), .CK(clk), .Q(temp1_im[1]) );
  DFFHQX1 \temp2_im_reg[1]  ( .D(temp1_im[1]), .CK(clk), .Q(temp2_im[1]) );
  DFFHQX1 \temp1_im_reg[0]  ( .D(mux2_im[0]), .CK(clk), .Q(temp1_im[0]) );
  DFFHQX1 \temp2_im_reg[0]  ( .D(temp1_im[0]), .CK(clk), .Q(temp2_im[0]) );
  DFFHQX1 \temp1_re_reg[11]  ( .D(mux2_re[11]), .CK(clk), .Q(temp1_re[11]) );
  DFFHQX1 \temp2_re_reg[11]  ( .D(temp1_re[11]), .CK(clk), .Q(temp2_re[11]) );
  DFFHQX1 \temp1_re_reg[10]  ( .D(mux2_re[10]), .CK(clk), .Q(temp1_re[10]) );
  DFFHQX1 \temp2_re_reg[10]  ( .D(temp1_re[10]), .CK(clk), .Q(temp2_re[10]) );
  DFFHQX1 \temp1_re_reg[9]  ( .D(mux2_re[9]), .CK(clk), .Q(temp1_re[9]) );
  DFFHQX1 \temp2_re_reg[9]  ( .D(temp1_re[9]), .CK(clk), .Q(temp2_re[9]) );
  DFFHQX1 \temp1_re_reg[8]  ( .D(mux2_re[8]), .CK(clk), .Q(temp1_re[8]) );
  DFFHQX1 \temp2_re_reg[8]  ( .D(temp1_re[8]), .CK(clk), .Q(temp2_re[8]) );
  DFFHQX1 \temp1_re_reg[7]  ( .D(mux2_re[7]), .CK(clk), .Q(temp1_re[7]) );
  DFFHQX1 \temp2_re_reg[7]  ( .D(temp1_re[7]), .CK(clk), .Q(temp2_re[7]) );
  DFFHQX1 \temp1_re_reg[6]  ( .D(mux2_re[6]), .CK(clk), .Q(temp1_re[6]) );
  DFFHQX1 \temp2_re_reg[6]  ( .D(temp1_re[6]), .CK(clk), .Q(temp2_re[6]) );
  DFFHQX1 \temp1_re_reg[5]  ( .D(mux2_re[5]), .CK(clk), .Q(temp1_re[5]) );
  DFFHQX1 \temp2_re_reg[5]  ( .D(temp1_re[5]), .CK(clk), .Q(temp2_re[5]) );
  DFFHQX1 \temp1_re_reg[4]  ( .D(mux2_re[4]), .CK(clk), .Q(temp1_re[4]) );
  DFFHQX1 \temp2_re_reg[4]  ( .D(temp1_re[4]), .CK(clk), .Q(temp2_re[4]) );
  DFFHQX1 \temp1_re_reg[3]  ( .D(mux2_re[3]), .CK(clk), .Q(temp1_re[3]) );
  DFFHQX1 \temp2_re_reg[3]  ( .D(temp1_re[3]), .CK(clk), .Q(temp2_re[3]) );
  DFFHQX1 \temp1_re_reg[2]  ( .D(mux2_re[2]), .CK(clk), .Q(temp1_re[2]) );
  DFFHQX1 \temp2_re_reg[2]  ( .D(temp1_re[2]), .CK(clk), .Q(temp2_re[2]) );
  DFFHQX1 \temp1_re_reg[1]  ( .D(mux2_re[1]), .CK(clk), .Q(temp1_re[1]) );
  DFFHQX1 \temp2_re_reg[1]  ( .D(temp1_re[1]), .CK(clk), .Q(temp2_re[1]) );
  DFFHQX1 \temp1_re_reg[0]  ( .D(mux2_re[0]), .CK(clk), .Q(temp1_re[0]) );
  DFFHQX1 \temp2_re_reg[0]  ( .D(temp1_re[0]), .CK(clk), .Q(temp2_re[0]) );
  DFFHQX1 \temp2_en_reg[0]  ( .D(\temp1_en[0] ), .CK(clk), .Q(\temp2_en[0] )
         );
  DFFHQX1 \temp3_en_reg[0]  ( .D(\temp2_en[0] ), .CK(clk), .Q(\temp3_en[0] )
         );
  DFFHQX1 \temp3_im_reg[11]  ( .D(temp2_im[11]), .CK(clk), .Q(temp3_im[11]) );
  DFFHQX1 \temp3_im_reg[10]  ( .D(temp2_im[10]), .CK(clk), .Q(temp3_im[10]) );
  DFFHQX1 \temp3_im_reg[9]  ( .D(temp2_im[9]), .CK(clk), .Q(temp3_im[9]) );
  DFFHQX1 \temp3_im_reg[8]  ( .D(temp2_im[8]), .CK(clk), .Q(temp3_im[8]) );
  DFFHQX1 \temp3_im_reg[7]  ( .D(temp2_im[7]), .CK(clk), .Q(temp3_im[7]) );
  DFFHQX1 \temp3_im_reg[6]  ( .D(temp2_im[6]), .CK(clk), .Q(temp3_im[6]) );
  DFFHQX1 \temp3_im_reg[5]  ( .D(temp2_im[5]), .CK(clk), .Q(temp3_im[5]) );
  DFFHQX1 \temp3_im_reg[4]  ( .D(temp2_im[4]), .CK(clk), .Q(temp3_im[4]) );
  DFFHQX1 \temp3_im_reg[3]  ( .D(temp2_im[3]), .CK(clk), .Q(temp3_im[3]) );
  DFFHQX1 \temp3_im_reg[2]  ( .D(temp2_im[2]), .CK(clk), .Q(temp3_im[2]) );
  DFFHQX1 \temp3_im_reg[1]  ( .D(temp2_im[1]), .CK(clk), .Q(temp3_im[1]) );
  DFFHQX1 \temp3_im_reg[0]  ( .D(temp2_im[0]), .CK(clk), .Q(temp3_im[0]) );
  DFFHQX1 \temp3_re_reg[11]  ( .D(temp2_re[11]), .CK(clk), .Q(temp3_re[11]) );
  DFFHQX1 \temp3_re_reg[10]  ( .D(temp2_re[10]), .CK(clk), .Q(temp3_re[10]) );
  DFFHQX1 \temp3_re_reg[9]  ( .D(temp2_re[9]), .CK(clk), .Q(temp3_re[9]) );
  DFFHQX1 \temp3_re_reg[8]  ( .D(temp2_re[8]), .CK(clk), .Q(temp3_re[8]) );
  DFFHQX1 \temp3_re_reg[7]  ( .D(temp2_re[7]), .CK(clk), .Q(temp3_re[7]) );
  DFFHQX1 \temp3_re_reg[6]  ( .D(temp2_re[6]), .CK(clk), .Q(temp3_re[6]) );
  DFFHQX1 \temp3_re_reg[5]  ( .D(temp2_re[5]), .CK(clk), .Q(temp3_re[5]) );
  DFFHQX1 \temp3_re_reg[4]  ( .D(temp2_re[4]), .CK(clk), .Q(temp3_re[4]) );
  DFFHQX1 \temp3_re_reg[3]  ( .D(temp2_re[3]), .CK(clk), .Q(temp3_re[3]) );
  DFFHQX1 \temp3_re_reg[2]  ( .D(temp2_re[2]), .CK(clk), .Q(temp3_re[2]) );
  DFFHQX1 \temp3_re_reg[1]  ( .D(temp2_re[1]), .CK(clk), .Q(temp3_re[1]) );
  DFFHQX1 \temp3_re_reg[0]  ( .D(temp2_re[0]), .CK(clk), .Q(temp3_re[0]) );
  DFFHQX1 \temp4_en_reg[0]  ( .D(\temp3_en[0] ), .CK(clk), .Q(\temp4_en[0] )
         );
  CLKINVX3 U53 ( .A(sel), .Y(n27) );
  DFFHQXL \dx_re_reg[10]  ( .D(N26), .CK(clk), .Q(dx_re[10]) );
  AOI22XL U8 ( .A0(dout_im[1]), .A1(en), .B0(temp4_im[1]), .B1(n2), .Y(n3) );
  AOI22XL U10 ( .A0(dout_im[2]), .A1(en), .B0(temp4_im[2]), .B1(n2), .Y(n4) );
  AOI22XL U12 ( .A0(dout_im[3]), .A1(en), .B0(temp4_im[3]), .B1(n2), .Y(n5) );
  AOI22XL U14 ( .A0(dout_im[4]), .A1(en), .B0(temp4_im[4]), .B1(n2), .Y(n6) );
  AOI22XL U175 ( .A0(dout_im[5]), .A1(en), .B0(temp4_im[5]), .B1(n2), .Y(n7)
         );
  signal_control2 s0 ( .clk(clk), .reset(reset), .di_en(di_en), .sel(sel), 
        .do_en(do_en), .addr(addr) );
  delaybuffer_WIDTH12_DEPTH3 d0 ( .clk(clk), .reset(reset), .x_re(dx_re), 
        .x_im(dx_im), .y_re(dy_re), .y_im(dy_im) );
  butterfly2_WIDTH12_2 b0 ( .x0_re(dy_re), .x0_im(dy_im), .x1_re(x_re_r), 
        .x1_im(x_im_r), .y0_re(bf_y0_re), .y0_im(bf_y0_im), .y1_re(bf_y1_re), 
        .y1_im(bf_y1_im) );
  twiddle3 t0 ( .clk(clk), .addr(addr), .tw_re({tw_re[11:1], 
        SYNOPSYS_UNCONNECTED__0}), .tw_im({tw_im[11:1], 
        SYNOPSYS_UNCONNECTED__1}) );
  multiply_WIDTH12_0 m0 ( .clk(clk), .a_re(mux2_re), .a_im(mux2_im), .b_re({
        tw_re[11:1], 1'b0}), .b_im({tw_im[11:1], 1'b0}), .m_re(dout_re), 
        .m_im(dout_im) );
  DFFX2 en_reg ( .D(\temp4_en[0] ), .CK(clk), .Q(en), .QN(n2) );
endmodule


module signal_control3_DW01_inc_0_DW01_inc_7 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module signal_control3 ( clk, reset, di_en, sel, bf_nj, do_en );
  input clk, reset, di_en;
  output sel, bf_nj, do_en;
  wire   N4, N5, N6, N7, N10, N11, N12, N13, N14, N15, N16, N30, N31, N38, N39,
         N44, n40, n41, n42, n43, n44, n45, n46, n47, n48, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26;
  wire   [6:0] cnt;

  DFFRHQX1 \cnt_reg[0]  ( .D(n46), .CK(clk), .RN(n47), .Q(cnt[0]) );
  DFFRHQX1 \cnt_reg[1]  ( .D(n45), .CK(clk), .RN(n47), .Q(cnt[1]) );
  DFFRHQX1 \cnt_reg[2]  ( .D(n44), .CK(clk), .RN(n47), .Q(cnt[2]) );
  DFFRHQX1 \cnt_reg[3]  ( .D(n43), .CK(clk), .RN(n47), .Q(cnt[3]) );
  DFFRHQX1 \cnt_reg[4]  ( .D(n42), .CK(clk), .RN(n47), .Q(cnt[4]) );
  DFFRHQX1 \cnt_reg[5]  ( .D(n41), .CK(clk), .RN(n47), .Q(cnt[5]) );
  DFFRHQX1 \cnt_reg[6]  ( .D(n40), .CK(clk), .RN(n47), .Q(cnt[6]) );
  DFFRHQX2 do_en_r_reg ( .D(N44), .CK(clk), .RN(n47), .Q(do_en) );
  DFFNRX1 start_count_reg ( .D(n48), .CKN(clk), .RN(n47), .Q(n1), .QN(n26) );
  DFFRHQX1 \cnt2_reg[0]  ( .D(N30), .CK(clk), .RN(n47), .Q(N4) );
  DFFRHQX1 \cnt2_reg[1]  ( .D(N31), .CK(clk), .RN(n47), .Q(N5) );
  DFFRHQX1 \cnt3_reg[0]  ( .D(N38), .CK(clk), .RN(n47), .Q(N6) );
  DFFRHQX1 \cnt3_reg[1]  ( .D(N39), .CK(clk), .RN(n47), .Q(N7) );
  AND2X2 U3 ( .A(N7), .B(N6), .Y(bf_nj) );
  XOR2X4 U4 ( .A(N5), .B(N4), .Y(sel) );
  OR2X1 U5 ( .A(di_en), .B(n1), .Y(n48) );
  INVX1 U6 ( .A(reset), .Y(n47) );
  INVX1 U7 ( .A(n2), .Y(n46) );
  AOI22X1 U8 ( .A0(n26), .A1(cnt[0]), .B0(N10), .B1(n3), .Y(n2) );
  OAI2BB2X1 U9 ( .B0(n1), .B1(n4), .A0N(N11), .A1N(n3), .Y(n45) );
  OAI2BB2X1 U10 ( .B0(n1), .B1(n5), .A0N(N12), .A1N(n3), .Y(n44) );
  OAI2BB2X1 U11 ( .B0(n1), .B1(n6), .A0N(N13), .A1N(n3), .Y(n43) );
  OAI2BB2X1 U12 ( .B0(n1), .B1(n7), .A0N(N14), .A1N(n3), .Y(n42) );
  INVX1 U13 ( .A(n8), .Y(n41) );
  AOI22X1 U14 ( .A0(n26), .A1(cnt[5]), .B0(N15), .B1(n3), .Y(n8) );
  INVX1 U15 ( .A(n9), .Y(n40) );
  AOI22X1 U16 ( .A0(n26), .A1(cnt[6]), .B0(N16), .B1(n3), .Y(n9) );
  AOI2BB1X1 U17 ( .A0N(n10), .A1N(n11), .B0(n26), .Y(n3) );
  NAND3X1 U18 ( .A(cnt[5]), .B(cnt[2]), .C(cnt[6]), .Y(n11) );
  NAND3X1 U19 ( .A(n6), .B(n7), .C(n12), .Y(n10) );
  INVX1 U20 ( .A(cnt[4]), .Y(n7) );
  AOI21X1 U21 ( .A0(n13), .A1(n14), .B0(n15), .Y(N44) );
  NAND2BX1 U22 ( .AN(n12), .B(cnt[2]), .Y(n14) );
  NOR2X1 U23 ( .A(cnt[1]), .B(cnt[0]), .Y(n12) );
  AOI22X1 U24 ( .A0(n16), .A1(n17), .B0(n18), .B1(n19), .Y(N39) );
  NAND2X1 U25 ( .A(n20), .B(n18), .Y(n17) );
  INVX1 U26 ( .A(N7), .Y(n18) );
  INVX1 U27 ( .A(n16), .Y(N38) );
  NAND2X1 U28 ( .A(n20), .B(n19), .Y(n16) );
  INVX1 U29 ( .A(N6), .Y(n19) );
  AOI21X1 U30 ( .A0(n5), .A1(n13), .B0(n15), .Y(n20) );
  INVX1 U31 ( .A(n21), .Y(n15) );
  MXI2X1 U32 ( .A(n22), .B(n23), .S0(N5), .Y(N31) );
  NAND3X1 U33 ( .A(n24), .B(n21), .C(N4), .Y(n22) );
  INVX1 U34 ( .A(n23), .Y(N30) );
  NAND3BX1 U35 ( .AN(N4), .B(n21), .C(n24), .Y(n23) );
  NAND3X1 U36 ( .A(n4), .B(n5), .C(n13), .Y(n24) );
  NOR4BX1 U37 ( .AN(n6), .B(cnt[4]), .C(cnt[5]), .D(cnt[6]), .Y(n13) );
  OAI31X1 U38 ( .A0(n25), .A1(cnt[5]), .A2(cnt[4]), .B0(cnt[6]), .Y(n21) );
  OAI21XL U39 ( .A0(n5), .A1(n4), .B0(n6), .Y(n25) );
  INVX1 U40 ( .A(cnt[3]), .Y(n6) );
  INVX1 U41 ( .A(cnt[1]), .Y(n4) );
  INVX1 U42 ( .A(cnt[2]), .Y(n5) );
  signal_control3_DW01_inc_0_DW01_inc_7 add_41 ( .A(cnt), .SUM({N16, N15, N14, 
        N13, N12, N11, N10}) );
endmodule


module delaybuffer2_WIDTH12 ( clk, reset, x_re, x_im, y_re, y_im );
  input [11:0] x_re;
  input [11:0] x_im;
  output [11:0] y_re;
  output [11:0] y_im;
  input clk, reset;
  wire   n1;

  INVX1 U3 ( .A(reset), .Y(n1) );
  DFFRHQXL \temp1_re_reg[11]  ( .D(x_re[11]), .CK(clk), .RN(n1), .Q(y_re[11])
         );
  DFFRHQXL \temp1_re_reg[10]  ( .D(x_re[10]), .CK(clk), .RN(n1), .Q(y_re[10])
         );
  DFFRHQXL \temp1_re_reg[9]  ( .D(x_re[9]), .CK(clk), .RN(n1), .Q(y_re[9]) );
  DFFRHQXL \temp1_re_reg[8]  ( .D(x_re[8]), .CK(clk), .RN(n1), .Q(y_re[8]) );
  DFFRHQXL \temp1_re_reg[7]  ( .D(x_re[7]), .CK(clk), .RN(n1), .Q(y_re[7]) );
  DFFRHQXL \temp1_re_reg[5]  ( .D(x_re[5]), .CK(clk), .RN(n1), .Q(y_re[5]) );
  DFFRHQXL \temp1_re_reg[4]  ( .D(x_re[4]), .CK(clk), .RN(n1), .Q(y_re[4]) );
  DFFRHQXL \temp1_re_reg[3]  ( .D(x_re[3]), .CK(clk), .RN(n1), .Q(y_re[3]) );
  DFFRHQXL \temp1_re_reg[2]  ( .D(x_re[2]), .CK(clk), .RN(n1), .Q(y_re[2]) );
  DFFRHQXL \temp1_re_reg[1]  ( .D(x_re[1]), .CK(clk), .RN(n1), .Q(y_re[1]) );
  DFFRHQXL \temp1_re_reg[0]  ( .D(x_re[0]), .CK(clk), .RN(n1), .Q(y_re[0]) );
  DFFRHQXL \temp1_im_reg[11]  ( .D(x_im[11]), .CK(clk), .RN(n1), .Q(y_im[11])
         );
  DFFRHQXL \temp1_im_reg[10]  ( .D(x_im[10]), .CK(clk), .RN(n1), .Q(y_im[10])
         );
  DFFRHQXL \temp1_im_reg[9]  ( .D(x_im[9]), .CK(clk), .RN(n1), .Q(y_im[9]) );
  DFFRHQXL \temp1_im_reg[8]  ( .D(x_im[8]), .CK(clk), .RN(n1), .Q(y_im[8]) );
  DFFRHQXL \temp1_im_reg[7]  ( .D(x_im[7]), .CK(clk), .RN(n1), .Q(y_im[7]) );
  DFFRHQXL \temp1_im_reg[5]  ( .D(x_im[5]), .CK(clk), .RN(n1), .Q(y_im[5]) );
  DFFRHQXL \temp1_im_reg[4]  ( .D(x_im[4]), .CK(clk), .RN(n1), .Q(y_im[4]) );
  DFFRHQXL \temp1_im_reg[3]  ( .D(x_im[3]), .CK(clk), .RN(n1), .Q(y_im[3]) );
  DFFRHQXL \temp1_im_reg[2]  ( .D(x_im[2]), .CK(clk), .RN(n1), .Q(y_im[2]) );
  DFFRHQXL \temp1_im_reg[1]  ( .D(x_im[1]), .CK(clk), .RN(n1), .Q(y_im[1]) );
  DFFRHQXL \temp1_im_reg[0]  ( .D(x_im[0]), .CK(clk), .RN(n1), .Q(y_im[0]) );
  DFFRHQX1 \temp1_re_reg[6]  ( .D(x_re[6]), .CK(clk), .RN(n1), .Q(y_re[6]) );
  DFFRHQX1 \temp1_im_reg[6]  ( .D(x_im[6]), .CK(clk), .RN(n1), .Q(y_im[6]) );
endmodule


module carry_select_adder2_WIDTH12_7 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U5 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U8 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_6 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U5 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U6 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U7 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U8 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_5 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U5 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U8 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X1 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_4 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U5 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U8 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X1 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module butterfly2_WIDTH12_1_DW01_inc_0_DW01_inc_18 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module butterfly2_WIDTH12_1_DW01_inc_1_DW01_inc_19 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module butterfly2_WIDTH12_1 ( x0_re, x0_im, x1_re, x1_im, y0_re, y0_im, y1_re, 
        y1_im );
  input [11:0] x0_re;
  input [11:0] x0_im;
  input [11:0] x1_re;
  input [11:0] x1_im;
  output [11:0] y0_re;
  output [11:0] y0_im;
  output [11:0] y1_re;
  output [11:0] y1_im;
  wire   N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N9, N8,
         N7, N6, N5, N4, N3, N2, N11, N10, N1, N0;
  wire   [11:0] x1_re_neg;
  wire   [11:0] x1_im_neg;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  INVX1 U3 ( .A(x1_re[10]), .Y(N1) );
  INVX1 U4 ( .A(x1_re[11]), .Y(N0) );
  INVX1 U5 ( .A(x1_re[1]), .Y(N10) );
  INVX1 U6 ( .A(x1_re[2]), .Y(N9) );
  INVX1 U7 ( .A(x1_re[3]), .Y(N8) );
  INVX1 U8 ( .A(x1_re[4]), .Y(N7) );
  INVX1 U9 ( .A(x1_re[5]), .Y(N6) );
  INVX1 U10 ( .A(x1_re[6]), .Y(N5) );
  INVX1 U11 ( .A(x1_re[7]), .Y(N4) );
  INVX1 U12 ( .A(x1_re[8]), .Y(N3) );
  INVX1 U13 ( .A(x1_re[9]), .Y(N2) );
  INVX1 U14 ( .A(x1_re[0]), .Y(N11) );
  INVX1 U15 ( .A(x1_im[10]), .Y(N13) );
  INVX1 U16 ( .A(x1_im[11]), .Y(N12) );
  INVX1 U17 ( .A(x1_im[1]), .Y(N22) );
  INVX1 U18 ( .A(x1_im[2]), .Y(N21) );
  INVX1 U19 ( .A(x1_im[3]), .Y(N20) );
  INVX1 U20 ( .A(x1_im[4]), .Y(N19) );
  INVX1 U21 ( .A(x1_im[5]), .Y(N18) );
  INVX1 U22 ( .A(x1_im[6]), .Y(N17) );
  INVX1 U23 ( .A(x1_im[7]), .Y(N16) );
  INVX1 U24 ( .A(x1_im[8]), .Y(N15) );
  INVX1 U25 ( .A(x1_im[9]), .Y(N14) );
  INVX1 U26 ( .A(x1_im[0]), .Y(N23) );
  carry_select_adder2_WIDTH12_7 c0 ( .x(x0_re), .y(x1_re), .z({y0_re, 
        SYNOPSYS_UNCONNECTED__0}) );
  carry_select_adder2_WIDTH12_6 c1 ( .x(x0_im), .y(x1_im), .z({y0_im, 
        SYNOPSYS_UNCONNECTED__1}) );
  carry_select_adder2_WIDTH12_5 c2 ( .x(x0_re), .y(x1_re_neg), .z({y1_re, 
        SYNOPSYS_UNCONNECTED__2}) );
  carry_select_adder2_WIDTH12_4 c3 ( .x(x0_im), .y(x1_im_neg), .z({y1_im, 
        SYNOPSYS_UNCONNECTED__3}) );
  butterfly2_WIDTH12_1_DW01_inc_0_DW01_inc_18 add_0_root_add_22_ni ( .A({N12, 
        N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23}), .SUM(
        x1_im_neg) );
  butterfly2_WIDTH12_1_DW01_inc_1_DW01_inc_19 add_0_root_add_21_ni ( .A({N0, 
        N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11}), .SUM(x1_re_neg) );
endmodule


module sdfunit5_WIDTH12_DEPTH1_DW01_inc_0_DW01_inc_15 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module sdfunit5_WIDTH12_DEPTH1 ( clk, di_en, reset, x_re, x_im, y_re, y_im, 
        do_en );
  input [11:0] x_re;
  input [11:0] x_im;
  output [11:0] y_re;
  output [11:0] y_im;
  input clk, di_en, reset;
  output do_en;
  wire   sel, bf_nj, N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12,
         N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N25, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41,
         N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55,
         N56, N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69,
         N70, N71, N72, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84,
         N85, N98, N99, N100, N101, N102, N103, N104, N105, N106, N107, N108,
         N109, N110, N111, N112, N113, N114, N115, N116, N117, N118, N119,
         N120, N121, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, N97, N96, N95, N94, N93, N92, N91, N90, N89,
         N88, N87, N86;
  wire   [11:0] x_re_r;
  wire   [11:0] x_im_r;
  wire   [11:0] bf_y1_re;
  wire   [11:0] dx_re;
  wire   [11:0] bf_y1_im;
  wire   [11:0] dx_im;
  wire   [11:0] dy_re;
  wire   [11:0] dy_im;
  wire   [11:0] bf_y0_re;
  wire   [11:0] bf_y0_im;
  wire   [11:0] mux2_re;
  wire   [11:0] mux2_im;
  wire   [11:0] dout_re;
  wire   [11:0] dout_im;

  AND2X1 U3 ( .A(x_re[2]), .B(di_en), .Y(N9) );
  INVX1 U4 ( .A(n1), .Y(N85) );
  INVX1 U6 ( .A(n3), .Y(N84) );
  INVX1 U8 ( .A(n4), .Y(N83) );
  INVX1 U10 ( .A(n5), .Y(N82) );
  INVX1 U12 ( .A(n6), .Y(N81) );
  INVX1 U14 ( .A(n7), .Y(N80) );
  AOI22X1 U15 ( .A0(bf_nj), .A1(mux2_im[5]), .B0(mux2_re[5]), .B1(n2), .Y(n7)
         );
  AND2X1 U16 ( .A(x_re[3]), .B(di_en), .Y(N8) );
  INVX1 U17 ( .A(n8), .Y(N79) );
  AOI22X1 U18 ( .A0(bf_nj), .A1(mux2_im[6]), .B0(mux2_re[6]), .B1(n2), .Y(n8)
         );
  INVX1 U19 ( .A(n9), .Y(N78) );
  AOI22X1 U20 ( .A0(bf_nj), .A1(mux2_im[7]), .B0(mux2_re[7]), .B1(n2), .Y(n9)
         );
  INVX1 U21 ( .A(n10), .Y(N77) );
  AOI22X1 U22 ( .A0(bf_nj), .A1(mux2_im[8]), .B0(mux2_re[8]), .B1(n2), .Y(n10)
         );
  INVX1 U23 ( .A(n11), .Y(N76) );
  AOI22X1 U24 ( .A0(bf_nj), .A1(mux2_im[9]), .B0(mux2_re[9]), .B1(n2), .Y(n11)
         );
  INVX1 U25 ( .A(n12), .Y(N75) );
  AOI22X1 U26 ( .A0(bf_nj), .A1(mux2_im[10]), .B0(mux2_re[10]), .B1(n2), .Y(
        n12) );
  INVX1 U27 ( .A(n13), .Y(N74) );
  AOI22X1 U28 ( .A0(bf_nj), .A1(mux2_im[11]), .B0(mux2_re[11]), .B1(n2), .Y(
        n13) );
  INVX1 U29 ( .A(n14), .Y(N72) );
  AOI22X1 U30 ( .A0(sel), .A1(bf_y0_im[0]), .B0(dy_im[0]), .B1(n15), .Y(n14)
         );
  INVX1 U31 ( .A(n16), .Y(N71) );
  AOI22X1 U32 ( .A0(bf_y0_im[1]), .A1(sel), .B0(dy_im[1]), .B1(n15), .Y(n16)
         );
  INVX1 U33 ( .A(n17), .Y(N70) );
  AOI22X1 U34 ( .A0(bf_y0_im[2]), .A1(sel), .B0(dy_im[2]), .B1(n15), .Y(n17)
         );
  AND2X1 U35 ( .A(x_re[4]), .B(di_en), .Y(N7) );
  INVX1 U36 ( .A(n18), .Y(N69) );
  AOI22X1 U37 ( .A0(bf_y0_im[3]), .A1(sel), .B0(dy_im[3]), .B1(n15), .Y(n18)
         );
  INVX1 U38 ( .A(n19), .Y(N68) );
  AOI22X1 U39 ( .A0(bf_y0_im[4]), .A1(sel), .B0(dy_im[4]), .B1(n15), .Y(n19)
         );
  INVX1 U40 ( .A(n20), .Y(N67) );
  AOI22X1 U41 ( .A0(bf_y0_im[5]), .A1(sel), .B0(dy_im[5]), .B1(n15), .Y(n20)
         );
  INVX1 U42 ( .A(n21), .Y(N66) );
  AOI22X1 U43 ( .A0(bf_y0_im[6]), .A1(sel), .B0(dy_im[6]), .B1(n15), .Y(n21)
         );
  INVX1 U44 ( .A(n22), .Y(N65) );
  AOI22X1 U45 ( .A0(bf_y0_im[7]), .A1(sel), .B0(dy_im[7]), .B1(n15), .Y(n22)
         );
  INVX1 U46 ( .A(n23), .Y(N64) );
  AOI22X1 U47 ( .A0(bf_y0_im[8]), .A1(sel), .B0(dy_im[8]), .B1(n15), .Y(n23)
         );
  INVX1 U48 ( .A(n24), .Y(N63) );
  AOI22X1 U49 ( .A0(bf_y0_im[9]), .A1(sel), .B0(dy_im[9]), .B1(n15), .Y(n24)
         );
  INVX1 U50 ( .A(n25), .Y(N62) );
  AOI22X1 U51 ( .A0(bf_y0_im[10]), .A1(sel), .B0(dy_im[10]), .B1(n15), .Y(n25)
         );
  INVX1 U52 ( .A(n26), .Y(N61) );
  AOI22X1 U53 ( .A0(bf_y0_im[11]), .A1(sel), .B0(dy_im[11]), .B1(n15), .Y(n26)
         );
  INVX1 U54 ( .A(n27), .Y(N60) );
  AOI22X1 U55 ( .A0(bf_y0_re[0]), .A1(sel), .B0(dy_re[0]), .B1(n15), .Y(n27)
         );
  AND2X1 U56 ( .A(x_re[5]), .B(di_en), .Y(N6) );
  INVX1 U57 ( .A(n28), .Y(N59) );
  AOI22X1 U58 ( .A0(bf_y0_re[1]), .A1(sel), .B0(dy_re[1]), .B1(n15), .Y(n28)
         );
  INVX1 U59 ( .A(n29), .Y(N58) );
  AOI22X1 U60 ( .A0(bf_y0_re[2]), .A1(sel), .B0(dy_re[2]), .B1(n15), .Y(n29)
         );
  INVX1 U61 ( .A(n30), .Y(N57) );
  AOI22X1 U62 ( .A0(bf_y0_re[3]), .A1(sel), .B0(dy_re[3]), .B1(n15), .Y(n30)
         );
  INVX1 U63 ( .A(n31), .Y(N56) );
  AOI22X1 U64 ( .A0(bf_y0_re[4]), .A1(sel), .B0(dy_re[4]), .B1(n15), .Y(n31)
         );
  INVX1 U65 ( .A(n32), .Y(N55) );
  AOI22X1 U66 ( .A0(bf_y0_re[5]), .A1(sel), .B0(dy_re[5]), .B1(n15), .Y(n32)
         );
  INVX1 U67 ( .A(n33), .Y(N54) );
  AOI22X1 U68 ( .A0(bf_y0_re[6]), .A1(sel), .B0(dy_re[6]), .B1(n15), .Y(n33)
         );
  INVX1 U69 ( .A(n34), .Y(N53) );
  AOI22X1 U70 ( .A0(bf_y0_re[7]), .A1(sel), .B0(dy_re[7]), .B1(n15), .Y(n34)
         );
  INVX1 U71 ( .A(n35), .Y(N52) );
  AOI22X1 U72 ( .A0(bf_y0_re[8]), .A1(sel), .B0(dy_re[8]), .B1(n15), .Y(n35)
         );
  INVX1 U73 ( .A(n36), .Y(N51) );
  AOI22X1 U74 ( .A0(bf_y0_re[9]), .A1(sel), .B0(dy_re[9]), .B1(n15), .Y(n36)
         );
  INVX1 U75 ( .A(n37), .Y(N50) );
  AOI22X1 U76 ( .A0(bf_y0_re[10]), .A1(sel), .B0(dy_re[10]), .B1(n15), .Y(n37)
         );
  AND2X1 U77 ( .A(x_re[6]), .B(di_en), .Y(N5) );
  INVX1 U78 ( .A(n38), .Y(N49) );
  AOI22X1 U79 ( .A0(bf_y0_re[11]), .A1(sel), .B0(dy_re[11]), .B1(n15), .Y(n38)
         );
  INVX1 U80 ( .A(n39), .Y(N48) );
  AOI22X1 U81 ( .A0(bf_y1_im[0]), .A1(sel), .B0(x_im_r[0]), .B1(n15), .Y(n39)
         );
  INVX1 U82 ( .A(n40), .Y(N47) );
  AOI22X1 U83 ( .A0(bf_y1_im[1]), .A1(sel), .B0(x_im_r[1]), .B1(n15), .Y(n40)
         );
  INVX1 U84 ( .A(n41), .Y(N46) );
  AOI22X1 U85 ( .A0(bf_y1_im[2]), .A1(sel), .B0(x_im_r[2]), .B1(n15), .Y(n41)
         );
  INVX1 U86 ( .A(n42), .Y(N45) );
  AOI22X1 U87 ( .A0(bf_y1_im[3]), .A1(sel), .B0(x_im_r[3]), .B1(n15), .Y(n42)
         );
  INVX1 U88 ( .A(n43), .Y(N44) );
  AOI22X1 U89 ( .A0(bf_y1_im[4]), .A1(sel), .B0(x_im_r[4]), .B1(n15), .Y(n43)
         );
  INVX1 U90 ( .A(n44), .Y(N43) );
  AOI22X1 U91 ( .A0(bf_y1_im[5]), .A1(sel), .B0(x_im_r[5]), .B1(n15), .Y(n44)
         );
  INVX1 U92 ( .A(n45), .Y(N42) );
  AOI22X1 U93 ( .A0(bf_y1_im[6]), .A1(sel), .B0(x_im_r[6]), .B1(n15), .Y(n45)
         );
  INVX1 U94 ( .A(n46), .Y(N41) );
  AOI22X1 U95 ( .A0(bf_y1_im[7]), .A1(sel), .B0(x_im_r[7]), .B1(n15), .Y(n46)
         );
  INVX1 U96 ( .A(n47), .Y(N40) );
  AOI22X1 U97 ( .A0(bf_y1_im[8]), .A1(sel), .B0(x_im_r[8]), .B1(n15), .Y(n47)
         );
  AND2X1 U98 ( .A(x_re[7]), .B(di_en), .Y(N4) );
  INVX1 U99 ( .A(n48), .Y(N39) );
  AOI22X1 U100 ( .A0(bf_y1_im[9]), .A1(sel), .B0(x_im_r[9]), .B1(n15), .Y(n48)
         );
  INVX1 U101 ( .A(n49), .Y(N38) );
  AOI22X1 U102 ( .A0(bf_y1_im[10]), .A1(sel), .B0(x_im_r[10]), .B1(n15), .Y(
        n49) );
  INVX1 U103 ( .A(n50), .Y(N37) );
  AOI22X1 U104 ( .A0(bf_y1_im[11]), .A1(sel), .B0(x_im_r[11]), .B1(n15), .Y(
        n50) );
  INVX1 U105 ( .A(n51), .Y(N36) );
  AOI22X1 U106 ( .A0(bf_y1_re[0]), .A1(sel), .B0(x_re_r[0]), .B1(n15), .Y(n51)
         );
  INVX1 U107 ( .A(n52), .Y(N35) );
  AOI22X1 U108 ( .A0(bf_y1_re[1]), .A1(sel), .B0(x_re_r[1]), .B1(n15), .Y(n52)
         );
  INVX1 U109 ( .A(n53), .Y(N34) );
  AOI22X1 U110 ( .A0(bf_y1_re[2]), .A1(sel), .B0(x_re_r[2]), .B1(n15), .Y(n53)
         );
  INVX1 U111 ( .A(n54), .Y(N33) );
  AOI22X1 U112 ( .A0(bf_y1_re[3]), .A1(sel), .B0(x_re_r[3]), .B1(n15), .Y(n54)
         );
  INVX1 U113 ( .A(n55), .Y(N32) );
  AOI22X1 U114 ( .A0(bf_y1_re[4]), .A1(sel), .B0(x_re_r[4]), .B1(n15), .Y(n55)
         );
  INVX1 U115 ( .A(n56), .Y(N31) );
  AOI22X1 U116 ( .A0(bf_y1_re[5]), .A1(sel), .B0(x_re_r[5]), .B1(n15), .Y(n56)
         );
  INVX1 U117 ( .A(n57), .Y(N30) );
  AOI22X1 U118 ( .A0(bf_y1_re[6]), .A1(sel), .B0(x_re_r[6]), .B1(n15), .Y(n57)
         );
  AND2X1 U119 ( .A(x_re[8]), .B(di_en), .Y(N3) );
  INVX1 U120 ( .A(n58), .Y(N29) );
  AOI22X1 U121 ( .A0(bf_y1_re[7]), .A1(sel), .B0(x_re_r[7]), .B1(n15), .Y(n58)
         );
  INVX1 U122 ( .A(n59), .Y(N28) );
  AOI22X1 U123 ( .A0(bf_y1_re[8]), .A1(sel), .B0(x_re_r[8]), .B1(n15), .Y(n59)
         );
  INVX1 U124 ( .A(n60), .Y(N27) );
  AOI22X1 U125 ( .A0(bf_y1_re[9]), .A1(sel), .B0(x_re_r[9]), .B1(n15), .Y(n60)
         );
  INVX1 U126 ( .A(n61), .Y(N26) );
  AOI22X1 U127 ( .A0(bf_y1_re[10]), .A1(sel), .B0(x_re_r[10]), .B1(n15), .Y(
        n61) );
  INVX1 U128 ( .A(n62), .Y(N25) );
  AOI22X1 U129 ( .A0(bf_y1_re[11]), .A1(sel), .B0(x_re_r[11]), .B1(n15), .Y(
        n62) );
  AND2X1 U131 ( .A(x_im[0]), .B(di_en), .Y(N23) );
  AND2X1 U132 ( .A(x_im[1]), .B(di_en), .Y(N22) );
  AND2X1 U133 ( .A(x_im[2]), .B(di_en), .Y(N21) );
  AND2X1 U134 ( .A(x_im[3]), .B(di_en), .Y(N20) );
  AND2X1 U135 ( .A(x_re[9]), .B(di_en), .Y(N2) );
  AND2X1 U136 ( .A(x_im[4]), .B(di_en), .Y(N19) );
  AND2X1 U137 ( .A(x_im[5]), .B(di_en), .Y(N18) );
  AND2X1 U138 ( .A(x_im[6]), .B(di_en), .Y(N17) );
  AND2X1 U139 ( .A(x_im[7]), .B(di_en), .Y(N16) );
  AND2X1 U140 ( .A(x_im[8]), .B(di_en), .Y(N15) );
  AND2X1 U141 ( .A(x_im[9]), .B(di_en), .Y(N14) );
  AND2X1 U142 ( .A(x_im[10]), .B(di_en), .Y(N13) );
  INVX1 U143 ( .A(n63), .Y(N121) );
  AOI22X1 U144 ( .A0(n2), .A1(mux2_im[0]), .B0(N98), .B1(bf_nj), .Y(n63) );
  INVX1 U145 ( .A(n64), .Y(N120) );
  AOI22X1 U146 ( .A0(n2), .A1(mux2_im[1]), .B0(N99), .B1(bf_nj), .Y(n64) );
  AND2X1 U147 ( .A(x_im[11]), .B(di_en), .Y(N12) );
  INVX1 U148 ( .A(n65), .Y(N119) );
  AOI22X1 U149 ( .A0(n2), .A1(mux2_im[2]), .B0(N100), .B1(bf_nj), .Y(n65) );
  INVX1 U150 ( .A(n66), .Y(N118) );
  AOI22X1 U151 ( .A0(n2), .A1(mux2_im[3]), .B0(N101), .B1(bf_nj), .Y(n66) );
  INVX1 U152 ( .A(n67), .Y(N117) );
  AOI22X1 U153 ( .A0(n2), .A1(mux2_im[4]), .B0(N102), .B1(bf_nj), .Y(n67) );
  INVX1 U154 ( .A(n68), .Y(N116) );
  AOI22X1 U155 ( .A0(n2), .A1(mux2_im[5]), .B0(N103), .B1(bf_nj), .Y(n68) );
  INVX1 U156 ( .A(n69), .Y(N115) );
  AOI22X1 U157 ( .A0(n2), .A1(mux2_im[6]), .B0(N104), .B1(bf_nj), .Y(n69) );
  INVX1 U158 ( .A(n70), .Y(N114) );
  AOI22X1 U159 ( .A0(n2), .A1(mux2_im[7]), .B0(N105), .B1(bf_nj), .Y(n70) );
  INVX1 U160 ( .A(n71), .Y(N113) );
  AOI22X1 U161 ( .A0(n2), .A1(mux2_im[8]), .B0(N106), .B1(bf_nj), .Y(n71) );
  INVX1 U162 ( .A(n72), .Y(N112) );
  AOI22X1 U163 ( .A0(n2), .A1(mux2_im[9]), .B0(N107), .B1(bf_nj), .Y(n72) );
  INVX1 U164 ( .A(n73), .Y(N111) );
  AOI22X1 U165 ( .A0(n2), .A1(mux2_im[10]), .B0(N108), .B1(bf_nj), .Y(n73) );
  INVX1 U166 ( .A(n74), .Y(N110) );
  AOI22X1 U167 ( .A0(n2), .A1(mux2_im[11]), .B0(N109), .B1(bf_nj), .Y(n74) );
  AND2X1 U169 ( .A(x_re[0]), .B(di_en), .Y(N11) );
  AND2X1 U170 ( .A(x_re[1]), .B(di_en), .Y(N10) );
  AND2X1 U171 ( .A(x_re[10]), .B(di_en), .Y(N1) );
  AND2X1 U172 ( .A(x_re[11]), .B(di_en), .Y(N0) );
  DFFHQX1 \x_re_r_reg[11]  ( .D(N0), .CK(clk), .Q(x_re_r[11]) );
  DFFHQX1 \x_re_r_reg[10]  ( .D(N1), .CK(clk), .Q(x_re_r[10]) );
  DFFHQX1 \x_re_r_reg[9]  ( .D(N2), .CK(clk), .Q(x_re_r[9]) );
  DFFHQX1 \x_re_r_reg[8]  ( .D(N3), .CK(clk), .Q(x_re_r[8]) );
  DFFHQX1 \x_re_r_reg[7]  ( .D(N4), .CK(clk), .Q(x_re_r[7]) );
  DFFHQX1 \x_re_r_reg[6]  ( .D(N5), .CK(clk), .Q(x_re_r[6]) );
  DFFHQX1 \x_re_r_reg[5]  ( .D(N6), .CK(clk), .Q(x_re_r[5]) );
  DFFHQX1 \x_re_r_reg[4]  ( .D(N7), .CK(clk), .Q(x_re_r[4]) );
  DFFHQX1 \x_re_r_reg[3]  ( .D(N8), .CK(clk), .Q(x_re_r[3]) );
  DFFHQX1 \x_re_r_reg[2]  ( .D(N9), .CK(clk), .Q(x_re_r[2]) );
  DFFHQX1 \x_re_r_reg[1]  ( .D(N10), .CK(clk), .Q(x_re_r[1]) );
  DFFHQX1 \x_re_r_reg[0]  ( .D(N11), .CK(clk), .Q(x_re_r[0]) );
  DFFHQX1 \x_im_r_reg[11]  ( .D(N12), .CK(clk), .Q(x_im_r[11]) );
  DFFHQX1 \x_im_r_reg[10]  ( .D(N13), .CK(clk), .Q(x_im_r[10]) );
  DFFHQX1 \x_im_r_reg[9]  ( .D(N14), .CK(clk), .Q(x_im_r[9]) );
  DFFHQX1 \x_im_r_reg[8]  ( .D(N15), .CK(clk), .Q(x_im_r[8]) );
  DFFHQX1 \x_im_r_reg[7]  ( .D(N16), .CK(clk), .Q(x_im_r[7]) );
  DFFHQX1 \x_im_r_reg[6]  ( .D(N17), .CK(clk), .Q(x_im_r[6]) );
  DFFHQX1 \x_im_r_reg[5]  ( .D(N18), .CK(clk), .Q(x_im_r[5]) );
  DFFHQX1 \x_im_r_reg[4]  ( .D(N19), .CK(clk), .Q(x_im_r[4]) );
  DFFHQX1 \x_im_r_reg[3]  ( .D(N20), .CK(clk), .Q(x_im_r[3]) );
  DFFHQX1 \x_im_r_reg[2]  ( .D(N21), .CK(clk), .Q(x_im_r[2]) );
  DFFHQX1 \x_im_r_reg[1]  ( .D(N22), .CK(clk), .Q(x_im_r[1]) );
  DFFHQX1 \x_im_r_reg[0]  ( .D(N23), .CK(clk), .Q(x_im_r[0]) );
  DFFHQXL \dx_im_reg[0]  ( .D(N48), .CK(clk), .Q(dx_im[0]) );
  DFFHQXL \dx_im_reg[1]  ( .D(N47), .CK(clk), .Q(dx_im[1]) );
  DFFHQXL \dx_im_reg[2]  ( .D(N46), .CK(clk), .Q(dx_im[2]) );
  DFFHQXL \dx_im_reg[3]  ( .D(N45), .CK(clk), .Q(dx_im[3]) );
  DFFHQXL \dx_im_reg[4]  ( .D(N44), .CK(clk), .Q(dx_im[4]) );
  DFFHQXL \dx_im_reg[5]  ( .D(N43), .CK(clk), .Q(dx_im[5]) );
  DFFHQXL \dx_im_reg[6]  ( .D(N42), .CK(clk), .Q(dx_im[6]) );
  DFFHQXL \dx_im_reg[7]  ( .D(N41), .CK(clk), .Q(dx_im[7]) );
  DFFHQXL \dx_im_reg[8]  ( .D(N40), .CK(clk), .Q(dx_im[8]) );
  DFFHQXL \dx_im_reg[9]  ( .D(N39), .CK(clk), .Q(dx_im[9]) );
  DFFHQXL \dx_im_reg[10]  ( .D(N38), .CK(clk), .Q(dx_im[10]) );
  DFFHQXL \dx_im_reg[11]  ( .D(N37), .CK(clk), .Q(dx_im[11]) );
  DFFHQXL \dx_re_reg[0]  ( .D(N36), .CK(clk), .Q(dx_re[0]) );
  DFFHQXL \dx_re_reg[1]  ( .D(N35), .CK(clk), .Q(dx_re[1]) );
  DFFHQXL \dx_re_reg[2]  ( .D(N34), .CK(clk), .Q(dx_re[2]) );
  DFFHQXL \dx_re_reg[3]  ( .D(N33), .CK(clk), .Q(dx_re[3]) );
  DFFHQXL \dx_re_reg[4]  ( .D(N32), .CK(clk), .Q(dx_re[4]) );
  DFFHQXL \dx_re_reg[5]  ( .D(N31), .CK(clk), .Q(dx_re[5]) );
  DFFHQXL \dx_re_reg[6]  ( .D(N30), .CK(clk), .Q(dx_re[6]) );
  DFFHQXL \dx_re_reg[7]  ( .D(N29), .CK(clk), .Q(dx_re[7]) );
  DFFHQXL \dx_re_reg[8]  ( .D(N28), .CK(clk), .Q(dx_re[8]) );
  DFFHQXL \dx_re_reg[9]  ( .D(N27), .CK(clk), .Q(dx_re[9]) );
  DFFHQXL \dx_re_reg[10]  ( .D(N26), .CK(clk), .Q(dx_re[10]) );
  DFFHQXL \dx_re_reg[11]  ( .D(N25), .CK(clk), .Q(dx_re[11]) );
  DFFHQXL \mux2_re_reg[11]  ( .D(N49), .CK(clk), .Q(mux2_re[11]) );
  DFFHQXL \mux2_re_reg[10]  ( .D(N50), .CK(clk), .Q(mux2_re[10]) );
  DFFHQXL \mux2_re_reg[9]  ( .D(N51), .CK(clk), .Q(mux2_re[9]) );
  DFFHQXL \mux2_re_reg[8]  ( .D(N52), .CK(clk), .Q(mux2_re[8]) );
  DFFHQXL \mux2_re_reg[7]  ( .D(N53), .CK(clk), .Q(mux2_re[7]) );
  DFFHQXL \mux2_re_reg[6]  ( .D(N54), .CK(clk), .Q(mux2_re[6]) );
  DFFHQXL \mux2_re_reg[5]  ( .D(N55), .CK(clk), .Q(mux2_re[5]) );
  DFFHQXL \mux2_re_reg[4]  ( .D(N56), .CK(clk), .Q(mux2_re[4]) );
  DFFHQXL \mux2_re_reg[3]  ( .D(N57), .CK(clk), .Q(mux2_re[3]) );
  DFFHQXL \mux2_re_reg[2]  ( .D(N58), .CK(clk), .Q(mux2_re[2]) );
  DFFHQXL \mux2_re_reg[1]  ( .D(N59), .CK(clk), .Q(mux2_re[1]) );
  DFFHQXL \mux2_re_reg[0]  ( .D(N60), .CK(clk), .Q(mux2_re[0]) );
  DFFHQXL \mux2_im_reg[11]  ( .D(N61), .CK(clk), .Q(mux2_im[11]) );
  DFFHQXL \mux2_im_reg[10]  ( .D(N62), .CK(clk), .Q(mux2_im[10]) );
  DFFHQXL \mux2_im_reg[9]  ( .D(N63), .CK(clk), .Q(mux2_im[9]) );
  DFFHQXL \mux2_im_reg[8]  ( .D(N64), .CK(clk), .Q(mux2_im[8]) );
  DFFHQXL \mux2_im_reg[7]  ( .D(N65), .CK(clk), .Q(mux2_im[7]) );
  DFFHQXL \mux2_im_reg[6]  ( .D(N66), .CK(clk), .Q(mux2_im[6]) );
  DFFHQXL \mux2_im_reg[5]  ( .D(N67), .CK(clk), .Q(mux2_im[5]) );
  DFFHQXL \mux2_im_reg[4]  ( .D(N68), .CK(clk), .Q(mux2_im[4]) );
  DFFHQXL \mux2_im_reg[3]  ( .D(N69), .CK(clk), .Q(mux2_im[3]) );
  DFFHQXL \mux2_im_reg[2]  ( .D(N70), .CK(clk), .Q(mux2_im[2]) );
  DFFHQXL \mux2_im_reg[1]  ( .D(N71), .CK(clk), .Q(mux2_im[1]) );
  DFFHQXL \mux2_im_reg[0]  ( .D(N72), .CK(clk), .Q(mux2_im[0]) );
  DFFHQX1 \dout_re_reg[11]  ( .D(N74), .CK(clk), .Q(dout_re[11]) );
  DFFHQX1 \dout_re_reg[10]  ( .D(N75), .CK(clk), .Q(dout_re[10]) );
  DFFHQX1 \dout_re_reg[9]  ( .D(N76), .CK(clk), .Q(dout_re[9]) );
  DFFHQX1 \dout_re_reg[8]  ( .D(N77), .CK(clk), .Q(dout_re[8]) );
  DFFHQX1 \dout_re_reg[7]  ( .D(N78), .CK(clk), .Q(dout_re[7]) );
  DFFHQX1 \dout_re_reg[6]  ( .D(N79), .CK(clk), .Q(dout_re[6]) );
  DFFHQX1 \dout_re_reg[5]  ( .D(N80), .CK(clk), .Q(dout_re[5]) );
  DFFHQX1 \dout_re_reg[4]  ( .D(N81), .CK(clk), .Q(dout_re[4]) );
  DFFHQX1 \dout_re_reg[3]  ( .D(N82), .CK(clk), .Q(dout_re[3]) );
  DFFHQX1 \dout_re_reg[2]  ( .D(N83), .CK(clk), .Q(dout_re[2]) );
  DFFHQX1 \dout_re_reg[1]  ( .D(N84), .CK(clk), .Q(dout_re[1]) );
  DFFHQX1 \dout_re_reg[0]  ( .D(N85), .CK(clk), .Q(dout_re[0]) );
  DFFHQX1 \dout_im_reg[11]  ( .D(N110), .CK(clk), .Q(dout_im[11]) );
  DFFHQX1 \dout_im_reg[10]  ( .D(N111), .CK(clk), .Q(dout_im[10]) );
  DFFHQX1 \dout_im_reg[9]  ( .D(N112), .CK(clk), .Q(dout_im[9]) );
  DFFHQX1 \dout_im_reg[8]  ( .D(N113), .CK(clk), .Q(dout_im[8]) );
  DFFHQX1 \dout_im_reg[7]  ( .D(N114), .CK(clk), .Q(dout_im[7]) );
  DFFHQX1 \dout_im_reg[6]  ( .D(N115), .CK(clk), .Q(dout_im[6]) );
  DFFHQX1 \dout_im_reg[5]  ( .D(N116), .CK(clk), .Q(dout_im[5]) );
  DFFHQX1 \dout_im_reg[4]  ( .D(N117), .CK(clk), .Q(dout_im[4]) );
  DFFHQX1 \dout_im_reg[3]  ( .D(N118), .CK(clk), .Q(dout_im[3]) );
  DFFHQX1 \dout_im_reg[2]  ( .D(N119), .CK(clk), .Q(dout_im[2]) );
  DFFHQX1 \dout_im_reg[1]  ( .D(N120), .CK(clk), .Q(dout_im[1]) );
  DFFHQX1 \dout_im_reg[0]  ( .D(N121), .CK(clk), .Q(dout_im[0]) );
  DFFHQX1 \y_re_reg[11]  ( .D(dout_re[11]), .CK(clk), .Q(y_re[11]) );
  DFFHQX1 \y_re_reg[10]  ( .D(dout_re[10]), .CK(clk), .Q(y_re[10]) );
  DFFHQX1 \y_re_reg[9]  ( .D(dout_re[9]), .CK(clk), .Q(y_re[9]) );
  DFFHQX1 \y_re_reg[8]  ( .D(dout_re[8]), .CK(clk), .Q(y_re[8]) );
  DFFHQX1 \y_re_reg[7]  ( .D(dout_re[7]), .CK(clk), .Q(y_re[7]) );
  DFFHQX1 \y_re_reg[6]  ( .D(dout_re[6]), .CK(clk), .Q(y_re[6]) );
  DFFHQX1 \y_re_reg[5]  ( .D(dout_re[5]), .CK(clk), .Q(y_re[5]) );
  DFFHQX1 \y_re_reg[4]  ( .D(dout_re[4]), .CK(clk), .Q(y_re[4]) );
  DFFHQX1 \y_re_reg[3]  ( .D(dout_re[3]), .CK(clk), .Q(y_re[3]) );
  DFFHQX1 \y_re_reg[2]  ( .D(dout_re[2]), .CK(clk), .Q(y_re[2]) );
  DFFHQX1 \y_re_reg[1]  ( .D(dout_re[1]), .CK(clk), .Q(y_re[1]) );
  DFFHQX1 \y_re_reg[0]  ( .D(dout_re[0]), .CK(clk), .Q(y_re[0]) );
  DFFHQX1 \y_im_reg[11]  ( .D(dout_im[11]), .CK(clk), .Q(y_im[11]) );
  DFFHQX1 \y_im_reg[10]  ( .D(dout_im[10]), .CK(clk), .Q(y_im[10]) );
  DFFHQX1 \y_im_reg[9]  ( .D(dout_im[9]), .CK(clk), .Q(y_im[9]) );
  DFFHQX1 \y_im_reg[8]  ( .D(dout_im[8]), .CK(clk), .Q(y_im[8]) );
  DFFHQX1 \y_im_reg[7]  ( .D(dout_im[7]), .CK(clk), .Q(y_im[7]) );
  DFFHQX1 \y_im_reg[6]  ( .D(dout_im[6]), .CK(clk), .Q(y_im[6]) );
  DFFHQX1 \y_im_reg[5]  ( .D(dout_im[5]), .CK(clk), .Q(y_im[5]) );
  DFFHQX1 \y_im_reg[4]  ( .D(dout_im[4]), .CK(clk), .Q(y_im[4]) );
  DFFHQX1 \y_im_reg[3]  ( .D(dout_im[3]), .CK(clk), .Q(y_im[3]) );
  DFFHQX1 \y_im_reg[2]  ( .D(dout_im[2]), .CK(clk), .Q(y_im[2]) );
  DFFHQX1 \y_im_reg[1]  ( .D(dout_im[1]), .CK(clk), .Q(y_im[1]) );
  DFFHQX1 \y_im_reg[0]  ( .D(dout_im[0]), .CK(clk), .Q(y_im[0]) );
  CLKINVX3 U5 ( .A(bf_nj), .Y(n2) );
  AOI22XL U7 ( .A0(bf_nj), .A1(mux2_im[0]), .B0(mux2_re[0]), .B1(n2), .Y(n1)
         );
  AOI22XL U9 ( .A0(bf_nj), .A1(mux2_im[1]), .B0(mux2_re[1]), .B1(n2), .Y(n3)
         );
  AOI22XL U11 ( .A0(bf_nj), .A1(mux2_im[2]), .B0(mux2_re[2]), .B1(n2), .Y(n4)
         );
  AOI22XL U13 ( .A0(bf_nj), .A1(mux2_im[3]), .B0(mux2_re[3]), .B1(n2), .Y(n5)
         );
  AOI22XL U130 ( .A0(bf_nj), .A1(mux2_im[4]), .B0(mux2_re[4]), .B1(n2), .Y(n6)
         );
  CLKINVX3 U168 ( .A(sel), .Y(n15) );
  INVX1 U173 ( .A(mux2_re[10]), .Y(N87) );
  INVX1 U174 ( .A(mux2_re[11]), .Y(N86) );
  INVX1 U175 ( .A(mux2_re[1]), .Y(N96) );
  INVX1 U176 ( .A(mux2_re[2]), .Y(N95) );
  INVX1 U177 ( .A(mux2_re[3]), .Y(N94) );
  INVX1 U178 ( .A(mux2_re[4]), .Y(N93) );
  INVX1 U179 ( .A(mux2_re[5]), .Y(N92) );
  INVX1 U180 ( .A(mux2_re[6]), .Y(N91) );
  INVX1 U181 ( .A(mux2_re[7]), .Y(N90) );
  INVX1 U182 ( .A(mux2_re[8]), .Y(N89) );
  INVX1 U183 ( .A(mux2_re[9]), .Y(N88) );
  INVX1 U184 ( .A(mux2_re[0]), .Y(N97) );
  signal_control3 s0 ( .clk(clk), .reset(reset), .di_en(di_en), .sel(sel), 
        .bf_nj(bf_nj), .do_en(do_en) );
  delaybuffer2_WIDTH12 d0 ( .clk(clk), .reset(reset), .x_re(dx_re), .x_im(
        dx_im), .y_re(dy_re), .y_im(dy_im) );
  butterfly2_WIDTH12_1 b0 ( .x0_re(dy_re), .x0_im(dy_im), .x1_re(x_re_r), 
        .x1_im(x_im_r), .y0_re(bf_y0_re), .y0_im(bf_y0_im), .y1_re(bf_y1_re), 
        .y1_im(bf_y1_im) );
  sdfunit5_WIDTH12_DEPTH1_DW01_inc_0_DW01_inc_15 add_0_root_add_102_ni ( .A({
        N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97}), .SUM({
        N109, N108, N107, N106, N105, N104, N103, N102, N101, N100, N99, N98})
         );
endmodule


module signal_control4_DW01_inc_0_DW01_inc_6 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module signal_control4 ( clk, reset, di_en, sel, do_en );
  input clk, reset, di_en;
  output sel, do_en;
  wire   N6, N7, N8, N9, N10, N11, N12, N25, N30, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16;
  wire   [6:0] cnt;

  DFFRHQX4 cnt2_reg ( .D(N25), .CK(clk), .RN(n33), .Q(sel) );
  DFFRHQX1 \cnt_reg[0]  ( .D(n32), .CK(clk), .RN(n33), .Q(cnt[0]) );
  DFFRHQX1 \cnt_reg[1]  ( .D(n31), .CK(clk), .RN(n33), .Q(cnt[1]) );
  DFFRHQX1 \cnt_reg[2]  ( .D(n30), .CK(clk), .RN(n33), .Q(cnt[2]) );
  DFFRHQX1 \cnt_reg[3]  ( .D(n29), .CK(clk), .RN(n33), .Q(cnt[3]) );
  DFFRHQX1 \cnt_reg[4]  ( .D(n28), .CK(clk), .RN(n33), .Q(cnt[4]) );
  DFFRHQX1 \cnt_reg[5]  ( .D(n27), .CK(clk), .RN(n33), .Q(cnt[5]) );
  DFFRHQX1 \cnt_reg[6]  ( .D(n26), .CK(clk), .RN(n33), .Q(cnt[6]) );
  DFFRHQXL do_en_r_reg ( .D(N30), .CK(clk), .RN(n33), .Q(do_en) );
  DFFNRX1 start_count_reg ( .D(n34), .CKN(clk), .RN(n33), .Q(n1), .QN(n16) );
  NAND2BX1 U3 ( .AN(di_en), .B(n16), .Y(n34) );
  INVX1 U4 ( .A(reset), .Y(n33) );
  OAI2BB2X1 U5 ( .B0(n1), .B1(n2), .A0N(N6), .A1N(n3), .Y(n32) );
  OAI2BB2X1 U6 ( .B0(n1), .B1(n4), .A0N(N7), .A1N(n3), .Y(n31) );
  INVX1 U7 ( .A(n5), .Y(n30) );
  AOI22X1 U8 ( .A0(n16), .A1(cnt[2]), .B0(N8), .B1(n3), .Y(n5) );
  OAI2BB2X1 U9 ( .B0(n1), .B1(n6), .A0N(N9), .A1N(n3), .Y(n29) );
  OAI2BB2X1 U10 ( .B0(n1), .B1(n7), .A0N(N10), .A1N(n3), .Y(n28) );
  OAI2BB2X1 U11 ( .B0(n1), .B1(n8), .A0N(N11), .A1N(n3), .Y(n27) );
  INVX1 U12 ( .A(n9), .Y(n26) );
  AOI22X1 U13 ( .A0(n16), .A1(cnt[6]), .B0(N12), .B1(n3), .Y(n9) );
  AOI2BB1X1 U14 ( .A0N(n10), .A1N(n11), .B0(n16), .Y(n3) );
  NAND3X1 U15 ( .A(cnt[5]), .B(cnt[2]), .C(cnt[6]), .Y(n11) );
  NAND4X1 U16 ( .A(n2), .B(n4), .C(n6), .D(n7), .Y(n10) );
  INVX1 U17 ( .A(cnt[1]), .Y(n4) );
  AOI21X1 U18 ( .A0(cnt[6]), .A1(n12), .B0(n13), .Y(N30) );
  AOI221X1 U19 ( .A0(n13), .A1(n2), .B0(cnt[6]), .B1(n12), .C0(sel), .Y(N25)
         );
  NAND4X1 U20 ( .A(n7), .B(n8), .C(n6), .D(n14), .Y(n12) );
  AOI21X1 U21 ( .A0(cnt[1]), .A1(cnt[0]), .B0(cnt[2]), .Y(n14) );
  INVX1 U22 ( .A(cnt[3]), .Y(n6) );
  INVX1 U23 ( .A(cnt[5]), .Y(n8) );
  INVX1 U24 ( .A(cnt[4]), .Y(n7) );
  INVX1 U25 ( .A(cnt[0]), .Y(n2) );
  NOR4BX1 U26 ( .AN(n15), .B(cnt[2]), .C(cnt[3]), .D(cnt[1]), .Y(n13) );
  NOR3X1 U27 ( .A(cnt[4]), .B(cnt[6]), .C(cnt[5]), .Y(n15) );
  signal_control4_DW01_inc_0_DW01_inc_6 add_35 ( .A(cnt), .SUM({N12, N11, N10, 
        N9, N8, N7, N6}) );
endmodule


module carry_select_adder2_WIDTH12_3 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U5 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U8 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_2 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U5 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U8 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_1 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U5 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U8 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X1 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_0 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  AOI2BB1X1 U16 ( .A0N(y[11]), .A1N(x[11]), .B0(n3), .Y(z[12]) );
  INVX1 U17 ( .A(n3), .Y(z[11]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFX2 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(carry), .S(low_sum[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  MXI2X1 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U5 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U8 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  OR2X2 U9 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X1 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U13 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module butterfly2_WIDTH12_0_DW01_inc_0_DW01_inc_16 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module butterfly2_WIDTH12_0_DW01_inc_1_DW01_inc_17 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module butterfly2_WIDTH12_0 ( x0_re, x0_im, x1_re, x1_im, y0_re, y0_im, y1_re, 
        y1_im );
  input [11:0] x0_re;
  input [11:0] x0_im;
  input [11:0] x1_re;
  input [11:0] x1_im;
  output [11:0] y0_re;
  output [11:0] y0_im;
  output [11:0] y1_re;
  output [11:0] y1_im;
  wire   N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N9, N8,
         N7, N6, N5, N4, N3, N2, N11, N10, N1, N0;
  wire   [11:0] x1_re_neg;
  wire   [11:0] x1_im_neg;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  INVX1 U3 ( .A(x1_re[10]), .Y(N1) );
  INVX1 U4 ( .A(x1_re[11]), .Y(N0) );
  INVX1 U5 ( .A(x1_re[1]), .Y(N10) );
  INVX1 U6 ( .A(x1_re[2]), .Y(N9) );
  INVX1 U7 ( .A(x1_re[3]), .Y(N8) );
  INVX1 U8 ( .A(x1_re[4]), .Y(N7) );
  INVX1 U9 ( .A(x1_re[5]), .Y(N6) );
  INVX1 U10 ( .A(x1_re[6]), .Y(N5) );
  INVX1 U11 ( .A(x1_re[7]), .Y(N4) );
  INVX1 U12 ( .A(x1_re[8]), .Y(N3) );
  INVX1 U13 ( .A(x1_re[9]), .Y(N2) );
  INVX1 U14 ( .A(x1_re[0]), .Y(N11) );
  INVX1 U15 ( .A(x1_im[10]), .Y(N13) );
  INVX1 U16 ( .A(x1_im[11]), .Y(N12) );
  INVX1 U17 ( .A(x1_im[1]), .Y(N22) );
  INVX1 U18 ( .A(x1_im[2]), .Y(N21) );
  INVX1 U19 ( .A(x1_im[3]), .Y(N20) );
  INVX1 U20 ( .A(x1_im[4]), .Y(N19) );
  INVX1 U21 ( .A(x1_im[5]), .Y(N18) );
  INVX1 U22 ( .A(x1_im[6]), .Y(N17) );
  INVX1 U23 ( .A(x1_im[7]), .Y(N16) );
  INVX1 U24 ( .A(x1_im[8]), .Y(N15) );
  INVX1 U25 ( .A(x1_im[9]), .Y(N14) );
  INVX1 U26 ( .A(x1_im[0]), .Y(N23) );
  carry_select_adder2_WIDTH12_3 c0 ( .x(x0_re), .y(x1_re), .z({y0_re, 
        SYNOPSYS_UNCONNECTED__0}) );
  carry_select_adder2_WIDTH12_2 c1 ( .x(x0_im), .y(x1_im), .z({y0_im, 
        SYNOPSYS_UNCONNECTED__1}) );
  carry_select_adder2_WIDTH12_1 c2 ( .x(x0_re), .y(x1_re_neg), .z({y1_re, 
        SYNOPSYS_UNCONNECTED__2}) );
  carry_select_adder2_WIDTH12_0 c3 ( .x(x0_im), .y(x1_im_neg), .z({y1_im, 
        SYNOPSYS_UNCONNECTED__3}) );
  butterfly2_WIDTH12_0_DW01_inc_0_DW01_inc_16 add_0_root_add_22_ni ( .A({N12, 
        N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23}), .SUM(
        x1_im_neg) );
  butterfly2_WIDTH12_0_DW01_inc_1_DW01_inc_17 add_0_root_add_21_ni ( .A({N0, 
        N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11}), .SUM(x1_re_neg) );
endmodule


module sdfunit6_WIDTH12 ( clk, di_en, reset, x_re, x_im, y_re, y_im, do_en );
  input [11:0] x_re;
  input [11:0] x_im;
  output [11:0] y_re;
  output [11:0] y_im;
  input clk, di_en, reset;
  output do_en;
  wire   sel, N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14,
         N15, N16, N17, N18, N19, N20, N21, N22, N23, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49;
  wire   [11:0] x_re_r;
  wire   [11:0] x_im_r;
  wire   [11:0] bf_y1_re;
  wire   [11:0] mux1_re;
  wire   [11:0] bf_y1_im;
  wire   [11:0] mux1_im;
  wire   [11:0] bf_y0_re;
  wire   [11:0] bf_y0_im;

  AND2X1 U3 ( .A(x_re[2]), .B(di_en), .Y(N9) );
  AND2X1 U4 ( .A(x_re[3]), .B(di_en), .Y(N8) );
  AOI22X1 U6 ( .A0(sel), .A1(bf_y0_im[0]), .B0(mux1_im[0]), .B1(n2), .Y(n1) );
  INVX1 U7 ( .A(n3), .Y(N71) );
  AOI22X1 U8 ( .A0(bf_y0_im[1]), .A1(sel), .B0(mux1_im[1]), .B1(n2), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(N70) );
  AOI22X1 U10 ( .A0(bf_y0_im[2]), .A1(sel), .B0(mux1_im[2]), .B1(n2), .Y(n4)
         );
  AND2X1 U11 ( .A(x_re[4]), .B(di_en), .Y(N7) );
  INVX1 U12 ( .A(n5), .Y(N69) );
  AOI22X1 U13 ( .A0(bf_y0_im[3]), .A1(sel), .B0(mux1_im[3]), .B1(n2), .Y(n5)
         );
  INVX1 U14 ( .A(n6), .Y(N68) );
  AOI22X1 U15 ( .A0(bf_y0_im[4]), .A1(sel), .B0(mux1_im[4]), .B1(n2), .Y(n6)
         );
  INVX1 U16 ( .A(n7), .Y(N67) );
  AOI22X1 U17 ( .A0(bf_y0_im[5]), .A1(sel), .B0(mux1_im[5]), .B1(n2), .Y(n7)
         );
  INVX1 U18 ( .A(n8), .Y(N66) );
  AOI22X1 U19 ( .A0(bf_y0_im[6]), .A1(sel), .B0(mux1_im[6]), .B1(n2), .Y(n8)
         );
  INVX1 U20 ( .A(n9), .Y(N65) );
  AOI22X1 U21 ( .A0(bf_y0_im[7]), .A1(sel), .B0(mux1_im[7]), .B1(n2), .Y(n9)
         );
  INVX1 U22 ( .A(n10), .Y(N64) );
  AOI22X1 U23 ( .A0(bf_y0_im[8]), .A1(sel), .B0(mux1_im[8]), .B1(n2), .Y(n10)
         );
  INVX1 U24 ( .A(n11), .Y(N63) );
  AOI22X1 U25 ( .A0(bf_y0_im[9]), .A1(sel), .B0(mux1_im[9]), .B1(n2), .Y(n11)
         );
  INVX1 U26 ( .A(n12), .Y(N62) );
  AOI22X1 U27 ( .A0(bf_y0_im[10]), .A1(sel), .B0(mux1_im[10]), .B1(n2), .Y(n12) );
  INVX1 U28 ( .A(n13), .Y(N61) );
  AOI22X1 U29 ( .A0(bf_y0_im[11]), .A1(sel), .B0(mux1_im[11]), .B1(n2), .Y(n13) );
  INVX1 U30 ( .A(n14), .Y(N60) );
  AOI22X1 U31 ( .A0(bf_y0_re[0]), .A1(sel), .B0(mux1_re[0]), .B1(n2), .Y(n14)
         );
  AND2X1 U32 ( .A(x_re[5]), .B(di_en), .Y(N6) );
  INVX1 U33 ( .A(n15), .Y(N59) );
  AOI22X1 U34 ( .A0(bf_y0_re[1]), .A1(sel), .B0(mux1_re[1]), .B1(n2), .Y(n15)
         );
  INVX1 U35 ( .A(n16), .Y(N58) );
  AOI22X1 U36 ( .A0(bf_y0_re[2]), .A1(sel), .B0(mux1_re[2]), .B1(n2), .Y(n16)
         );
  INVX1 U37 ( .A(n17), .Y(N57) );
  AOI22X1 U38 ( .A0(bf_y0_re[3]), .A1(sel), .B0(mux1_re[3]), .B1(n2), .Y(n17)
         );
  INVX1 U39 ( .A(n18), .Y(N56) );
  AOI22X1 U40 ( .A0(bf_y0_re[4]), .A1(sel), .B0(mux1_re[4]), .B1(n2), .Y(n18)
         );
  INVX1 U41 ( .A(n19), .Y(N55) );
  AOI22X1 U42 ( .A0(bf_y0_re[5]), .A1(sel), .B0(mux1_re[5]), .B1(n2), .Y(n19)
         );
  INVX1 U43 ( .A(n20), .Y(N54) );
  AOI22X1 U44 ( .A0(bf_y0_re[6]), .A1(sel), .B0(mux1_re[6]), .B1(n2), .Y(n20)
         );
  INVX1 U45 ( .A(n21), .Y(N53) );
  AOI22X1 U46 ( .A0(bf_y0_re[7]), .A1(sel), .B0(mux1_re[7]), .B1(n2), .Y(n21)
         );
  INVX1 U47 ( .A(n22), .Y(N52) );
  AOI22X1 U48 ( .A0(bf_y0_re[8]), .A1(sel), .B0(mux1_re[8]), .B1(n2), .Y(n22)
         );
  INVX1 U49 ( .A(n23), .Y(N51) );
  AOI22X1 U50 ( .A0(bf_y0_re[9]), .A1(sel), .B0(mux1_re[9]), .B1(n2), .Y(n23)
         );
  INVX1 U51 ( .A(n24), .Y(N50) );
  AOI22X1 U52 ( .A0(bf_y0_re[10]), .A1(sel), .B0(mux1_re[10]), .B1(n2), .Y(n24) );
  AND2X1 U53 ( .A(x_re[6]), .B(di_en), .Y(N5) );
  INVX1 U54 ( .A(n25), .Y(N49) );
  AOI22X1 U55 ( .A0(bf_y0_re[11]), .A1(sel), .B0(mux1_re[11]), .B1(n2), .Y(n25) );
  INVX1 U56 ( .A(n26), .Y(N48) );
  AOI22X1 U57 ( .A0(bf_y1_im[0]), .A1(sel), .B0(x_im_r[0]), .B1(n2), .Y(n26)
         );
  INVX1 U58 ( .A(n27), .Y(N47) );
  AOI22X1 U59 ( .A0(bf_y1_im[1]), .A1(sel), .B0(x_im_r[1]), .B1(n2), .Y(n27)
         );
  INVX1 U60 ( .A(n28), .Y(N46) );
  AOI22X1 U61 ( .A0(bf_y1_im[2]), .A1(sel), .B0(x_im_r[2]), .B1(n2), .Y(n28)
         );
  INVX1 U62 ( .A(n29), .Y(N45) );
  AOI22X1 U63 ( .A0(bf_y1_im[3]), .A1(sel), .B0(x_im_r[3]), .B1(n2), .Y(n29)
         );
  INVX1 U64 ( .A(n30), .Y(N44) );
  AOI22X1 U65 ( .A0(bf_y1_im[4]), .A1(sel), .B0(x_im_r[4]), .B1(n2), .Y(n30)
         );
  INVX1 U66 ( .A(n31), .Y(N43) );
  AOI22X1 U67 ( .A0(bf_y1_im[5]), .A1(sel), .B0(x_im_r[5]), .B1(n2), .Y(n31)
         );
  INVX1 U68 ( .A(n32), .Y(N42) );
  AOI22X1 U69 ( .A0(bf_y1_im[6]), .A1(sel), .B0(x_im_r[6]), .B1(n2), .Y(n32)
         );
  INVX1 U70 ( .A(n33), .Y(N41) );
  AOI22X1 U71 ( .A0(bf_y1_im[7]), .A1(sel), .B0(x_im_r[7]), .B1(n2), .Y(n33)
         );
  INVX1 U72 ( .A(n34), .Y(N40) );
  AOI22X1 U73 ( .A0(bf_y1_im[8]), .A1(sel), .B0(x_im_r[8]), .B1(n2), .Y(n34)
         );
  AND2X1 U74 ( .A(x_re[7]), .B(di_en), .Y(N4) );
  INVX1 U75 ( .A(n35), .Y(N39) );
  AOI22X1 U76 ( .A0(bf_y1_im[9]), .A1(sel), .B0(x_im_r[9]), .B1(n2), .Y(n35)
         );
  INVX1 U77 ( .A(n36), .Y(N38) );
  AOI22X1 U78 ( .A0(bf_y1_im[10]), .A1(sel), .B0(x_im_r[10]), .B1(n2), .Y(n36)
         );
  INVX1 U79 ( .A(n37), .Y(N37) );
  AOI22X1 U80 ( .A0(bf_y1_im[11]), .A1(sel), .B0(x_im_r[11]), .B1(n2), .Y(n37)
         );
  INVX1 U81 ( .A(n38), .Y(N36) );
  AOI22X1 U82 ( .A0(bf_y1_re[0]), .A1(sel), .B0(x_re_r[0]), .B1(n2), .Y(n38)
         );
  INVX1 U83 ( .A(n39), .Y(N35) );
  AOI22X1 U84 ( .A0(bf_y1_re[1]), .A1(sel), .B0(x_re_r[1]), .B1(n2), .Y(n39)
         );
  INVX1 U85 ( .A(n40), .Y(N34) );
  AOI22X1 U86 ( .A0(bf_y1_re[2]), .A1(sel), .B0(x_re_r[2]), .B1(n2), .Y(n40)
         );
  INVX1 U87 ( .A(n41), .Y(N33) );
  AOI22X1 U88 ( .A0(bf_y1_re[3]), .A1(sel), .B0(x_re_r[3]), .B1(n2), .Y(n41)
         );
  INVX1 U89 ( .A(n42), .Y(N32) );
  AOI22X1 U90 ( .A0(bf_y1_re[4]), .A1(sel), .B0(x_re_r[4]), .B1(n2), .Y(n42)
         );
  INVX1 U91 ( .A(n43), .Y(N31) );
  AOI22X1 U92 ( .A0(bf_y1_re[5]), .A1(sel), .B0(x_re_r[5]), .B1(n2), .Y(n43)
         );
  INVX1 U93 ( .A(n44), .Y(N30) );
  AOI22X1 U94 ( .A0(bf_y1_re[6]), .A1(sel), .B0(x_re_r[6]), .B1(n2), .Y(n44)
         );
  AND2X1 U95 ( .A(x_re[8]), .B(di_en), .Y(N3) );
  INVX1 U96 ( .A(n45), .Y(N29) );
  AOI22X1 U97 ( .A0(bf_y1_re[7]), .A1(sel), .B0(x_re_r[7]), .B1(n2), .Y(n45)
         );
  INVX1 U98 ( .A(n46), .Y(N28) );
  AOI22X1 U99 ( .A0(bf_y1_re[8]), .A1(sel), .B0(x_re_r[8]), .B1(n2), .Y(n46)
         );
  INVX1 U100 ( .A(n47), .Y(N27) );
  AOI22X1 U101 ( .A0(bf_y1_re[9]), .A1(sel), .B0(x_re_r[9]), .B1(n2), .Y(n47)
         );
  INVX1 U102 ( .A(n48), .Y(N26) );
  AOI22X1 U103 ( .A0(bf_y1_re[10]), .A1(sel), .B0(x_re_r[10]), .B1(n2), .Y(n48) );
  INVX1 U104 ( .A(n49), .Y(N25) );
  AOI22X1 U105 ( .A0(bf_y1_re[11]), .A1(sel), .B0(x_re_r[11]), .B1(n2), .Y(n49) );
  AND2X1 U107 ( .A(x_im[0]), .B(di_en), .Y(N23) );
  AND2X1 U108 ( .A(x_im[1]), .B(di_en), .Y(N22) );
  AND2X1 U109 ( .A(x_im[2]), .B(di_en), .Y(N21) );
  AND2X1 U110 ( .A(x_im[3]), .B(di_en), .Y(N20) );
  AND2X1 U111 ( .A(x_re[9]), .B(di_en), .Y(N2) );
  AND2X1 U112 ( .A(x_im[4]), .B(di_en), .Y(N19) );
  AND2X1 U113 ( .A(x_im[5]), .B(di_en), .Y(N18) );
  AND2X1 U114 ( .A(x_im[6]), .B(di_en), .Y(N17) );
  AND2X1 U115 ( .A(x_im[7]), .B(di_en), .Y(N16) );
  AND2X1 U116 ( .A(x_im[8]), .B(di_en), .Y(N15) );
  AND2X1 U117 ( .A(x_im[9]), .B(di_en), .Y(N14) );
  AND2X1 U118 ( .A(x_im[10]), .B(di_en), .Y(N13) );
  AND2X1 U119 ( .A(x_im[11]), .B(di_en), .Y(N12) );
  AND2X1 U120 ( .A(x_re[0]), .B(di_en), .Y(N11) );
  AND2X1 U121 ( .A(x_re[1]), .B(di_en), .Y(N10) );
  AND2X1 U122 ( .A(x_re[10]), .B(di_en), .Y(N1) );
  AND2X1 U123 ( .A(x_re[11]), .B(di_en), .Y(N0) );
  DFFHQX1 \x_re_r_reg[11]  ( .D(N0), .CK(clk), .Q(x_re_r[11]) );
  DFFHQX1 \x_re_r_reg[10]  ( .D(N1), .CK(clk), .Q(x_re_r[10]) );
  DFFHQX1 \x_re_r_reg[9]  ( .D(N2), .CK(clk), .Q(x_re_r[9]) );
  DFFHQX1 \x_re_r_reg[8]  ( .D(N3), .CK(clk), .Q(x_re_r[8]) );
  DFFHQX1 \x_re_r_reg[7]  ( .D(N4), .CK(clk), .Q(x_re_r[7]) );
  DFFHQX1 \x_re_r_reg[6]  ( .D(N5), .CK(clk), .Q(x_re_r[6]) );
  DFFHQX1 \x_re_r_reg[5]  ( .D(N6), .CK(clk), .Q(x_re_r[5]) );
  DFFHQX1 \x_re_r_reg[4]  ( .D(N7), .CK(clk), .Q(x_re_r[4]) );
  DFFHQX1 \x_re_r_reg[3]  ( .D(N8), .CK(clk), .Q(x_re_r[3]) );
  DFFHQX1 \x_re_r_reg[2]  ( .D(N9), .CK(clk), .Q(x_re_r[2]) );
  DFFHQX1 \x_re_r_reg[1]  ( .D(N10), .CK(clk), .Q(x_re_r[1]) );
  DFFHQX1 \x_re_r_reg[0]  ( .D(N11), .CK(clk), .Q(x_re_r[0]) );
  DFFHQX1 \x_im_r_reg[11]  ( .D(N12), .CK(clk), .Q(x_im_r[11]) );
  DFFHQX1 \x_im_r_reg[10]  ( .D(N13), .CK(clk), .Q(x_im_r[10]) );
  DFFHQX1 \x_im_r_reg[9]  ( .D(N14), .CK(clk), .Q(x_im_r[9]) );
  DFFHQX1 \x_im_r_reg[8]  ( .D(N15), .CK(clk), .Q(x_im_r[8]) );
  DFFHQX1 \x_im_r_reg[7]  ( .D(N16), .CK(clk), .Q(x_im_r[7]) );
  DFFHQX1 \x_im_r_reg[6]  ( .D(N17), .CK(clk), .Q(x_im_r[6]) );
  DFFHQX1 \x_im_r_reg[5]  ( .D(N18), .CK(clk), .Q(x_im_r[5]) );
  DFFHQX1 \x_im_r_reg[4]  ( .D(N19), .CK(clk), .Q(x_im_r[4]) );
  DFFHQX1 \x_im_r_reg[3]  ( .D(N20), .CK(clk), .Q(x_im_r[3]) );
  DFFHQX1 \x_im_r_reg[2]  ( .D(N21), .CK(clk), .Q(x_im_r[2]) );
  DFFHQX1 \x_im_r_reg[1]  ( .D(N22), .CK(clk), .Q(x_im_r[1]) );
  DFFHQX1 \x_im_r_reg[0]  ( .D(N23), .CK(clk), .Q(x_im_r[0]) );
  DFFHQXL \mux1_im_reg[0]  ( .D(N48), .CK(clk), .Q(mux1_im[0]) );
  DFFHQXL \mux1_im_reg[1]  ( .D(N47), .CK(clk), .Q(mux1_im[1]) );
  DFFHQXL \mux1_im_reg[2]  ( .D(N46), .CK(clk), .Q(mux1_im[2]) );
  DFFHQXL \mux1_im_reg[3]  ( .D(N45), .CK(clk), .Q(mux1_im[3]) );
  DFFHQXL \mux1_im_reg[4]  ( .D(N44), .CK(clk), .Q(mux1_im[4]) );
  DFFHQXL \mux1_im_reg[5]  ( .D(N43), .CK(clk), .Q(mux1_im[5]) );
  DFFHQX1 \mux1_im_reg[6]  ( .D(N42), .CK(clk), .Q(mux1_im[6]) );
  DFFHQXL \mux1_im_reg[7]  ( .D(N41), .CK(clk), .Q(mux1_im[7]) );
  DFFHQXL \mux1_im_reg[8]  ( .D(N40), .CK(clk), .Q(mux1_im[8]) );
  DFFHQXL \mux1_im_reg[9]  ( .D(N39), .CK(clk), .Q(mux1_im[9]) );
  DFFHQXL \mux1_im_reg[10]  ( .D(N38), .CK(clk), .Q(mux1_im[10]) );
  DFFHQXL \mux1_im_reg[11]  ( .D(N37), .CK(clk), .Q(mux1_im[11]) );
  DFFHQXL \mux1_re_reg[0]  ( .D(N36), .CK(clk), .Q(mux1_re[0]) );
  DFFHQXL \mux1_re_reg[1]  ( .D(N35), .CK(clk), .Q(mux1_re[1]) );
  DFFHQXL \mux1_re_reg[2]  ( .D(N34), .CK(clk), .Q(mux1_re[2]) );
  DFFHQXL \mux1_re_reg[3]  ( .D(N33), .CK(clk), .Q(mux1_re[3]) );
  DFFHQXL \mux1_re_reg[4]  ( .D(N32), .CK(clk), .Q(mux1_re[4]) );
  DFFHQXL \mux1_re_reg[5]  ( .D(N31), .CK(clk), .Q(mux1_re[5]) );
  DFFHQX1 \mux1_re_reg[6]  ( .D(N30), .CK(clk), .Q(mux1_re[6]) );
  DFFHQXL \mux1_re_reg[7]  ( .D(N29), .CK(clk), .Q(mux1_re[7]) );
  DFFHQXL \mux1_re_reg[8]  ( .D(N28), .CK(clk), .Q(mux1_re[8]) );
  DFFHQXL \mux1_re_reg[9]  ( .D(N27), .CK(clk), .Q(mux1_re[9]) );
  DFFHQXL \mux1_re_reg[10]  ( .D(N26), .CK(clk), .Q(mux1_re[10]) );
  DFFHQXL \mux1_re_reg[11]  ( .D(N25), .CK(clk), .Q(mux1_re[11]) );
  INVX1 U5 ( .A(n1), .Y(N72) );
  CLKINVX3 U106 ( .A(sel), .Y(n2) );
  DFFHQX1 \mux2_re_reg[11]  ( .D(N49), .CK(clk), .Q(y_re[11]) );
  DFFHQX1 \mux2_re_reg[10]  ( .D(N50), .CK(clk), .Q(y_re[10]) );
  DFFHQX1 \mux2_re_reg[9]  ( .D(N51), .CK(clk), .Q(y_re[9]) );
  DFFHQX1 \mux2_re_reg[8]  ( .D(N52), .CK(clk), .Q(y_re[8]) );
  DFFHQX1 \mux2_re_reg[7]  ( .D(N53), .CK(clk), .Q(y_re[7]) );
  DFFHQX1 \mux2_re_reg[6]  ( .D(N54), .CK(clk), .Q(y_re[6]) );
  DFFHQX1 \mux2_re_reg[5]  ( .D(N55), .CK(clk), .Q(y_re[5]) );
  DFFHQX1 \mux2_re_reg[4]  ( .D(N56), .CK(clk), .Q(y_re[4]) );
  DFFHQX1 \mux2_re_reg[3]  ( .D(N57), .CK(clk), .Q(y_re[3]) );
  DFFHQX1 \mux2_re_reg[2]  ( .D(N58), .CK(clk), .Q(y_re[2]) );
  DFFHQX1 \mux2_re_reg[1]  ( .D(N59), .CK(clk), .Q(y_re[1]) );
  DFFHQX1 \mux2_re_reg[0]  ( .D(N60), .CK(clk), .Q(y_re[0]) );
  DFFHQX1 \mux2_im_reg[11]  ( .D(N61), .CK(clk), .Q(y_im[11]) );
  DFFHQX1 \mux2_im_reg[10]  ( .D(N62), .CK(clk), .Q(y_im[10]) );
  DFFHQX1 \mux2_im_reg[9]  ( .D(N63), .CK(clk), .Q(y_im[9]) );
  DFFHQX1 \mux2_im_reg[8]  ( .D(N64), .CK(clk), .Q(y_im[8]) );
  DFFHQX1 \mux2_im_reg[7]  ( .D(N65), .CK(clk), .Q(y_im[7]) );
  DFFHQX1 \mux2_im_reg[6]  ( .D(N66), .CK(clk), .Q(y_im[6]) );
  DFFHQX1 \mux2_im_reg[5]  ( .D(N67), .CK(clk), .Q(y_im[5]) );
  DFFHQX1 \mux2_im_reg[4]  ( .D(N68), .CK(clk), .Q(y_im[4]) );
  DFFHQX1 \mux2_im_reg[3]  ( .D(N69), .CK(clk), .Q(y_im[3]) );
  DFFHQX1 \mux2_im_reg[2]  ( .D(N70), .CK(clk), .Q(y_im[2]) );
  DFFHQX1 \mux2_im_reg[1]  ( .D(N71), .CK(clk), .Q(y_im[1]) );
  DFFHQX1 \mux2_im_reg[0]  ( .D(N72), .CK(clk), .Q(y_im[0]) );
  signal_control4 s0 ( .clk(clk), .reset(reset), .di_en(di_en), .sel(sel), 
        .do_en(do_en) );
  butterfly2_WIDTH12_0 b0 ( .x0_re(mux1_re), .x0_im(mux1_im), .x1_re(x_re_r), 
        .x1_im(x_im_r), .y0_re(bf_y0_re), .y0_im(bf_y0_im), .y1_re(bf_y1_re), 
        .y1_im(bf_y1_im) );
endmodule


module FFT64 ( clk, reset, di_en, x_re, x_im, y_re, y_im, do_en );
  input [11:0] x_re;
  input [11:0] x_im;
  output [11:0] y_re;
  output [11:0] y_im;
  input clk, reset, di_en;
  output do_en;
  wire   n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, do1, do2, do3,
         do4, do5;
  wire   [11:0] temp1_re;
  wire   [11:0] temp1_im;
  wire   [11:0] temp2_re;
  wire   [11:0] temp2_im;
  wire   [11:0] temp3_re;
  wire   [11:0] temp3_im;
  wire   [11:0] temp4_re;
  wire   [11:0] temp4_im;
  wire   [11:0] temp5_re;
  wire   [11:0] temp5_im;

  BUFX20 U1 ( .A(n49), .Y(y_im[0]) );
  BUFX20 U2 ( .A(n48), .Y(y_im[1]) );
  BUFX20 U3 ( .A(n47), .Y(y_im[2]) );
  BUFX20 U4 ( .A(n46), .Y(y_im[3]) );
  BUFX20 U5 ( .A(n45), .Y(y_im[4]) );
  BUFX20 U6 ( .A(n44), .Y(y_im[5]) );
  BUFX20 U7 ( .A(n43), .Y(y_im[6]) );
  BUFX20 U8 ( .A(n42), .Y(y_im[7]) );
  BUFX20 U9 ( .A(n41), .Y(y_im[8]) );
  BUFX20 U10 ( .A(n40), .Y(y_im[9]) );
  BUFX20 U11 ( .A(n39), .Y(y_im[10]) );
  BUFX20 U12 ( .A(n38), .Y(y_im[11]) );
  BUFX20 U13 ( .A(n37), .Y(y_re[0]) );
  BUFX20 U14 ( .A(n36), .Y(y_re[1]) );
  BUFX20 U15 ( .A(n35), .Y(y_re[2]) );
  BUFX20 U16 ( .A(n34), .Y(y_re[3]) );
  BUFX20 U17 ( .A(n33), .Y(y_re[4]) );
  BUFX20 U18 ( .A(n32), .Y(y_re[5]) );
  BUFX20 U19 ( .A(n31), .Y(y_re[6]) );
  BUFX20 U20 ( .A(n30), .Y(y_re[7]) );
  BUFX20 U21 ( .A(n29), .Y(y_re[8]) );
  BUFX20 U22 ( .A(n28), .Y(y_re[9]) );
  BUFX20 U23 ( .A(n27), .Y(y_re[10]) );
  BUFX20 U24 ( .A(n26), .Y(y_re[11]) );
  CLKBUFX20 U25 ( .A(n50), .Y(do_en) );
  sdfunit1_WIDTH12_DEPTH31 s1 ( .clk(clk), .di_en(di_en), .reset(reset), 
        .x_re(x_re), .x_im(x_im), .y_re(temp1_re), .y_im(temp1_im), .do_en(do1) );
  sdfunit2_WIDTH12_DEPTH15 s2 ( .clk(clk), .di_en(do1), .reset(reset), .x_re(
        temp1_re), .x_im(temp1_im), .y_re(temp2_re), .y_im(temp2_im), .do_en(
        do2) );
  sdfunit3_WIDTH12_DEPTH7 s3 ( .clk(clk), .di_en(do2), .reset(reset), .x_re(
        temp2_re), .x_im(temp2_im), .y_re(temp3_re), .y_im(temp3_im), .do_en(
        do3) );
  sdfunit4_WIDTH12_DEPTH3 s4 ( .clk(clk), .di_en(do3), .reset(reset), .x_re(
        temp3_re), .x_im(temp3_im), .y_re(temp4_re), .y_im(temp4_im), .do_en(
        do4) );
  sdfunit5_WIDTH12_DEPTH1 s5 ( .clk(clk), .di_en(do4), .reset(reset), .x_re(
        temp4_re), .x_im(temp4_im), .y_re(temp5_re), .y_im(temp5_im), .do_en(
        do5) );
  sdfunit6_WIDTH12 s6 ( .clk(clk), .di_en(do5), .reset(reset), .x_re(temp5_re), 
        .x_im(temp5_im), .y_re({n26, n27, n28, n29, n30, n31, n32, n33, n34, 
        n35, n36, n37}), .y_im({n38, n39, n40, n41, n42, n43, n44, n45, n46, 
        n47, n48, n49}), .do_en(n50) );
endmodule

