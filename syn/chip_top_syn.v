/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12
// Date      : Tue Jul 29 16:53:25 2025
/////////////////////////////////////////////////////////////


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
  FSM_DW01_inc_0_DW01_inc_14 add_27 ( .A(cnt), .SUM({N16, N15, N14, N13, N12, 
        N11, N10}) );
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
         n31, n32, n33, n34, n35, n36, n37;

  DFFRHQX1 \buf_im_reg[1][11]  ( .D(x_im[11]), .CK(clk), .RN(n12), .Q(
        \buf_im[1][11] ) );
  DFFRHQX1 \buf_im_reg[2][11]  ( .D(\buf_im[1][11] ), .CK(clk), .RN(n12), .Q(
        \buf_im[2][11] ) );
  DFFRHQX1 \buf_im_reg[3][11]  ( .D(\buf_im[2][11] ), .CK(clk), .RN(n12), .Q(
        \buf_im[3][11] ) );
  DFFRHQX1 \buf_im_reg[4][11]  ( .D(\buf_im[3][11] ), .CK(clk), .RN(n12), .Q(
        \buf_im[4][11] ) );
  DFFRHQX1 \buf_im_reg[5][11]  ( .D(\buf_im[4][11] ), .CK(clk), .RN(n12), .Q(
        \buf_im[5][11] ) );
  DFFRHQX1 \buf_im_reg[6][11]  ( .D(\buf_im[5][11] ), .CK(clk), .RN(n12), .Q(
        \buf_im[6][11] ) );
  DFFRHQX1 \buf_im_reg[7][11]  ( .D(\buf_im[6][11] ), .CK(clk), .RN(n12), .Q(
        \buf_im[7][11] ) );
  DFFRHQX1 \buf_im_reg[8][11]  ( .D(\buf_im[7][11] ), .CK(clk), .RN(n12), .Q(
        \buf_im[8][11] ) );
  DFFRHQX1 \buf_im_reg[9][11]  ( .D(\buf_im[8][11] ), .CK(clk), .RN(n12), .Q(
        \buf_im[9][11] ) );
  DFFRHQX1 \buf_im_reg[10][11]  ( .D(\buf_im[9][11] ), .CK(clk), .RN(n12), .Q(
        \buf_im[10][11] ) );
  DFFRHQX1 \buf_im_reg[11][11]  ( .D(\buf_im[10][11] ), .CK(clk), .RN(n12), 
        .Q(\buf_im[11][11] ) );
  DFFRHQX1 \buf_im_reg[12][11]  ( .D(\buf_im[11][11] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[12][11] ) );
  DFFRHQX1 \buf_im_reg[13][11]  ( .D(\buf_im[12][11] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[13][11] ) );
  DFFRHQX1 \buf_im_reg[14][11]  ( .D(\buf_im[13][11] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[14][11] ) );
  DFFRHQX1 \buf_im_reg[15][11]  ( .D(\buf_im[14][11] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[15][11] ) );
  DFFRHQX1 \buf_im_reg[16][11]  ( .D(\buf_im[15][11] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[16][11] ) );
  DFFRHQX1 \buf_im_reg[17][11]  ( .D(\buf_im[16][11] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[17][11] ) );
  DFFRHQX1 \buf_im_reg[18][11]  ( .D(\buf_im[17][11] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[18][11] ) );
  DFFRHQX1 \buf_im_reg[19][11]  ( .D(\buf_im[18][11] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[19][11] ) );
  DFFRHQX1 \buf_im_reg[20][11]  ( .D(\buf_im[19][11] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[20][11] ) );
  DFFRHQX1 \buf_im_reg[21][11]  ( .D(\buf_im[20][11] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[21][11] ) );
  DFFRHQX1 \buf_im_reg[22][11]  ( .D(\buf_im[21][11] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[22][11] ) );
  DFFRHQX1 \buf_im_reg[23][11]  ( .D(\buf_im[22][11] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[23][11] ) );
  DFFRHQX1 \buf_im_reg[24][11]  ( .D(\buf_im[23][11] ), .CK(clk), .RN(n11), 
        .Q(\buf_im[24][11] ) );
  DFFRHQX1 \buf_im_reg[25][11]  ( .D(\buf_im[24][11] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[25][11] ) );
  DFFRHQX1 \buf_im_reg[26][11]  ( .D(\buf_im[25][11] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[26][11] ) );
  DFFRHQX1 \buf_im_reg[27][11]  ( .D(\buf_im[26][11] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[27][11] ) );
  DFFRHQX1 \buf_im_reg[28][11]  ( .D(\buf_im[27][11] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[28][11] ) );
  DFFRHQX1 \buf_im_reg[29][11]  ( .D(\buf_im[28][11] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[29][11] ) );
  DFFRHQX1 \buf_im_reg[30][11]  ( .D(\buf_im[29][11] ), .CK(clk), .RN(n10), 
        .Q(\buf_im[30][11] ) );
  DFFRHQX1 \buf_im_reg[1][10]  ( .D(x_im[10]), .CK(clk), .RN(n1), .Q(
        \buf_im[1][10] ) );
  DFFRHQX1 \buf_im_reg[2][10]  ( .D(\buf_im[1][10] ), .CK(clk), .RN(n1), .Q(
        \buf_im[2][10] ) );
  DFFRHQX1 \buf_im_reg[3][10]  ( .D(\buf_im[2][10] ), .CK(clk), .RN(n14), .Q(
        \buf_im[3][10] ) );
  DFFRHQX1 \buf_im_reg[4][10]  ( .D(\buf_im[3][10] ), .CK(clk), .RN(n14), .Q(
        \buf_im[4][10] ) );
  DFFRHQX1 \buf_im_reg[5][10]  ( .D(\buf_im[4][10] ), .CK(clk), .RN(n14), .Q(
        \buf_im[5][10] ) );
  DFFRHQX1 \buf_im_reg[6][10]  ( .D(\buf_im[5][10] ), .CK(clk), .RN(n14), .Q(
        \buf_im[6][10] ) );
  DFFRHQX1 \buf_im_reg[7][10]  ( .D(\buf_im[6][10] ), .CK(clk), .RN(n14), .Q(
        \buf_im[7][10] ) );
  DFFRHQX1 \buf_im_reg[8][10]  ( .D(\buf_im[7][10] ), .CK(clk), .RN(n14), .Q(
        \buf_im[8][10] ) );
  DFFRHQX1 \buf_im_reg[9][10]  ( .D(\buf_im[8][10] ), .CK(clk), .RN(n14), .Q(
        \buf_im[9][10] ) );
  DFFRHQX1 \buf_im_reg[10][10]  ( .D(\buf_im[9][10] ), .CK(clk), .RN(n14), .Q(
        \buf_im[10][10] ) );
  DFFRHQX1 \buf_im_reg[11][10]  ( .D(\buf_im[10][10] ), .CK(clk), .RN(n14), 
        .Q(\buf_im[11][10] ) );
  DFFRHQX1 \buf_im_reg[12][10]  ( .D(\buf_im[11][10] ), .CK(clk), .RN(n14), 
        .Q(\buf_im[12][10] ) );
  DFFRHQX1 \buf_im_reg[13][10]  ( .D(\buf_im[12][10] ), .CK(clk), .RN(n14), 
        .Q(\buf_im[13][10] ) );
  DFFRHQX1 \buf_im_reg[14][10]  ( .D(\buf_im[13][10] ), .CK(clk), .RN(n14), 
        .Q(\buf_im[14][10] ) );
  DFFRHQX1 \buf_im_reg[15][10]  ( .D(\buf_im[14][10] ), .CK(clk), .RN(n14), 
        .Q(\buf_im[15][10] ) );
  DFFRHQX1 \buf_im_reg[16][10]  ( .D(\buf_im[15][10] ), .CK(clk), .RN(n13), 
        .Q(\buf_im[16][10] ) );
  DFFRHQX1 \buf_im_reg[17][10]  ( .D(\buf_im[16][10] ), .CK(clk), .RN(n13), 
        .Q(\buf_im[17][10] ) );
  DFFRHQX1 \buf_im_reg[18][10]  ( .D(\buf_im[17][10] ), .CK(clk), .RN(n13), 
        .Q(\buf_im[18][10] ) );
  DFFRHQX1 \buf_im_reg[19][10]  ( .D(\buf_im[18][10] ), .CK(clk), .RN(n13), 
        .Q(\buf_im[19][10] ) );
  DFFRHQX1 \buf_im_reg[20][10]  ( .D(\buf_im[19][10] ), .CK(clk), .RN(n13), 
        .Q(\buf_im[20][10] ) );
  DFFRHQX1 \buf_im_reg[21][10]  ( .D(\buf_im[20][10] ), .CK(clk), .RN(n13), 
        .Q(\buf_im[21][10] ) );
  DFFRHQX1 \buf_im_reg[22][10]  ( .D(\buf_im[21][10] ), .CK(clk), .RN(n13), 
        .Q(\buf_im[22][10] ) );
  DFFRHQX1 \buf_im_reg[23][10]  ( .D(\buf_im[22][10] ), .CK(clk), .RN(n13), 
        .Q(\buf_im[23][10] ) );
  DFFRHQX1 \buf_im_reg[24][10]  ( .D(\buf_im[23][10] ), .CK(clk), .RN(n13), 
        .Q(\buf_im[24][10] ) );
  DFFRHQX1 \buf_im_reg[25][10]  ( .D(\buf_im[24][10] ), .CK(clk), .RN(n13), 
        .Q(\buf_im[25][10] ) );
  DFFRHQX1 \buf_im_reg[26][10]  ( .D(\buf_im[25][10] ), .CK(clk), .RN(n13), 
        .Q(\buf_im[26][10] ) );
  DFFRHQX1 \buf_im_reg[27][10]  ( .D(\buf_im[26][10] ), .CK(clk), .RN(n13), 
        .Q(\buf_im[27][10] ) );
  DFFRHQX1 \buf_im_reg[28][10]  ( .D(\buf_im[27][10] ), .CK(clk), .RN(n13), 
        .Q(\buf_im[28][10] ) );
  DFFRHQX1 \buf_im_reg[29][10]  ( .D(\buf_im[28][10] ), .CK(clk), .RN(n12), 
        .Q(\buf_im[29][10] ) );
  DFFRHQX1 \buf_im_reg[30][10]  ( .D(\buf_im[29][10] ), .CK(clk), .RN(n12), 
        .Q(\buf_im[30][10] ) );
  DFFRHQX1 \buf_im_reg[1][9]  ( .D(x_im[9]), .CK(clk), .RN(n35), .Q(
        \buf_im[1][9] ) );
  DFFRHQX1 \buf_im_reg[2][9]  ( .D(\buf_im[1][9] ), .CK(clk), .RN(n22), .Q(
        \buf_im[2][9] ) );
  DFFRHQX1 \buf_im_reg[3][9]  ( .D(\buf_im[2][9] ), .CK(clk), .RN(n4), .Q(
        \buf_im[3][9] ) );
  DFFRHQX1 \buf_im_reg[4][9]  ( .D(\buf_im[3][9] ), .CK(clk), .RN(n2), .Q(
        \buf_im[4][9] ) );
  DFFRHQX1 \buf_im_reg[5][9]  ( .D(\buf_im[4][9] ), .CK(clk), .RN(n21), .Q(
        \buf_im[5][9] ) );
  DFFRHQX1 \buf_im_reg[6][9]  ( .D(\buf_im[5][9] ), .CK(clk), .RN(n3), .Q(
        \buf_im[6][9] ) );
  DFFRHQX1 \buf_im_reg[7][9]  ( .D(\buf_im[6][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[7][9] ) );
  DFFRHQX1 \buf_im_reg[8][9]  ( .D(\buf_im[7][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[8][9] ) );
  DFFRHQX1 \buf_im_reg[9][9]  ( .D(\buf_im[8][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[9][9] ) );
  DFFRHQX1 \buf_im_reg[10][9]  ( .D(\buf_im[9][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[10][9] ) );
  DFFRHQX1 \buf_im_reg[11][9]  ( .D(\buf_im[10][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[11][9] ) );
  DFFRHQX1 \buf_im_reg[12][9]  ( .D(\buf_im[11][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[12][9] ) );
  DFFRHQX1 \buf_im_reg[13][9]  ( .D(\buf_im[12][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[13][9] ) );
  DFFRHQX1 \buf_im_reg[14][9]  ( .D(\buf_im[13][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[14][9] ) );
  DFFRHQX1 \buf_im_reg[15][9]  ( .D(\buf_im[14][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[15][9] ) );
  DFFRHQX1 \buf_im_reg[16][9]  ( .D(\buf_im[15][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[16][9] ) );
  DFFRHQX1 \buf_im_reg[17][9]  ( .D(\buf_im[16][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[17][9] ) );
  DFFRHQX1 \buf_im_reg[18][9]  ( .D(\buf_im[17][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[18][9] ) );
  DFFRHQX1 \buf_im_reg[19][9]  ( .D(\buf_im[18][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[19][9] ) );
  DFFRHQX1 \buf_im_reg[20][9]  ( .D(\buf_im[19][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[20][9] ) );
  DFFRHQX1 \buf_im_reg[21][9]  ( .D(\buf_im[20][9] ), .CK(clk), .RN(n32), .Q(
        \buf_im[21][9] ) );
  DFFRHQX1 \buf_im_reg[22][9]  ( .D(\buf_im[21][9] ), .CK(clk), .RN(n31), .Q(
        \buf_im[22][9] ) );
  DFFRHQX1 \buf_im_reg[23][9]  ( .D(\buf_im[22][9] ), .CK(clk), .RN(n35), .Q(
        \buf_im[23][9] ) );
  DFFRHQX1 \buf_im_reg[24][9]  ( .D(\buf_im[23][9] ), .CK(clk), .RN(n32), .Q(
        \buf_im[24][9] ) );
  DFFRHQX1 \buf_im_reg[25][9]  ( .D(\buf_im[24][9] ), .CK(clk), .RN(n31), .Q(
        \buf_im[25][9] ) );
  DFFRHQX1 \buf_im_reg[26][9]  ( .D(\buf_im[25][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[26][9] ) );
  DFFRHQX1 \buf_im_reg[27][9]  ( .D(\buf_im[26][9] ), .CK(clk), .RN(n35), .Q(
        \buf_im[27][9] ) );
  DFFRHQX1 \buf_im_reg[28][9]  ( .D(\buf_im[27][9] ), .CK(clk), .RN(n15), .Q(
        \buf_im[28][9] ) );
  DFFRHQX1 \buf_im_reg[29][9]  ( .D(\buf_im[28][9] ), .CK(clk), .RN(n32), .Q(
        \buf_im[29][9] ) );
  DFFRHQX1 \buf_im_reg[30][9]  ( .D(\buf_im[29][9] ), .CK(clk), .RN(n31), .Q(
        \buf_im[30][9] ) );
  DFFRHQX1 \buf_im_reg[1][8]  ( .D(x_im[8]), .CK(clk), .RN(n20), .Q(
        \buf_im[1][8] ) );
  DFFRHQX1 \buf_im_reg[2][8]  ( .D(\buf_im[1][8] ), .CK(clk), .RN(n20), .Q(
        \buf_im[2][8] ) );
  DFFRHQX1 \buf_im_reg[3][8]  ( .D(\buf_im[2][8] ), .CK(clk), .RN(n20), .Q(
        \buf_im[3][8] ) );
  DFFRHQX1 \buf_im_reg[4][8]  ( .D(\buf_im[3][8] ), .CK(clk), .RN(n20), .Q(
        \buf_im[4][8] ) );
  DFFRHQX1 \buf_im_reg[5][8]  ( .D(\buf_im[4][8] ), .CK(clk), .RN(n20), .Q(
        \buf_im[5][8] ) );
  DFFRHQX1 \buf_im_reg[6][8]  ( .D(\buf_im[5][8] ), .CK(clk), .RN(n19), .Q(
        \buf_im[6][8] ) );
  DFFRHQX1 \buf_im_reg[7][8]  ( .D(\buf_im[6][8] ), .CK(clk), .RN(n19), .Q(
        \buf_im[7][8] ) );
  DFFRHQX1 \buf_im_reg[8][8]  ( .D(\buf_im[7][8] ), .CK(clk), .RN(n19), .Q(
        \buf_im[8][8] ) );
  DFFRHQX1 \buf_im_reg[9][8]  ( .D(\buf_im[8][8] ), .CK(clk), .RN(n19), .Q(
        \buf_im[9][8] ) );
  DFFRHQX1 \buf_im_reg[10][8]  ( .D(\buf_im[9][8] ), .CK(clk), .RN(n19), .Q(
        \buf_im[10][8] ) );
  DFFRHQX1 \buf_im_reg[11][8]  ( .D(\buf_im[10][8] ), .CK(clk), .RN(n19), .Q(
        \buf_im[11][8] ) );
  DFFRHQX1 \buf_im_reg[12][8]  ( .D(\buf_im[11][8] ), .CK(clk), .RN(n19), .Q(
        \buf_im[12][8] ) );
  DFFRHQX1 \buf_im_reg[13][8]  ( .D(\buf_im[12][8] ), .CK(clk), .RN(n19), .Q(
        \buf_im[13][8] ) );
  DFFRHQX1 \buf_im_reg[14][8]  ( .D(\buf_im[13][8] ), .CK(clk), .RN(n19), .Q(
        \buf_im[14][8] ) );
  DFFRHQX1 \buf_im_reg[15][8]  ( .D(\buf_im[14][8] ), .CK(clk), .RN(n19), .Q(
        \buf_im[15][8] ) );
  DFFRHQX1 \buf_im_reg[16][8]  ( .D(\buf_im[15][8] ), .CK(clk), .RN(n19), .Q(
        \buf_im[16][8] ) );
  DFFRHQX1 \buf_im_reg[17][8]  ( .D(\buf_im[16][8] ), .CK(clk), .RN(n19), .Q(
        \buf_im[17][8] ) );
  DFFRHQX1 \buf_im_reg[18][8]  ( .D(\buf_im[17][8] ), .CK(clk), .RN(n19), .Q(
        \buf_im[18][8] ) );
  DFFRHQX1 \buf_im_reg[19][8]  ( .D(\buf_im[18][8] ), .CK(clk), .RN(n17), .Q(
        \buf_im[19][8] ) );
  DFFRHQX1 \buf_im_reg[20][8]  ( .D(\buf_im[19][8] ), .CK(clk), .RN(n16), .Q(
        \buf_im[20][8] ) );
  DFFRHQX1 \buf_im_reg[21][8]  ( .D(\buf_im[20][8] ), .CK(clk), .RN(n10), .Q(
        \buf_im[21][8] ) );
  DFFRHQX1 \buf_im_reg[22][8]  ( .D(\buf_im[21][8] ), .CK(clk), .RN(n8), .Q(
        \buf_im[22][8] ) );
  DFFRHQX1 \buf_im_reg[23][8]  ( .D(\buf_im[22][8] ), .CK(clk), .RN(n18), .Q(
        \buf_im[23][8] ) );
  DFFRHQX1 \buf_im_reg[24][8]  ( .D(\buf_im[23][8] ), .CK(clk), .RN(n17), .Q(
        \buf_im[24][8] ) );
  DFFRHQX1 \buf_im_reg[25][8]  ( .D(\buf_im[24][8] ), .CK(clk), .RN(n16), .Q(
        \buf_im[25][8] ) );
  DFFRHQX1 \buf_im_reg[26][8]  ( .D(\buf_im[25][8] ), .CK(clk), .RN(n10), .Q(
        \buf_im[26][8] ) );
  DFFRHQX1 \buf_im_reg[27][8]  ( .D(\buf_im[26][8] ), .CK(clk), .RN(n8), .Q(
        \buf_im[27][8] ) );
  DFFRHQX1 \buf_im_reg[28][8]  ( .D(\buf_im[27][8] ), .CK(clk), .RN(n18), .Q(
        \buf_im[28][8] ) );
  DFFRHQX1 \buf_im_reg[29][8]  ( .D(\buf_im[28][8] ), .CK(clk), .RN(n23), .Q(
        \buf_im[29][8] ) );
  DFFRHQX1 \buf_im_reg[30][8]  ( .D(\buf_im[29][8] ), .CK(clk), .RN(n6), .Q(
        \buf_im[30][8] ) );
  DFFRHQX1 \buf_im_reg[1][7]  ( .D(x_im[7]), .CK(clk), .RN(n7), .Q(
        \buf_im[1][7] ) );
  DFFRHQX1 \buf_im_reg[2][7]  ( .D(\buf_im[1][7] ), .CK(clk), .RN(n18), .Q(
        \buf_im[2][7] ) );
  DFFRHQX1 \buf_im_reg[3][7]  ( .D(\buf_im[2][7] ), .CK(clk), .RN(n18), .Q(
        \buf_im[3][7] ) );
  DFFRHQX1 \buf_im_reg[4][7]  ( .D(\buf_im[3][7] ), .CK(clk), .RN(n18), .Q(
        \buf_im[4][7] ) );
  DFFRHQX1 \buf_im_reg[5][7]  ( .D(\buf_im[4][7] ), .CK(clk), .RN(n18), .Q(
        \buf_im[5][7] ) );
  DFFRHQX1 \buf_im_reg[6][7]  ( .D(\buf_im[5][7] ), .CK(clk), .RN(n18), .Q(
        \buf_im[6][7] ) );
  DFFRHQX1 \buf_im_reg[7][7]  ( .D(\buf_im[6][7] ), .CK(clk), .RN(n18), .Q(
        \buf_im[7][7] ) );
  DFFRHQX1 \buf_im_reg[8][7]  ( .D(\buf_im[7][7] ), .CK(clk), .RN(n18), .Q(
        \buf_im[8][7] ) );
  DFFRHQX1 \buf_im_reg[9][7]  ( .D(\buf_im[8][7] ), .CK(clk), .RN(n18), .Q(
        \buf_im[9][7] ) );
  DFFRHQX1 \buf_im_reg[10][7]  ( .D(\buf_im[9][7] ), .CK(clk), .RN(n18), .Q(
        \buf_im[10][7] ) );
  DFFRHQX1 \buf_im_reg[11][7]  ( .D(\buf_im[10][7] ), .CK(clk), .RN(n18), .Q(
        \buf_im[11][7] ) );
  DFFRHQX1 \buf_im_reg[12][7]  ( .D(\buf_im[11][7] ), .CK(clk), .RN(n18), .Q(
        \buf_im[12][7] ) );
  DFFRHQX1 \buf_im_reg[13][7]  ( .D(\buf_im[12][7] ), .CK(clk), .RN(n18), .Q(
        \buf_im[13][7] ) );
  DFFRHQX1 \buf_im_reg[14][7]  ( .D(\buf_im[13][7] ), .CK(clk), .RN(n18), .Q(
        \buf_im[14][7] ) );
  DFFRHQX1 \buf_im_reg[15][7]  ( .D(\buf_im[14][7] ), .CK(clk), .RN(n17), .Q(
        \buf_im[15][7] ) );
  DFFRHQX1 \buf_im_reg[16][7]  ( .D(\buf_im[15][7] ), .CK(clk), .RN(n17), .Q(
        \buf_im[16][7] ) );
  DFFRHQX1 \buf_im_reg[17][7]  ( .D(\buf_im[16][7] ), .CK(clk), .RN(n17), .Q(
        \buf_im[17][7] ) );
  DFFRHQX1 \buf_im_reg[18][7]  ( .D(\buf_im[17][7] ), .CK(clk), .RN(n17), .Q(
        \buf_im[18][7] ) );
  DFFRHQX1 \buf_im_reg[19][7]  ( .D(\buf_im[18][7] ), .CK(clk), .RN(n17), .Q(
        \buf_im[19][7] ) );
  DFFRHQX1 \buf_im_reg[20][7]  ( .D(\buf_im[19][7] ), .CK(clk), .RN(n17), .Q(
        \buf_im[20][7] ) );
  DFFRHQX1 \buf_im_reg[21][7]  ( .D(\buf_im[20][7] ), .CK(clk), .RN(n17), .Q(
        \buf_im[21][7] ) );
  DFFRHQX1 \buf_im_reg[22][7]  ( .D(\buf_im[21][7] ), .CK(clk), .RN(n17), .Q(
        \buf_im[22][7] ) );
  DFFRHQX1 \buf_im_reg[23][7]  ( .D(\buf_im[22][7] ), .CK(clk), .RN(n17), .Q(
        \buf_im[23][7] ) );
  DFFRHQX1 \buf_im_reg[24][7]  ( .D(\buf_im[23][7] ), .CK(clk), .RN(n17), .Q(
        \buf_im[24][7] ) );
  DFFRHQX1 \buf_im_reg[25][7]  ( .D(\buf_im[24][7] ), .CK(clk), .RN(n17), .Q(
        \buf_im[25][7] ) );
  DFFRHQX1 \buf_im_reg[26][7]  ( .D(\buf_im[25][7] ), .CK(clk), .RN(n17), .Q(
        \buf_im[26][7] ) );
  DFFRHQX1 \buf_im_reg[27][7]  ( .D(\buf_im[26][7] ), .CK(clk), .RN(n17), .Q(
        \buf_im[27][7] ) );
  DFFRHQX1 \buf_im_reg[28][7]  ( .D(\buf_im[27][7] ), .CK(clk), .RN(n16), .Q(
        \buf_im[28][7] ) );
  DFFRHQX1 \buf_im_reg[29][7]  ( .D(\buf_im[28][7] ), .CK(clk), .RN(n16), .Q(
        \buf_im[29][7] ) );
  DFFRHQX1 \buf_im_reg[30][7]  ( .D(\buf_im[29][7] ), .CK(clk), .RN(n16), .Q(
        \buf_im[30][7] ) );
  DFFRHQX1 \buf_im_reg[1][6]  ( .D(x_im[6]), .CK(clk), .RN(n16), .Q(
        \buf_im[1][6] ) );
  DFFRHQX1 \buf_im_reg[2][6]  ( .D(\buf_im[1][6] ), .CK(clk), .RN(n16), .Q(
        \buf_im[2][6] ) );
  DFFRHQX1 \buf_im_reg[3][6]  ( .D(\buf_im[2][6] ), .CK(clk), .RN(n16), .Q(
        \buf_im[3][6] ) );
  DFFRHQX1 \buf_im_reg[4][6]  ( .D(\buf_im[3][6] ), .CK(clk), .RN(n16), .Q(
        \buf_im[4][6] ) );
  DFFRHQX1 \buf_im_reg[5][6]  ( .D(\buf_im[4][6] ), .CK(clk), .RN(n16), .Q(
        \buf_im[5][6] ) );
  DFFRHQX1 \buf_im_reg[6][6]  ( .D(\buf_im[5][6] ), .CK(clk), .RN(n16), .Q(
        \buf_im[6][6] ) );
  DFFRHQX1 \buf_im_reg[7][6]  ( .D(\buf_im[6][6] ), .CK(clk), .RN(n16), .Q(
        \buf_im[7][6] ) );
  DFFRHQX1 \buf_im_reg[8][6]  ( .D(\buf_im[7][6] ), .CK(clk), .RN(n16), .Q(
        \buf_im[8][6] ) );
  DFFRHQX1 \buf_im_reg[9][6]  ( .D(\buf_im[8][6] ), .CK(clk), .RN(n16), .Q(
        \buf_im[9][6] ) );
  DFFRHQX1 \buf_im_reg[10][6]  ( .D(\buf_im[9][6] ), .CK(clk), .RN(n16), .Q(
        \buf_im[10][6] ) );
  DFFRHQX1 \buf_im_reg[11][6]  ( .D(\buf_im[10][6] ), .CK(clk), .RN(n9), .Q(
        \buf_im[11][6] ) );
  DFFRHQX1 \buf_im_reg[12][6]  ( .D(\buf_im[11][6] ), .CK(clk), .RN(n35), .Q(
        \buf_im[12][6] ) );
  DFFRHQX1 \buf_im_reg[13][6]  ( .D(\buf_im[12][6] ), .CK(clk), .RN(n20), .Q(
        \buf_im[13][6] ) );
  DFFRHQX1 \buf_im_reg[14][6]  ( .D(\buf_im[13][6] ), .CK(clk), .RN(n24), .Q(
        \buf_im[14][6] ) );
  DFFRHQX1 \buf_im_reg[15][6]  ( .D(\buf_im[14][6] ), .CK(clk), .RN(n11), .Q(
        \buf_im[15][6] ) );
  DFFRHQX1 \buf_im_reg[16][6]  ( .D(\buf_im[15][6] ), .CK(clk), .RN(n8), .Q(
        \buf_im[16][6] ) );
  DFFRHQX1 \buf_im_reg[17][6]  ( .D(\buf_im[16][6] ), .CK(clk), .RN(n33), .Q(
        \buf_im[17][6] ) );
  DFFRHQX1 \buf_im_reg[18][6]  ( .D(\buf_im[17][6] ), .CK(clk), .RN(n19), .Q(
        \buf_im[18][6] ) );
  DFFRHQX1 \buf_im_reg[19][6]  ( .D(\buf_im[18][6] ), .CK(clk), .RN(n28), .Q(
        \buf_im[19][6] ) );
  DFFRHQX1 \buf_im_reg[20][6]  ( .D(\buf_im[19][6] ), .CK(clk), .RN(n26), .Q(
        \buf_im[20][6] ) );
  DFFRHQX1 \buf_im_reg[21][6]  ( .D(\buf_im[20][6] ), .CK(clk), .RN(n9), .Q(
        \buf_im[21][6] ) );
  DFFRHQX1 \buf_im_reg[22][6]  ( .D(\buf_im[21][6] ), .CK(clk), .RN(n35), .Q(
        \buf_im[22][6] ) );
  DFFRHQX1 \buf_im_reg[23][6]  ( .D(\buf_im[22][6] ), .CK(clk), .RN(n20), .Q(
        \buf_im[23][6] ) );
  DFFRHQX1 \buf_im_reg[24][6]  ( .D(\buf_im[23][6] ), .CK(clk), .RN(n7), .Q(
        \buf_im[24][6] ) );
  DFFRHQX1 \buf_im_reg[25][6]  ( .D(\buf_im[24][6] ), .CK(clk), .RN(n6), .Q(
        \buf_im[25][6] ) );
  DFFRHQX1 \buf_im_reg[26][6]  ( .D(\buf_im[25][6] ), .CK(clk), .RN(n23), .Q(
        \buf_im[26][6] ) );
  DFFRHQX1 \buf_im_reg[27][6]  ( .D(\buf_im[26][6] ), .CK(clk), .RN(n23), .Q(
        \buf_im[27][6] ) );
  DFFRHQX1 \buf_im_reg[28][6]  ( .D(\buf_im[27][6] ), .CK(clk), .RN(n7), .Q(
        \buf_im[28][6] ) );
  DFFRHQX1 \buf_im_reg[29][6]  ( .D(\buf_im[28][6] ), .CK(clk), .RN(n6), .Q(
        \buf_im[29][6] ) );
  DFFRHQX1 \buf_im_reg[30][6]  ( .D(\buf_im[29][6] ), .CK(clk), .RN(n7), .Q(
        \buf_im[30][6] ) );
  DFFRHQX1 \buf_im_reg[1][5]  ( .D(x_im[5]), .CK(clk), .RN(n10), .Q(
        \buf_im[1][5] ) );
  DFFRHQX1 \buf_im_reg[2][5]  ( .D(\buf_im[1][5] ), .CK(clk), .RN(n10), .Q(
        \buf_im[2][5] ) );
  DFFRHQX1 \buf_im_reg[3][5]  ( .D(\buf_im[2][5] ), .CK(clk), .RN(n10), .Q(
        \buf_im[3][5] ) );
  DFFRHQX1 \buf_im_reg[4][5]  ( .D(\buf_im[3][5] ), .CK(clk), .RN(n10), .Q(
        \buf_im[4][5] ) );
  DFFRHQX1 \buf_im_reg[5][5]  ( .D(\buf_im[4][5] ), .CK(clk), .RN(n10), .Q(
        \buf_im[5][5] ) );
  DFFRHQX1 \buf_im_reg[6][5]  ( .D(\buf_im[5][5] ), .CK(clk), .RN(n10), .Q(
        \buf_im[6][5] ) );
  DFFRHQX1 \buf_im_reg[7][5]  ( .D(\buf_im[6][5] ), .CK(clk), .RN(n10), .Q(
        \buf_im[7][5] ) );
  DFFRHQX1 \buf_im_reg[8][5]  ( .D(\buf_im[7][5] ), .CK(clk), .RN(n35), .Q(
        \buf_im[8][5] ) );
  DFFRHQX1 \buf_im_reg[9][5]  ( .D(\buf_im[8][5] ), .CK(clk), .RN(n9), .Q(
        \buf_im[9][5] ) );
  DFFRHQX1 \buf_im_reg[10][5]  ( .D(\buf_im[9][5] ), .CK(clk), .RN(n28), .Q(
        \buf_im[10][5] ) );
  DFFRHQX1 \buf_im_reg[11][5]  ( .D(\buf_im[10][5] ), .CK(clk), .RN(n26), .Q(
        \buf_im[11][5] ) );
  DFFRHQX1 \buf_im_reg[12][5]  ( .D(\buf_im[11][5] ), .CK(clk), .RN(n33), .Q(
        \buf_im[12][5] ) );
  DFFRHQX1 \buf_im_reg[13][5]  ( .D(\buf_im[12][5] ), .CK(clk), .RN(n19), .Q(
        \buf_im[13][5] ) );
  DFFRHQX1 \buf_im_reg[14][5]  ( .D(\buf_im[13][5] ), .CK(clk), .RN(n24), .Q(
        \buf_im[14][5] ) );
  DFFRHQX1 \buf_im_reg[15][5]  ( .D(\buf_im[14][5] ), .CK(clk), .RN(n11), .Q(
        \buf_im[15][5] ) );
  DFFRHQX1 \buf_im_reg[16][5]  ( .D(\buf_im[15][5] ), .CK(clk), .RN(n17), .Q(
        \buf_im[16][5] ) );
  DFFRHQX1 \buf_im_reg[17][5]  ( .D(\buf_im[16][5] ), .CK(clk), .RN(n28), .Q(
        \buf_im[17][5] ) );
  DFFRHQX1 \buf_im_reg[18][5]  ( .D(\buf_im[17][5] ), .CK(clk), .RN(n26), .Q(
        \buf_im[18][5] ) );
  DFFRHQX1 \buf_im_reg[19][5]  ( .D(\buf_im[18][5] ), .CK(clk), .RN(n9), .Q(
        \buf_im[19][5] ) );
  DFFRHQX1 \buf_im_reg[20][5]  ( .D(\buf_im[19][5] ), .CK(clk), .RN(n20), .Q(
        \buf_im[20][5] ) );
  DFFRHQX1 \buf_im_reg[21][5]  ( .D(\buf_im[20][5] ), .CK(clk), .RN(n9), .Q(
        \buf_im[21][5] ) );
  DFFRHQX1 \buf_im_reg[22][5]  ( .D(\buf_im[21][5] ), .CK(clk), .RN(n9), .Q(
        \buf_im[22][5] ) );
  DFFRHQX1 \buf_im_reg[23][5]  ( .D(\buf_im[22][5] ), .CK(clk), .RN(n9), .Q(
        \buf_im[23][5] ) );
  DFFRHQX1 \buf_im_reg[24][5]  ( .D(\buf_im[23][5] ), .CK(clk), .RN(n9), .Q(
        \buf_im[24][5] ) );
  DFFRHQX1 \buf_im_reg[25][5]  ( .D(\buf_im[24][5] ), .CK(clk), .RN(n9), .Q(
        \buf_im[25][5] ) );
  DFFRHQX1 \buf_im_reg[26][5]  ( .D(\buf_im[25][5] ), .CK(clk), .RN(n9), .Q(
        \buf_im[26][5] ) );
  DFFRHQX1 \buf_im_reg[27][5]  ( .D(\buf_im[26][5] ), .CK(clk), .RN(n9), .Q(
        \buf_im[27][5] ) );
  DFFRHQX1 \buf_im_reg[28][5]  ( .D(\buf_im[27][5] ), .CK(clk), .RN(n9), .Q(
        \buf_im[28][5] ) );
  DFFRHQX1 \buf_im_reg[29][5]  ( .D(\buf_im[28][5] ), .CK(clk), .RN(n9), .Q(
        \buf_im[29][5] ) );
  DFFRHQX1 \buf_im_reg[30][5]  ( .D(\buf_im[29][5] ), .CK(clk), .RN(n9), .Q(
        \buf_im[30][5] ) );
  DFFRHQX1 \buf_im_reg[1][4]  ( .D(x_im[4]), .CK(clk), .RN(n9), .Q(
        \buf_im[1][4] ) );
  DFFRHQX1 \buf_im_reg[2][4]  ( .D(\buf_im[1][4] ), .CK(clk), .RN(n9), .Q(
        \buf_im[2][4] ) );
  DFFRHQX1 \buf_im_reg[3][4]  ( .D(\buf_im[2][4] ), .CK(clk), .RN(n9), .Q(
        \buf_im[3][4] ) );
  DFFRHQX1 \buf_im_reg[4][4]  ( .D(\buf_im[3][4] ), .CK(clk), .RN(n8), .Q(
        \buf_im[4][4] ) );
  DFFRHQX1 \buf_im_reg[5][4]  ( .D(\buf_im[4][4] ), .CK(clk), .RN(n8), .Q(
        \buf_im[5][4] ) );
  DFFRHQX1 \buf_im_reg[6][4]  ( .D(\buf_im[5][4] ), .CK(clk), .RN(n8), .Q(
        \buf_im[6][4] ) );
  DFFRHQX1 \buf_im_reg[7][4]  ( .D(\buf_im[6][4] ), .CK(clk), .RN(n8), .Q(
        \buf_im[7][4] ) );
  DFFRHQX1 \buf_im_reg[8][4]  ( .D(\buf_im[7][4] ), .CK(clk), .RN(n8), .Q(
        \buf_im[8][4] ) );
  DFFRHQX1 \buf_im_reg[9][4]  ( .D(\buf_im[8][4] ), .CK(clk), .RN(n8), .Q(
        \buf_im[9][4] ) );
  DFFRHQX1 \buf_im_reg[10][4]  ( .D(\buf_im[9][4] ), .CK(clk), .RN(n8), .Q(
        \buf_im[10][4] ) );
  DFFRHQX1 \buf_im_reg[11][4]  ( .D(\buf_im[10][4] ), .CK(clk), .RN(n8), .Q(
        \buf_im[11][4] ) );
  DFFRHQX1 \buf_im_reg[12][4]  ( .D(\buf_im[11][4] ), .CK(clk), .RN(n8), .Q(
        \buf_im[12][4] ) );
  DFFRHQX1 \buf_im_reg[13][4]  ( .D(\buf_im[12][4] ), .CK(clk), .RN(n8), .Q(
        \buf_im[13][4] ) );
  DFFRHQX1 \buf_im_reg[14][4]  ( .D(\buf_im[13][4] ), .CK(clk), .RN(n8), .Q(
        \buf_im[14][4] ) );
  DFFRHQX1 \buf_im_reg[15][4]  ( .D(\buf_im[14][4] ), .CK(clk), .RN(n8), .Q(
        \buf_im[15][4] ) );
  DFFRHQX1 \buf_im_reg[16][4]  ( .D(\buf_im[15][4] ), .CK(clk), .RN(n8), .Q(
        \buf_im[16][4] ) );
  DFFRHQX1 \buf_im_reg[17][4]  ( .D(\buf_im[16][4] ), .CK(clk), .RN(n7), .Q(
        \buf_im[17][4] ) );
  DFFRHQX1 \buf_im_reg[18][4]  ( .D(\buf_im[17][4] ), .CK(clk), .RN(n7), .Q(
        \buf_im[18][4] ) );
  DFFRHQX1 \buf_im_reg[19][4]  ( .D(\buf_im[18][4] ), .CK(clk), .RN(n7), .Q(
        \buf_im[19][4] ) );
  DFFRHQX1 \buf_im_reg[20][4]  ( .D(\buf_im[19][4] ), .CK(clk), .RN(n7), .Q(
        \buf_im[20][4] ) );
  DFFRHQX1 \buf_im_reg[21][4]  ( .D(\buf_im[20][4] ), .CK(clk), .RN(n7), .Q(
        \buf_im[21][4] ) );
  DFFRHQX1 \buf_im_reg[22][4]  ( .D(\buf_im[21][4] ), .CK(clk), .RN(n7), .Q(
        \buf_im[22][4] ) );
  DFFRHQX1 \buf_im_reg[23][4]  ( .D(\buf_im[22][4] ), .CK(clk), .RN(n7), .Q(
        \buf_im[23][4] ) );
  DFFRHQX1 \buf_im_reg[24][4]  ( .D(\buf_im[23][4] ), .CK(clk), .RN(n7), .Q(
        \buf_im[24][4] ) );
  DFFRHQX1 \buf_im_reg[25][4]  ( .D(\buf_im[24][4] ), .CK(clk), .RN(n7), .Q(
        \buf_im[25][4] ) );
  DFFRHQX1 \buf_im_reg[26][4]  ( .D(\buf_im[25][4] ), .CK(clk), .RN(n7), .Q(
        \buf_im[26][4] ) );
  DFFRHQX1 \buf_im_reg[27][4]  ( .D(\buf_im[26][4] ), .CK(clk), .RN(n7), .Q(
        \buf_im[27][4] ) );
  DFFRHQX1 \buf_im_reg[28][4]  ( .D(\buf_im[27][4] ), .CK(clk), .RN(n7), .Q(
        \buf_im[28][4] ) );
  DFFRHQX1 \buf_im_reg[29][4]  ( .D(\buf_im[28][4] ), .CK(clk), .RN(n7), .Q(
        \buf_im[29][4] ) );
  DFFRHQX1 \buf_im_reg[30][4]  ( .D(\buf_im[29][4] ), .CK(clk), .RN(n6), .Q(
        \buf_im[30][4] ) );
  DFFRHQX1 \buf_im_reg[1][3]  ( .D(x_im[3]), .CK(clk), .RN(n6), .Q(
        \buf_im[1][3] ) );
  DFFRHQX1 \buf_im_reg[2][3]  ( .D(\buf_im[1][3] ), .CK(clk), .RN(n6), .Q(
        \buf_im[2][3] ) );
  DFFRHQX1 \buf_im_reg[3][3]  ( .D(\buf_im[2][3] ), .CK(clk), .RN(n6), .Q(
        \buf_im[3][3] ) );
  DFFRHQX1 \buf_im_reg[4][3]  ( .D(\buf_im[3][3] ), .CK(clk), .RN(n6), .Q(
        \buf_im[4][3] ) );
  DFFRHQX1 \buf_im_reg[5][3]  ( .D(\buf_im[4][3] ), .CK(clk), .RN(n6), .Q(
        \buf_im[5][3] ) );
  DFFRHQX1 \buf_im_reg[6][3]  ( .D(\buf_im[5][3] ), .CK(clk), .RN(n6), .Q(
        \buf_im[6][3] ) );
  DFFRHQX1 \buf_im_reg[7][3]  ( .D(\buf_im[6][3] ), .CK(clk), .RN(n6), .Q(
        \buf_im[7][3] ) );
  DFFRHQX1 \buf_im_reg[8][3]  ( .D(\buf_im[7][3] ), .CK(clk), .RN(n6), .Q(
        \buf_im[8][3] ) );
  DFFRHQX1 \buf_im_reg[9][3]  ( .D(\buf_im[8][3] ), .CK(clk), .RN(n6), .Q(
        \buf_im[9][3] ) );
  DFFRHQX1 \buf_im_reg[10][3]  ( .D(\buf_im[9][3] ), .CK(clk), .RN(n6), .Q(
        \buf_im[10][3] ) );
  DFFRHQX1 \buf_im_reg[11][3]  ( .D(\buf_im[10][3] ), .CK(clk), .RN(n6), .Q(
        \buf_im[11][3] ) );
  DFFRHQX1 \buf_im_reg[12][3]  ( .D(\buf_im[11][3] ), .CK(clk), .RN(n6), .Q(
        \buf_im[12][3] ) );
  DFFRHQX1 \buf_im_reg[13][3]  ( .D(\buf_im[12][3] ), .CK(clk), .RN(n10), .Q(
        \buf_im[13][3] ) );
  DFFRHQX1 \buf_im_reg[14][3]  ( .D(\buf_im[13][3] ), .CK(clk), .RN(n18), .Q(
        \buf_im[14][3] ) );
  DFFRHQX1 \buf_im_reg[15][3]  ( .D(\buf_im[14][3] ), .CK(clk), .RN(n8), .Q(
        \buf_im[15][3] ) );
  DFFRHQX1 \buf_im_reg[16][3]  ( .D(\buf_im[15][3] ), .CK(clk), .RN(n17), .Q(
        \buf_im[16][3] ) );
  DFFRHQX1 \buf_im_reg[17][3]  ( .D(\buf_im[16][3] ), .CK(clk), .RN(n16), .Q(
        \buf_im[17][3] ) );
  DFFRHQX1 \buf_im_reg[18][3]  ( .D(\buf_im[17][3] ), .CK(clk), .RN(n21), .Q(
        \buf_im[18][3] ) );
  DFFRHQX1 \buf_im_reg[19][3]  ( .D(\buf_im[18][3] ), .CK(clk), .RN(n2), .Q(
        \buf_im[19][3] ) );
  DFFRHQX1 \buf_im_reg[20][3]  ( .D(\buf_im[19][3] ), .CK(clk), .RN(n3), .Q(
        \buf_im[20][3] ) );
  DFFRHQX1 \buf_im_reg[21][3]  ( .D(\buf_im[20][3] ), .CK(clk), .RN(n4), .Q(
        \buf_im[21][3] ) );
  DFFRHQX1 \buf_im_reg[22][3]  ( .D(\buf_im[21][3] ), .CK(clk), .RN(n22), .Q(
        \buf_im[22][3] ) );
  DFFRHQX1 \buf_im_reg[23][3]  ( .D(\buf_im[22][3] ), .CK(clk), .RN(n21), .Q(
        \buf_im[23][3] ) );
  DFFRHQX1 \buf_im_reg[24][3]  ( .D(\buf_im[23][3] ), .CK(clk), .RN(n2), .Q(
        \buf_im[24][3] ) );
  DFFRHQX1 \buf_im_reg[25][3]  ( .D(\buf_im[24][3] ), .CK(clk), .RN(n3), .Q(
        \buf_im[25][3] ) );
  DFFRHQX1 \buf_im_reg[26][3]  ( .D(\buf_im[25][3] ), .CK(clk), .RN(n16), .Q(
        \buf_im[26][3] ) );
  DFFRHQX1 \buf_im_reg[27][3]  ( .D(\buf_im[26][3] ), .CK(clk), .RN(n10), .Q(
        \buf_im[27][3] ) );
  DFFRHQX1 \buf_im_reg[28][3]  ( .D(\buf_im[27][3] ), .CK(clk), .RN(n7), .Q(
        \buf_im[28][3] ) );
  DFFRHQX1 \buf_im_reg[29][3]  ( .D(\buf_im[28][3] ), .CK(clk), .RN(n6), .Q(
        \buf_im[29][3] ) );
  DFFRHQX1 \buf_im_reg[30][3]  ( .D(\buf_im[29][3] ), .CK(clk), .RN(n23), .Q(
        \buf_im[30][3] ) );
  DFFRHQX1 \buf_im_reg[1][2]  ( .D(x_im[2]), .CK(clk), .RN(n6), .Q(
        \buf_im[1][2] ) );
  DFFRHQX1 \buf_im_reg[2][2]  ( .D(\buf_im[1][2] ), .CK(clk), .RN(n5), .Q(
        \buf_im[2][2] ) );
  DFFRHQX1 \buf_im_reg[3][2]  ( .D(\buf_im[2][2] ), .CK(clk), .RN(n10), .Q(
        \buf_im[3][2] ) );
  DFFRHQX1 \buf_im_reg[4][2]  ( .D(\buf_im[3][2] ), .CK(clk), .RN(n7), .Q(
        \buf_im[4][2] ) );
  DFFRHQX1 \buf_im_reg[5][2]  ( .D(\buf_im[4][2] ), .CK(clk), .RN(n6), .Q(
        \buf_im[5][2] ) );
  DFFRHQX1 \buf_im_reg[6][2]  ( .D(\buf_im[5][2] ), .CK(clk), .RN(n23), .Q(
        \buf_im[6][2] ) );
  DFFRHQX1 \buf_im_reg[7][2]  ( .D(\buf_im[6][2] ), .CK(clk), .RN(n23), .Q(
        \buf_im[7][2] ) );
  DFFRHQX1 \buf_im_reg[8][2]  ( .D(\buf_im[7][2] ), .CK(clk), .RN(n5), .Q(
        \buf_im[8][2] ) );
  DFFRHQX1 \buf_im_reg[9][2]  ( .D(\buf_im[8][2] ), .CK(clk), .RN(n5), .Q(
        \buf_im[9][2] ) );
  DFFRHQX1 \buf_im_reg[10][2]  ( .D(\buf_im[9][2] ), .CK(clk), .RN(n5), .Q(
        \buf_im[10][2] ) );
  DFFRHQX1 \buf_im_reg[11][2]  ( .D(\buf_im[10][2] ), .CK(clk), .RN(n5), .Q(
        \buf_im[11][2] ) );
  DFFRHQX1 \buf_im_reg[12][2]  ( .D(\buf_im[11][2] ), .CK(clk), .RN(n5), .Q(
        \buf_im[12][2] ) );
  DFFRHQX1 \buf_im_reg[13][2]  ( .D(\buf_im[12][2] ), .CK(clk), .RN(n5), .Q(
        \buf_im[13][2] ) );
  DFFRHQX1 \buf_im_reg[14][2]  ( .D(\buf_im[13][2] ), .CK(clk), .RN(n5), .Q(
        \buf_im[14][2] ) );
  DFFRHQX1 \buf_im_reg[15][2]  ( .D(\buf_im[14][2] ), .CK(clk), .RN(n5), .Q(
        \buf_im[15][2] ) );
  DFFRHQX1 \buf_im_reg[16][2]  ( .D(\buf_im[15][2] ), .CK(clk), .RN(n5), .Q(
        \buf_im[16][2] ) );
  DFFRHQX1 \buf_im_reg[17][2]  ( .D(\buf_im[16][2] ), .CK(clk), .RN(n5), .Q(
        \buf_im[17][2] ) );
  DFFRHQX1 \buf_im_reg[18][2]  ( .D(\buf_im[17][2] ), .CK(clk), .RN(n5), .Q(
        \buf_im[18][2] ) );
  DFFRHQX1 \buf_im_reg[19][2]  ( .D(\buf_im[18][2] ), .CK(clk), .RN(n5), .Q(
        \buf_im[19][2] ) );
  DFFRHQX1 \buf_im_reg[20][2]  ( .D(\buf_im[19][2] ), .CK(clk), .RN(n5), .Q(
        \buf_im[20][2] ) );
  DFFRHQX1 \buf_im_reg[21][2]  ( .D(\buf_im[20][2] ), .CK(clk), .RN(n5), .Q(
        \buf_im[21][2] ) );
  DFFRHQX1 \buf_im_reg[22][2]  ( .D(\buf_im[21][2] ), .CK(clk), .RN(n4), .Q(
        \buf_im[22][2] ) );
  DFFRHQX1 \buf_im_reg[23][2]  ( .D(\buf_im[22][2] ), .CK(clk), .RN(n4), .Q(
        \buf_im[23][2] ) );
  DFFRHQX1 \buf_im_reg[24][2]  ( .D(\buf_im[23][2] ), .CK(clk), .RN(n4), .Q(
        \buf_im[24][2] ) );
  DFFRHQX1 \buf_im_reg[25][2]  ( .D(\buf_im[24][2] ), .CK(clk), .RN(n4), .Q(
        \buf_im[25][2] ) );
  DFFRHQX1 \buf_im_reg[26][2]  ( .D(\buf_im[25][2] ), .CK(clk), .RN(n4), .Q(
        \buf_im[26][2] ) );
  DFFRHQX1 \buf_im_reg[27][2]  ( .D(\buf_im[26][2] ), .CK(clk), .RN(n4), .Q(
        \buf_im[27][2] ) );
  DFFRHQX1 \buf_im_reg[28][2]  ( .D(\buf_im[27][2] ), .CK(clk), .RN(n4), .Q(
        \buf_im[28][2] ) );
  DFFRHQX1 \buf_im_reg[29][2]  ( .D(\buf_im[28][2] ), .CK(clk), .RN(n4), .Q(
        \buf_im[29][2] ) );
  DFFRHQX1 \buf_im_reg[30][2]  ( .D(\buf_im[29][2] ), .CK(clk), .RN(n4), .Q(
        \buf_im[30][2] ) );
  DFFRHQX1 \buf_im_reg[1][1]  ( .D(x_im[1]), .CK(clk), .RN(n4), .Q(
        \buf_im[1][1] ) );
  DFFRHQX1 \buf_im_reg[2][1]  ( .D(\buf_im[1][1] ), .CK(clk), .RN(n4), .Q(
        \buf_im[2][1] ) );
  DFFRHQX1 \buf_im_reg[3][1]  ( .D(\buf_im[2][1] ), .CK(clk), .RN(n4), .Q(
        \buf_im[3][1] ) );
  DFFRHQX1 \buf_im_reg[4][1]  ( .D(\buf_im[3][1] ), .CK(clk), .RN(n4), .Q(
        \buf_im[4][1] ) );
  DFFRHQX1 \buf_im_reg[5][1]  ( .D(\buf_im[4][1] ), .CK(clk), .RN(n3), .Q(
        \buf_im[5][1] ) );
  DFFRHQX1 \buf_im_reg[6][1]  ( .D(\buf_im[5][1] ), .CK(clk), .RN(n3), .Q(
        \buf_im[6][1] ) );
  DFFRHQX1 \buf_im_reg[7][1]  ( .D(\buf_im[6][1] ), .CK(clk), .RN(n3), .Q(
        \buf_im[7][1] ) );
  DFFRHQX1 \buf_im_reg[8][1]  ( .D(\buf_im[7][1] ), .CK(clk), .RN(n3), .Q(
        \buf_im[8][1] ) );
  DFFRHQX1 \buf_im_reg[9][1]  ( .D(\buf_im[8][1] ), .CK(clk), .RN(n3), .Q(
        \buf_im[9][1] ) );
  DFFRHQX1 \buf_im_reg[10][1]  ( .D(\buf_im[9][1] ), .CK(clk), .RN(n3), .Q(
        \buf_im[10][1] ) );
  DFFRHQX1 \buf_im_reg[11][1]  ( .D(\buf_im[10][1] ), .CK(clk), .RN(n3), .Q(
        \buf_im[11][1] ) );
  DFFRHQX1 \buf_im_reg[12][1]  ( .D(\buf_im[11][1] ), .CK(clk), .RN(n3), .Q(
        \buf_im[12][1] ) );
  DFFRHQX1 \buf_im_reg[13][1]  ( .D(\buf_im[12][1] ), .CK(clk), .RN(n3), .Q(
        \buf_im[13][1] ) );
  DFFRHQX1 \buf_im_reg[14][1]  ( .D(\buf_im[13][1] ), .CK(clk), .RN(n3), .Q(
        \buf_im[14][1] ) );
  DFFRHQX1 \buf_im_reg[15][1]  ( .D(\buf_im[14][1] ), .CK(clk), .RN(n3), .Q(
        \buf_im[15][1] ) );
  DFFRHQX1 \buf_im_reg[16][1]  ( .D(\buf_im[15][1] ), .CK(clk), .RN(n3), .Q(
        \buf_im[16][1] ) );
  DFFRHQX1 \buf_im_reg[17][1]  ( .D(\buf_im[16][1] ), .CK(clk), .RN(n3), .Q(
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
  DFFRHQX1 \buf_im_reg[1][0]  ( .D(x_im[0]), .CK(clk), .RN(n22), .Q(
        \buf_im[1][0] ) );
  DFFRHQX1 \buf_im_reg[2][0]  ( .D(\buf_im[1][0] ), .CK(clk), .RN(n22), .Q(
        \buf_im[2][0] ) );
  DFFRHQX1 \buf_im_reg[3][0]  ( .D(\buf_im[2][0] ), .CK(clk), .RN(n22), .Q(
        \buf_im[3][0] ) );
  DFFRHQX1 \buf_im_reg[4][0]  ( .D(\buf_im[3][0] ), .CK(clk), .RN(n22), .Q(
        \buf_im[4][0] ) );
  DFFRHQX1 \buf_im_reg[5][0]  ( .D(\buf_im[4][0] ), .CK(clk), .RN(n22), .Q(
        \buf_im[5][0] ) );
  DFFRHQX1 \buf_im_reg[6][0]  ( .D(\buf_im[5][0] ), .CK(clk), .RN(n22), .Q(
        \buf_im[6][0] ) );
  DFFRHQX1 \buf_im_reg[7][0]  ( .D(\buf_im[6][0] ), .CK(clk), .RN(n22), .Q(
        \buf_im[7][0] ) );
  DFFRHQX1 \buf_im_reg[8][0]  ( .D(\buf_im[7][0] ), .CK(clk), .RN(n22), .Q(
        \buf_im[8][0] ) );
  DFFRHQX1 \buf_im_reg[9][0]  ( .D(\buf_im[8][0] ), .CK(clk), .RN(n22), .Q(
        \buf_im[9][0] ) );
  DFFRHQX1 \buf_im_reg[10][0]  ( .D(\buf_im[9][0] ), .CK(clk), .RN(n21), .Q(
        \buf_im[10][0] ) );
  DFFRHQX1 \buf_im_reg[11][0]  ( .D(\buf_im[10][0] ), .CK(clk), .RN(n21), .Q(
        \buf_im[11][0] ) );
  DFFRHQX1 \buf_im_reg[12][0]  ( .D(\buf_im[11][0] ), .CK(clk), .RN(n21), .Q(
        \buf_im[12][0] ) );
  DFFRHQX1 \buf_im_reg[13][0]  ( .D(\buf_im[12][0] ), .CK(clk), .RN(n21), .Q(
        \buf_im[13][0] ) );
  DFFRHQX1 \buf_im_reg[14][0]  ( .D(\buf_im[13][0] ), .CK(clk), .RN(n21), .Q(
        \buf_im[14][0] ) );
  DFFRHQX1 \buf_im_reg[15][0]  ( .D(\buf_im[14][0] ), .CK(clk), .RN(n21), .Q(
        \buf_im[15][0] ) );
  DFFRHQX1 \buf_im_reg[16][0]  ( .D(\buf_im[15][0] ), .CK(clk), .RN(n21), .Q(
        \buf_im[16][0] ) );
  DFFRHQX1 \buf_im_reg[17][0]  ( .D(\buf_im[16][0] ), .CK(clk), .RN(n21), .Q(
        \buf_im[17][0] ) );
  DFFRHQX1 \buf_im_reg[18][0]  ( .D(\buf_im[17][0] ), .CK(clk), .RN(n21), .Q(
        \buf_im[18][0] ) );
  DFFRHQX1 \buf_im_reg[19][0]  ( .D(\buf_im[18][0] ), .CK(clk), .RN(n21), .Q(
        \buf_im[19][0] ) );
  DFFRHQX1 \buf_im_reg[20][0]  ( .D(\buf_im[19][0] ), .CK(clk), .RN(n21), .Q(
        \buf_im[20][0] ) );
  DFFRHQX1 \buf_im_reg[21][0]  ( .D(\buf_im[20][0] ), .CK(clk), .RN(n21), .Q(
        \buf_im[21][0] ) );
  DFFRHQX1 \buf_im_reg[22][0]  ( .D(\buf_im[21][0] ), .CK(clk), .RN(n21), .Q(
        \buf_im[22][0] ) );
  DFFRHQX1 \buf_im_reg[23][0]  ( .D(\buf_im[22][0] ), .CK(clk), .RN(n20), .Q(
        \buf_im[23][0] ) );
  DFFRHQX1 \buf_im_reg[24][0]  ( .D(\buf_im[23][0] ), .CK(clk), .RN(n20), .Q(
        \buf_im[24][0] ) );
  DFFRHQX1 \buf_im_reg[25][0]  ( .D(\buf_im[24][0] ), .CK(clk), .RN(n20), .Q(
        \buf_im[25][0] ) );
  DFFRHQX1 \buf_im_reg[26][0]  ( .D(\buf_im[25][0] ), .CK(clk), .RN(n20), .Q(
        \buf_im[26][0] ) );
  DFFRHQX1 \buf_im_reg[27][0]  ( .D(\buf_im[26][0] ), .CK(clk), .RN(n20), .Q(
        \buf_im[27][0] ) );
  DFFRHQX1 \buf_im_reg[28][0]  ( .D(\buf_im[27][0] ), .CK(clk), .RN(n20), .Q(
        \buf_im[28][0] ) );
  DFFRHQX1 \buf_im_reg[29][0]  ( .D(\buf_im[28][0] ), .CK(clk), .RN(n20), .Q(
        \buf_im[29][0] ) );
  DFFRHQX1 \buf_im_reg[30][0]  ( .D(\buf_im[29][0] ), .CK(clk), .RN(n20), .Q(
        \buf_im[30][0] ) );
  DFFRHQX1 \buf_re_reg[1][11]  ( .D(x_re[11]), .CK(clk), .RN(n29), .Q(
        \buf_re[1][11] ) );
  DFFRHQX1 \buf_re_reg[2][11]  ( .D(\buf_re[1][11] ), .CK(clk), .RN(n10), .Q(
        \buf_re[2][11] ) );
  DFFRHQX1 \buf_re_reg[3][11]  ( .D(\buf_re[2][11] ), .CK(clk), .RN(n33), .Q(
        \buf_re[3][11] ) );
  DFFRHQX1 \buf_re_reg[4][11]  ( .D(\buf_re[3][11] ), .CK(clk), .RN(n19), .Q(
        \buf_re[4][11] ) );
  DFFRHQX1 \buf_re_reg[5][11]  ( .D(\buf_re[4][11] ), .CK(clk), .RN(n11), .Q(
        \buf_re[5][11] ) );
  DFFRHQX1 \buf_re_reg[6][11]  ( .D(\buf_re[5][11] ), .CK(clk), .RN(n24), .Q(
        \buf_re[6][11] ) );
  DFFRHQX1 \buf_re_reg[7][11]  ( .D(\buf_re[6][11] ), .CK(clk), .RN(n29), .Q(
        \buf_re[7][11] ) );
  DFFRHQX1 \buf_re_reg[8][11]  ( .D(\buf_re[7][11] ), .CK(clk), .RN(n27), .Q(
        \buf_re[8][11] ) );
  DFFRHQX1 \buf_re_reg[9][11]  ( .D(\buf_re[8][11] ), .CK(clk), .RN(n27), .Q(
        \buf_re[9][11] ) );
  DFFRHQX1 \buf_re_reg[10][11]  ( .D(\buf_re[9][11] ), .CK(clk), .RN(n27), .Q(
        \buf_re[10][11] ) );
  DFFRHQX1 \buf_re_reg[11][11]  ( .D(\buf_re[10][11] ), .CK(clk), .RN(n27), 
        .Q(\buf_re[11][11] ) );
  DFFRHQX1 \buf_re_reg[12][11]  ( .D(\buf_re[11][11] ), .CK(clk), .RN(n27), 
        .Q(\buf_re[12][11] ) );
  DFFRHQX1 \buf_re_reg[13][11]  ( .D(\buf_re[12][11] ), .CK(clk), .RN(n27), 
        .Q(\buf_re[13][11] ) );
  DFFRHQX1 \buf_re_reg[14][11]  ( .D(\buf_re[13][11] ), .CK(clk), .RN(n27), 
        .Q(\buf_re[14][11] ) );
  DFFRHQX1 \buf_re_reg[15][11]  ( .D(\buf_re[14][11] ), .CK(clk), .RN(n27), 
        .Q(\buf_re[15][11] ) );
  DFFRHQX1 \buf_re_reg[16][11]  ( .D(\buf_re[15][11] ), .CK(clk), .RN(n27), 
        .Q(\buf_re[16][11] ) );
  DFFRHQX1 \buf_re_reg[17][11]  ( .D(\buf_re[16][11] ), .CK(clk), .RN(n27), 
        .Q(\buf_re[17][11] ) );
  DFFRHQX1 \buf_re_reg[18][11]  ( .D(\buf_re[17][11] ), .CK(clk), .RN(n27), 
        .Q(\buf_re[18][11] ) );
  DFFRHQX1 \buf_re_reg[19][11]  ( .D(\buf_re[18][11] ), .CK(clk), .RN(n27), 
        .Q(\buf_re[19][11] ) );
  DFFRHQX1 \buf_re_reg[20][11]  ( .D(\buf_re[19][11] ), .CK(clk), .RN(n27), 
        .Q(\buf_re[20][11] ) );
  DFFRHQX1 \buf_re_reg[21][11]  ( .D(\buf_re[20][11] ), .CK(clk), .RN(n26), 
        .Q(\buf_re[21][11] ) );
  DFFRHQX1 \buf_re_reg[22][11]  ( .D(\buf_re[21][11] ), .CK(clk), .RN(n26), 
        .Q(\buf_re[22][11] ) );
  DFFRHQX1 \buf_re_reg[23][11]  ( .D(\buf_re[22][11] ), .CK(clk), .RN(n26), 
        .Q(\buf_re[23][11] ) );
  DFFRHQX1 \buf_re_reg[24][11]  ( .D(\buf_re[23][11] ), .CK(clk), .RN(n26), 
        .Q(\buf_re[24][11] ) );
  DFFRHQX1 \buf_re_reg[25][11]  ( .D(\buf_re[24][11] ), .CK(clk), .RN(n26), 
        .Q(\buf_re[25][11] ) );
  DFFRHQX1 \buf_re_reg[26][11]  ( .D(\buf_re[25][11] ), .CK(clk), .RN(n26), 
        .Q(\buf_re[26][11] ) );
  DFFRHQX1 \buf_re_reg[27][11]  ( .D(\buf_re[26][11] ), .CK(clk), .RN(n26), 
        .Q(\buf_re[27][11] ) );
  DFFRHQX1 \buf_re_reg[28][11]  ( .D(\buf_re[27][11] ), .CK(clk), .RN(n26), 
        .Q(\buf_re[28][11] ) );
  DFFRHQX1 \buf_re_reg[29][11]  ( .D(\buf_re[28][11] ), .CK(clk), .RN(n26), 
        .Q(\buf_re[29][11] ) );
  DFFRHQX1 \buf_re_reg[30][11]  ( .D(\buf_re[29][11] ), .CK(clk), .RN(n26), 
        .Q(\buf_re[30][11] ) );
  DFFRHQX1 \buf_re_reg[1][10]  ( .D(x_re[10]), .CK(clk), .RN(n20), .Q(
        \buf_re[1][10] ) );
  DFFRHQX1 \buf_re_reg[2][10]  ( .D(\buf_re[1][10] ), .CK(clk), .RN(n29), .Q(
        \buf_re[2][10] ) );
  DFFRHQX1 \buf_re_reg[3][10]  ( .D(\buf_re[2][10] ), .CK(clk), .RN(n7), .Q(
        \buf_re[3][10] ) );
  DFFRHQX1 \buf_re_reg[4][10]  ( .D(\buf_re[3][10] ), .CK(clk), .RN(n26), .Q(
        \buf_re[4][10] ) );
  DFFRHQX1 \buf_re_reg[5][10]  ( .D(\buf_re[4][10] ), .CK(clk), .RN(n26), .Q(
        \buf_re[5][10] ) );
  DFFRHQX1 \buf_re_reg[6][10]  ( .D(\buf_re[5][10] ), .CK(clk), .RN(n10), .Q(
        \buf_re[6][10] ) );
  DFFRHQX1 \buf_re_reg[7][10]  ( .D(\buf_re[6][10] ), .CK(clk), .RN(n33), .Q(
        \buf_re[7][10] ) );
  DFFRHQX1 \buf_re_reg[8][10]  ( .D(\buf_re[7][10] ), .CK(clk), .RN(n19), .Q(
        \buf_re[8][10] ) );
  DFFRHQX1 \buf_re_reg[9][10]  ( .D(\buf_re[8][10] ), .CK(clk), .RN(n24), .Q(
        \buf_re[9][10] ) );
  DFFRHQX1 \buf_re_reg[10][10]  ( .D(\buf_re[9][10] ), .CK(clk), .RN(n11), .Q(
        \buf_re[10][10] ) );
  DFFRHQX1 \buf_re_reg[11][10]  ( .D(\buf_re[10][10] ), .CK(clk), .RN(n23), 
        .Q(\buf_re[11][10] ) );
  DFFRHQX1 \buf_re_reg[12][10]  ( .D(\buf_re[11][10] ), .CK(clk), .RN(n28), 
        .Q(\buf_re[12][10] ) );
  DFFRHQX1 \buf_re_reg[13][10]  ( .D(\buf_re[12][10] ), .CK(clk), .RN(n28), 
        .Q(\buf_re[13][10] ) );
  DFFRHQX1 \buf_re_reg[14][10]  ( .D(\buf_re[13][10] ), .CK(clk), .RN(n28), 
        .Q(\buf_re[14][10] ) );
  DFFRHQX1 \buf_re_reg[15][10]  ( .D(\buf_re[14][10] ), .CK(clk), .RN(n28), 
        .Q(\buf_re[15][10] ) );
  DFFRHQX1 \buf_re_reg[16][10]  ( .D(\buf_re[15][10] ), .CK(clk), .RN(n28), 
        .Q(\buf_re[16][10] ) );
  DFFRHQX1 \buf_re_reg[17][10]  ( .D(\buf_re[16][10] ), .CK(clk), .RN(n28), 
        .Q(\buf_re[17][10] ) );
  DFFRHQX1 \buf_re_reg[18][10]  ( .D(\buf_re[17][10] ), .CK(clk), .RN(n28), 
        .Q(\buf_re[18][10] ) );
  DFFRHQX1 \buf_re_reg[19][10]  ( .D(\buf_re[18][10] ), .CK(clk), .RN(n28), 
        .Q(\buf_re[19][10] ) );
  DFFRHQX1 \buf_re_reg[20][10]  ( .D(\buf_re[19][10] ), .CK(clk), .RN(n28), 
        .Q(\buf_re[20][10] ) );
  DFFRHQX1 \buf_re_reg[21][10]  ( .D(\buf_re[20][10] ), .CK(clk), .RN(n28), 
        .Q(\buf_re[21][10] ) );
  DFFRHQX1 \buf_re_reg[22][10]  ( .D(\buf_re[21][10] ), .CK(clk), .RN(n28), 
        .Q(\buf_re[22][10] ) );
  DFFRHQX1 \buf_re_reg[23][10]  ( .D(\buf_re[22][10] ), .CK(clk), .RN(n28), 
        .Q(\buf_re[23][10] ) );
  DFFRHQX1 \buf_re_reg[24][10]  ( .D(\buf_re[23][10] ), .CK(clk), .RN(n28), 
        .Q(\buf_re[24][10] ) );
  DFFRHQX1 \buf_re_reg[25][10]  ( .D(\buf_re[24][10] ), .CK(clk), .RN(n28), 
        .Q(\buf_re[25][10] ) );
  DFFRHQX1 \buf_re_reg[26][10]  ( .D(\buf_re[25][10] ), .CK(clk), .RN(n26), 
        .Q(\buf_re[26][10] ) );
  DFFRHQX1 \buf_re_reg[27][10]  ( .D(\buf_re[26][10] ), .CK(clk), .RN(n9), .Q(
        \buf_re[27][10] ) );
  DFFRHQX1 \buf_re_reg[28][10]  ( .D(\buf_re[27][10] ), .CK(clk), .RN(n35), 
        .Q(\buf_re[28][10] ) );
  DFFRHQX1 \buf_re_reg[29][10]  ( .D(\buf_re[28][10] ), .CK(clk), .RN(n20), 
        .Q(\buf_re[29][10] ) );
  DFFRHQX1 \buf_re_reg[30][10]  ( .D(\buf_re[29][10] ), .CK(clk), .RN(n24), 
        .Q(\buf_re[30][10] ) );
  DFFRHQX1 \buf_re_reg[1][9]  ( .D(x_re[9]), .CK(clk), .RN(n29), .Q(
        \buf_re[1][9] ) );
  DFFRHQX1 \buf_re_reg[2][9]  ( .D(\buf_re[1][9] ), .CK(clk), .RN(n29), .Q(
        \buf_re[2][9] ) );
  DFFRHQX1 \buf_re_reg[3][9]  ( .D(\buf_re[2][9] ), .CK(clk), .RN(n30), .Q(
        \buf_re[3][9] ) );
  DFFRHQX1 \buf_re_reg[4][9]  ( .D(\buf_re[3][9] ), .CK(clk), .RN(n30), .Q(
        \buf_re[4][9] ) );
  DFFRHQX1 \buf_re_reg[5][9]  ( .D(\buf_re[4][9] ), .CK(clk), .RN(n12), .Q(
        \buf_re[5][9] ) );
  DFFRHQX1 \buf_re_reg[6][9]  ( .D(\buf_re[5][9] ), .CK(clk), .RN(n14), .Q(
        \buf_re[6][9] ) );
  DFFRHQX1 \buf_re_reg[7][9]  ( .D(\buf_re[6][9] ), .CK(clk), .RN(n13), .Q(
        \buf_re[7][9] ) );
  DFFRHQX1 \buf_re_reg[8][9]  ( .D(\buf_re[7][9] ), .CK(clk), .RN(n27), .Q(
        \buf_re[8][9] ) );
  DFFRHQX1 \buf_re_reg[9][9]  ( .D(\buf_re[8][9] ), .CK(clk), .RN(n30), .Q(
        \buf_re[9][9] ) );
  DFFRHQX1 \buf_re_reg[10][9]  ( .D(\buf_re[9][9] ), .CK(clk), .RN(n12), .Q(
        \buf_re[10][9] ) );
  DFFRHQX1 \buf_re_reg[11][9]  ( .D(\buf_re[10][9] ), .CK(clk), .RN(n12), .Q(
        \buf_re[11][9] ) );
  DFFRHQX1 \buf_re_reg[12][9]  ( .D(\buf_re[11][9] ), .CK(clk), .RN(n14), .Q(
        \buf_re[12][9] ) );
  DFFRHQX1 \buf_re_reg[13][9]  ( .D(\buf_re[12][9] ), .CK(clk), .RN(n13), .Q(
        \buf_re[13][9] ) );
  DFFRHQX1 \buf_re_reg[14][9]  ( .D(\buf_re[13][9] ), .CK(clk), .RN(n27), .Q(
        \buf_re[14][9] ) );
  DFFRHQX1 \buf_re_reg[15][9]  ( .D(\buf_re[14][9] ), .CK(clk), .RN(n30), .Q(
        \buf_re[15][9] ) );
  DFFRHQX1 \buf_re_reg[16][9]  ( .D(\buf_re[15][9] ), .CK(clk), .RN(n13), .Q(
        \buf_re[16][9] ) );
  DFFRHQX1 \buf_re_reg[17][9]  ( .D(\buf_re[16][9] ), .CK(clk), .RN(n27), .Q(
        \buf_re[17][9] ) );
  DFFRHQX1 \buf_re_reg[18][9]  ( .D(\buf_re[17][9] ), .CK(clk), .RN(n14), .Q(
        \buf_re[18][9] ) );
  DFFRHQX1 \buf_re_reg[19][9]  ( .D(\buf_re[18][9] ), .CK(clk), .RN(n13), .Q(
        \buf_re[19][9] ) );
  DFFRHQX1 \buf_re_reg[20][9]  ( .D(\buf_re[19][9] ), .CK(clk), .RN(n27), .Q(
        \buf_re[20][9] ) );
  DFFRHQX1 \buf_re_reg[21][9]  ( .D(\buf_re[20][9] ), .CK(clk), .RN(n30), .Q(
        \buf_re[21][9] ) );
  DFFRHQX1 \buf_re_reg[22][9]  ( .D(\buf_re[21][9] ), .CK(clk), .RN(n12), .Q(
        \buf_re[22][9] ) );
  DFFRHQX1 \buf_re_reg[23][9]  ( .D(\buf_re[22][9] ), .CK(clk), .RN(n12), .Q(
        \buf_re[23][9] ) );
  DFFRHQX1 \buf_re_reg[24][9]  ( .D(\buf_re[23][9] ), .CK(clk), .RN(n30), .Q(
        \buf_re[24][9] ) );
  DFFRHQX1 \buf_re_reg[25][9]  ( .D(\buf_re[24][9] ), .CK(clk), .RN(n14), .Q(
        \buf_re[25][9] ) );
  DFFRHQX1 \buf_re_reg[26][9]  ( .D(\buf_re[25][9] ), .CK(clk), .RN(n12), .Q(
        \buf_re[26][9] ) );
  DFFRHQX1 \buf_re_reg[27][9]  ( .D(\buf_re[26][9] ), .CK(clk), .RN(n14), .Q(
        \buf_re[27][9] ) );
  DFFRHQX1 \buf_re_reg[28][9]  ( .D(\buf_re[27][9] ), .CK(clk), .RN(n13), .Q(
        \buf_re[28][9] ) );
  DFFRHQX1 \buf_re_reg[29][9]  ( .D(\buf_re[28][9] ), .CK(clk), .RN(n28), .Q(
        \buf_re[29][9] ) );
  DFFRHQX1 \buf_re_reg[30][9]  ( .D(\buf_re[29][9] ), .CK(clk), .RN(n9), .Q(
        \buf_re[30][9] ) );
  DFFRHQX1 \buf_re_reg[1][8]  ( .D(x_re[8]), .CK(clk), .RN(n1), .Q(
        \buf_re[1][8] ) );
  DFFRHQX1 \buf_re_reg[2][8]  ( .D(\buf_re[1][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[2][8] ) );
  DFFRHQX1 \buf_re_reg[3][8]  ( .D(\buf_re[2][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[3][8] ) );
  DFFRHQX1 \buf_re_reg[4][8]  ( .D(\buf_re[3][8] ), .CK(clk), .RN(n15), .Q(
        \buf_re[4][8] ) );
  DFFRHQX1 \buf_re_reg[5][8]  ( .D(\buf_re[4][8] ), .CK(clk), .RN(n1), .Q(
        \buf_re[5][8] ) );
  DFFRHQX1 \buf_re_reg[6][8]  ( .D(\buf_re[5][8] ), .CK(clk), .RN(n35), .Q(
        \buf_re[6][8] ) );
  DFFRHQX1 \buf_re_reg[7][8]  ( .D(\buf_re[6][8] ), .CK(clk), .RN(n15), .Q(
        \buf_re[7][8] ) );
  DFFRHQX1 \buf_re_reg[8][8]  ( .D(\buf_re[7][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[8][8] ) );
  DFFRHQX1 \buf_re_reg[9][8]  ( .D(\buf_re[8][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[9][8] ) );
  DFFRHQX1 \buf_re_reg[10][8]  ( .D(\buf_re[9][8] ), .CK(clk), .RN(n1), .Q(
        \buf_re[10][8] ) );
  DFFRHQX1 \buf_re_reg[11][8]  ( .D(\buf_re[10][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[11][8] ) );
  DFFRHQX1 \buf_re_reg[12][8]  ( .D(\buf_re[11][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[12][8] ) );
  DFFRHQX1 \buf_re_reg[13][8]  ( .D(\buf_re[12][8] ), .CK(clk), .RN(n15), .Q(
        \buf_re[13][8] ) );
  DFFRHQX1 \buf_re_reg[14][8]  ( .D(\buf_re[13][8] ), .CK(clk), .RN(n1), .Q(
        \buf_re[14][8] ) );
  DFFRHQX1 \buf_re_reg[15][8]  ( .D(\buf_re[14][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[15][8] ) );
  DFFRHQX1 \buf_re_reg[16][8]  ( .D(\buf_re[15][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[16][8] ) );
  DFFRHQX1 \buf_re_reg[17][8]  ( .D(\buf_re[16][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[17][8] ) );
  DFFRHQX1 \buf_re_reg[18][8]  ( .D(\buf_re[17][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[18][8] ) );
  DFFRHQX1 \buf_re_reg[19][8]  ( .D(\buf_re[18][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[19][8] ) );
  DFFRHQX1 \buf_re_reg[20][8]  ( .D(\buf_re[19][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[20][8] ) );
  DFFRHQX1 \buf_re_reg[21][8]  ( .D(\buf_re[20][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[21][8] ) );
  DFFRHQX1 \buf_re_reg[22][8]  ( .D(\buf_re[21][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[22][8] ) );
  DFFRHQX1 \buf_re_reg[23][8]  ( .D(\buf_re[22][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[23][8] ) );
  DFFRHQX1 \buf_re_reg[24][8]  ( .D(\buf_re[23][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[24][8] ) );
  DFFRHQX1 \buf_re_reg[25][8]  ( .D(\buf_re[24][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[25][8] ) );
  DFFRHQX1 \buf_re_reg[26][8]  ( .D(\buf_re[25][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[26][8] ) );
  DFFRHQX1 \buf_re_reg[27][8]  ( .D(\buf_re[26][8] ), .CK(clk), .RN(n32), .Q(
        \buf_re[27][8] ) );
  DFFRHQX1 \buf_re_reg[28][8]  ( .D(\buf_re[27][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[28][8] ) );
  DFFRHQX1 \buf_re_reg[29][8]  ( .D(\buf_re[28][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[29][8] ) );
  DFFRHQX1 \buf_re_reg[30][8]  ( .D(\buf_re[29][8] ), .CK(clk), .RN(n31), .Q(
        \buf_re[30][8] ) );
  DFFRHQX1 \buf_re_reg[1][7]  ( .D(x_re[7]), .CK(clk), .RN(n31), .Q(
        \buf_re[1][7] ) );
  DFFRHQX1 \buf_re_reg[2][7]  ( .D(\buf_re[1][7] ), .CK(clk), .RN(n31), .Q(
        \buf_re[2][7] ) );
  DFFRHQX1 \buf_re_reg[3][7]  ( .D(\buf_re[2][7] ), .CK(clk), .RN(n31), .Q(
        \buf_re[3][7] ) );
  DFFRHQX1 \buf_re_reg[4][7]  ( .D(\buf_re[3][7] ), .CK(clk), .RN(n31), .Q(
        \buf_re[4][7] ) );
  DFFRHQX1 \buf_re_reg[5][7]  ( .D(\buf_re[4][7] ), .CK(clk), .RN(n31), .Q(
        \buf_re[5][7] ) );
  DFFRHQX1 \buf_re_reg[6][7]  ( .D(\buf_re[5][7] ), .CK(clk), .RN(n31), .Q(
        \buf_re[6][7] ) );
  DFFRHQX1 \buf_re_reg[7][7]  ( .D(\buf_re[6][7] ), .CK(clk), .RN(n31), .Q(
        \buf_re[7][7] ) );
  DFFRHQX1 \buf_re_reg[8][7]  ( .D(\buf_re[7][7] ), .CK(clk), .RN(n31), .Q(
        \buf_re[8][7] ) );
  DFFRHQX1 \buf_re_reg[9][7]  ( .D(\buf_re[8][7] ), .CK(clk), .RN(n31), .Q(
        \buf_re[9][7] ) );
  DFFRHQX1 \buf_re_reg[10][7]  ( .D(\buf_re[9][7] ), .CK(clk), .RN(n31), .Q(
        \buf_re[10][7] ) );
  DFFRHQX1 \buf_re_reg[11][7]  ( .D(\buf_re[10][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[11][7] ) );
  DFFRHQX1 \buf_re_reg[12][7]  ( .D(\buf_re[11][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[12][7] ) );
  DFFRHQX1 \buf_re_reg[13][7]  ( .D(\buf_re[12][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[13][7] ) );
  DFFRHQX1 \buf_re_reg[14][7]  ( .D(\buf_re[13][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[14][7] ) );
  DFFRHQX1 \buf_re_reg[15][7]  ( .D(\buf_re[14][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[15][7] ) );
  DFFRHQX1 \buf_re_reg[16][7]  ( .D(\buf_re[15][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[16][7] ) );
  DFFRHQX1 \buf_re_reg[17][7]  ( .D(\buf_re[16][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[17][7] ) );
  DFFRHQX1 \buf_re_reg[18][7]  ( .D(\buf_re[17][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[18][7] ) );
  DFFRHQX1 \buf_re_reg[19][7]  ( .D(\buf_re[18][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[19][7] ) );
  DFFRHQX1 \buf_re_reg[20][7]  ( .D(\buf_re[19][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[20][7] ) );
  DFFRHQX1 \buf_re_reg[21][7]  ( .D(\buf_re[20][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[21][7] ) );
  DFFRHQX1 \buf_re_reg[22][7]  ( .D(\buf_re[21][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[22][7] ) );
  DFFRHQX1 \buf_re_reg[23][7]  ( .D(\buf_re[22][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[23][7] ) );
  DFFRHQX1 \buf_re_reg[24][7]  ( .D(\buf_re[23][7] ), .CK(clk), .RN(n13), .Q(
        \buf_re[24][7] ) );
  DFFRHQX1 \buf_re_reg[25][7]  ( .D(\buf_re[24][7] ), .CK(clk), .RN(n27), .Q(
        \buf_re[25][7] ) );
  DFFRHQX1 \buf_re_reg[26][7]  ( .D(\buf_re[25][7] ), .CK(clk), .RN(n14), .Q(
        \buf_re[26][7] ) );
  DFFRHQX1 \buf_re_reg[27][7]  ( .D(\buf_re[26][7] ), .CK(clk), .RN(n30), .Q(
        \buf_re[27][7] ) );
  DFFRHQX1 \buf_re_reg[28][7]  ( .D(\buf_re[27][7] ), .CK(clk), .RN(n12), .Q(
        \buf_re[28][7] ) );
  DFFRHQX1 \buf_re_reg[29][7]  ( .D(\buf_re[28][7] ), .CK(clk), .RN(n13), .Q(
        \buf_re[29][7] ) );
  DFFRHQX1 \buf_re_reg[30][7]  ( .D(\buf_re[29][7] ), .CK(clk), .RN(n27), .Q(
        \buf_re[30][7] ) );
  DFFRHQX1 \buf_re_reg[1][6]  ( .D(x_re[6]), .CK(clk), .RN(n30), .Q(
        \buf_re[1][6] ) );
  DFFRHQX1 \buf_re_reg[2][6]  ( .D(\buf_re[1][6] ), .CK(clk), .RN(n12), .Q(
        \buf_re[2][6] ) );
  DFFRHQX1 \buf_re_reg[3][6]  ( .D(\buf_re[2][6] ), .CK(clk), .RN(n14), .Q(
        \buf_re[3][6] ) );
  DFFRHQX1 \buf_re_reg[4][6]  ( .D(\buf_re[3][6] ), .CK(clk), .RN(n13), .Q(
        \buf_re[4][6] ) );
  DFFRHQX1 \buf_re_reg[5][6]  ( .D(\buf_re[4][6] ), .CK(clk), .RN(n27), .Q(
        \buf_re[5][6] ) );
  DFFRHQX1 \buf_re_reg[6][6]  ( .D(\buf_re[5][6] ), .CK(clk), .RN(n14), .Q(
        \buf_re[6][6] ) );
  DFFRHQX1 \buf_re_reg[7][6]  ( .D(\buf_re[6][6] ), .CK(clk), .RN(n11), .Q(
        \buf_re[7][6] ) );
  DFFRHQX1 \buf_re_reg[8][6]  ( .D(\buf_re[7][6] ), .CK(clk), .RN(n20), .Q(
        \buf_re[8][6] ) );
  DFFRHQX1 \buf_re_reg[9][6]  ( .D(\buf_re[8][6] ), .CK(clk), .RN(n29), .Q(
        \buf_re[9][6] ) );
  DFFRHQX1 \buf_re_reg[10][6]  ( .D(\buf_re[9][6] ), .CK(clk), .RN(n6), .Q(
        \buf_re[10][6] ) );
  DFFRHQX1 \buf_re_reg[11][6]  ( .D(\buf_re[10][6] ), .CK(clk), .RN(n29), .Q(
        \buf_re[11][6] ) );
  DFFRHQX1 \buf_re_reg[12][6]  ( .D(\buf_re[11][6] ), .CK(clk), .RN(n8), .Q(
        \buf_re[12][6] ) );
  DFFRHQX1 \buf_re_reg[13][6]  ( .D(\buf_re[12][6] ), .CK(clk), .RN(n33), .Q(
        \buf_re[13][6] ) );
  DFFRHQX1 \buf_re_reg[14][6]  ( .D(\buf_re[13][6] ), .CK(clk), .RN(n19), .Q(
        \buf_re[14][6] ) );
  DFFRHQX1 \buf_re_reg[15][6]  ( .D(\buf_re[14][6] ), .CK(clk), .RN(n24), .Q(
        \buf_re[15][6] ) );
  DFFRHQX1 \buf_re_reg[16][6]  ( .D(\buf_re[15][6] ), .CK(clk), .RN(n11), .Q(
        \buf_re[16][6] ) );
  DFFRHQX1 \buf_re_reg[17][6]  ( .D(\buf_re[16][6] ), .CK(clk), .RN(n28), .Q(
        \buf_re[17][6] ) );
  DFFRHQX1 \buf_re_reg[18][6]  ( .D(\buf_re[17][6] ), .CK(clk), .RN(n26), .Q(
        \buf_re[18][6] ) );
  DFFRHQX1 \buf_re_reg[19][6]  ( .D(\buf_re[18][6] ), .CK(clk), .RN(n9), .Q(
        \buf_re[19][6] ) );
  DFFRHQX1 \buf_re_reg[20][6]  ( .D(\buf_re[19][6] ), .CK(clk), .RN(n29), .Q(
        \buf_re[20][6] ) );
  DFFRHQX1 \buf_re_reg[21][6]  ( .D(\buf_re[20][6] ), .CK(clk), .RN(n29), .Q(
        \buf_re[21][6] ) );
  DFFRHQX1 \buf_re_reg[22][6]  ( .D(\buf_re[21][6] ), .CK(clk), .RN(n29), .Q(
        \buf_re[22][6] ) );
  DFFRHQX1 \buf_re_reg[23][6]  ( .D(\buf_re[22][6] ), .CK(clk), .RN(n29), .Q(
        \buf_re[23][6] ) );
  DFFRHQX1 \buf_re_reg[24][6]  ( .D(\buf_re[23][6] ), .CK(clk), .RN(n29), .Q(
        \buf_re[24][6] ) );
  DFFRHQX1 \buf_re_reg[25][6]  ( .D(\buf_re[24][6] ), .CK(clk), .RN(n29), .Q(
        \buf_re[25][6] ) );
  DFFRHQX1 \buf_re_reg[26][6]  ( .D(\buf_re[25][6] ), .CK(clk), .RN(n29), .Q(
        \buf_re[26][6] ) );
  DFFRHQX1 \buf_re_reg[27][6]  ( .D(\buf_re[26][6] ), .CK(clk), .RN(n29), .Q(
        \buf_re[27][6] ) );
  DFFRHQX1 \buf_re_reg[28][6]  ( .D(\buf_re[27][6] ), .CK(clk), .RN(n29), .Q(
        \buf_re[28][6] ) );
  DFFRHQX1 \buf_re_reg[29][6]  ( .D(\buf_re[28][6] ), .CK(clk), .RN(n29), .Q(
        \buf_re[29][6] ) );
  DFFRHQX1 \buf_re_reg[30][6]  ( .D(\buf_re[29][6] ), .CK(clk), .RN(n29), .Q(
        \buf_re[30][6] ) );
  DFFRHQX1 \buf_re_reg[1][5]  ( .D(x_re[5]), .CK(clk), .RN(n26), .Q(
        \buf_re[1][5] ) );
  DFFRHQX1 \buf_re_reg[2][5]  ( .D(\buf_re[1][5] ), .CK(clk), .RN(n26), .Q(
        \buf_re[2][5] ) );
  DFFRHQX1 \buf_re_reg[3][5]  ( .D(\buf_re[2][5] ), .CK(clk), .RN(n26), .Q(
        \buf_re[3][5] ) );
  DFFRHQX1 \buf_re_reg[4][5]  ( .D(\buf_re[3][5] ), .CK(clk), .RN(n25), .Q(
        \buf_re[4][5] ) );
  DFFRHQX1 \buf_re_reg[5][5]  ( .D(\buf_re[4][5] ), .CK(clk), .RN(n25), .Q(
        \buf_re[5][5] ) );
  DFFRHQX1 \buf_re_reg[6][5]  ( .D(\buf_re[5][5] ), .CK(clk), .RN(n25), .Q(
        \buf_re[6][5] ) );
  DFFRHQX1 \buf_re_reg[7][5]  ( .D(\buf_re[6][5] ), .CK(clk), .RN(n25), .Q(
        \buf_re[7][5] ) );
  DFFRHQX1 \buf_re_reg[8][5]  ( .D(\buf_re[7][5] ), .CK(clk), .RN(n25), .Q(
        \buf_re[8][5] ) );
  DFFRHQX1 \buf_re_reg[9][5]  ( .D(\buf_re[8][5] ), .CK(clk), .RN(n25), .Q(
        \buf_re[9][5] ) );
  DFFRHQX1 \buf_re_reg[10][5]  ( .D(\buf_re[9][5] ), .CK(clk), .RN(n25), .Q(
        \buf_re[10][5] ) );
  DFFRHQX1 \buf_re_reg[11][5]  ( .D(\buf_re[10][5] ), .CK(clk), .RN(n25), .Q(
        \buf_re[11][5] ) );
  DFFRHQX1 \buf_re_reg[12][5]  ( .D(\buf_re[11][5] ), .CK(clk), .RN(n25), .Q(
        \buf_re[12][5] ) );
  DFFRHQX1 \buf_re_reg[13][5]  ( .D(\buf_re[12][5] ), .CK(clk), .RN(n25), .Q(
        \buf_re[13][5] ) );
  DFFRHQX1 \buf_re_reg[14][5]  ( .D(\buf_re[13][5] ), .CK(clk), .RN(n25), .Q(
        \buf_re[14][5] ) );
  DFFRHQX1 \buf_re_reg[15][5]  ( .D(\buf_re[14][5] ), .CK(clk), .RN(n25), .Q(
        \buf_re[15][5] ) );
  DFFRHQX1 \buf_re_reg[16][5]  ( .D(\buf_re[15][5] ), .CK(clk), .RN(n25), .Q(
        \buf_re[16][5] ) );
  DFFRHQX1 \buf_re_reg[17][5]  ( .D(\buf_re[16][5] ), .CK(clk), .RN(n18), .Q(
        \buf_re[17][5] ) );
  DFFRHQX1 \buf_re_reg[18][5]  ( .D(\buf_re[17][5] ), .CK(clk), .RN(n27), .Q(
        \buf_re[18][5] ) );
  DFFRHQX1 \buf_re_reg[19][5]  ( .D(\buf_re[18][5] ), .CK(clk), .RN(n17), .Q(
        \buf_re[19][5] ) );
  DFFRHQX1 \buf_re_reg[20][5]  ( .D(\buf_re[19][5] ), .CK(clk), .RN(n33), .Q(
        \buf_re[20][5] ) );
  DFFRHQX1 \buf_re_reg[21][5]  ( .D(\buf_re[20][5] ), .CK(clk), .RN(n25), .Q(
        \buf_re[21][5] ) );
  DFFRHQX1 \buf_re_reg[22][5]  ( .D(\buf_re[21][5] ), .CK(clk), .RN(n16), .Q(
        \buf_re[22][5] ) );
  DFFRHQX1 \buf_re_reg[23][5]  ( .D(\buf_re[22][5] ), .CK(clk), .RN(n19), .Q(
        \buf_re[23][5] ) );
  DFFRHQX1 \buf_re_reg[24][5]  ( .D(\buf_re[23][5] ), .CK(clk), .RN(n10), .Q(
        \buf_re[24][5] ) );
  DFFRHQX1 \buf_re_reg[25][5]  ( .D(\buf_re[24][5] ), .CK(clk), .RN(n23), .Q(
        \buf_re[25][5] ) );
  DFFRHQX1 \buf_re_reg[26][5]  ( .D(\buf_re[25][5] ), .CK(clk), .RN(n24), .Q(
        \buf_re[26][5] ) );
  DFFRHQX1 \buf_re_reg[27][5]  ( .D(\buf_re[26][5] ), .CK(clk), .RN(n8), .Q(
        \buf_re[27][5] ) );
  DFFRHQX1 \buf_re_reg[28][5]  ( .D(\buf_re[27][5] ), .CK(clk), .RN(n7), .Q(
        \buf_re[28][5] ) );
  DFFRHQX1 \buf_re_reg[29][5]  ( .D(\buf_re[28][5] ), .CK(clk), .RN(n6), .Q(
        \buf_re[29][5] ) );
  DFFRHQX1 \buf_re_reg[30][5]  ( .D(\buf_re[29][5] ), .CK(clk), .RN(n29), .Q(
        \buf_re[30][5] ) );
  DFFRHQX1 \buf_re_reg[1][4]  ( .D(x_re[4]), .CK(clk), .RN(n28), .Q(
        \buf_re[1][4] ) );
  DFFRHQX1 \buf_re_reg[2][4]  ( .D(\buf_re[1][4] ), .CK(clk), .RN(n17), .Q(
        \buf_re[2][4] ) );
  DFFRHQX1 \buf_re_reg[3][4]  ( .D(\buf_re[2][4] ), .CK(clk), .RN(n10), .Q(
        \buf_re[3][4] ) );
  DFFRHQX1 \buf_re_reg[4][4]  ( .D(\buf_re[3][4] ), .CK(clk), .RN(n35), .Q(
        \buf_re[4][4] ) );
  DFFRHQX1 \buf_re_reg[5][4]  ( .D(\buf_re[4][4] ), .CK(clk), .RN(n16), .Q(
        \buf_re[5][4] ) );
  DFFRHQX1 \buf_re_reg[6][4]  ( .D(\buf_re[5][4] ), .CK(clk), .RN(n23), .Q(
        \buf_re[6][4] ) );
  DFFRHQX1 \buf_re_reg[7][4]  ( .D(\buf_re[6][4] ), .CK(clk), .RN(n20), .Q(
        \buf_re[7][4] ) );
  DFFRHQX1 \buf_re_reg[8][4]  ( .D(\buf_re[7][4] ), .CK(clk), .RN(n18), .Q(
        \buf_re[8][4] ) );
  DFFRHQX1 \buf_re_reg[9][4]  ( .D(\buf_re[8][4] ), .CK(clk), .RN(n7), .Q(
        \buf_re[9][4] ) );
  DFFRHQX1 \buf_re_reg[10][4]  ( .D(\buf_re[9][4] ), .CK(clk), .RN(n29), .Q(
        \buf_re[10][4] ) );
  DFFRHQX1 \buf_re_reg[11][4]  ( .D(\buf_re[10][4] ), .CK(clk), .RN(n16), .Q(
        \buf_re[11][4] ) );
  DFFRHQX1 \buf_re_reg[12][4]  ( .D(\buf_re[11][4] ), .CK(clk), .RN(n6), .Q(
        \buf_re[12][4] ) );
  DFFRHQX1 \buf_re_reg[13][4]  ( .D(\buf_re[12][4] ), .CK(clk), .RN(n35), .Q(
        \buf_re[13][4] ) );
  DFFRHQX1 \buf_re_reg[14][4]  ( .D(\buf_re[13][4] ), .CK(clk), .RN(n22), .Q(
        \buf_re[14][4] ) );
  DFFRHQX1 \buf_re_reg[15][4]  ( .D(\buf_re[14][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[15][4] ) );
  DFFRHQX1 \buf_re_reg[16][4]  ( .D(\buf_re[15][4] ), .CK(clk), .RN(n3), .Q(
        \buf_re[16][4] ) );
  DFFRHQX1 \buf_re_reg[17][4]  ( .D(\buf_re[16][4] ), .CK(clk), .RN(n2), .Q(
        \buf_re[17][4] ) );
  DFFRHQX1 \buf_re_reg[18][4]  ( .D(\buf_re[17][4] ), .CK(clk), .RN(n21), .Q(
        \buf_re[18][4] ) );
  DFFRHQX1 \buf_re_reg[19][4]  ( .D(\buf_re[18][4] ), .CK(clk), .RN(n35), .Q(
        \buf_re[19][4] ) );
  DFFRHQX1 \buf_re_reg[20][4]  ( .D(\buf_re[19][4] ), .CK(clk), .RN(n4), .Q(
        \buf_re[20][4] ) );
  DFFRHQX1 \buf_re_reg[21][4]  ( .D(\buf_re[20][4] ), .CK(clk), .RN(n22), .Q(
        \buf_re[21][4] ) );
  DFFRHQX1 \buf_re_reg[22][4]  ( .D(\buf_re[21][4] ), .CK(clk), .RN(n3), .Q(
        \buf_re[22][4] ) );
  DFFRHQX1 \buf_re_reg[23][4]  ( .D(\buf_re[22][4] ), .CK(clk), .RN(n2), .Q(
        \buf_re[23][4] ) );
  DFFRHQX1 \buf_re_reg[24][4]  ( .D(\buf_re[23][4] ), .CK(clk), .RN(n21), .Q(
        \buf_re[24][4] ) );
  DFFRHQX1 \buf_re_reg[25][4]  ( .D(\buf_re[24][4] ), .CK(clk), .RN(n35), .Q(
        \buf_re[25][4] ) );
  DFFRHQX1 \buf_re_reg[26][4]  ( .D(\buf_re[25][4] ), .CK(clk), .RN(n24), .Q(
        \buf_re[26][4] ) );
  DFFRHQX1 \buf_re_reg[27][4]  ( .D(\buf_re[26][4] ), .CK(clk), .RN(n24), .Q(
        \buf_re[27][4] ) );
  DFFRHQX1 \buf_re_reg[28][4]  ( .D(\buf_re[27][4] ), .CK(clk), .RN(n24), .Q(
        \buf_re[28][4] ) );
  DFFRHQX1 \buf_re_reg[29][4]  ( .D(\buf_re[28][4] ), .CK(clk), .RN(n24), .Q(
        \buf_re[29][4] ) );
  DFFRHQX1 \buf_re_reg[30][4]  ( .D(\buf_re[29][4] ), .CK(clk), .RN(n24), .Q(
        \buf_re[30][4] ) );
  DFFRHQX1 \buf_re_reg[1][3]  ( .D(x_re[3]), .CK(clk), .RN(n24), .Q(
        \buf_re[1][3] ) );
  DFFRHQX1 \buf_re_reg[2][3]  ( .D(\buf_re[1][3] ), .CK(clk), .RN(n24), .Q(
        \buf_re[2][3] ) );
  DFFRHQX1 \buf_re_reg[3][3]  ( .D(\buf_re[2][3] ), .CK(clk), .RN(n24), .Q(
        \buf_re[3][3] ) );
  DFFRHQX1 \buf_re_reg[4][3]  ( .D(\buf_re[3][3] ), .CK(clk), .RN(n24), .Q(
        \buf_re[4][3] ) );
  DFFRHQX1 \buf_re_reg[5][3]  ( .D(\buf_re[4][3] ), .CK(clk), .RN(n24), .Q(
        \buf_re[5][3] ) );
  DFFRHQX1 \buf_re_reg[6][3]  ( .D(\buf_re[5][3] ), .CK(clk), .RN(n24), .Q(
        \buf_re[6][3] ) );
  DFFRHQX1 \buf_re_reg[7][3]  ( .D(\buf_re[6][3] ), .CK(clk), .RN(n24), .Q(
        \buf_re[7][3] ) );
  DFFRHQX1 \buf_re_reg[8][3]  ( .D(\buf_re[7][3] ), .CK(clk), .RN(n24), .Q(
        \buf_re[8][3] ) );
  DFFRHQX1 \buf_re_reg[9][3]  ( .D(\buf_re[8][3] ), .CK(clk), .RN(n23), .Q(
        \buf_re[9][3] ) );
  DFFRHQX1 \buf_re_reg[10][3]  ( .D(\buf_re[9][3] ), .CK(clk), .RN(n23), .Q(
        \buf_re[10][3] ) );
  DFFRHQX1 \buf_re_reg[11][3]  ( .D(\buf_re[10][3] ), .CK(clk), .RN(n23), .Q(
        \buf_re[11][3] ) );
  DFFRHQX1 \buf_re_reg[12][3]  ( .D(\buf_re[11][3] ), .CK(clk), .RN(n23), .Q(
        \buf_re[12][3] ) );
  DFFRHQX1 \buf_re_reg[13][3]  ( .D(\buf_re[12][3] ), .CK(clk), .RN(n23), .Q(
        \buf_re[13][3] ) );
  DFFRHQX1 \buf_re_reg[14][3]  ( .D(\buf_re[13][3] ), .CK(clk), .RN(n23), .Q(
        \buf_re[14][3] ) );
  DFFRHQX1 \buf_re_reg[15][3]  ( .D(\buf_re[14][3] ), .CK(clk), .RN(n23), .Q(
        \buf_re[15][3] ) );
  DFFRHQX1 \buf_re_reg[16][3]  ( .D(\buf_re[15][3] ), .CK(clk), .RN(n23), .Q(
        \buf_re[16][3] ) );
  DFFRHQX1 \buf_re_reg[17][3]  ( .D(\buf_re[16][3] ), .CK(clk), .RN(n23), .Q(
        \buf_re[17][3] ) );
  DFFRHQX1 \buf_re_reg[18][3]  ( .D(\buf_re[17][3] ), .CK(clk), .RN(n23), .Q(
        \buf_re[18][3] ) );
  DFFRHQX1 \buf_re_reg[19][3]  ( .D(\buf_re[18][3] ), .CK(clk), .RN(n23), .Q(
        \buf_re[19][3] ) );
  DFFRHQX1 \buf_re_reg[20][3]  ( .D(\buf_re[19][3] ), .CK(clk), .RN(n23), .Q(
        \buf_re[20][3] ) );
  DFFRHQX1 \buf_re_reg[21][3]  ( .D(\buf_re[20][3] ), .CK(clk), .RN(n23), .Q(
        \buf_re[21][3] ) );
  DFFRHQX1 \buf_re_reg[22][3]  ( .D(\buf_re[21][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[22][3] ) );
  DFFRHQX1 \buf_re_reg[23][3]  ( .D(\buf_re[22][3] ), .CK(clk), .RN(n8), .Q(
        \buf_re[23][3] ) );
  DFFRHQX1 \buf_re_reg[24][3]  ( .D(\buf_re[23][3] ), .CK(clk), .RN(n17), .Q(
        \buf_re[24][3] ) );
  DFFRHQX1 \buf_re_reg[25][3]  ( .D(\buf_re[24][3] ), .CK(clk), .RN(n16), .Q(
        \buf_re[25][3] ) );
  DFFRHQX1 \buf_re_reg[26][3]  ( .D(\buf_re[25][3] ), .CK(clk), .RN(n8), .Q(
        \buf_re[26][3] ) );
  DFFRHQX1 \buf_re_reg[27][3]  ( .D(\buf_re[26][3] ), .CK(clk), .RN(n35), .Q(
        \buf_re[27][3] ) );
  DFFRHQX1 \buf_re_reg[28][3]  ( .D(\buf_re[27][3] ), .CK(clk), .RN(n5), .Q(
        \buf_re[28][3] ) );
  DFFRHQX1 \buf_re_reg[29][3]  ( .D(\buf_re[28][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[29][3] ) );
  DFFRHQX1 \buf_re_reg[30][3]  ( .D(\buf_re[29][3] ), .CK(clk), .RN(n18), .Q(
        \buf_re[30][3] ) );
  DFFRHQX1 \buf_re_reg[1][2]  ( .D(x_re[2]), .CK(clk), .RN(n8), .Q(
        \buf_re[1][2] ) );
  DFFRHQX1 \buf_re_reg[2][2]  ( .D(\buf_re[1][2] ), .CK(clk), .RN(n17), .Q(
        \buf_re[2][2] ) );
  DFFRHQX1 \buf_re_reg[3][2]  ( .D(\buf_re[2][2] ), .CK(clk), .RN(n5), .Q(
        \buf_re[3][2] ) );
  DFFRHQX1 \buf_re_reg[4][2]  ( .D(\buf_re[3][2] ), .CK(clk), .RN(n5), .Q(
        \buf_re[4][2] ) );
  DFFRHQX1 \buf_re_reg[5][2]  ( .D(\buf_re[4][2] ), .CK(clk), .RN(n24), .Q(
        \buf_re[5][2] ) );
  DFFRHQX1 \buf_re_reg[6][2]  ( .D(\buf_re[5][2] ), .CK(clk), .RN(n11), .Q(
        \buf_re[6][2] ) );
  DFFRHQX1 \buf_re_reg[7][2]  ( .D(\buf_re[6][2] ), .CK(clk), .RN(n28), .Q(
        \buf_re[7][2] ) );
  DFFRHQX1 \buf_re_reg[8][2]  ( .D(\buf_re[7][2] ), .CK(clk), .RN(n9), .Q(
        \buf_re[8][2] ) );
  DFFRHQX1 \buf_re_reg[9][2]  ( .D(\buf_re[8][2] ), .CK(clk), .RN(n35), .Q(
        \buf_re[9][2] ) );
  DFFRHQX1 \buf_re_reg[10][2]  ( .D(\buf_re[9][2] ), .CK(clk), .RN(n20), .Q(
        \buf_re[10][2] ) );
  DFFRHQX1 \buf_re_reg[11][2]  ( .D(\buf_re[10][2] ), .CK(clk), .RN(n29), .Q(
        \buf_re[11][2] ) );
  DFFRHQX1 \buf_re_reg[12][2]  ( .D(\buf_re[11][2] ), .CK(clk), .RN(n26), .Q(
        \buf_re[12][2] ) );
  DFFRHQX1 \buf_re_reg[13][2]  ( .D(\buf_re[12][2] ), .CK(clk), .RN(n18), .Q(
        \buf_re[13][2] ) );
  DFFRHQX1 \buf_re_reg[14][2]  ( .D(\buf_re[13][2] ), .CK(clk), .RN(n33), .Q(
        \buf_re[14][2] ) );
  DFFRHQX1 \buf_re_reg[15][2]  ( .D(\buf_re[14][2] ), .CK(clk), .RN(n19), .Q(
        \buf_re[15][2] ) );
  DFFRHQX1 \buf_re_reg[16][2]  ( .D(\buf_re[15][2] ), .CK(clk), .RN(n24), .Q(
        \buf_re[16][2] ) );
  DFFRHQX1 \buf_re_reg[17][2]  ( .D(\buf_re[16][2] ), .CK(clk), .RN(n11), .Q(
        \buf_re[17][2] ) );
  DFFRHQX1 \buf_re_reg[18][2]  ( .D(\buf_re[17][2] ), .CK(clk), .RN(n11), .Q(
        \buf_re[18][2] ) );
  DFFRHQX1 \buf_re_reg[19][2]  ( .D(\buf_re[18][2] ), .CK(clk), .RN(n17), .Q(
        \buf_re[19][2] ) );
  DFFRHQX1 \buf_re_reg[20][2]  ( .D(\buf_re[19][2] ), .CK(clk), .RN(n33), .Q(
        \buf_re[20][2] ) );
  DFFRHQX1 \buf_re_reg[21][2]  ( .D(\buf_re[20][2] ), .CK(clk), .RN(n19), .Q(
        \buf_re[21][2] ) );
  DFFRHQX1 \buf_re_reg[22][2]  ( .D(\buf_re[21][2] ), .CK(clk), .RN(n28), .Q(
        \buf_re[22][2] ) );
  DFFRHQX1 \buf_re_reg[23][2]  ( .D(\buf_re[22][2] ), .CK(clk), .RN(n26), .Q(
        \buf_re[23][2] ) );
  DFFRHQX1 \buf_re_reg[24][2]  ( .D(\buf_re[23][2] ), .CK(clk), .RN(n9), .Q(
        \buf_re[24][2] ) );
  DFFRHQX1 \buf_re_reg[25][2]  ( .D(\buf_re[24][2] ), .CK(clk), .RN(n35), .Q(
        \buf_re[25][2] ) );
  DFFRHQX1 \buf_re_reg[26][2]  ( .D(\buf_re[25][2] ), .CK(clk), .RN(n20), .Q(
        \buf_re[26][2] ) );
  DFFRHQX1 \buf_re_reg[27][2]  ( .D(\buf_re[26][2] ), .CK(clk), .RN(n29), .Q(
        \buf_re[27][2] ) );
  DFFRHQX1 \buf_re_reg[28][2]  ( .D(\buf_re[27][2] ), .CK(clk), .RN(n16), .Q(
        \buf_re[28][2] ) );
  DFFRHQX1 \buf_re_reg[29][2]  ( .D(\buf_re[28][2] ), .CK(clk), .RN(n33), .Q(
        \buf_re[29][2] ) );
  DFFRHQX1 \buf_re_reg[30][2]  ( .D(\buf_re[29][2] ), .CK(clk), .RN(n19), .Q(
        \buf_re[30][2] ) );
  DFFRHQX1 \buf_re_reg[1][1]  ( .D(x_re[1]), .CK(clk), .RN(n22), .Q(
        \buf_re[1][1] ) );
  DFFRHQX1 \buf_re_reg[2][1]  ( .D(\buf_re[1][1] ), .CK(clk), .RN(n3), .Q(
        \buf_re[2][1] ) );
  DFFRHQX1 \buf_re_reg[3][1]  ( .D(\buf_re[2][1] ), .CK(clk), .RN(n2), .Q(
        \buf_re[3][1] ) );
  DFFRHQX1 \buf_re_reg[4][1]  ( .D(\buf_re[3][1] ), .CK(clk), .RN(n21), .Q(
        \buf_re[4][1] ) );
  DFFRHQX1 \buf_re_reg[5][1]  ( .D(\buf_re[4][1] ), .CK(clk), .RN(n35), .Q(
        \buf_re[5][1] ) );
  DFFRHQX1 \buf_re_reg[6][1]  ( .D(\buf_re[5][1] ), .CK(clk), .RN(n4), .Q(
        \buf_re[6][1] ) );
  DFFRHQX1 \buf_re_reg[7][1]  ( .D(\buf_re[6][1] ), .CK(clk), .RN(n22), .Q(
        \buf_re[7][1] ) );
  DFFRHQX1 \buf_re_reg[8][1]  ( .D(\buf_re[7][1] ), .CK(clk), .RN(n3), .Q(
        \buf_re[8][1] ) );
  DFFRHQX1 \buf_re_reg[9][1]  ( .D(\buf_re[8][1] ), .CK(clk), .RN(n2), .Q(
        \buf_re[9][1] ) );
  DFFRHQX1 \buf_re_reg[10][1]  ( .D(\buf_re[9][1] ), .CK(clk), .RN(n21), .Q(
        \buf_re[10][1] ) );
  DFFRHQX1 \buf_re_reg[11][1]  ( .D(\buf_re[10][1] ), .CK(clk), .RN(n35), .Q(
        \buf_re[11][1] ) );
  DFFRHQX1 \buf_re_reg[12][1]  ( .D(\buf_re[11][1] ), .CK(clk), .RN(n4), .Q(
        \buf_re[12][1] ) );
  DFFRHQX1 \buf_re_reg[13][1]  ( .D(\buf_re[12][1] ), .CK(clk), .RN(n22), .Q(
        \buf_re[13][1] ) );
  DFFRHQX1 \buf_re_reg[14][1]  ( .D(\buf_re[13][1] ), .CK(clk), .RN(n22), .Q(
        \buf_re[14][1] ) );
  DFFRHQX1 \buf_re_reg[15][1]  ( .D(\buf_re[14][1] ), .CK(clk), .RN(n4), .Q(
        \buf_re[15][1] ) );
  DFFRHQX1 \buf_re_reg[16][1]  ( .D(\buf_re[15][1] ), .CK(clk), .RN(n3), .Q(
        \buf_re[16][1] ) );
  DFFRHQX1 \buf_re_reg[17][1]  ( .D(\buf_re[16][1] ), .CK(clk), .RN(n2), .Q(
        \buf_re[17][1] ) );
  DFFRHQX1 \buf_re_reg[18][1]  ( .D(\buf_re[17][1] ), .CK(clk), .RN(n21), .Q(
        \buf_re[18][1] ) );
  DFFRHQX1 \buf_re_reg[19][1]  ( .D(\buf_re[18][1] ), .CK(clk), .RN(n35), .Q(
        \buf_re[19][1] ) );
  DFFRHQX1 \buf_re_reg[20][1]  ( .D(\buf_re[19][1] ), .CK(clk), .RN(n22), .Q(
        \buf_re[20][1] ) );
  DFFRHQX1 \buf_re_reg[21][1]  ( .D(\buf_re[20][1] ), .CK(clk), .RN(n4), .Q(
        \buf_re[21][1] ) );
  DFFRHQX1 \buf_re_reg[22][1]  ( .D(\buf_re[21][1] ), .CK(clk), .RN(n2), .Q(
        \buf_re[22][1] ) );
  DFFRHQX1 \buf_re_reg[23][1]  ( .D(\buf_re[22][1] ), .CK(clk), .RN(n21), .Q(
        \buf_re[23][1] ) );
  DFFRHQX1 \buf_re_reg[24][1]  ( .D(\buf_re[23][1] ), .CK(clk), .RN(n3), .Q(
        \buf_re[24][1] ) );
  DFFRHQX1 \buf_re_reg[25][1]  ( .D(\buf_re[24][1] ), .CK(clk), .RN(n35), .Q(
        \buf_re[25][1] ) );
  DFFRHQX1 \buf_re_reg[26][1]  ( .D(\buf_re[25][1] ), .CK(clk), .RN(n4), .Q(
        \buf_re[26][1] ) );
  DFFRHQX1 \buf_re_reg[27][1]  ( .D(\buf_re[26][1] ), .CK(clk), .RN(n22), .Q(
        \buf_re[27][1] ) );
  DFFRHQX1 \buf_re_reg[28][1]  ( .D(\buf_re[27][1] ), .CK(clk), .RN(n22), .Q(
        \buf_re[28][1] ) );
  DFFRHQX1 \buf_re_reg[29][1]  ( .D(\buf_re[28][1] ), .CK(clk), .RN(n22), .Q(
        \buf_re[29][1] ) );
  DFFRHQX1 \buf_re_reg[30][1]  ( .D(\buf_re[29][1] ), .CK(clk), .RN(n22), .Q(
        \buf_re[30][1] ) );
  DFFRHQX1 \buf_re_reg[1][0]  ( .D(x_re[0]), .CK(clk), .RN(n12), .Q(
        \buf_re[1][0] ) );
  DFFRHQX1 \buf_re_reg[2][0]  ( .D(\buf_re[1][0] ), .CK(clk), .RN(n14), .Q(
        \buf_re[2][0] ) );
  DFFRHQX1 \buf_re_reg[3][0]  ( .D(\buf_re[2][0] ), .CK(clk), .RN(n13), .Q(
        \buf_re[3][0] ) );
  DFFRHQX1 \buf_re_reg[4][0]  ( .D(\buf_re[3][0] ), .CK(clk), .RN(n27), .Q(
        \buf_re[4][0] ) );
  DFFRHQX1 \buf_re_reg[5][0]  ( .D(\buf_re[4][0] ), .CK(clk), .RN(n30), .Q(
        \buf_re[5][0] ) );
  DFFRHQX1 \buf_re_reg[6][0]  ( .D(\buf_re[5][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[6][0] ) );
  DFFRHQX1 \buf_re_reg[7][0]  ( .D(\buf_re[6][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[7][0] ) );
  DFFRHQX1 \buf_re_reg[8][0]  ( .D(\buf_re[7][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[8][0] ) );
  DFFRHQX1 \buf_re_reg[9][0]  ( .D(\buf_re[8][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[9][0] ) );
  DFFRHQX1 \buf_re_reg[10][0]  ( .D(\buf_re[9][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[10][0] ) );
  DFFRHQX1 \buf_re_reg[11][0]  ( .D(\buf_re[10][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[11][0] ) );
  DFFRHQX1 \buf_re_reg[12][0]  ( .D(\buf_re[11][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[12][0] ) );
  DFFRHQX1 \buf_re_reg[13][0]  ( .D(\buf_re[12][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[13][0] ) );
  DFFRHQX1 \buf_re_reg[14][0]  ( .D(\buf_re[13][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[14][0] ) );
  DFFRHQX1 \buf_re_reg[15][0]  ( .D(\buf_re[14][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[15][0] ) );
  DFFRHQX1 \buf_re_reg[16][0]  ( .D(\buf_re[15][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[16][0] ) );
  DFFRHQX1 \buf_re_reg[17][0]  ( .D(\buf_re[16][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[17][0] ) );
  DFFRHQX1 \buf_re_reg[18][0]  ( .D(\buf_re[17][0] ), .CK(clk), .RN(n33), .Q(
        \buf_re[18][0] ) );
  DFFRHQX1 \buf_re_reg[19][0]  ( .D(\buf_re[18][0] ), .CK(clk), .RN(n1), .Q(
        \buf_re[19][0] ) );
  DFFRHQX1 \buf_re_reg[20][0]  ( .D(\buf_re[19][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[20][0] ) );
  DFFRHQX1 \buf_re_reg[21][0]  ( .D(\buf_re[20][0] ), .CK(clk), .RN(n31), .Q(
        \buf_re[21][0] ) );
  DFFRHQX1 \buf_re_reg[22][0]  ( .D(\buf_re[21][0] ), .CK(clk), .RN(n15), .Q(
        \buf_re[22][0] ) );
  DFFRHQX1 \buf_re_reg[23][0]  ( .D(\buf_re[22][0] ), .CK(clk), .RN(n35), .Q(
        \buf_re[23][0] ) );
  DFFRHQX1 \buf_re_reg[24][0]  ( .D(\buf_re[23][0] ), .CK(clk), .RN(n1), .Q(
        \buf_re[24][0] ) );
  DFFRHQX1 \buf_re_reg[25][0]  ( .D(\buf_re[24][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[25][0] ) );
  DFFRHQX1 \buf_re_reg[26][0]  ( .D(\buf_re[25][0] ), .CK(clk), .RN(n31), .Q(
        \buf_re[26][0] ) );
  DFFRHQX1 \buf_re_reg[27][0]  ( .D(\buf_re[26][0] ), .CK(clk), .RN(n15), .Q(
        \buf_re[27][0] ) );
  DFFRHQX1 \buf_re_reg[28][0]  ( .D(\buf_re[27][0] ), .CK(clk), .RN(n32), .Q(
        \buf_re[28][0] ) );
  DFFRHQX1 \buf_re_reg[29][0]  ( .D(\buf_re[28][0] ), .CK(clk), .RN(n31), .Q(
        \buf_re[29][0] ) );
  DFFRHQX1 \buf_re_reg[30][0]  ( .D(\buf_re[29][0] ), .CK(clk), .RN(n15), .Q(
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
  DFFHQX1 \y_im_r_reg[8]  ( .D(\buf_im[30][8] ), .CK(clk), .Q(y_im[8]) );
  DFFHQX1 \y_im_r_reg[7]  ( .D(\buf_im[30][7] ), .CK(clk), .Q(y_im[7]) );
  DFFHQX1 \y_im_r_reg[5]  ( .D(\buf_im[30][5] ), .CK(clk), .Q(y_im[5]) );
  DFFHQX1 \y_im_r_reg[4]  ( .D(\buf_im[30][4] ), .CK(clk), .Q(y_im[4]) );
  DFFHQX1 \y_im_r_reg[3]  ( .D(\buf_im[30][3] ), .CK(clk), .Q(y_im[3]) );
  DFFHQX1 \y_im_r_reg[2]  ( .D(\buf_im[30][2] ), .CK(clk), .Q(y_im[2]) );
  DFFHQX1 \y_im_r_reg[1]  ( .D(\buf_im[30][1] ), .CK(clk), .Q(y_im[1]) );
  DFFHQX1 \y_im_r_reg[0]  ( .D(\buf_im[30][0] ), .CK(clk), .Q(y_im[0]) );
  DFFHQX1 \y_re_r_reg[6]  ( .D(\buf_re[30][6] ), .CK(clk), .Q(y_re[6]) );
  DFFHQX1 \y_im_r_reg[6]  ( .D(\buf_im[30][6] ), .CK(clk), .Q(y_im[6]) );
  INVX1 U3 ( .A(n1), .Y(n36) );
  INVXL U4 ( .A(n35), .Y(n34) );
  INVX1 U5 ( .A(reset), .Y(n1) );
  INVX1 U6 ( .A(n1), .Y(n37) );
  INVX1 U7 ( .A(n36), .Y(n35) );
  INVX1 U8 ( .A(n36), .Y(n33) );
  INVX1 U9 ( .A(n37), .Y(n23) );
  INVX1 U10 ( .A(n37), .Y(n24) );
  INVX1 U11 ( .A(n34), .Y(n25) );
  INVX1 U12 ( .A(n37), .Y(n30) );
  INVX1 U13 ( .A(n36), .Y(n31) );
  INVX1 U14 ( .A(n36), .Y(n32) );
  INVX1 U15 ( .A(n37), .Y(n29) );
  INVX1 U16 ( .A(n36), .Y(n28) );
  INVX1 U17 ( .A(n37), .Y(n26) );
  INVX1 U18 ( .A(n37), .Y(n27) );
  INVX1 U19 ( .A(n36), .Y(n21) );
  INVX1 U20 ( .A(n37), .Y(n22) );
  INVX1 U21 ( .A(n36), .Y(n2) );
  INVX1 U22 ( .A(n36), .Y(n3) );
  INVX1 U23 ( .A(n37), .Y(n4) );
  INVX1 U24 ( .A(n37), .Y(n5) );
  INVX1 U25 ( .A(n37), .Y(n6) );
  INVX1 U26 ( .A(n37), .Y(n7) );
  INVX1 U27 ( .A(n37), .Y(n8) );
  INVX1 U28 ( .A(n37), .Y(n9) );
  INVX1 U29 ( .A(n37), .Y(n16) );
  INVX1 U30 ( .A(n37), .Y(n17) );
  INVX1 U31 ( .A(n37), .Y(n18) );
  INVX1 U32 ( .A(n37), .Y(n19) );
  INVX1 U33 ( .A(n37), .Y(n20) );
  INVX1 U34 ( .A(n36), .Y(n15) );
  INVX1 U35 ( .A(n37), .Y(n13) );
  INVX1 U36 ( .A(n37), .Y(n14) );
  INVX1 U37 ( .A(n37), .Y(n10) );
  INVX1 U38 ( .A(n37), .Y(n11) );
  INVX1 U39 ( .A(n37), .Y(n12) );
endmodule


module carry_select_adder2_WIDTH12_23 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, n12, n16, \add_29/carry[5] , \add_29/carry[4] ,
         \add_29/carry[3] , \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3,
         n4, n5;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  INVX1 U17 ( .A(n16), .Y(z[11]) );
  XOR3X2 \add_1_root_add_28_2/U1_5  ( .A(x[11]), .B(y[11]), .C(
        \add_1_root_add_28_2/carry[5] ), .Y(high_sum1[5]) );
  XOR3X2 \add_29/U1_5  ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(
        high_sum2[5]) );
  ADDFX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n5), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n4), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFHX4 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFHX4 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(
        carry), .S(low_sum[5]) );
  AOI2BB1X2 U3 ( .A0N(y[11]), .A1N(x[11]), .B0(n16), .Y(z[12]) );
  CLKINVX8 U4 ( .A(carry), .Y(n1) );
  INVX3 U5 ( .A(n1), .Y(n2) );
  INVX8 U6 ( .A(n1), .Y(n3) );
  AOI22X4 U7 ( .A0(n12), .A1(high_sum2[5]), .B0(n2), .B1(high_sum1[5]), .Y(n16) );
  INVX2 U8 ( .A(n3), .Y(n12) );
  AND2X4 U9 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
  MX2X1 U10 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(n3), .Y(z[6]) );
  MX2X1 U11 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(n3), .Y(z[7]) );
  MX2X1 U12 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(n3), .Y(z[8]) );
  MX2X1 U13 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(n3), .Y(z[9]) );
  MX2X1 U14 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(n3), .Y(z[10]) );
  AND2X2 U15 ( .A(y[6]), .B(x[6]), .Y(n4) );
  OR2X2 U16 ( .A(x[6]), .B(y[6]), .Y(n5) );
  XNOR2X1 U18 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  XOR2X1 U19 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
endmodule


module carry_select_adder2_WIDTH12_22 ( x, y, z );
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
  ADDFX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  ADDFX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFX2 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFHX4 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(
        carry), .S(low_sum[5]) );
  MXI2X4 U3 ( .A(high_sum2[5]), .B(high_sum1[5]), .S0(carry), .Y(n3) );
  MX2X1 U4 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U5 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U7 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U8 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  AND2X2 U9 ( .A(y[6]), .B(x[6]), .Y(n1) );
  OR2X2 U10 ( .A(x[6]), .B(y[6]), .Y(n2) );
  AND2X2 U11 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
  XNOR2X1 U12 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  XOR2X1 U13 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
endmodule


module carry_select_adder2_WIDTH12_21 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3,
         n4, n5, n6;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  ADDFHX4 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(
        carry), .S(low_sum[5]) );
  ADDFHX1 \add_27/U1_2  ( .A(x[2]), .B(y[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFX2 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFHX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFHX2 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFHX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFHX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFHX2 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFHX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFHX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFHX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFHX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFHX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  INVXL U3 ( .A(n6), .Y(z[11]) );
  AOI21X4 U4 ( .A0(n3), .A1(n4), .B0(n6), .Y(z[12]) );
  INVX1 U5 ( .A(y[11]), .Y(n3) );
  MX2X1 U6 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U7 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U8 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U9 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U10 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U11 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U12 ( .A(y[6]), .B(x[6]), .Y(n2) );
  INVX1 U13 ( .A(x[11]), .Y(n4) );
  XNOR3X4 U14 ( .A(n4), .B(y[11]), .C(\add_1_root_add_28_2/carry[5] ), .Y(
        high_sum1[5]) );
  AOI2BB2X4 U15 ( .B0(high_sum1[5]), .B1(carry), .A0N(n5), .A1N(carry), .Y(n6)
         );
  XNOR3X4 U16 ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(n5) );
  XNOR2X1 U17 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  XOR2X1 U18 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  AND2X1 U19 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_20 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3,
         n4, n5;
  wire   [5:0] low_sum;
  wire   [5:0] high_sum1;
  wire   [5:0] high_sum2;
  assign z[5] = low_sum[5];
  assign z[4] = low_sum[4];
  assign z[3] = low_sum[3];
  assign z[2] = low_sum[2];
  assign z[1] = low_sum[1];

  ADDFHX2 \add_27/U1_3  ( .A(x[3]), .B(y[3]), .CI(\add_27/carry[3] ), .CO(
        \add_27/carry[4] ), .S(low_sum[3]) );
  ADDFHX4 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
  ADDFHX4 \add_27/U1_1  ( .A(x[1]), .B(y[1]), .CI(\add_27/carry[1] ), .CO(
        \add_27/carry[2] ), .S(low_sum[1]) );
  ADDFX2 \add_27/U1_2  ( .A(y[2]), .B(x[2]), .CI(\add_27/carry[2] ), .CO(
        \add_27/carry[3] ), .S(low_sum[2]) );
  ADDFHX2 \add_1_root_add_28_2/U1_4  ( .A(x[10]), .B(y[10]), .CI(
        \add_1_root_add_28_2/carry[4] ), .CO(\add_1_root_add_28_2/carry[5] ), 
        .S(high_sum1[4]) );
  ADDFHX2 \add_29/U1_2  ( .A(x[8]), .B(y[8]), .CI(\add_29/carry[2] ), .CO(
        \add_29/carry[3] ), .S(high_sum2[2]) );
  ADDFHX2 \add_1_root_add_28_2/U1_3  ( .A(x[9]), .B(y[9]), .CI(
        \add_1_root_add_28_2/carry[3] ), .CO(\add_1_root_add_28_2/carry[4] ), 
        .S(high_sum1[3]) );
  ADDFHX4 \add_27/U1_5  ( .A(x[5]), .B(y[5]), .CI(\add_27/carry[5] ), .CO(
        carry), .S(low_sum[5]) );
  ADDFHX2 \add_1_root_add_28_2/U1_2  ( .A(x[8]), .B(y[8]), .CI(
        \add_1_root_add_28_2/carry[2] ), .CO(\add_1_root_add_28_2/carry[3] ), 
        .S(high_sum1[2]) );
  ADDFHX4 \add_29/U1_3  ( .A(x[9]), .B(y[9]), .CI(\add_29/carry[3] ), .CO(
        \add_29/carry[4] ), .S(high_sum2[3]) );
  ADDFHX4 \add_29/U1_4  ( .A(x[10]), .B(y[10]), .CI(\add_29/carry[4] ), .CO(
        \add_29/carry[5] ), .S(high_sum2[4]) );
  ADDFHX2 \add_1_root_add_28_2/U1_1  ( .A(x[7]), .B(y[7]), .CI(n1), .CO(
        \add_1_root_add_28_2/carry[2] ), .S(high_sum1[1]) );
  ADDFHX2 \add_29/U1_1  ( .A(x[7]), .B(y[7]), .CI(n2), .CO(\add_29/carry[2] ), 
        .S(high_sum2[1]) );
  OR2X4 U3 ( .A(x[6]), .B(y[6]), .Y(n1) );
  MX2X2 U4 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X2 U5 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X2 U6 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X2 U7 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X2 U8 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  INVX1 U9 ( .A(x[11]), .Y(n3) );
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
  AOI2BB1X4 U11 ( .A0N(y[11]), .A1N(x[11]), .B0(n5), .Y(z[12]) );
  INVX2 U12 ( .A(n5), .Y(z[11]) );
  XNOR3X4 U13 ( .A(n3), .B(y[11]), .C(\add_1_root_add_28_2/carry[5] ), .Y(
        high_sum1[5]) );
  XNOR3X4 U14 ( .A(x[11]), .B(y[11]), .C(\add_29/carry[5] ), .Y(n4) );
  AOI2BB2X4 U15 ( .B0(high_sum1[5]), .B1(carry), .A0N(n4), .A1N(carry), .Y(n5)
         );
  XNOR2X1 U16 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  XOR2X1 U17 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  AND2X1 U18 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module butterfly_WIDTH12_DW01_inc_1_DW01_inc_27 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [11:2] carry;

  ADDHX4 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX4 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX4 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX4 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHX2 U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  XOR2X1 U1 ( .A(A[1]), .B(n6), .Y(SUM[1]) );
  CLKINVX3 U2 ( .A(n5), .Y(n6) );
  AND2X2 U3 ( .A(carry[2]), .B(A[2]), .Y(n2) );
  NAND2X2 U4 ( .A(A[3]), .B(A[4]), .Y(n3) );
  AND2X4 U5 ( .A(carry[2]), .B(A[2]), .Y(n1) );
  NOR2BX4 U6 ( .AN(n1), .B(n3), .Y(n9) );
  AND2X1 U7 ( .A(n2), .B(A[3]), .Y(n4) );
  NAND2X4 U8 ( .A(A[5]), .B(n9), .Y(n8) );
  INVX2 U9 ( .A(A[0]), .Y(n5) );
  XOR2XL U10 ( .A(A[2]), .B(carry[2]), .Y(SUM[2]) );
  INVX8 U11 ( .A(n7), .Y(carry[2]) );
  NAND2X4 U12 ( .A(A[0]), .B(A[1]), .Y(n7) );
  XOR2XL U13 ( .A(A[5]), .B(n9), .Y(SUM[5]) );
  CLKINVX8 U14 ( .A(n8), .Y(carry[6]) );
  INVX1 U15 ( .A(n6), .Y(SUM[0]) );
  XOR2XL U16 ( .A(A[3]), .B(n2), .Y(SUM[3]) );
  XOR2XL U17 ( .A(A[4]), .B(n4), .Y(SUM[4]) );
  XOR2X4 U18 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
endmodule


module butterfly_WIDTH12_DW01_inc_0_DW01_inc_26 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;
  wire   n1, n2, n3, n4, n5, n6;
  wire   [11:2] carry;

  ADDHX2 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHX4 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX4 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX2 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX2 U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  XOR2X1 U1 ( .A(A[5]), .B(n3), .Y(SUM[5]) );
  NAND2X2 U2 ( .A(A[3]), .B(A[4]), .Y(n5) );
  NOR2BX1 U3 ( .AN(n4), .B(n5), .Y(n3) );
  INVX1 U4 ( .A(n6), .Y(n4) );
  NOR3BX4 U5 ( .AN(A[5]), .B(n6), .C(n5), .Y(carry[6]) );
  AND2X2 U6 ( .A(n4), .B(A[3]), .Y(n1) );
  XOR2X1 U7 ( .A(A[3]), .B(n4), .Y(SUM[3]) );
  XOR2X1 U8 ( .A(A[1]), .B(A[0]), .Y(SUM[1]) );
  INVX8 U9 ( .A(n2), .Y(carry[2]) );
  NAND2X4 U10 ( .A(A[1]), .B(A[0]), .Y(n2) );
  XOR2XL U11 ( .A(A[2]), .B(carry[2]), .Y(SUM[2]) );
  XOR2X1 U12 ( .A(A[4]), .B(n1), .Y(SUM[4]) );
  NAND2X4 U13 ( .A(A[2]), .B(carry[2]), .Y(n6) );
  XOR2X4 U14 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  INVX1 U15 ( .A(A[0]), .Y(SUM[0]) );
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
         N7, N6, N5, N4, N3, N2, N11, N10, N1, N0, n3, n5, n6, n7, n8, n9;
  wire   [11:0] x1_re_neg;
  wire   [11:0] x1_im_neg;
  wire   [12:0] temp1;
  wire   [12:0] temp2;
  wire   [12:0] temp3;
  wire   [12:0] temp4;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  carry_select_adder2_WIDTH12_23 c0 ( .x(x0_re), .y({x1_re[11:4], n7, x1_re[2], 
        n9, x1_re[0]}), .z({temp1[12:1], SYNOPSYS_UNCONNECTED__0}) );
  carry_select_adder2_WIDTH12_22 c1 ( .x(x0_im), .y({x1_im[11:2], n6, x1_im[0]}), .z({temp2[12:1], SYNOPSYS_UNCONNECTED__1}) );
  carry_select_adder2_WIDTH12_21 c2 ( .x(x0_re), .y({x1_re_neg[11:4], n3, 
        x1_re_neg[2:0]}), .z({temp3[12:1], SYNOPSYS_UNCONNECTED__2}) );
  carry_select_adder2_WIDTH12_20 c3 ( .x(x0_im), .y(x1_im_neg), .z({
        temp4[12:1], SYNOPSYS_UNCONNECTED__3}) );
  butterfly_WIDTH12_DW01_inc_1_DW01_inc_27 add_0_root_add_22_ni ( .A({N12, N13, 
        N14, N15, N16, N17, N18, N19, N20, N21, N22, N23}), .SUM(x1_im_neg) );
  butterfly_WIDTH12_DW01_inc_0_DW01_inc_26 add_0_root_add_21_ni ( .A({N0, N1, 
        N2, N3, N4, N5, N6, N7, N8, N9, N10, N11}), .SUM(x1_re_neg) );
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
  DFFHQXL \sub_re_reg[12]  ( .D(temp3[12]), .CK(clk), .Q(y1_re[11]) );
  DFFHQXL \sub_re_reg[10]  ( .D(temp3[10]), .CK(clk), .Q(y1_re[9]) );
  DFFHQXL \sub_re_reg[9]  ( .D(temp3[9]), .CK(clk), .Q(y1_re[8]) );
  DFFHQXL \sub_re_reg[8]  ( .D(temp3[8]), .CK(clk), .Q(y1_re[7]) );
  DFFHQXL \sub_re_reg[7]  ( .D(temp3[7]), .CK(clk), .Q(y1_re[6]) );
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
  DFFXL \sub_re_reg[11]  ( .D(temp3[11]), .CK(clk), .Q(y1_re[10]) );
  DFFXL \sub_im_reg[11]  ( .D(temp4[11]), .CK(clk), .Q(y1_im[10]) );
  DFFXL \sub_im_reg[12]  ( .D(temp4[12]), .CK(clk), .Q(y1_im[11]) );
  CLKINVX8 U3 ( .A(x1_re[5]), .Y(N6) );
  CLKINVX8 U4 ( .A(x1_re[0]), .Y(N11) );
  CLKINVX3 U5 ( .A(x1_im[1]), .Y(n5) );
  CLKINVX8 U6 ( .A(x1_im[4]), .Y(N19) );
  CLKINVX3 U7 ( .A(x1_re[2]), .Y(N9) );
  INVX1 U8 ( .A(n5), .Y(n6) );
  INVX1 U9 ( .A(n8), .Y(n9) );
  INVX1 U10 ( .A(x1_re[1]), .Y(n8) );
  INVX1 U11 ( .A(N8), .Y(n7) );
  BUFX3 U12 ( .A(x1_re_neg[3]), .Y(n3) );
  INVX4 U13 ( .A(x1_im[2]), .Y(N21) );
  INVX8 U14 ( .A(x1_re[1]), .Y(N10) );
  INVX8 U15 ( .A(x1_im[1]), .Y(N22) );
  INVX8 U16 ( .A(x1_im[0]), .Y(N23) );
  INVX4 U17 ( .A(x1_im[5]), .Y(N18) );
  CLKINVX8 U18 ( .A(x1_re[3]), .Y(N8) );
  CLKINVX3 U19 ( .A(x1_im[3]), .Y(N20) );
  CLKINVX3 U20 ( .A(x1_re[4]), .Y(N7) );
  INVX1 U21 ( .A(x1_im[10]), .Y(N13) );
  INVX1 U22 ( .A(x1_im[11]), .Y(N12) );
  INVX1 U23 ( .A(x1_im[6]), .Y(N17) );
  INVX1 U24 ( .A(x1_im[7]), .Y(N16) );
  INVX1 U25 ( .A(x1_im[8]), .Y(N15) );
  INVX1 U26 ( .A(x1_im[9]), .Y(N14) );
  INVX1 U27 ( .A(x1_re[10]), .Y(N1) );
  INVX1 U28 ( .A(x1_re[11]), .Y(N0) );
  INVX1 U29 ( .A(x1_re[6]), .Y(N5) );
  INVX1 U30 ( .A(x1_re[7]), .Y(N4) );
  INVX1 U31 ( .A(x1_re[8]), .Y(N3) );
  INVX1 U32 ( .A(x1_re[9]), .Y(N2) );
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
  AOI22X1 U77 ( .A0(bf_y0_re[0]), .A1(sel), .B0(dy_re[0]), .B1(n11), .Y(n33)
         );
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
  DFFHQX1 \dx_im_reg[0]  ( .D(N24), .CK(clk), .Q(dx_im[0]) );
  DFFHQX1 \dx_im_reg[1]  ( .D(N23), .CK(clk), .Q(dx_im[1]) );
  DFFHQX1 \dx_im_reg[2]  ( .D(N22), .CK(clk), .Q(dx_im[2]) );
  DFFHQX1 \dx_im_reg[3]  ( .D(N21), .CK(clk), .Q(dx_im[3]) );
  DFFHQX1 \dx_im_reg[4]  ( .D(N20), .CK(clk), .Q(dx_im[4]) );
  DFFHQX1 \dx_im_reg[5]  ( .D(N19), .CK(clk), .Q(dx_im[5]) );
  DFFHQX1 \dx_im_reg[6]  ( .D(N18), .CK(clk), .Q(dx_im[6]) );
  DFFHQX1 \dx_im_reg[7]  ( .D(N17), .CK(clk), .Q(dx_im[7]) );
  DFFHQX1 \dx_im_reg[8]  ( .D(N16), .CK(clk), .Q(dx_im[8]) );
  DFFHQX1 \dx_im_reg[9]  ( .D(N15), .CK(clk), .Q(dx_im[9]) );
  DFFHQX1 \dx_im_reg[10]  ( .D(N14), .CK(clk), .Q(dx_im[10]) );
  DFFHQX1 \dx_im_reg[11]  ( .D(N13), .CK(clk), .Q(dx_im[11]) );
  DFFHQX1 \dx_re_reg[0]  ( .D(N12), .CK(clk), .Q(dx_re[0]) );
  DFFHQX1 \dx_re_reg[1]  ( .D(N11), .CK(clk), .Q(dx_re[1]) );
  DFFHQX1 \dx_re_reg[2]  ( .D(N10), .CK(clk), .Q(dx_re[2]) );
  DFFHQX1 \dx_re_reg[3]  ( .D(N9), .CK(clk), .Q(dx_re[3]) );
  DFFHQX1 \dx_re_reg[4]  ( .D(N8), .CK(clk), .Q(dx_re[4]) );
  DFFHQX1 \dx_re_reg[5]  ( .D(N7), .CK(clk), .Q(dx_re[5]) );
  DFFHQX1 \dx_re_reg[6]  ( .D(N6), .CK(clk), .Q(dx_re[6]) );
  DFFHQX1 \dx_re_reg[7]  ( .D(N5), .CK(clk), .Q(dx_re[7]) );
  DFFHQX1 \dx_re_reg[8]  ( .D(N4), .CK(clk), .Q(dx_re[8]) );
  DFFHQX1 \dx_re_reg[9]  ( .D(N3), .CK(clk), .Q(dx_re[9]) );
  DFFHQX1 \dx_re_reg[10]  ( .D(N2), .CK(clk), .Q(dx_re[10]) );
  DFFHQX1 \dx_re_reg[11]  ( .D(N1), .CK(clk), .Q(dx_re[11]) );
  DFFX1 \mux2_re_reg[11]  ( .D(N25), .CK(clk), .QN(N62) );
  DFFX1 \mux2_re_reg[10]  ( .D(N26), .CK(clk), .QN(N63) );
  DFFX1 \mux2_re_reg[9]  ( .D(N27), .CK(clk), .QN(N64) );
  DFFX1 \mux2_re_reg[8]  ( .D(N28), .CK(clk), .QN(N65) );
  DFFX1 \mux2_re_reg[7]  ( .D(N29), .CK(clk), .QN(N66) );
  DFFX1 \mux2_re_reg[6]  ( .D(N30), .CK(clk), .QN(N67) );
  DFFX1 \mux2_re_reg[5]  ( .D(N31), .CK(clk), .QN(N68) );
  DFFX1 \mux2_re_reg[4]  ( .D(N32), .CK(clk), .QN(N69) );
  DFFX1 \mux2_re_reg[3]  ( .D(N33), .CK(clk), .QN(N70) );
  DFFX1 \mux2_re_reg[2]  ( .D(N34), .CK(clk), .QN(N71) );
  DFFX1 \mux2_re_reg[1]  ( .D(N35), .CK(clk), .QN(N72) );
  DFFX1 \mux2_re_reg[0]  ( .D(N36), .CK(clk), .QN(N73) );
  DFFHQX1 \mux2_im_reg[11]  ( .D(N37), .CK(clk), .Q(mux2_im[11]) );
  DFFHQX1 \mux2_im_reg[10]  ( .D(N38), .CK(clk), .Q(mux2_im[10]) );
  DFFHQX1 \mux2_im_reg[9]  ( .D(N39), .CK(clk), .Q(mux2_im[9]) );
  DFFHQX1 \mux2_im_reg[8]  ( .D(N40), .CK(clk), .Q(mux2_im[8]) );
  DFFHQX1 \mux2_im_reg[7]  ( .D(N41), .CK(clk), .Q(mux2_im[7]) );
  DFFHQX1 \mux2_im_reg[6]  ( .D(N42), .CK(clk), .Q(mux2_im[6]) );
  DFFHQX1 \mux2_im_reg[5]  ( .D(N43), .CK(clk), .Q(mux2_im[5]) );
  DFFHQX1 \mux2_im_reg[4]  ( .D(N44), .CK(clk), .Q(mux2_im[4]) );
  DFFHQX1 \mux2_im_reg[3]  ( .D(N45), .CK(clk), .Q(mux2_im[3]) );
  DFFHQX1 \mux2_im_reg[2]  ( .D(N46), .CK(clk), .Q(mux2_im[2]) );
  DFFHQX1 \mux2_im_reg[1]  ( .D(N47), .CK(clk), .Q(mux2_im[1]) );
  DFFHQX1 \mux2_im_reg[0]  ( .D(N48), .CK(clk), .Q(mux2_im[0]) );
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
  CLKINVX3 U136 ( .A(sel), .Y(n11) );
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
  FSM2_DW01_inc_0_DW01_inc_12 add_36 ( .A(cnt), .SUM({N12, N11, N10, N9, N8, 
        N7, N6}) );
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
  DFFHQX1 \y_im_r_reg[11]  ( .D(\buf_im[14][11] ), .CK(clk), .Q(y_im[11]) );
  DFFHQX1 \y_re_r_reg[11]  ( .D(\buf_re[14][11] ), .CK(clk), .Q(y_re[11]) );
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
  DFFHQX1 \y_re_r_reg[6]  ( .D(\buf_re[14][6] ), .CK(clk), .Q(y_re[6]) );
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
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3,
         n4;
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
  AOI22X1 U18 ( .A0(n4), .A1(high_sum2[5]), .B0(carry), .B1(high_sum1[5]), .Y(
        n3) );
  INVX1 U21 ( .A(carry), .Y(n4) );
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
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
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
  MX2X1 U3 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U4 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U5 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U6 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U7 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U8 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U9 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U10 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U12 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_18 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3,
         n4;
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
  AOI22X1 U18 ( .A0(n4), .A1(high_sum2[5]), .B0(carry), .B1(high_sum1[5]), .Y(
        n3) );
  INVX1 U21 ( .A(carry), .Y(n4) );
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
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
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
  MX2X1 U3 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U4 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U5 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U6 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U7 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U8 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U9 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U10 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U12 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
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
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
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
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
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

  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
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
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_1_DW01_inc_0_DW01_inc_29 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
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
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_1_DW_mult_tc_7 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n1, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n26, n28, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n77, n79, n80, n85, n86, n87, n88, n89, n90, n92, n93, n95, n96,
         n97, n98, n103, n104, n106, n111, n112, n113, n115, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n442, n494, n495,
         n496, n497, n498, n499, n500, n501, n502, n503, n504, n505;
  assign n1 = b[0];
  assign n389 = b[11];
  assign n390 = b[10];
  assign n391 = b[9];
  assign n392 = b[8];
  assign n393 = b[7];
  assign n394 = b[6];
  assign n395 = b[5];
  assign n396 = b[4];
  assign n397 = b[3];
  assign n398 = b[2];
  assign n399 = b[1];
  assign n425 = a[11];
  assign n426 = a[9];
  assign n427 = a[7];
  assign n428 = a[5];
  assign n429 = a[3];
  assign n430 = a[1];

  NAND2X4 U406 ( .A(n416), .B(n404), .Y(n410) );
  XNOR2X4 U408 ( .A(n494), .B(a[4]), .Y(n416) );
  OAI22XL U417 ( .A0(n407), .A1(n312), .B0(n413), .B1(n311), .Y(n239) );
  OAI22XL U418 ( .A0(n407), .A1(n313), .B0(n413), .B1(n312), .Y(n240) );
  OAI22XL U419 ( .A0(n407), .A1(n314), .B0(n413), .B1(n313), .Y(n241) );
  OAI22XL U420 ( .A0(n407), .A1(n316), .B0(n413), .B1(n315), .Y(n243) );
  OAI22XL U421 ( .A0(n412), .A1(n424), .B0(n388), .B1(n442), .Y(n238) );
  OAI22XL U422 ( .A0(n412), .A1(n387), .B0(n386), .B1(n442), .Y(n310) );
  OAI22XL U423 ( .A0(n412), .A1(n382), .B0(n381), .B1(n442), .Y(n305) );
  OAI22XL U424 ( .A0(n412), .A1(n384), .B0(n383), .B1(n442), .Y(n307) );
  OAI22XL U425 ( .A0(n412), .A1(n386), .B0(n385), .B1(n442), .Y(n309) );
  AOI21XL U426 ( .A0(n415), .A1(n409), .B0(n337), .Y(n496) );
  OAI22XL U427 ( .A0(n409), .A1(n338), .B0(n337), .B1(n415), .Y(n150) );
  OAI22XL U428 ( .A0(n409), .A1(n341), .B0(n340), .B1(n415), .Y(n266) );
  OAI22XL U429 ( .A0(n409), .A1(n339), .B0(n338), .B1(n415), .Y(n264) );
  OAI22XL U430 ( .A0(n409), .A1(n342), .B0(n341), .B1(n415), .Y(n267) );
  NOR2BXL U431 ( .AN(n1), .B(n415), .Y(n274) );
  OAI22XL U432 ( .A0(n409), .A1(n340), .B0(n339), .B1(n415), .Y(n265) );
  OAI22XL U433 ( .A0(n409), .A1(n347), .B0(n346), .B1(n415), .Y(n272) );
  XNOR2X2 U434 ( .A(n426), .B(a[10]), .Y(n413) );
  BUFX3 U435 ( .A(n429), .Y(n494) );
  NAND2X4 U436 ( .A(n417), .B(n405), .Y(n411) );
  NAND2X1 U437 ( .A(n500), .B(n504), .Y(n74) );
  XNOR2X2 U438 ( .A(n430), .B(a[2]), .Y(n417) );
  XOR2X1 U439 ( .A(n428), .B(a[4]), .Y(n404) );
  CMPR42X1 U440 ( .A(n267), .B(n247), .C(n178), .D(n182), .ICI(n175), .S(n172), 
        .ICO(n170), .CO(n171) );
  NAND2X1 U441 ( .A(n54), .B(n46), .Y(n44) );
  NOR2X1 U442 ( .A(n180), .B(n187), .Y(n67) );
  NOR2X1 U443 ( .A(n166), .B(n171), .Y(n56) );
  NOR2X1 U444 ( .A(n159), .B(n165), .Y(n51) );
  AOI21X2 U445 ( .A0(n31), .A1(n505), .B0(n28), .Y(n26) );
  NOR2X1 U446 ( .A(n67), .B(n70), .Y(n65) );
  AOI21X1 U447 ( .A0(n416), .A1(n410), .B0(n350), .Y(n495) );
  INVX1 U448 ( .A(n495), .Y(n275) );
  OAI21X1 U449 ( .A0(n67), .A1(n71), .B0(n68), .Y(n66) );
  AOI21X1 U450 ( .A0(n55), .A1(n46), .B0(n47), .Y(n45) );
  AOI22X1 U451 ( .A0(n502), .A1(n111), .B0(n227), .B1(n237), .Y(n106) );
  OAI21X2 U452 ( .A0(n86), .A1(n74), .B0(n75), .Y(n73) );
  INVX1 U453 ( .A(n496), .Y(n263) );
  AOI21XL U454 ( .A0(n442), .A1(n412), .B0(n376), .Y(n497) );
  INVX1 U455 ( .A(n497), .Y(n299) );
  OAI21X2 U456 ( .A0(n34), .A1(n32), .B0(n33), .Y(n31) );
  OAI21XL U457 ( .A0(n53), .A1(n51), .B0(n52), .Y(n50) );
  AOI21X1 U458 ( .A0(n417), .A1(n411), .B0(n363), .Y(n498) );
  INVX1 U459 ( .A(n498), .Y(n287) );
  AND2X2 U460 ( .A(n140), .B(n139), .Y(n28) );
  NAND2BX1 U461 ( .AN(n40), .B(n41), .Y(n7) );
  NAND2X1 U462 ( .A(n406), .B(n442), .Y(n412) );
  AOI21X1 U463 ( .A0(n414), .A1(n408), .B0(n324), .Y(n499) );
  INVX1 U464 ( .A(n499), .Y(n251) );
  NAND2BX1 U465 ( .AN(n48), .B(n49), .Y(n8) );
  NAND2BX1 U466 ( .AN(n32), .B(n33), .Y(n5) );
  OAI2BB2X1 U467 ( .B0(n106), .B1(n104), .A0N(n225), .A1N(n226), .Y(n103) );
  NAND2BX1 U468 ( .AN(n70), .B(n71), .Y(n13) );
  NAND2BX1 U469 ( .AN(n56), .B(n57), .Y(n10) );
  OAI21XL U470 ( .A0(n42), .A1(n40), .B0(n41), .Y(n39) );
  XOR3X2 U471 ( .A(n31), .B(n140), .C(n139), .Y(product[20]) );
  AOI22X1 U472 ( .A0(n503), .A1(n103), .B0(n221), .B1(n224), .Y(n98) );
  NAND2BX1 U473 ( .AN(n67), .B(n68), .Y(n12) );
  NAND2BX1 U474 ( .AN(n51), .B(n52), .Y(n9) );
  NAND2BX1 U475 ( .AN(n37), .B(n38), .Y(n6) );
  XOR3X2 U476 ( .A(n26), .B(n239), .C(n138), .Y(product[21]) );
  OR2X2 U477 ( .A(n196), .B(n201), .Y(n500) );
  AND2X2 U478 ( .A(n202), .B(n208), .Y(n501) );
  OR2X2 U479 ( .A(n227), .B(n237), .Y(n502) );
  OR2X2 U480 ( .A(n221), .B(n224), .Y(n503) );
  OR2X2 U481 ( .A(n202), .B(n208), .Y(n504) );
  OR2X2 U482 ( .A(n140), .B(n139), .Y(n505) );
  OAI21X2 U483 ( .A0(n44), .A1(n64), .B0(n45), .Y(n43) );
  CMPR42X1 U484 ( .A(n276), .B(n266), .C(n170), .D(n174), .ICI(n169), .S(n166), 
        .ICO(n164), .CO(n165) );
  AOI21XL U485 ( .A0(n63), .A1(n54), .B0(n55), .Y(n53) );
  CMPR42X2 U486 ( .A(n163), .B(n167), .C(n161), .D(n168), .ICI(n164), .S(n159), 
        .ICO(n157), .CO(n158) );
  AOI21X2 U487 ( .A0(n43), .A1(n35), .B0(n36), .Y(n34) );
  OAI21X2 U488 ( .A0(n56), .A1(n62), .B0(n57), .Y(n55) );
  AOI21X4 U489 ( .A0(n65), .A1(n73), .B0(n66), .Y(n64) );
  CMPR42X2 U490 ( .A(n248), .B(n192), .C(n185), .D(n190), .ICI(n183), .S(n180), 
        .ICO(n178), .CO(n179) );
  XNOR2X4 U491 ( .A(n427), .B(a[8]), .Y(n414) );
  INVX1 U492 ( .A(n428), .Y(n422) );
  OAI22X1 U493 ( .A0(n411), .A1(n423), .B0(n417), .B1(n375), .Y(n237) );
  INVX1 U494 ( .A(n494), .Y(n423) );
  NAND2BX1 U495 ( .AN(n1), .B(n494), .Y(n375) );
  NOR2BX1 U496 ( .AN(n1), .B(n417), .Y(n298) );
  NAND2BX1 U497 ( .AN(n1), .B(n430), .Y(n388) );
  INVX1 U498 ( .A(n430), .Y(n424) );
  XNOR2X1 U499 ( .A(n430), .B(n399), .Y(n386) );
  XNOR2X1 U500 ( .A(n430), .B(n396), .Y(n383) );
  XNOR2X1 U501 ( .A(n430), .B(n398), .Y(n385) );
  XNOR2X1 U502 ( .A(n494), .B(n399), .Y(n373) );
  XNOR2X1 U503 ( .A(n430), .B(n397), .Y(n384) );
  XNOR2X1 U504 ( .A(n494), .B(n389), .Y(n363) );
  XNOR2X1 U505 ( .A(n430), .B(n395), .Y(n382) );
  OAI22X1 U506 ( .A0(n411), .A1(n371), .B0(n370), .B1(n417), .Y(n294) );
  XNOR2X1 U507 ( .A(n494), .B(n397), .Y(n371) );
  XNOR2X1 U508 ( .A(n494), .B(n398), .Y(n372) );
  XNOR2X1 U509 ( .A(n428), .B(n399), .Y(n360) );
  ADDHXL U510 ( .A(n306), .B(n236), .CO(n222), .S(n223) );
  OAI22X1 U511 ( .A0(n412), .A1(n383), .B0(n382), .B1(n442), .Y(n306) );
  OAI22X1 U512 ( .A0(n410), .A1(n422), .B0(n416), .B1(n362), .Y(n236) );
  NAND2BX1 U513 ( .AN(n1), .B(n428), .Y(n362) );
  NOR2X1 U514 ( .A(n309), .B(n298), .Y(n112) );
  NAND2X1 U515 ( .A(n309), .B(n298), .Y(n113) );
  NAND2X1 U516 ( .A(n310), .B(n238), .Y(n115) );
  XNOR2X1 U517 ( .A(n430), .B(n1), .Y(n387) );
  ADDFX2 U518 ( .A(n286), .B(n307), .CI(n296), .CO(n224), .S(n225) );
  NOR2BX1 U519 ( .AN(n1), .B(n416), .Y(n286) );
  OAI22X1 U520 ( .A0(n411), .A1(n373), .B0(n372), .B1(n417), .Y(n296) );
  ADDHXL U521 ( .A(n308), .B(n297), .CO(n226), .S(n227) );
  OAI22X1 U522 ( .A0(n412), .A1(n385), .B0(n384), .B1(n442), .Y(n308) );
  OAI22X1 U523 ( .A0(n411), .A1(n374), .B0(n373), .B1(n417), .Y(n297) );
  XNOR2X1 U524 ( .A(n494), .B(n1), .Y(n374) );
  NAND2BX1 U525 ( .AN(n1), .B(n427), .Y(n349) );
  XNOR2X1 U526 ( .A(n430), .B(n394), .Y(n381) );
  XNOR2X1 U527 ( .A(n427), .B(n1), .Y(n348) );
  XNOR2X1 U528 ( .A(n494), .B(n396), .Y(n370) );
  XNOR2X1 U529 ( .A(n428), .B(n398), .Y(n359) );
  NAND2BX1 U530 ( .AN(n1), .B(n426), .Y(n336) );
  XNOR2X1 U531 ( .A(n426), .B(n1), .Y(n335) );
  XNOR2X1 U532 ( .A(n427), .B(n398), .Y(n346) );
  XNOR2X1 U533 ( .A(n430), .B(n392), .Y(n379) );
  XNOR2X1 U534 ( .A(n430), .B(n393), .Y(n380) );
  XNOR2X1 U535 ( .A(n427), .B(n399), .Y(n347) );
  XNOR2X1 U536 ( .A(n426), .B(n399), .Y(n334) );
  XNOR2X1 U537 ( .A(n427), .B(n397), .Y(n345) );
  XNOR2X1 U538 ( .A(n426), .B(n396), .Y(n331) );
  XNOR2X1 U539 ( .A(n427), .B(n396), .Y(n344) );
  XNOR2X1 U540 ( .A(n425), .B(n1), .Y(n322) );
  XNOR2X1 U541 ( .A(n430), .B(n389), .Y(n376) );
  NAND2BX1 U542 ( .AN(n1), .B(n425), .Y(n323) );
  XNOR2X1 U543 ( .A(n494), .B(n390), .Y(n364) );
  XNOR2X1 U544 ( .A(n427), .B(n395), .Y(n343) );
  XNOR2X1 U545 ( .A(n494), .B(n391), .Y(n365) );
  XNOR2X1 U546 ( .A(n428), .B(n392), .Y(n353) );
  OAI22X1 U547 ( .A0(n408), .A1(n331), .B0(n330), .B1(n414), .Y(n257) );
  XNOR2X1 U548 ( .A(n426), .B(n395), .Y(n330) );
  OAI22X1 U549 ( .A0(n411), .A1(n364), .B0(n363), .B1(n417), .Y(n176) );
  XNOR2X1 U550 ( .A(n425), .B(n396), .Y(n318) );
  XNOR2X1 U551 ( .A(n426), .B(n394), .Y(n329) );
  XNOR2X1 U552 ( .A(n428), .B(n389), .Y(n350) );
  XNOR2X1 U553 ( .A(n425), .B(n395), .Y(n317) );
  XNOR2X1 U554 ( .A(n427), .B(n389), .Y(n337) );
  CMPR42X1 U555 ( .A(n274), .B(n305), .C(n294), .D(n284), .ICI(n222), .S(n219), 
        .ICO(n217), .CO(n218) );
  OAI22X1 U556 ( .A0(n410), .A1(n360), .B0(n359), .B1(n416), .Y(n284) );
  ADDFX2 U557 ( .A(n295), .B(n285), .CI(n223), .CO(n220), .S(n221) );
  OAI22X1 U558 ( .A0(n410), .A1(n361), .B0(n360), .B1(n416), .Y(n285) );
  OAI22X1 U559 ( .A0(n411), .A1(n372), .B0(n371), .B1(n417), .Y(n295) );
  XNOR2X1 U560 ( .A(n428), .B(n1), .Y(n361) );
  OAI21XL U561 ( .A0(n112), .A1(n115), .B0(n113), .Y(n111) );
  NOR2X1 U562 ( .A(n225), .B(n226), .Y(n104) );
  XNOR2X1 U563 ( .A(n428), .B(n396), .Y(n357) );
  XNOR2X1 U564 ( .A(n494), .B(n395), .Y(n369) );
  XNOR2X1 U565 ( .A(n428), .B(n397), .Y(n358) );
  ADDHXL U566 ( .A(n304), .B(n235), .CO(n215), .S(n216) );
  OAI22X1 U567 ( .A0(n412), .A1(n381), .B0(n380), .B1(n442), .Y(n304) );
  OAI22X1 U568 ( .A0(n409), .A1(n421), .B0(n415), .B1(n349), .Y(n235) );
  INVX1 U569 ( .A(n427), .Y(n421) );
  CMPR42X1 U570 ( .A(n293), .B(n273), .C(n283), .D(n216), .ICI(n217), .S(n214), 
        .ICO(n212), .CO(n213) );
  OAI22X1 U571 ( .A0(n410), .A1(n359), .B0(n358), .B1(n416), .Y(n283) );
  OAI22X1 U572 ( .A0(n409), .A1(n348), .B0(n347), .B1(n415), .Y(n273) );
  OAI22X1 U573 ( .A0(n411), .A1(n370), .B0(n369), .B1(n417), .Y(n293) );
  ADDHXL U574 ( .A(n302), .B(n234), .CO(n205), .S(n206) );
  OAI22X1 U575 ( .A0(n412), .A1(n379), .B0(n378), .B1(n442), .Y(n302) );
  OAI22X1 U576 ( .A0(n408), .A1(n420), .B0(n414), .B1(n336), .Y(n234) );
  INVX1 U577 ( .A(n426), .Y(n420) );
  ADDFX2 U578 ( .A(n271), .B(n261), .CI(n281), .CO(n203), .S(n204) );
  OAI22X1 U579 ( .A0(n410), .A1(n357), .B0(n356), .B1(n416), .Y(n281) );
  OAI22X1 U580 ( .A0(n408), .A1(n335), .B0(n334), .B1(n414), .Y(n261) );
  OAI22X1 U581 ( .A0(n409), .A1(n346), .B0(n345), .B1(n415), .Y(n271) );
  XNOR2X1 U582 ( .A(n494), .B(n394), .Y(n368) );
  ADDFX2 U583 ( .A(n262), .B(n303), .CI(n272), .CO(n210), .S(n211) );
  OAI22X1 U584 ( .A0(n412), .A1(n380), .B0(n379), .B1(n442), .Y(n303) );
  NOR2BX1 U585 ( .AN(n1), .B(n414), .Y(n262) );
  XNOR2X1 U586 ( .A(n428), .B(n395), .Y(n356) );
  XNOR2X1 U587 ( .A(n494), .B(n393), .Y(n367) );
  XNOR2X1 U588 ( .A(n430), .B(n390), .Y(n377) );
  XNOR2X1 U589 ( .A(n430), .B(n391), .Y(n378) );
  XOR2X1 U590 ( .A(n430), .B(a[0]), .Y(n406) );
  CLKINVX3 U591 ( .A(a[0]), .Y(n442) );
  XNOR2X1 U592 ( .A(n494), .B(n392), .Y(n366) );
  XOR2X1 U593 ( .A(n494), .B(a[2]), .Y(n405) );
  XNOR2X1 U594 ( .A(n426), .B(n398), .Y(n333) );
  XNOR2X1 U595 ( .A(n428), .B(n394), .Y(n355) );
  XNOR2X1 U596 ( .A(n426), .B(n397), .Y(n332) );
  XNOR2X1 U597 ( .A(n428), .B(n393), .Y(n354) );
  CMPR42X1 U598 ( .A(n250), .B(n260), .C(n270), .D(n205), .ICI(n203), .S(n199), 
        .ICO(n197), .CO(n198) );
  NOR2BX1 U599 ( .AN(n1), .B(n413), .Y(n250) );
  OAI22X1 U600 ( .A0(n409), .A1(n345), .B0(n344), .B1(n415), .Y(n270) );
  OAI22X1 U601 ( .A0(n408), .A1(n334), .B0(n333), .B1(n414), .Y(n260) );
  OAI22X1 U602 ( .A0(n408), .A1(n332), .B0(n331), .B1(n414), .Y(n258) );
  OAI22X1 U603 ( .A0(n410), .A1(n354), .B0(n353), .B1(n416), .Y(n278) );
  XNOR2X1 U604 ( .A(n425), .B(n399), .Y(n321) );
  CMPR42X1 U605 ( .A(n269), .B(n249), .C(n289), .D(n194), .ICI(n197), .S(n191), 
        .ICO(n189), .CO(n190) );
  OAI22X1 U606 ( .A0(n411), .A1(n366), .B0(n365), .B1(n417), .Y(n289) );
  OAI22X1 U607 ( .A0(n407), .A1(n322), .B0(n413), .B1(n321), .Y(n249) );
  OAI22X1 U608 ( .A0(n409), .A1(n344), .B0(n343), .B1(n415), .Y(n269) );
  ADDHXL U609 ( .A(n300), .B(n233), .CO(n192), .S(n193) );
  OAI22X1 U610 ( .A0(n412), .A1(n377), .B0(n376), .B1(n442), .Y(n300) );
  OAI22X1 U611 ( .A0(n407), .A1(n419), .B0(n413), .B1(n323), .Y(n233) );
  INVX1 U612 ( .A(n425), .Y(n419) );
  XNOR2X1 U613 ( .A(n427), .B(n394), .Y(n342) );
  XNOR2X1 U614 ( .A(n425), .B(n398), .Y(n320) );
  CMPR42X1 U615 ( .A(n268), .B(n288), .C(n299), .D(n189), .ICI(n186), .S(n183), 
        .ICO(n181), .CO(n182) );
  OAI22X1 U616 ( .A0(n411), .A1(n365), .B0(n364), .B1(n417), .Y(n288) );
  OAI22X1 U617 ( .A0(n409), .A1(n343), .B0(n342), .B1(n415), .Y(n268) );
  XNOR2X1 U618 ( .A(n425), .B(n397), .Y(n319) );
  XNOR2X1 U619 ( .A(n428), .B(n391), .Y(n352) );
  XNOR2X1 U620 ( .A(n427), .B(n393), .Y(n341) );
  CMPR42X1 U621 ( .A(n257), .B(n277), .C(n177), .D(n184), .ICI(n181), .S(n175), 
        .ICO(n173), .CO(n174) );
  OR2X2 U622 ( .A(n278), .B(n258), .Y(n184) );
  INVX1 U623 ( .A(n176), .Y(n177) );
  OAI22X1 U624 ( .A0(n410), .A1(n353), .B0(n352), .B1(n416), .Y(n277) );
  XNOR2X1 U625 ( .A(n427), .B(n392), .Y(n340) );
  XNOR2X1 U626 ( .A(n428), .B(n390), .Y(n351) );
  CMPR42X1 U627 ( .A(n246), .B(n176), .C(n256), .D(n287), .ICI(n173), .S(n169), 
        .ICO(n167), .CO(n168) );
  OAI22X1 U628 ( .A0(n408), .A1(n330), .B0(n329), .B1(n414), .Y(n256) );
  OAI22X1 U629 ( .A0(n407), .A1(n319), .B0(n413), .B1(n318), .Y(n246) );
  OAI22X1 U630 ( .A0(n410), .A1(n351), .B0(n350), .B1(n416), .Y(n162) );
  XNOR2X1 U631 ( .A(n426), .B(n393), .Y(n328) );
  XNOR2X1 U632 ( .A(n427), .B(n391), .Y(n339) );
  XNOR2X1 U633 ( .A(n427), .B(n390), .Y(n338) );
  ADDFX2 U634 ( .A(n245), .B(n255), .CI(n265), .CO(n160), .S(n161) );
  OAI22X1 U635 ( .A0(n408), .A1(n329), .B0(n328), .B1(n414), .Y(n255) );
  OAI22X1 U636 ( .A0(n407), .A1(n318), .B0(n413), .B1(n317), .Y(n245) );
  XNOR2X1 U637 ( .A(n426), .B(n392), .Y(n327) );
  XNOR2X1 U638 ( .A(n425), .B(n394), .Y(n316) );
  ADDFX2 U639 ( .A(n244), .B(n162), .CI(n275), .CO(n155), .S(n156) );
  OAI22X1 U640 ( .A0(n407), .A1(n317), .B0(n413), .B1(n316), .Y(n244) );
  OAI21XL U641 ( .A0(n52), .A1(n48), .B0(n49), .Y(n47) );
  XNOR2X2 U642 ( .A(n428), .B(a[6]), .Y(n415) );
  NAND2X2 U643 ( .A(n415), .B(n403), .Y(n409) );
  XOR2X1 U644 ( .A(n427), .B(a[6]), .Y(n403) );
  XNOR2X1 U645 ( .A(n426), .B(n391), .Y(n326) );
  XNOR2X1 U646 ( .A(n425), .B(n393), .Y(n315) );
  XNOR2X1 U647 ( .A(n426), .B(n390), .Y(n325) );
  XNOR2X1 U648 ( .A(n425), .B(n392), .Y(n314) );
  NAND2X1 U649 ( .A(n209), .B(n213), .Y(n90) );
  NAND2X1 U650 ( .A(n214), .B(n218), .Y(n93) );
  NOR2X1 U651 ( .A(n209), .B(n213), .Y(n89) );
  NOR2X1 U652 ( .A(n214), .B(n218), .Y(n92) );
  NOR2X1 U653 ( .A(n219), .B(n220), .Y(n96) );
  NAND2X1 U654 ( .A(n219), .B(n220), .Y(n97) );
  CMPR42X1 U655 ( .A(n292), .B(n282), .C(n215), .D(n212), .ICI(n211), .S(n209), 
        .ICO(n207), .CO(n208) );
  OAI22X1 U656 ( .A0(n410), .A1(n358), .B0(n357), .B1(n416), .Y(n282) );
  OAI22X1 U657 ( .A0(n411), .A1(n369), .B0(n368), .B1(n417), .Y(n292) );
  CMPR42X1 U658 ( .A(n291), .B(n206), .C(n210), .D(n204), .ICI(n207), .S(n202), 
        .ICO(n200), .CO(n201) );
  OAI22X1 U659 ( .A0(n411), .A1(n368), .B0(n367), .B1(n417), .Y(n291) );
  CMPR42X1 U660 ( .A(n301), .B(n280), .C(n290), .D(n200), .ICI(n199), .S(n196), 
        .ICO(n194), .CO(n195) );
  OAI22X1 U661 ( .A0(n412), .A1(n378), .B0(n377), .B1(n442), .Y(n301) );
  OAI22X1 U662 ( .A0(n411), .A1(n367), .B0(n366), .B1(n417), .Y(n290) );
  OAI22X1 U663 ( .A0(n410), .A1(n356), .B0(n355), .B1(n416), .Y(n280) );
  CMPR42X1 U664 ( .A(n279), .B(n259), .C(n193), .D(n198), .ICI(n191), .S(n188), 
        .ICO(n186), .CO(n187) );
  OAI22X1 U665 ( .A0(n410), .A1(n355), .B0(n354), .B1(n416), .Y(n279) );
  OAI22X1 U666 ( .A0(n408), .A1(n333), .B0(n332), .B1(n414), .Y(n259) );
  AOI21X1 U667 ( .A0(n500), .A1(n501), .B0(n77), .Y(n75) );
  INVX1 U668 ( .A(n79), .Y(n77) );
  OAI22X1 U669 ( .A0(n407), .A1(n321), .B0(n413), .B1(n320), .Y(n248) );
  XNOR2X1 U670 ( .A(n278), .B(n258), .Y(n185) );
  NOR2X1 U671 ( .A(n172), .B(n179), .Y(n61) );
  OAI22X1 U672 ( .A0(n407), .A1(n320), .B0(n413), .B1(n319), .Y(n247) );
  OAI22X1 U673 ( .A0(n410), .A1(n352), .B0(n351), .B1(n416), .Y(n276) );
  INVX1 U674 ( .A(n162), .Y(n163) );
  NOR2X1 U675 ( .A(n56), .B(n61), .Y(n54) );
  CMPR42X1 U676 ( .A(n264), .B(n254), .C(n160), .D(n156), .ICI(n157), .S(n154), 
        .ICO(n152), .CO(n153) );
  OAI22X1 U677 ( .A0(n408), .A1(n328), .B0(n327), .B1(n414), .Y(n254) );
  CMPR42X1 U678 ( .A(n253), .B(n243), .C(n151), .D(n155), .ICI(n152), .S(n149), 
        .ICO(n147), .CO(n148) );
  INVX1 U679 ( .A(n150), .Y(n151) );
  OAI22X1 U680 ( .A0(n408), .A1(n327), .B0(n326), .B1(n414), .Y(n253) );
  NOR2X1 U681 ( .A(n51), .B(n48), .Y(n46) );
  CMPR42X1 U682 ( .A(n150), .B(n242), .C(n252), .D(n263), .ICI(n147), .S(n146), 
        .ICO(n144), .CO(n145) );
  OAI22X1 U683 ( .A0(n408), .A1(n326), .B0(n325), .B1(n414), .Y(n252) );
  OAI22X1 U684 ( .A0(n407), .A1(n315), .B0(n413), .B1(n314), .Y(n242) );
  XNOR2X1 U685 ( .A(n426), .B(n389), .Y(n324) );
  OAI22X1 U686 ( .A0(n408), .A1(n325), .B0(n324), .B1(n414), .Y(n142) );
  XNOR2X1 U687 ( .A(n425), .B(n391), .Y(n313) );
  NAND2X2 U688 ( .A(n414), .B(n402), .Y(n408) );
  XOR2X1 U689 ( .A(n426), .B(a[8]), .Y(n402) );
  NAND2X2 U690 ( .A(n413), .B(n401), .Y(n407) );
  XOR2X1 U691 ( .A(n425), .B(a[10]), .Y(n401) );
  XNOR2X1 U692 ( .A(n425), .B(n390), .Y(n312) );
  ADDFX2 U693 ( .A(n241), .B(n143), .CI(n144), .CO(n140), .S(n141) );
  INVX1 U694 ( .A(n142), .Y(n143) );
  NAND2X1 U695 ( .A(n196), .B(n201), .Y(n79) );
  AOI21X1 U696 ( .A0(n87), .A1(n95), .B0(n88), .Y(n86) );
  OAI21XL U697 ( .A0(n98), .A1(n96), .B0(n97), .Y(n95) );
  NOR2X1 U698 ( .A(n89), .B(n92), .Y(n87) );
  OAI21XL U699 ( .A0(n89), .A1(n93), .B0(n90), .Y(n88) );
  NOR2X1 U700 ( .A(n188), .B(n195), .Y(n70) );
  NAND2X1 U701 ( .A(n188), .B(n195), .Y(n71) );
  NAND2X1 U702 ( .A(n180), .B(n187), .Y(n68) );
  INVX1 U703 ( .A(n73), .Y(n72) );
  NAND2X1 U704 ( .A(n172), .B(n179), .Y(n62) );
  INVX1 U705 ( .A(n61), .Y(n59) );
  INVX1 U706 ( .A(n62), .Y(n60) );
  NAND2X1 U707 ( .A(n166), .B(n171), .Y(n57) );
  INVX1 U708 ( .A(n64), .Y(n63) );
  NOR2X1 U709 ( .A(n158), .B(n154), .Y(n48) );
  NAND2X1 U710 ( .A(n159), .B(n165), .Y(n52) );
  NAND2X1 U711 ( .A(n158), .B(n154), .Y(n49) );
  NOR2X1 U712 ( .A(n146), .B(n148), .Y(n37) );
  NOR2X1 U713 ( .A(n153), .B(n149), .Y(n40) );
  NAND2X1 U714 ( .A(n153), .B(n149), .Y(n41) );
  NAND2X1 U715 ( .A(n146), .B(n148), .Y(n38) );
  INVX1 U716 ( .A(n43), .Y(n42) );
  NOR2X1 U717 ( .A(n145), .B(n141), .Y(n32) );
  OAI21XL U718 ( .A0(n41), .A1(n37), .B0(n38), .Y(n36) );
  NOR2X1 U719 ( .A(n40), .B(n37), .Y(n35) );
  NAND2X1 U720 ( .A(n145), .B(n141), .Y(n33) );
  ADDFX2 U721 ( .A(n142), .B(n240), .CI(n251), .CO(n138), .S(n139) );
  XNOR2X1 U722 ( .A(n425), .B(n389), .Y(n311) );
  XOR2X1 U723 ( .A(n80), .B(n14), .Y(product[10]) );
  NAND2X1 U724 ( .A(n500), .B(n79), .Y(n14) );
  AOI21X1 U725 ( .A0(n85), .A1(n504), .B0(n501), .Y(n80) );
  INVX1 U726 ( .A(n86), .Y(n85) );
  XOR2X1 U727 ( .A(n72), .B(n13), .Y(product[11]) );
  XNOR2X1 U728 ( .A(n69), .B(n12), .Y(product[12]) );
  OAI21XL U729 ( .A0(n72), .A1(n70), .B0(n71), .Y(n69) );
  XNOR2X1 U730 ( .A(n63), .B(n11), .Y(product[13]) );
  NAND2X1 U731 ( .A(n59), .B(n62), .Y(n11) );
  XOR2X1 U732 ( .A(n58), .B(n10), .Y(product[14]) );
  AOI21X1 U733 ( .A0(n63), .A1(n59), .B0(n60), .Y(n58) );
  XOR2X1 U734 ( .A(n53), .B(n9), .Y(product[15]) );
  XNOR2X1 U735 ( .A(n50), .B(n8), .Y(product[16]) );
  XOR2X1 U736 ( .A(n42), .B(n7), .Y(product[17]) );
  XNOR2X1 U737 ( .A(n39), .B(n6), .Y(product[18]) );
  XOR2X1 U738 ( .A(n34), .B(n5), .Y(product[19]) );
endmodule


module multiply_WIDTH12_1_DW_mult_tc_9 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n1, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n26, n28, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n77, n79, n80, n85, n86, n87, n88, n89, n90, n92, n93, n95, n96,
         n97, n98, n103, n104, n105, n106, n111, n112, n113, n115, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n419, n420, n421,
         n422, n423, n424, n425, n426, n427, n428, n429, n430, n442, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505;
  assign n1 = b[0];
  assign n389 = b[11];
  assign n390 = b[10];
  assign n391 = b[9];
  assign n392 = b[8];
  assign n393 = b[7];
  assign n394 = b[6];
  assign n395 = b[5];
  assign n396 = b[4];
  assign n397 = b[3];
  assign n398 = b[2];
  assign n399 = b[1];
  assign n425 = a[11];
  assign n426 = a[9];
  assign n427 = a[7];
  assign n428 = a[5];
  assign n429 = a[3];
  assign n430 = a[1];

  NAND2X4 U406 ( .A(n416), .B(n404), .Y(n410) );
  XNOR2X4 U408 ( .A(n494), .B(a[4]), .Y(n416) );
  BUFX3 U417 ( .A(n429), .Y(n494) );
  OAI22XL U418 ( .A0(n407), .A1(n312), .B0(n413), .B1(n311), .Y(n239) );
  OAI22XL U419 ( .A0(n407), .A1(n313), .B0(n413), .B1(n312), .Y(n240) );
  OAI22XL U420 ( .A0(n407), .A1(n314), .B0(n413), .B1(n313), .Y(n241) );
  OAI22XL U421 ( .A0(n407), .A1(n316), .B0(n413), .B1(n315), .Y(n243) );
  OAI22XL U422 ( .A0(n407), .A1(n315), .B0(n413), .B1(n314), .Y(n242) );
  OAI22XL U423 ( .A0(n407), .A1(n320), .B0(n413), .B1(n319), .Y(n247) );
  OAI22XL U424 ( .A0(n407), .A1(n321), .B0(n413), .B1(n320), .Y(n248) );
  OAI22XL U425 ( .A0(n407), .A1(n317), .B0(n413), .B1(n316), .Y(n244) );
  OAI22XL U426 ( .A0(n407), .A1(n318), .B0(n413), .B1(n317), .Y(n245) );
  NOR2BXL U427 ( .AN(n1), .B(n413), .Y(n250) );
  OAI22XL U428 ( .A0(n407), .A1(n322), .B0(n413), .B1(n321), .Y(n249) );
  OAI22X2 U429 ( .A0(n411), .A1(n364), .B0(n363), .B1(n417), .Y(n176) );
  OAI22XL U430 ( .A0(n411), .A1(n367), .B0(n366), .B1(n417), .Y(n290) );
  OAI22XL U431 ( .A0(n411), .A1(n366), .B0(n365), .B1(n417), .Y(n289) );
  AOI21XL U432 ( .A0(n417), .A1(n411), .B0(n363), .Y(n495) );
  OAI22XL U433 ( .A0(n411), .A1(n370), .B0(n369), .B1(n417), .Y(n293) );
  XNOR2X4 U434 ( .A(n430), .B(a[2]), .Y(n417) );
  XOR2X1 U435 ( .A(n428), .B(a[4]), .Y(n404) );
  NOR2X1 U436 ( .A(n172), .B(n179), .Y(n61) );
  CMPR42X1 U437 ( .A(n163), .B(n167), .C(n161), .D(n168), .ICI(n164), .S(n159), 
        .ICO(n157), .CO(n158) );
  NOR2X1 U438 ( .A(n159), .B(n165), .Y(n51) );
  INVX1 U439 ( .A(n495), .Y(n287) );
  OAI22XL U440 ( .A0(n410), .A1(n352), .B0(n351), .B1(n416), .Y(n276) );
  NAND2X1 U441 ( .A(n500), .B(n504), .Y(n74) );
  AOI21XL U442 ( .A0(n415), .A1(n409), .B0(n337), .Y(n496) );
  INVX1 U443 ( .A(n496), .Y(n263) );
  AOI21X1 U444 ( .A0(n416), .A1(n410), .B0(n350), .Y(n497) );
  INVX1 U445 ( .A(n497), .Y(n275) );
  OAI21XL U446 ( .A0(n56), .A1(n62), .B0(n57), .Y(n55) );
  AOI21X1 U447 ( .A0(n55), .A1(n46), .B0(n47), .Y(n45) );
  AOI21XL U448 ( .A0(n442), .A1(n412), .B0(n376), .Y(n498) );
  INVX1 U449 ( .A(n498), .Y(n299) );
  OAI21X2 U450 ( .A0(n34), .A1(n32), .B0(n33), .Y(n31) );
  OAI21XL U451 ( .A0(n53), .A1(n51), .B0(n52), .Y(n50) );
  AND2X2 U452 ( .A(n140), .B(n139), .Y(n28) );
  AOI21X1 U453 ( .A0(n63), .A1(n59), .B0(n60), .Y(n58) );
  INVX1 U454 ( .A(n64), .Y(n63) );
  NAND2BX1 U455 ( .AN(n40), .B(n41), .Y(n7) );
  NAND2X1 U456 ( .A(n406), .B(n442), .Y(n412) );
  AOI21X1 U457 ( .A0(n414), .A1(n408), .B0(n324), .Y(n499) );
  INVX1 U458 ( .A(n499), .Y(n251) );
  NAND2BX1 U459 ( .AN(n48), .B(n49), .Y(n8) );
  NAND2BX1 U460 ( .AN(n32), .B(n33), .Y(n5) );
  AOI22X1 U461 ( .A0(n502), .A1(n111), .B0(n227), .B1(n237), .Y(n106) );
  NAND2BX1 U462 ( .AN(n70), .B(n71), .Y(n13) );
  NAND2BX1 U463 ( .AN(n56), .B(n57), .Y(n10) );
  OAI21XL U464 ( .A0(n42), .A1(n40), .B0(n41), .Y(n39) );
  XOR3X2 U465 ( .A(n31), .B(n140), .C(n139), .Y(product[20]) );
  AOI22X1 U466 ( .A0(n503), .A1(n103), .B0(n221), .B1(n224), .Y(n98) );
  NAND2BX1 U467 ( .AN(n67), .B(n68), .Y(n12) );
  NAND2BX1 U468 ( .AN(n51), .B(n52), .Y(n9) );
  NAND2BX1 U469 ( .AN(n37), .B(n38), .Y(n6) );
  XOR3X2 U470 ( .A(n26), .B(n239), .C(n138), .Y(product[21]) );
  OR2X2 U471 ( .A(n196), .B(n201), .Y(n500) );
  AND2X2 U472 ( .A(n202), .B(n208), .Y(n501) );
  OR2X2 U473 ( .A(n227), .B(n237), .Y(n502) );
  OR2X2 U474 ( .A(n221), .B(n224), .Y(n503) );
  OR2X2 U475 ( .A(n202), .B(n208), .Y(n504) );
  OR2X2 U476 ( .A(n140), .B(n139), .Y(n505) );
  NOR2X1 U477 ( .A(n51), .B(n48), .Y(n46) );
  NOR2X1 U478 ( .A(n56), .B(n61), .Y(n54) );
  OAI21X4 U479 ( .A0(n44), .A1(n64), .B0(n45), .Y(n43) );
  CMPR42X2 U480 ( .A(n267), .B(n247), .C(n178), .D(n182), .ICI(n175), .S(n172), 
        .ICO(n170), .CO(n171) );
  AOI21X4 U481 ( .A0(n65), .A1(n73), .B0(n66), .Y(n64) );
  NOR2X2 U482 ( .A(n180), .B(n187), .Y(n67) );
  INVXL U483 ( .A(n43), .Y(n42) );
  AOI21X1 U484 ( .A0(n63), .A1(n54), .B0(n55), .Y(n53) );
  CMPR42X2 U485 ( .A(n276), .B(n266), .C(n170), .D(n174), .ICI(n169), .S(n166), 
        .ICO(n164), .CO(n165) );
  NAND2X2 U486 ( .A(n172), .B(n179), .Y(n62) );
  NOR2X2 U487 ( .A(n166), .B(n171), .Y(n56) );
  OAI21X2 U488 ( .A0(n86), .A1(n74), .B0(n75), .Y(n73) );
  AOI21X4 U489 ( .A0(n43), .A1(n35), .B0(n36), .Y(n34) );
  XNOR2X4 U490 ( .A(n427), .B(a[8]), .Y(n414) );
  INVX1 U491 ( .A(n428), .Y(n422) );
  OAI22X1 U492 ( .A0(n411), .A1(n423), .B0(n417), .B1(n375), .Y(n237) );
  INVX1 U493 ( .A(n494), .Y(n423) );
  NAND2BX1 U494 ( .AN(n1), .B(n494), .Y(n375) );
  NOR2BX1 U495 ( .AN(n1), .B(n417), .Y(n298) );
  OAI22X1 U496 ( .A0(n412), .A1(n386), .B0(n385), .B1(n442), .Y(n309) );
  NAND2BX1 U497 ( .AN(n1), .B(n430), .Y(n388) );
  INVX1 U498 ( .A(n430), .Y(n424) );
  XNOR2X1 U499 ( .A(n430), .B(n399), .Y(n386) );
  XNOR2X1 U500 ( .A(n430), .B(n396), .Y(n383) );
  XNOR2X1 U501 ( .A(n430), .B(n398), .Y(n385) );
  XNOR2X1 U502 ( .A(n494), .B(n399), .Y(n373) );
  XNOR2X1 U503 ( .A(n430), .B(n397), .Y(n384) );
  XNOR2X1 U504 ( .A(n494), .B(n389), .Y(n363) );
  XNOR2X1 U505 ( .A(n430), .B(n395), .Y(n382) );
  OAI22X1 U506 ( .A0(n411), .A1(n371), .B0(n370), .B1(n417), .Y(n294) );
  XNOR2X1 U507 ( .A(n494), .B(n397), .Y(n371) );
  XNOR2X1 U508 ( .A(n494), .B(n398), .Y(n372) );
  XNOR2X1 U509 ( .A(n428), .B(n399), .Y(n360) );
  ADDHXL U510 ( .A(n306), .B(n236), .CO(n222), .S(n223) );
  OAI22X1 U511 ( .A0(n412), .A1(n383), .B0(n382), .B1(n442), .Y(n306) );
  OAI22X1 U512 ( .A0(n410), .A1(n422), .B0(n416), .B1(n362), .Y(n236) );
  NAND2BX1 U513 ( .AN(n1), .B(n428), .Y(n362) );
  NOR2X1 U514 ( .A(n309), .B(n298), .Y(n112) );
  NAND2X1 U515 ( .A(n309), .B(n298), .Y(n113) );
  NAND2X1 U516 ( .A(n310), .B(n238), .Y(n115) );
  OAI22X1 U517 ( .A0(n412), .A1(n387), .B0(n386), .B1(n442), .Y(n310) );
  OAI22X1 U518 ( .A0(n412), .A1(n424), .B0(n388), .B1(n442), .Y(n238) );
  XNOR2X1 U519 ( .A(n430), .B(n1), .Y(n387) );
  ADDFX2 U520 ( .A(n286), .B(n307), .CI(n296), .CO(n224), .S(n225) );
  OAI22X1 U521 ( .A0(n412), .A1(n384), .B0(n383), .B1(n442), .Y(n307) );
  NOR2BX1 U522 ( .AN(n1), .B(n416), .Y(n286) );
  OAI22X1 U523 ( .A0(n411), .A1(n373), .B0(n372), .B1(n417), .Y(n296) );
  ADDHXL U524 ( .A(n308), .B(n297), .CO(n226), .S(n227) );
  OAI22X1 U525 ( .A0(n412), .A1(n385), .B0(n384), .B1(n442), .Y(n308) );
  OAI22X1 U526 ( .A0(n411), .A1(n374), .B0(n373), .B1(n417), .Y(n297) );
  XNOR2X1 U527 ( .A(n494), .B(n1), .Y(n374) );
  NAND2BX1 U528 ( .AN(n1), .B(n427), .Y(n349) );
  XNOR2X1 U529 ( .A(n430), .B(n394), .Y(n381) );
  XNOR2X1 U530 ( .A(n427), .B(n1), .Y(n348) );
  XNOR2X1 U531 ( .A(n494), .B(n396), .Y(n370) );
  XNOR2X1 U532 ( .A(n428), .B(n398), .Y(n359) );
  NAND2BX1 U533 ( .AN(n1), .B(n426), .Y(n336) );
  XNOR2X1 U534 ( .A(n426), .B(n1), .Y(n335) );
  XNOR2X1 U535 ( .A(n427), .B(n398), .Y(n346) );
  XNOR2X1 U536 ( .A(n430), .B(n392), .Y(n379) );
  XNOR2X1 U537 ( .A(n430), .B(n393), .Y(n380) );
  XNOR2X1 U538 ( .A(n427), .B(n399), .Y(n347) );
  XNOR2X1 U539 ( .A(n426), .B(n399), .Y(n334) );
  XNOR2X1 U540 ( .A(n427), .B(n397), .Y(n345) );
  XNOR2X1 U541 ( .A(n426), .B(n396), .Y(n331) );
  XNOR2X1 U542 ( .A(n427), .B(n396), .Y(n344) );
  XNOR2X1 U543 ( .A(n425), .B(n1), .Y(n322) );
  XNOR2X1 U544 ( .A(n430), .B(n389), .Y(n376) );
  NAND2BX1 U545 ( .AN(n1), .B(n425), .Y(n323) );
  XNOR2X1 U546 ( .A(n494), .B(n390), .Y(n364) );
  XNOR2X1 U547 ( .A(n427), .B(n395), .Y(n343) );
  XNOR2X1 U548 ( .A(n494), .B(n391), .Y(n365) );
  XNOR2X1 U549 ( .A(n428), .B(n392), .Y(n353) );
  OAI22X1 U550 ( .A0(n408), .A1(n331), .B0(n330), .B1(n414), .Y(n257) );
  XNOR2X1 U551 ( .A(n426), .B(n395), .Y(n330) );
  XNOR2X1 U552 ( .A(n425), .B(n396), .Y(n318) );
  XNOR2X1 U553 ( .A(n426), .B(n394), .Y(n329) );
  XNOR2X1 U554 ( .A(n428), .B(n389), .Y(n350) );
  XNOR2X1 U555 ( .A(n425), .B(n395), .Y(n317) );
  XNOR2X1 U556 ( .A(n427), .B(n389), .Y(n337) );
  CMPR42X1 U557 ( .A(n274), .B(n305), .C(n294), .D(n284), .ICI(n222), .S(n219), 
        .ICO(n217), .CO(n218) );
  OAI22X1 U558 ( .A0(n412), .A1(n382), .B0(n381), .B1(n442), .Y(n305) );
  NOR2BX1 U559 ( .AN(n1), .B(n415), .Y(n274) );
  OAI22X1 U560 ( .A0(n410), .A1(n360), .B0(n359), .B1(n416), .Y(n284) );
  ADDFX2 U561 ( .A(n295), .B(n285), .CI(n223), .CO(n220), .S(n221) );
  OAI22X1 U562 ( .A0(n410), .A1(n361), .B0(n360), .B1(n416), .Y(n285) );
  OAI22X1 U563 ( .A0(n411), .A1(n372), .B0(n371), .B1(n417), .Y(n295) );
  XNOR2X1 U564 ( .A(n428), .B(n1), .Y(n361) );
  OAI21XL U565 ( .A0(n112), .A1(n115), .B0(n113), .Y(n111) );
  NOR2X1 U566 ( .A(n225), .B(n226), .Y(n104) );
  NAND2X1 U567 ( .A(n225), .B(n226), .Y(n105) );
  XNOR2X1 U568 ( .A(n428), .B(n396), .Y(n357) );
  XNOR2X1 U569 ( .A(n494), .B(n395), .Y(n369) );
  XNOR2X1 U570 ( .A(n428), .B(n397), .Y(n358) );
  ADDHXL U571 ( .A(n304), .B(n235), .CO(n215), .S(n216) );
  OAI22X1 U572 ( .A0(n412), .A1(n381), .B0(n380), .B1(n442), .Y(n304) );
  OAI22X1 U573 ( .A0(n409), .A1(n421), .B0(n415), .B1(n349), .Y(n235) );
  INVX1 U574 ( .A(n427), .Y(n421) );
  CMPR42X1 U575 ( .A(n293), .B(n273), .C(n283), .D(n216), .ICI(n217), .S(n214), 
        .ICO(n212), .CO(n213) );
  OAI22X1 U576 ( .A0(n410), .A1(n359), .B0(n358), .B1(n416), .Y(n283) );
  OAI22X1 U577 ( .A0(n409), .A1(n348), .B0(n347), .B1(n415), .Y(n273) );
  ADDHXL U578 ( .A(n302), .B(n234), .CO(n205), .S(n206) );
  OAI22X1 U579 ( .A0(n412), .A1(n379), .B0(n378), .B1(n442), .Y(n302) );
  OAI22X1 U580 ( .A0(n408), .A1(n420), .B0(n414), .B1(n336), .Y(n234) );
  INVX1 U581 ( .A(n426), .Y(n420) );
  ADDFX2 U582 ( .A(n271), .B(n261), .CI(n281), .CO(n203), .S(n204) );
  OAI22X1 U583 ( .A0(n410), .A1(n357), .B0(n356), .B1(n416), .Y(n281) );
  OAI22X1 U584 ( .A0(n408), .A1(n335), .B0(n334), .B1(n414), .Y(n261) );
  OAI22X1 U585 ( .A0(n409), .A1(n346), .B0(n345), .B1(n415), .Y(n271) );
  XNOR2X1 U586 ( .A(n494), .B(n394), .Y(n368) );
  ADDFX2 U587 ( .A(n262), .B(n303), .CI(n272), .CO(n210), .S(n211) );
  OAI22X1 U588 ( .A0(n412), .A1(n380), .B0(n379), .B1(n442), .Y(n303) );
  NOR2BX1 U589 ( .AN(n1), .B(n414), .Y(n262) );
  OAI22X1 U590 ( .A0(n409), .A1(n347), .B0(n346), .B1(n415), .Y(n272) );
  XNOR2X1 U591 ( .A(n428), .B(n395), .Y(n356) );
  XNOR2X1 U592 ( .A(n494), .B(n393), .Y(n367) );
  XNOR2X1 U593 ( .A(n430), .B(n390), .Y(n377) );
  XNOR2X1 U594 ( .A(n430), .B(n391), .Y(n378) );
  XOR2X1 U595 ( .A(n430), .B(a[0]), .Y(n406) );
  CLKINVX3 U596 ( .A(a[0]), .Y(n442) );
  XNOR2X1 U597 ( .A(n494), .B(n392), .Y(n366) );
  NAND2X2 U598 ( .A(n417), .B(n405), .Y(n411) );
  XOR2X1 U599 ( .A(n494), .B(a[2]), .Y(n405) );
  XNOR2X1 U600 ( .A(n426), .B(n398), .Y(n333) );
  XNOR2X1 U601 ( .A(n428), .B(n394), .Y(n355) );
  XNOR2X1 U602 ( .A(n426), .B(n397), .Y(n332) );
  XNOR2X1 U603 ( .A(n428), .B(n393), .Y(n354) );
  CMPR42X1 U604 ( .A(n250), .B(n260), .C(n270), .D(n205), .ICI(n203), .S(n199), 
        .ICO(n197), .CO(n198) );
  OAI22X1 U605 ( .A0(n409), .A1(n345), .B0(n344), .B1(n415), .Y(n270) );
  OAI22X1 U606 ( .A0(n408), .A1(n334), .B0(n333), .B1(n414), .Y(n260) );
  OAI22X1 U607 ( .A0(n408), .A1(n332), .B0(n331), .B1(n414), .Y(n258) );
  OAI22X1 U608 ( .A0(n410), .A1(n354), .B0(n353), .B1(n416), .Y(n278) );
  XNOR2X1 U609 ( .A(n425), .B(n399), .Y(n321) );
  CMPR42X1 U610 ( .A(n269), .B(n249), .C(n289), .D(n194), .ICI(n197), .S(n191), 
        .ICO(n189), .CO(n190) );
  OAI22X1 U611 ( .A0(n409), .A1(n344), .B0(n343), .B1(n415), .Y(n269) );
  ADDHXL U612 ( .A(n300), .B(n233), .CO(n192), .S(n193) );
  OAI22X1 U613 ( .A0(n412), .A1(n377), .B0(n376), .B1(n442), .Y(n300) );
  OAI22X1 U614 ( .A0(n407), .A1(n419), .B0(n413), .B1(n323), .Y(n233) );
  INVX1 U615 ( .A(n425), .Y(n419) );
  XNOR2X1 U616 ( .A(n427), .B(n394), .Y(n342) );
  XNOR2X1 U617 ( .A(n425), .B(n398), .Y(n320) );
  CMPR42X1 U618 ( .A(n268), .B(n288), .C(n299), .D(n189), .ICI(n186), .S(n183), 
        .ICO(n181), .CO(n182) );
  OAI22X1 U619 ( .A0(n411), .A1(n365), .B0(n364), .B1(n417), .Y(n288) );
  OAI22X1 U620 ( .A0(n409), .A1(n343), .B0(n342), .B1(n415), .Y(n268) );
  XNOR2X1 U621 ( .A(n425), .B(n397), .Y(n319) );
  XNOR2X1 U622 ( .A(n428), .B(n391), .Y(n352) );
  XNOR2X1 U623 ( .A(n427), .B(n393), .Y(n341) );
  CMPR42X1 U624 ( .A(n257), .B(n277), .C(n177), .D(n184), .ICI(n181), .S(n175), 
        .ICO(n173), .CO(n174) );
  OR2X2 U625 ( .A(n278), .B(n258), .Y(n184) );
  INVX1 U626 ( .A(n176), .Y(n177) );
  OAI22X1 U627 ( .A0(n410), .A1(n353), .B0(n352), .B1(n416), .Y(n277) );
  XNOR2X1 U628 ( .A(n427), .B(n392), .Y(n340) );
  XNOR2X1 U629 ( .A(n428), .B(n390), .Y(n351) );
  CMPR42X1 U630 ( .A(n246), .B(n176), .C(n256), .D(n287), .ICI(n173), .S(n169), 
        .ICO(n167), .CO(n168) );
  OAI22X1 U631 ( .A0(n408), .A1(n330), .B0(n329), .B1(n414), .Y(n256) );
  OAI22X1 U632 ( .A0(n407), .A1(n319), .B0(n413), .B1(n318), .Y(n246) );
  OAI22X1 U633 ( .A0(n410), .A1(n351), .B0(n350), .B1(n416), .Y(n162) );
  XNOR2X1 U634 ( .A(n426), .B(n393), .Y(n328) );
  XNOR2X1 U635 ( .A(n427), .B(n391), .Y(n339) );
  XNOR2X1 U636 ( .A(n427), .B(n390), .Y(n338) );
  ADDFX2 U637 ( .A(n245), .B(n255), .CI(n265), .CO(n160), .S(n161) );
  OAI22X1 U638 ( .A0(n409), .A1(n340), .B0(n339), .B1(n415), .Y(n265) );
  OAI22X1 U639 ( .A0(n408), .A1(n329), .B0(n328), .B1(n414), .Y(n255) );
  XNOR2X1 U640 ( .A(n426), .B(n392), .Y(n327) );
  XNOR2X1 U641 ( .A(n425), .B(n394), .Y(n316) );
  ADDFX2 U642 ( .A(n244), .B(n162), .CI(n275), .CO(n155), .S(n156) );
  OAI21XL U643 ( .A0(n52), .A1(n48), .B0(n49), .Y(n47) );
  XNOR2X2 U644 ( .A(n428), .B(a[6]), .Y(n415) );
  NAND2X2 U645 ( .A(n415), .B(n403), .Y(n409) );
  XOR2X1 U646 ( .A(n427), .B(a[6]), .Y(n403) );
  XNOR2X1 U647 ( .A(n426), .B(n391), .Y(n326) );
  XNOR2X1 U648 ( .A(n425), .B(n393), .Y(n315) );
  OAI22X1 U649 ( .A0(n409), .A1(n338), .B0(n337), .B1(n415), .Y(n150) );
  XNOR2X1 U650 ( .A(n426), .B(n390), .Y(n325) );
  XNOR2X1 U651 ( .A(n425), .B(n392), .Y(n314) );
  NAND2X1 U652 ( .A(n209), .B(n213), .Y(n90) );
  NAND2X1 U653 ( .A(n214), .B(n218), .Y(n93) );
  NOR2X1 U654 ( .A(n209), .B(n213), .Y(n89) );
  NOR2X1 U655 ( .A(n214), .B(n218), .Y(n92) );
  NOR2X1 U656 ( .A(n219), .B(n220), .Y(n96) );
  NAND2X1 U657 ( .A(n219), .B(n220), .Y(n97) );
  OAI21XL U658 ( .A0(n106), .A1(n104), .B0(n105), .Y(n103) );
  CMPR42X1 U659 ( .A(n292), .B(n282), .C(n215), .D(n212), .ICI(n211), .S(n209), 
        .ICO(n207), .CO(n208) );
  OAI22X1 U660 ( .A0(n410), .A1(n358), .B0(n357), .B1(n416), .Y(n282) );
  OAI22X1 U661 ( .A0(n411), .A1(n369), .B0(n368), .B1(n417), .Y(n292) );
  CMPR42X1 U662 ( .A(n291), .B(n206), .C(n210), .D(n204), .ICI(n207), .S(n202), 
        .ICO(n200), .CO(n201) );
  OAI22X1 U663 ( .A0(n411), .A1(n368), .B0(n367), .B1(n417), .Y(n291) );
  CMPR42X1 U664 ( .A(n301), .B(n280), .C(n290), .D(n200), .ICI(n199), .S(n196), 
        .ICO(n194), .CO(n195) );
  OAI22X1 U665 ( .A0(n412), .A1(n378), .B0(n377), .B1(n442), .Y(n301) );
  OAI22X1 U666 ( .A0(n410), .A1(n356), .B0(n355), .B1(n416), .Y(n280) );
  CMPR42X1 U667 ( .A(n279), .B(n259), .C(n193), .D(n198), .ICI(n191), .S(n188), 
        .ICO(n186), .CO(n187) );
  OAI22X1 U668 ( .A0(n410), .A1(n355), .B0(n354), .B1(n416), .Y(n279) );
  OAI22X1 U669 ( .A0(n408), .A1(n333), .B0(n332), .B1(n414), .Y(n259) );
  AOI21X1 U670 ( .A0(n500), .A1(n501), .B0(n77), .Y(n75) );
  INVX1 U671 ( .A(n79), .Y(n77) );
  CMPR42X1 U672 ( .A(n248), .B(n192), .C(n185), .D(n190), .ICI(n183), .S(n180), 
        .ICO(n178), .CO(n179) );
  XNOR2X1 U673 ( .A(n278), .B(n258), .Y(n185) );
  OAI22X1 U674 ( .A0(n409), .A1(n342), .B0(n341), .B1(n415), .Y(n267) );
  NOR2X1 U675 ( .A(n67), .B(n70), .Y(n65) );
  OAI21XL U676 ( .A0(n67), .A1(n71), .B0(n68), .Y(n66) );
  OAI22X1 U677 ( .A0(n409), .A1(n341), .B0(n340), .B1(n415), .Y(n266) );
  INVX1 U678 ( .A(n162), .Y(n163) );
  CMPR42X1 U679 ( .A(n264), .B(n254), .C(n160), .D(n156), .ICI(n157), .S(n154), 
        .ICO(n152), .CO(n153) );
  OAI22X1 U680 ( .A0(n408), .A1(n328), .B0(n327), .B1(n414), .Y(n254) );
  OAI22X1 U681 ( .A0(n409), .A1(n339), .B0(n338), .B1(n415), .Y(n264) );
  CMPR42X1 U682 ( .A(n253), .B(n243), .C(n151), .D(n155), .ICI(n152), .S(n149), 
        .ICO(n147), .CO(n148) );
  INVX1 U683 ( .A(n150), .Y(n151) );
  OAI22X1 U684 ( .A0(n408), .A1(n327), .B0(n326), .B1(n414), .Y(n253) );
  NAND2X1 U685 ( .A(n54), .B(n46), .Y(n44) );
  CMPR42X1 U686 ( .A(n150), .B(n242), .C(n252), .D(n263), .ICI(n147), .S(n146), 
        .ICO(n144), .CO(n145) );
  OAI22X1 U687 ( .A0(n408), .A1(n326), .B0(n325), .B1(n414), .Y(n252) );
  XNOR2X1 U688 ( .A(n426), .B(n389), .Y(n324) );
  OAI22X1 U689 ( .A0(n408), .A1(n325), .B0(n324), .B1(n414), .Y(n142) );
  XNOR2X1 U690 ( .A(n425), .B(n391), .Y(n313) );
  NAND2X2 U691 ( .A(n414), .B(n402), .Y(n408) );
  XOR2X1 U692 ( .A(n426), .B(a[8]), .Y(n402) );
  XNOR2X2 U693 ( .A(n426), .B(a[10]), .Y(n413) );
  NAND2X2 U694 ( .A(n413), .B(n401), .Y(n407) );
  XOR2X1 U695 ( .A(n425), .B(a[10]), .Y(n401) );
  XNOR2X1 U696 ( .A(n425), .B(n390), .Y(n312) );
  ADDFX2 U697 ( .A(n241), .B(n143), .CI(n144), .CO(n140), .S(n141) );
  INVX1 U698 ( .A(n142), .Y(n143) );
  NAND2X1 U699 ( .A(n196), .B(n201), .Y(n79) );
  AOI21X1 U700 ( .A0(n87), .A1(n95), .B0(n88), .Y(n86) );
  OAI21XL U701 ( .A0(n98), .A1(n96), .B0(n97), .Y(n95) );
  NOR2X1 U702 ( .A(n89), .B(n92), .Y(n87) );
  OAI21XL U703 ( .A0(n89), .A1(n93), .B0(n90), .Y(n88) );
  NOR2X1 U704 ( .A(n188), .B(n195), .Y(n70) );
  NAND2X1 U705 ( .A(n188), .B(n195), .Y(n71) );
  NAND2X1 U706 ( .A(n180), .B(n187), .Y(n68) );
  INVX1 U707 ( .A(n73), .Y(n72) );
  INVX1 U708 ( .A(n61), .Y(n59) );
  INVX1 U709 ( .A(n62), .Y(n60) );
  NAND2X1 U710 ( .A(n166), .B(n171), .Y(n57) );
  NOR2X1 U711 ( .A(n158), .B(n154), .Y(n48) );
  NAND2X1 U712 ( .A(n159), .B(n165), .Y(n52) );
  NAND2X1 U713 ( .A(n158), .B(n154), .Y(n49) );
  NOR2X1 U714 ( .A(n146), .B(n148), .Y(n37) );
  NOR2X1 U715 ( .A(n153), .B(n149), .Y(n40) );
  NAND2X1 U716 ( .A(n153), .B(n149), .Y(n41) );
  NAND2X1 U717 ( .A(n146), .B(n148), .Y(n38) );
  NOR2X1 U718 ( .A(n145), .B(n141), .Y(n32) );
  OAI21XL U719 ( .A0(n41), .A1(n37), .B0(n38), .Y(n36) );
  NOR2X1 U720 ( .A(n40), .B(n37), .Y(n35) );
  NAND2X1 U721 ( .A(n145), .B(n141), .Y(n33) );
  ADDFX2 U722 ( .A(n142), .B(n240), .CI(n251), .CO(n138), .S(n139) );
  XNOR2X1 U723 ( .A(n425), .B(n389), .Y(n311) );
  XOR2X1 U724 ( .A(n80), .B(n14), .Y(product[10]) );
  NAND2X1 U725 ( .A(n500), .B(n79), .Y(n14) );
  AOI21X1 U726 ( .A0(n85), .A1(n504), .B0(n501), .Y(n80) );
  INVX1 U727 ( .A(n86), .Y(n85) );
  XOR2X1 U728 ( .A(n72), .B(n13), .Y(product[11]) );
  XNOR2X1 U729 ( .A(n69), .B(n12), .Y(product[12]) );
  OAI21XL U730 ( .A0(n72), .A1(n70), .B0(n71), .Y(n69) );
  XNOR2X1 U731 ( .A(n63), .B(n11), .Y(product[13]) );
  NAND2X1 U732 ( .A(n59), .B(n62), .Y(n11) );
  XOR2X1 U733 ( .A(n58), .B(n10), .Y(product[14]) );
  XOR2X1 U734 ( .A(n53), .B(n9), .Y(product[15]) );
  XNOR2X1 U735 ( .A(n50), .B(n8), .Y(product[16]) );
  XOR2X1 U736 ( .A(n42), .B(n7), .Y(product[17]) );
  XNOR2X1 U737 ( .A(n39), .B(n6), .Y(product[18]) );
  XOR2X1 U738 ( .A(n34), .B(n5), .Y(product[19]) );
  AOI21X1 U739 ( .A0(n31), .A1(n505), .B0(n28), .Y(n26) );
endmodule


module multiply_WIDTH12_1_DW_mult_tc_11 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n26, n28,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n77, n79, n80, n85, n86, n87, n88, n89, n90, n92, n93, n95,
         n96, n97, n98, n103, n104, n106, n111, n112, n113, n115, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n442,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508;
  assign n1 = b[0];
  assign n389 = b[11];
  assign n390 = b[10];
  assign n391 = b[9];
  assign n392 = b[8];
  assign n393 = b[7];
  assign n394 = b[6];
  assign n395 = b[5];
  assign n396 = b[4];
  assign n397 = b[3];
  assign n398 = b[2];
  assign n399 = b[1];
  assign n425 = a[11];
  assign n426 = a[9];
  assign n427 = a[7];
  assign n428 = a[5];
  assign n429 = a[3];
  assign n430 = a[1];

  BUFX3 U417 ( .A(n426), .Y(n494) );
  BUFX3 U418 ( .A(n425), .Y(n495) );
  BUFX3 U419 ( .A(n429), .Y(n496) );
  BUFX3 U420 ( .A(n429), .Y(n497) );
  XNOR2X2 U421 ( .A(n496), .B(a[4]), .Y(n416) );
  NAND2X2 U422 ( .A(n416), .B(n404), .Y(n410) );
  XOR2X1 U423 ( .A(n428), .B(a[4]), .Y(n404) );
  CMPR42X1 U424 ( .A(n163), .B(n167), .C(n161), .D(n168), .ICI(n164), .S(n159), 
        .ICO(n157), .CO(n158) );
  NOR2X1 U425 ( .A(n159), .B(n165), .Y(n51) );
  CMPR42X1 U426 ( .A(n248), .B(n192), .C(n185), .D(n190), .ICI(n183), .S(n180), 
        .ICO(n178), .CO(n179) );
  CMPR42X1 U427 ( .A(n276), .B(n266), .C(n170), .D(n174), .ICI(n169), .S(n166), 
        .ICO(n164), .CO(n165) );
  NOR2X2 U428 ( .A(n180), .B(n187), .Y(n67) );
  NOR2X1 U429 ( .A(n166), .B(n171), .Y(n56) );
  XNOR2X1 U430 ( .A(n50), .B(n8), .Y(product[16]) );
  OAI21XL U431 ( .A0(n42), .A1(n40), .B0(n41), .Y(n39) );
  OAI22XL U432 ( .A0(n408), .A1(n329), .B0(n328), .B1(n414), .Y(n255) );
  OAI22XL U433 ( .A0(n408), .A1(n333), .B0(n332), .B1(n414), .Y(n259) );
  OAI22XL U434 ( .A0(n408), .A1(n328), .B0(n327), .B1(n414), .Y(n254) );
  OAI22XL U435 ( .A0(n408), .A1(n327), .B0(n326), .B1(n414), .Y(n253) );
  AOI21X1 U436 ( .A0(n417), .A1(n411), .B0(n363), .Y(n498) );
  INVX1 U437 ( .A(n498), .Y(n287) );
  NAND2X1 U438 ( .A(n503), .B(n505), .Y(n74) );
  AOI21X1 U439 ( .A0(n416), .A1(n410), .B0(n350), .Y(n499) );
  INVX1 U440 ( .A(n499), .Y(n275) );
  NAND2BX1 U441 ( .AN(n61), .B(n62), .Y(n11) );
  AOI21X1 U442 ( .A0(n415), .A1(n409), .B0(n337), .Y(n500) );
  INVX1 U443 ( .A(n500), .Y(n263) );
  OAI21XL U444 ( .A0(n64), .A1(n61), .B0(n62), .Y(n501) );
  INVX1 U445 ( .A(n501), .Y(n58) );
  AOI22X1 U446 ( .A0(n504), .A1(n111), .B0(n227), .B1(n237), .Y(n106) );
  NAND2X1 U447 ( .A(n414), .B(n402), .Y(n408) );
  INVX1 U448 ( .A(n64), .Y(n63) );
  NAND2X1 U449 ( .A(n406), .B(n442), .Y(n412) );
  NAND2BX1 U450 ( .AN(n56), .B(n57), .Y(n10) );
  NAND2BX1 U451 ( .AN(n40), .B(n41), .Y(n7) );
  OAI2BB2X1 U452 ( .B0(n106), .B1(n104), .A0N(n225), .A1N(n226), .Y(n103) );
  AOI21X1 U453 ( .A0(n414), .A1(n408), .B0(n324), .Y(n502) );
  INVX1 U454 ( .A(n502), .Y(n251) );
  NAND2BX1 U455 ( .AN(n70), .B(n71), .Y(n13) );
  NAND2BX1 U456 ( .AN(n48), .B(n49), .Y(n8) );
  NAND2BX1 U457 ( .AN(n32), .B(n33), .Y(n5) );
  AOI22X1 U458 ( .A0(n506), .A1(n103), .B0(n221), .B1(n224), .Y(n98) );
  NAND2BX1 U459 ( .AN(n67), .B(n68), .Y(n12) );
  NAND2BX1 U460 ( .AN(n51), .B(n52), .Y(n9) );
  NAND2BX1 U461 ( .AN(n37), .B(n38), .Y(n6) );
  XOR2X1 U462 ( .A(n138), .B(n239), .Y(n3) );
  OR2X2 U463 ( .A(n196), .B(n201), .Y(n503) );
  OR2X2 U464 ( .A(n227), .B(n237), .Y(n504) );
  OR2X2 U465 ( .A(n202), .B(n208), .Y(n505) );
  OR2X2 U466 ( .A(n221), .B(n224), .Y(n506) );
  AND2X2 U467 ( .A(n202), .B(n208), .Y(n507) );
  OR2X2 U468 ( .A(n140), .B(n139), .Y(n508) );
  OAI21X2 U469 ( .A0(n56), .A1(n62), .B0(n57), .Y(n55) );
  CMPR42X2 U470 ( .A(n267), .B(n247), .C(n178), .D(n182), .ICI(n175), .S(n172), 
        .ICO(n170), .CO(n171) );
  OAI21X4 U471 ( .A0(n44), .A1(n64), .B0(n45), .Y(n43) );
  NAND2X2 U472 ( .A(n54), .B(n46), .Y(n44) );
  AOI21X4 U473 ( .A0(n65), .A1(n73), .B0(n66), .Y(n64) );
  NAND2XL U474 ( .A(n172), .B(n179), .Y(n62) );
  OAI21X4 U475 ( .A0(n67), .A1(n71), .B0(n68), .Y(n66) );
  NAND2XL U476 ( .A(n188), .B(n195), .Y(n71) );
  AOI21X2 U477 ( .A0(n63), .A1(n54), .B0(n55), .Y(n53) );
  AOI21X4 U478 ( .A0(n43), .A1(n35), .B0(n36), .Y(n34) );
  OAI21X2 U479 ( .A0(n86), .A1(n74), .B0(n75), .Y(n73) );
  XNOR2X4 U480 ( .A(n427), .B(a[8]), .Y(n414) );
  INVX4 U481 ( .A(n43), .Y(n42) );
  AOI21X2 U482 ( .A0(n55), .A1(n46), .B0(n47), .Y(n45) );
  XOR2X4 U483 ( .A(n26), .B(n3), .Y(product[21]) );
  AOI21X4 U484 ( .A0(n31), .A1(n508), .B0(n28), .Y(n26) );
  OAI21X4 U485 ( .A0(n34), .A1(n32), .B0(n33), .Y(n31) );
  INVX1 U486 ( .A(n428), .Y(n422) );
  OAI22X1 U487 ( .A0(n411), .A1(n423), .B0(n417), .B1(n375), .Y(n237) );
  INVX1 U488 ( .A(n497), .Y(n423) );
  NAND2BX1 U489 ( .AN(n1), .B(n497), .Y(n375) );
  NOR2BX1 U490 ( .AN(n1), .B(n417), .Y(n298) );
  OAI22X1 U491 ( .A0(n412), .A1(n386), .B0(n385), .B1(n442), .Y(n309) );
  NAND2BX1 U492 ( .AN(n1), .B(n430), .Y(n388) );
  INVX1 U493 ( .A(n430), .Y(n424) );
  XNOR2X1 U494 ( .A(n430), .B(n399), .Y(n386) );
  XNOR2X1 U495 ( .A(n430), .B(n396), .Y(n383) );
  XNOR2X1 U496 ( .A(n430), .B(n398), .Y(n385) );
  XNOR2X1 U497 ( .A(n497), .B(n399), .Y(n373) );
  XNOR2X1 U498 ( .A(n430), .B(n397), .Y(n384) );
  XNOR2X1 U499 ( .A(n497), .B(n389), .Y(n363) );
  XNOR2X1 U500 ( .A(n430), .B(n395), .Y(n382) );
  OAI22X1 U501 ( .A0(n411), .A1(n371), .B0(n370), .B1(n417), .Y(n294) );
  XNOR2X1 U502 ( .A(n497), .B(n397), .Y(n371) );
  XNOR2X1 U503 ( .A(n497), .B(n398), .Y(n372) );
  XNOR2X1 U504 ( .A(n428), .B(n399), .Y(n360) );
  ADDHXL U505 ( .A(n306), .B(n236), .CO(n222), .S(n223) );
  OAI22X1 U506 ( .A0(n412), .A1(n383), .B0(n382), .B1(n442), .Y(n306) );
  OAI22X1 U507 ( .A0(n410), .A1(n422), .B0(n416), .B1(n362), .Y(n236) );
  NAND2BX1 U508 ( .AN(n1), .B(n428), .Y(n362) );
  NOR2X1 U509 ( .A(n309), .B(n298), .Y(n112) );
  NAND2X1 U510 ( .A(n309), .B(n298), .Y(n113) );
  NAND2X1 U511 ( .A(n310), .B(n238), .Y(n115) );
  OAI22X1 U512 ( .A0(n412), .A1(n387), .B0(n386), .B1(n442), .Y(n310) );
  OAI22X1 U513 ( .A0(n412), .A1(n424), .B0(n388), .B1(n442), .Y(n238) );
  XNOR2X1 U514 ( .A(n430), .B(n1), .Y(n387) );
  ADDFX2 U515 ( .A(n286), .B(n307), .CI(n296), .CO(n224), .S(n225) );
  OAI22X1 U516 ( .A0(n412), .A1(n384), .B0(n383), .B1(n442), .Y(n307) );
  NOR2BX1 U517 ( .AN(n1), .B(n416), .Y(n286) );
  OAI22X1 U518 ( .A0(n411), .A1(n373), .B0(n372), .B1(n417), .Y(n296) );
  ADDHXL U519 ( .A(n308), .B(n297), .CO(n226), .S(n227) );
  OAI22X1 U520 ( .A0(n412), .A1(n385), .B0(n384), .B1(n442), .Y(n308) );
  OAI22X1 U521 ( .A0(n411), .A1(n374), .B0(n373), .B1(n417), .Y(n297) );
  XNOR2X1 U522 ( .A(n497), .B(n1), .Y(n374) );
  NAND2BX1 U523 ( .AN(n1), .B(n427), .Y(n349) );
  XNOR2X1 U524 ( .A(n430), .B(n394), .Y(n381) );
  XNOR2X1 U525 ( .A(n427), .B(n1), .Y(n348) );
  XNOR2X1 U526 ( .A(n497), .B(n396), .Y(n370) );
  XNOR2X1 U527 ( .A(n428), .B(n398), .Y(n359) );
  NAND2BX1 U528 ( .AN(n1), .B(n494), .Y(n336) );
  XNOR2X1 U529 ( .A(n494), .B(n1), .Y(n335) );
  XNOR2X1 U530 ( .A(n427), .B(n398), .Y(n346) );
  XNOR2X1 U531 ( .A(n430), .B(n392), .Y(n379) );
  XNOR2X1 U532 ( .A(n430), .B(n393), .Y(n380) );
  XNOR2X1 U533 ( .A(n427), .B(n399), .Y(n347) );
  XNOR2X1 U534 ( .A(n494), .B(n399), .Y(n334) );
  XNOR2X1 U535 ( .A(n427), .B(n397), .Y(n345) );
  XNOR2X1 U536 ( .A(n494), .B(n396), .Y(n331) );
  XNOR2X1 U537 ( .A(n427), .B(n396), .Y(n344) );
  XNOR2X1 U538 ( .A(n495), .B(n1), .Y(n322) );
  XNOR2X1 U539 ( .A(n430), .B(n389), .Y(n376) );
  NAND2BX1 U540 ( .AN(n1), .B(n495), .Y(n323) );
  XNOR2X1 U541 ( .A(n497), .B(n390), .Y(n364) );
  INVX1 U542 ( .A(n376), .Y(n232) );
  XNOR2X1 U543 ( .A(n427), .B(n395), .Y(n343) );
  XNOR2X1 U544 ( .A(n497), .B(n391), .Y(n365) );
  XNOR2X1 U545 ( .A(n428), .B(n392), .Y(n353) );
  OAI22X1 U546 ( .A0(n408), .A1(n331), .B0(n330), .B1(n414), .Y(n257) );
  XNOR2X1 U547 ( .A(n494), .B(n395), .Y(n330) );
  OAI22X1 U548 ( .A0(n411), .A1(n364), .B0(n363), .B1(n417), .Y(n176) );
  XNOR2X1 U549 ( .A(n495), .B(n396), .Y(n318) );
  XNOR2X1 U550 ( .A(n494), .B(n394), .Y(n329) );
  XNOR2X1 U551 ( .A(n428), .B(n389), .Y(n350) );
  XNOR2X1 U552 ( .A(n495), .B(n395), .Y(n317) );
  XNOR2X1 U553 ( .A(n427), .B(n389), .Y(n337) );
  CMPR42X1 U554 ( .A(n274), .B(n305), .C(n294), .D(n284), .ICI(n222), .S(n219), 
        .ICO(n217), .CO(n218) );
  OAI22X1 U555 ( .A0(n412), .A1(n382), .B0(n381), .B1(n442), .Y(n305) );
  NOR2BX1 U556 ( .AN(n1), .B(n415), .Y(n274) );
  OAI22X1 U557 ( .A0(n410), .A1(n360), .B0(n359), .B1(n416), .Y(n284) );
  ADDFX2 U558 ( .A(n295), .B(n285), .CI(n223), .CO(n220), .S(n221) );
  OAI22X1 U559 ( .A0(n410), .A1(n361), .B0(n360), .B1(n416), .Y(n285) );
  OAI22X1 U560 ( .A0(n411), .A1(n372), .B0(n371), .B1(n417), .Y(n295) );
  XNOR2X1 U561 ( .A(n428), .B(n1), .Y(n361) );
  OAI21XL U562 ( .A0(n112), .A1(n115), .B0(n113), .Y(n111) );
  NOR2X1 U563 ( .A(n225), .B(n226), .Y(n104) );
  XNOR2X1 U564 ( .A(n428), .B(n396), .Y(n357) );
  XNOR2X1 U565 ( .A(n497), .B(n395), .Y(n369) );
  XNOR2X1 U566 ( .A(n428), .B(n397), .Y(n358) );
  ADDHXL U567 ( .A(n304), .B(n235), .CO(n215), .S(n216) );
  OAI22X1 U568 ( .A0(n412), .A1(n381), .B0(n380), .B1(n442), .Y(n304) );
  OAI22X1 U569 ( .A0(n409), .A1(n421), .B0(n415), .B1(n349), .Y(n235) );
  INVX1 U570 ( .A(n427), .Y(n421) );
  CMPR42X1 U571 ( .A(n293), .B(n273), .C(n283), .D(n216), .ICI(n217), .S(n214), 
        .ICO(n212), .CO(n213) );
  OAI22X1 U572 ( .A0(n410), .A1(n359), .B0(n358), .B1(n416), .Y(n283) );
  OAI22X1 U573 ( .A0(n409), .A1(n348), .B0(n347), .B1(n415), .Y(n273) );
  OAI22X1 U574 ( .A0(n411), .A1(n370), .B0(n369), .B1(n417), .Y(n293) );
  ADDHXL U575 ( .A(n302), .B(n234), .CO(n205), .S(n206) );
  OAI22X1 U576 ( .A0(n412), .A1(n379), .B0(n378), .B1(n442), .Y(n302) );
  OAI22X1 U577 ( .A0(n408), .A1(n420), .B0(n414), .B1(n336), .Y(n234) );
  INVX1 U578 ( .A(n494), .Y(n420) );
  ADDFX2 U579 ( .A(n271), .B(n261), .CI(n281), .CO(n203), .S(n204) );
  OAI22X1 U580 ( .A0(n410), .A1(n357), .B0(n356), .B1(n416), .Y(n281) );
  OAI22X1 U581 ( .A0(n408), .A1(n335), .B0(n334), .B1(n414), .Y(n261) );
  OAI22X1 U582 ( .A0(n409), .A1(n346), .B0(n345), .B1(n415), .Y(n271) );
  XNOR2X1 U583 ( .A(n497), .B(n394), .Y(n368) );
  ADDFX2 U584 ( .A(n262), .B(n303), .CI(n272), .CO(n210), .S(n211) );
  OAI22X1 U585 ( .A0(n412), .A1(n380), .B0(n379), .B1(n442), .Y(n303) );
  NOR2BX1 U586 ( .AN(n1), .B(n414), .Y(n262) );
  OAI22X1 U587 ( .A0(n409), .A1(n347), .B0(n346), .B1(n415), .Y(n272) );
  XNOR2X1 U588 ( .A(n428), .B(n395), .Y(n356) );
  XNOR2X1 U589 ( .A(n497), .B(n393), .Y(n367) );
  XNOR2X1 U590 ( .A(n430), .B(n390), .Y(n377) );
  XNOR2X1 U591 ( .A(n430), .B(n391), .Y(n378) );
  XOR2X1 U592 ( .A(n430), .B(a[0]), .Y(n406) );
  CLKINVX3 U593 ( .A(a[0]), .Y(n442) );
  XNOR2X1 U594 ( .A(n497), .B(n392), .Y(n366) );
  XNOR2X2 U595 ( .A(n430), .B(a[2]), .Y(n417) );
  NAND2X2 U596 ( .A(n417), .B(n405), .Y(n411) );
  XOR2X1 U597 ( .A(n497), .B(a[2]), .Y(n405) );
  XNOR2X1 U598 ( .A(n494), .B(n398), .Y(n333) );
  XNOR2X1 U599 ( .A(n428), .B(n394), .Y(n355) );
  XNOR2X1 U600 ( .A(n494), .B(n397), .Y(n332) );
  XNOR2X1 U601 ( .A(n428), .B(n393), .Y(n354) );
  CMPR42X1 U602 ( .A(n250), .B(n260), .C(n270), .D(n205), .ICI(n203), .S(n199), 
        .ICO(n197), .CO(n198) );
  NOR2BX1 U603 ( .AN(n1), .B(n413), .Y(n250) );
  OAI22X1 U604 ( .A0(n409), .A1(n345), .B0(n344), .B1(n415), .Y(n270) );
  OAI22X1 U605 ( .A0(n408), .A1(n334), .B0(n333), .B1(n414), .Y(n260) );
  OAI22X1 U606 ( .A0(n408), .A1(n332), .B0(n331), .B1(n414), .Y(n258) );
  OAI22X1 U607 ( .A0(n410), .A1(n354), .B0(n353), .B1(n416), .Y(n278) );
  XNOR2X1 U608 ( .A(n495), .B(n399), .Y(n321) );
  CMPR42X1 U609 ( .A(n269), .B(n249), .C(n289), .D(n194), .ICI(n197), .S(n191), 
        .ICO(n189), .CO(n190) );
  OAI22X1 U610 ( .A0(n411), .A1(n366), .B0(n365), .B1(n417), .Y(n289) );
  OAI22X1 U611 ( .A0(n407), .A1(n322), .B0(n413), .B1(n321), .Y(n249) );
  OAI22X1 U612 ( .A0(n409), .A1(n344), .B0(n343), .B1(n415), .Y(n269) );
  ADDHXL U613 ( .A(n300), .B(n233), .CO(n192), .S(n193) );
  OAI22X1 U614 ( .A0(n412), .A1(n377), .B0(n376), .B1(n442), .Y(n300) );
  OAI22X1 U615 ( .A0(n407), .A1(n419), .B0(n413), .B1(n323), .Y(n233) );
  INVX1 U616 ( .A(n495), .Y(n419) );
  XNOR2X1 U617 ( .A(n427), .B(n394), .Y(n342) );
  XNOR2X1 U618 ( .A(n495), .B(n398), .Y(n320) );
  CMPR42X1 U619 ( .A(n268), .B(n288), .C(n299), .D(n189), .ICI(n186), .S(n183), 
        .ICO(n181), .CO(n182) );
  OAI2BB1X1 U620 ( .A0N(n442), .A1N(n412), .B0(n232), .Y(n299) );
  OAI22X1 U621 ( .A0(n411), .A1(n365), .B0(n364), .B1(n417), .Y(n288) );
  OAI22X1 U622 ( .A0(n409), .A1(n343), .B0(n342), .B1(n415), .Y(n268) );
  XNOR2X1 U623 ( .A(n495), .B(n397), .Y(n319) );
  XNOR2X1 U624 ( .A(n428), .B(n391), .Y(n352) );
  XNOR2X1 U625 ( .A(n427), .B(n393), .Y(n341) );
  CMPR42X1 U626 ( .A(n257), .B(n277), .C(n177), .D(n184), .ICI(n181), .S(n175), 
        .ICO(n173), .CO(n174) );
  OR2X2 U627 ( .A(n278), .B(n258), .Y(n184) );
  INVX1 U628 ( .A(n176), .Y(n177) );
  OAI22X1 U629 ( .A0(n410), .A1(n353), .B0(n352), .B1(n416), .Y(n277) );
  XNOR2X1 U630 ( .A(n427), .B(n392), .Y(n340) );
  XNOR2X1 U631 ( .A(n428), .B(n390), .Y(n351) );
  CMPR42X1 U632 ( .A(n246), .B(n176), .C(n256), .D(n287), .ICI(n173), .S(n169), 
        .ICO(n167), .CO(n168) );
  OAI22X1 U633 ( .A0(n408), .A1(n330), .B0(n329), .B1(n414), .Y(n256) );
  OAI22X1 U634 ( .A0(n407), .A1(n319), .B0(n413), .B1(n318), .Y(n246) );
  OAI22X1 U635 ( .A0(n410), .A1(n351), .B0(n350), .B1(n416), .Y(n162) );
  XNOR2X1 U636 ( .A(n494), .B(n393), .Y(n328) );
  XNOR2X1 U637 ( .A(n427), .B(n391), .Y(n339) );
  XNOR2X1 U638 ( .A(n427), .B(n390), .Y(n338) );
  ADDFX2 U639 ( .A(n245), .B(n255), .CI(n265), .CO(n160), .S(n161) );
  OAI22X1 U640 ( .A0(n409), .A1(n340), .B0(n339), .B1(n415), .Y(n265) );
  OAI22X1 U641 ( .A0(n407), .A1(n318), .B0(n413), .B1(n317), .Y(n245) );
  XNOR2X1 U642 ( .A(n494), .B(n392), .Y(n327) );
  XNOR2X1 U643 ( .A(n495), .B(n394), .Y(n316) );
  ADDFX2 U644 ( .A(n244), .B(n162), .CI(n275), .CO(n155), .S(n156) );
  OAI22X1 U645 ( .A0(n407), .A1(n317), .B0(n413), .B1(n316), .Y(n244) );
  OAI21XL U646 ( .A0(n52), .A1(n48), .B0(n49), .Y(n47) );
  XNOR2X2 U647 ( .A(n428), .B(a[6]), .Y(n415) );
  NAND2X2 U648 ( .A(n415), .B(n403), .Y(n409) );
  XOR2X1 U649 ( .A(n427), .B(a[6]), .Y(n403) );
  XNOR2X1 U650 ( .A(n494), .B(n391), .Y(n326) );
  XNOR2X1 U651 ( .A(n495), .B(n393), .Y(n315) );
  OAI22X1 U652 ( .A0(n409), .A1(n338), .B0(n337), .B1(n415), .Y(n150) );
  XNOR2X1 U653 ( .A(n494), .B(n390), .Y(n325) );
  XNOR2X1 U654 ( .A(n495), .B(n392), .Y(n314) );
  NAND2X1 U655 ( .A(n209), .B(n213), .Y(n90) );
  NAND2X1 U656 ( .A(n214), .B(n218), .Y(n93) );
  NOR2X1 U657 ( .A(n209), .B(n213), .Y(n89) );
  NOR2X1 U658 ( .A(n214), .B(n218), .Y(n92) );
  NOR2X1 U659 ( .A(n219), .B(n220), .Y(n96) );
  NAND2X1 U660 ( .A(n219), .B(n220), .Y(n97) );
  CMPR42X1 U661 ( .A(n292), .B(n282), .C(n215), .D(n212), .ICI(n211), .S(n209), 
        .ICO(n207), .CO(n208) );
  OAI22X1 U662 ( .A0(n410), .A1(n358), .B0(n357), .B1(n416), .Y(n282) );
  OAI22X1 U663 ( .A0(n411), .A1(n369), .B0(n368), .B1(n417), .Y(n292) );
  CMPR42X1 U664 ( .A(n291), .B(n206), .C(n210), .D(n204), .ICI(n207), .S(n202), 
        .ICO(n200), .CO(n201) );
  OAI22X1 U665 ( .A0(n411), .A1(n368), .B0(n367), .B1(n417), .Y(n291) );
  CMPR42X1 U666 ( .A(n301), .B(n280), .C(n290), .D(n200), .ICI(n199), .S(n196), 
        .ICO(n194), .CO(n195) );
  OAI22X1 U667 ( .A0(n412), .A1(n378), .B0(n377), .B1(n442), .Y(n301) );
  OAI22X1 U668 ( .A0(n411), .A1(n367), .B0(n366), .B1(n417), .Y(n290) );
  OAI22X1 U669 ( .A0(n410), .A1(n356), .B0(n355), .B1(n416), .Y(n280) );
  CMPR42X1 U670 ( .A(n279), .B(n259), .C(n193), .D(n198), .ICI(n191), .S(n188), 
        .ICO(n186), .CO(n187) );
  OAI22X1 U671 ( .A0(n410), .A1(n355), .B0(n354), .B1(n416), .Y(n279) );
  AOI21X1 U672 ( .A0(n503), .A1(n507), .B0(n77), .Y(n75) );
  INVX1 U673 ( .A(n79), .Y(n77) );
  OAI22X1 U674 ( .A0(n407), .A1(n321), .B0(n413), .B1(n320), .Y(n248) );
  XNOR2X1 U675 ( .A(n278), .B(n258), .Y(n185) );
  NOR2X1 U676 ( .A(n172), .B(n179), .Y(n61) );
  OAI22X1 U677 ( .A0(n407), .A1(n320), .B0(n413), .B1(n319), .Y(n247) );
  OAI22X1 U678 ( .A0(n409), .A1(n342), .B0(n341), .B1(n415), .Y(n267) );
  NOR2X1 U679 ( .A(n67), .B(n70), .Y(n65) );
  OAI22X1 U680 ( .A0(n409), .A1(n341), .B0(n340), .B1(n415), .Y(n266) );
  OAI22X1 U681 ( .A0(n410), .A1(n352), .B0(n351), .B1(n416), .Y(n276) );
  INVX1 U682 ( .A(n162), .Y(n163) );
  NOR2X1 U683 ( .A(n56), .B(n61), .Y(n54) );
  CMPR42X1 U684 ( .A(n264), .B(n254), .C(n160), .D(n156), .ICI(n157), .S(n154), 
        .ICO(n152), .CO(n153) );
  OAI22X1 U685 ( .A0(n409), .A1(n339), .B0(n338), .B1(n415), .Y(n264) );
  CMPR42X1 U686 ( .A(n253), .B(n243), .C(n151), .D(n155), .ICI(n152), .S(n149), 
        .ICO(n147), .CO(n148) );
  OAI22X1 U687 ( .A0(n407), .A1(n316), .B0(n413), .B1(n315), .Y(n243) );
  INVX1 U688 ( .A(n150), .Y(n151) );
  NOR2X1 U689 ( .A(n51), .B(n48), .Y(n46) );
  CMPR42X1 U690 ( .A(n150), .B(n242), .C(n252), .D(n263), .ICI(n147), .S(n146), 
        .ICO(n144), .CO(n145) );
  OAI22X1 U691 ( .A0(n408), .A1(n326), .B0(n325), .B1(n414), .Y(n252) );
  OAI22X1 U692 ( .A0(n407), .A1(n315), .B0(n413), .B1(n314), .Y(n242) );
  XNOR2X1 U693 ( .A(n494), .B(n389), .Y(n324) );
  OAI22X1 U694 ( .A0(n408), .A1(n325), .B0(n324), .B1(n414), .Y(n142) );
  XNOR2X1 U695 ( .A(n495), .B(n391), .Y(n313) );
  XOR2X1 U696 ( .A(n494), .B(a[8]), .Y(n402) );
  XNOR2X2 U697 ( .A(n494), .B(a[10]), .Y(n413) );
  NAND2X2 U698 ( .A(n413), .B(n401), .Y(n407) );
  XOR2X1 U699 ( .A(n495), .B(a[10]), .Y(n401) );
  XNOR2X1 U700 ( .A(n495), .B(n390), .Y(n312) );
  ADDFX2 U701 ( .A(n241), .B(n143), .CI(n144), .CO(n140), .S(n141) );
  OAI22X1 U702 ( .A0(n407), .A1(n314), .B0(n413), .B1(n313), .Y(n241) );
  INVX1 U703 ( .A(n142), .Y(n143) );
  NAND2X1 U704 ( .A(n196), .B(n201), .Y(n79) );
  AOI21X1 U705 ( .A0(n87), .A1(n95), .B0(n88), .Y(n86) );
  OAI21XL U706 ( .A0(n98), .A1(n96), .B0(n97), .Y(n95) );
  NOR2X1 U707 ( .A(n89), .B(n92), .Y(n87) );
  OAI21XL U708 ( .A0(n89), .A1(n93), .B0(n90), .Y(n88) );
  NOR2X1 U709 ( .A(n188), .B(n195), .Y(n70) );
  NAND2X1 U710 ( .A(n180), .B(n187), .Y(n68) );
  INVX1 U711 ( .A(n73), .Y(n72) );
  NAND2X1 U712 ( .A(n166), .B(n171), .Y(n57) );
  NOR2X1 U713 ( .A(n158), .B(n154), .Y(n48) );
  NAND2X1 U714 ( .A(n159), .B(n165), .Y(n52) );
  NAND2X1 U715 ( .A(n158), .B(n154), .Y(n49) );
  NOR2X1 U716 ( .A(n146), .B(n148), .Y(n37) );
  NOR2X1 U717 ( .A(n153), .B(n149), .Y(n40) );
  NAND2X1 U718 ( .A(n153), .B(n149), .Y(n41) );
  NAND2X1 U719 ( .A(n146), .B(n148), .Y(n38) );
  NOR2X1 U720 ( .A(n145), .B(n141), .Y(n32) );
  OAI21XL U721 ( .A0(n41), .A1(n37), .B0(n38), .Y(n36) );
  NOR2X1 U722 ( .A(n40), .B(n37), .Y(n35) );
  NAND2X1 U723 ( .A(n145), .B(n141), .Y(n33) );
  NAND2X1 U724 ( .A(n140), .B(n139), .Y(n30) );
  ADDFX2 U725 ( .A(n142), .B(n240), .CI(n251), .CO(n138), .S(n139) );
  OAI22X1 U726 ( .A0(n407), .A1(n313), .B0(n413), .B1(n312), .Y(n240) );
  OAI22X1 U727 ( .A0(n407), .A1(n312), .B0(n413), .B1(n311), .Y(n239) );
  XNOR2X1 U728 ( .A(n495), .B(n389), .Y(n311) );
  INVX1 U729 ( .A(n30), .Y(n28) );
  XOR2X1 U730 ( .A(n80), .B(n14), .Y(product[10]) );
  NAND2X1 U731 ( .A(n503), .B(n79), .Y(n14) );
  AOI21X1 U732 ( .A0(n85), .A1(n505), .B0(n507), .Y(n80) );
  INVX1 U733 ( .A(n86), .Y(n85) );
  XOR2X1 U734 ( .A(n72), .B(n13), .Y(product[11]) );
  XNOR2X1 U735 ( .A(n69), .B(n12), .Y(product[12]) );
  OAI21XL U736 ( .A0(n72), .A1(n70), .B0(n71), .Y(n69) );
  XNOR2X1 U737 ( .A(n63), .B(n11), .Y(product[13]) );
  XOR2X1 U738 ( .A(n58), .B(n10), .Y(product[14]) );
  XOR2X1 U739 ( .A(n53), .B(n9), .Y(product[15]) );
  OAI21XL U740 ( .A0(n53), .A1(n51), .B0(n52), .Y(n50) );
  XOR2X1 U741 ( .A(n42), .B(n7), .Y(product[17]) );
  XNOR2X1 U742 ( .A(n39), .B(n6), .Y(product[18]) );
  XOR2X1 U743 ( .A(n34), .B(n5), .Y(product[19]) );
  XNOR2X1 U744 ( .A(n31), .B(n4), .Y(product[20]) );
  NAND2X1 U745 ( .A(n508), .B(n30), .Y(n4) );
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
  DFFHQX2 \sub_br_bi_reg[11]  ( .D(N71), .CK(clk), .Q(sub_br_bi[11]) );
  DFFHQX1 \sub_br_bi_reg[10]  ( .D(N70), .CK(clk), .Q(sub_br_bi[10]) );
  DFFHQX1 \sub_br_bi_reg[8]  ( .D(N68), .CK(clk), .Q(sub_br_bi[8]) );
  DFFHQX1 \sub_br_bi_reg[6]  ( .D(N66), .CK(clk), .Q(sub_br_bi[6]) );
  DFFHQX1 \sub_br_bi_reg[4]  ( .D(N64), .CK(clk), .Q(sub_br_bi[4]) );
  DFFHQX2 \sub_br_bi_reg[3]  ( .D(N63), .CK(clk), .Q(sub_br_bi[3]) );
  DFFHQX1 \sub_br_bi_reg[2]  ( .D(N62), .CK(clk), .Q(sub_br_bi[2]) );
  DFFHQX1 \sub_br_bi_reg[0]  ( .D(N60), .CK(clk), .Q(sub_br_bi[0]) );
  DFFHQX1 \add_br_bi_reg[10]  ( .D(N82), .CK(clk), .Q(add_br_bi[10]) );
  DFFHQX2 \add_br_bi_reg[9]  ( .D(N81), .CK(clk), .Q(add_br_bi[9]) );
  DFFHQX1 \add_br_bi_reg[8]  ( .D(N80), .CK(clk), .Q(add_br_bi[8]) );
  DFFHQX1 \add_br_bi_reg[6]  ( .D(N78), .CK(clk), .Q(add_br_bi[6]) );
  DFFHQX1 \add_br_bi_reg[4]  ( .D(N76), .CK(clk), .Q(add_br_bi[4]) );
  DFFHQX2 \add_br_bi_reg[3]  ( .D(N75), .CK(clk), .Q(add_br_bi[3]) );
  DFFHQX1 \add_br_bi_reg[2]  ( .D(N74), .CK(clk), .Q(add_br_bi[2]) );
  DFFHQX1 \add_br_bi_reg[0]  ( .D(N72), .CK(clk), .Q(add_br_bi[0]) );
  DFFHQX2 \sub_ar_ai_reg[11]  ( .D(N35), .CK(clk), .Q(sub_ar_ai[11]) );
  DFFHQX1 \sub_ar_ai_reg[10]  ( .D(N34), .CK(clk), .Q(sub_ar_ai[10]) );
  DFFHQX1 \sub_ar_ai_reg[8]  ( .D(N32), .CK(clk), .Q(sub_ar_ai[8]) );
  DFFHQX1 \sub_ar_ai_reg[6]  ( .D(N30), .CK(clk), .Q(sub_ar_ai[6]) );
  DFFHQX1 \sub_ar_ai_reg[4]  ( .D(N28), .CK(clk), .Q(sub_ar_ai[4]) );
  DFFHQX2 \sub_ar_ai_reg[3]  ( .D(N27), .CK(clk), .Q(sub_ar_ai[3]) );
  DFFHQX1 \sub_ar_ai_reg[2]  ( .D(N26), .CK(clk), .Q(sub_ar_ai[2]) );
  DFFHQX1 \sub_ar_ai_reg[0]  ( .D(N24), .CK(clk), .Q(sub_ar_ai[0]) );
  DFFHQX1 \md_reg[21]  ( .D(N95), .CK(clk), .Q(md[21]) );
  DFFHQX1 \md_reg[20]  ( .D(N94), .CK(clk), .Q(md[20]) );
  DFFHQX1 \md_reg[19]  ( .D(N93), .CK(clk), .Q(md[19]) );
  DFFHQX1 \md_reg[18]  ( .D(N92), .CK(clk), .Q(md[18]) );
  DFFHQX1 \md_reg[17]  ( .D(N91), .CK(clk), .Q(md[17]) );
  DFFHQX1 \md_reg[16]  ( .D(N90), .CK(clk), .Q(md[16]) );
  DFFHQX1 \md_reg[15]  ( .D(N89), .CK(clk), .Q(md[15]) );
  DFFHQX1 \md_reg[14]  ( .D(N88), .CK(clk), .Q(md[14]) );
  DFFHQX1 \md_reg[13]  ( .D(N87), .CK(clk), .Q(md[13]) );
  DFFHQX1 \md_reg[12]  ( .D(N86), .CK(clk), .Q(md[12]) );
  DFFHQX1 \md_reg[11]  ( .D(N85), .CK(clk), .Q(md[11]) );
  DFFHQX1 \md_reg[10]  ( .D(N84), .CK(clk), .Q(md[10]) );
  DFFHQX1 \ma_reg[21]  ( .D(N107), .CK(clk), .Q(ma[21]) );
  DFFHQX1 \ma_reg[20]  ( .D(N106), .CK(clk), .Q(ma[20]) );
  DFFHQX1 \ma_reg[19]  ( .D(N105), .CK(clk), .Q(ma[19]) );
  DFFHQX1 \ma_reg[18]  ( .D(N104), .CK(clk), .Q(ma[18]) );
  DFFHQX1 \ma_reg[17]  ( .D(N103), .CK(clk), .Q(ma[17]) );
  DFFHQX1 \ma_reg[16]  ( .D(N102), .CK(clk), .Q(ma[16]) );
  DFFHQX1 \ma_reg[15]  ( .D(N101), .CK(clk), .Q(ma[15]) );
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
  DFFHQX1 \mb_reg[16]  ( .D(N114), .CK(clk), .Q(mb[16]) );
  DFFHQX1 \mb_reg[15]  ( .D(N113), .CK(clk), .Q(mb[15]) );
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
  DFFHQX1 \temp1_b_im_reg[3]  ( .D(b_im[3]), .CK(clk), .Q(temp1_b_im[3]) );
  DFFHQX1 \temp1_b_im_reg[2]  ( .D(b_im[2]), .CK(clk), .Q(temp1_b_im[2]) );
  DFFHQX1 \temp1_b_im_reg[1]  ( .D(b_im[1]), .CK(clk), .Q(temp1_b_im[1]) );
  DFFHQX1 \temp1_b_im_reg[5]  ( .D(b_im[5]), .CK(clk), .Q(temp1_b_im[5]) );
  DFFHQX1 \temp1_b_im_reg[4]  ( .D(b_im[4]), .CK(clk), .Q(temp1_b_im[4]) );
  DFFHQX1 \temp1_a_re_reg[8]  ( .D(a_re[8]), .CK(clk), .Q(temp1_a_re[8]) );
  DFFHQX1 \temp1_a_re_reg[7]  ( .D(a_re[7]), .CK(clk), .Q(temp1_a_re[7]) );
  DFFHQX1 \temp1_a_re_reg[6]  ( .D(a_re[6]), .CK(clk), .Q(temp1_a_re[6]) );
  DFFHQX1 \temp1_a_re_reg[3]  ( .D(a_re[3]), .CK(clk), .Q(temp1_a_re[3]) );
  DFFHQX1 \temp1_a_re_reg[2]  ( .D(a_re[2]), .CK(clk), .Q(temp1_a_re[2]) );
  DFFHQX1 \temp1_a_re_reg[1]  ( .D(a_re[1]), .CK(clk), .Q(temp1_a_re[1]) );
  DFFHQX1 \temp1_a_re_reg[5]  ( .D(a_re[5]), .CK(clk), .Q(temp1_a_re[5]) );
  DFFHQX1 \temp1_a_re_reg[4]  ( .D(a_re[4]), .CK(clk), .Q(temp1_a_re[4]) );
  DFFHQX1 \temp1_a_im_reg[8]  ( .D(a_im[8]), .CK(clk), .Q(temp1_a_im[8]) );
  DFFHQX1 \temp1_a_im_reg[7]  ( .D(a_im[7]), .CK(clk), .Q(temp1_a_im[7]) );
  DFFHQX1 \temp1_a_im_reg[6]  ( .D(a_im[6]), .CK(clk), .Q(temp1_a_im[6]) );
  DFFHQX1 \temp1_a_im_reg[3]  ( .D(a_im[3]), .CK(clk), .Q(temp1_a_im[3]) );
  DFFHQX1 \temp1_a_im_reg[2]  ( .D(a_im[2]), .CK(clk), .Q(temp1_a_im[2]) );
  DFFHQX1 \temp1_a_im_reg[1]  ( .D(a_im[1]), .CK(clk), .Q(temp1_a_im[1]) );
  DFFHQX1 \temp1_a_im_reg[5]  ( .D(a_im[5]), .CK(clk), .Q(temp1_a_im[5]) );
  DFFHQX1 \temp1_a_im_reg[4]  ( .D(a_im[4]), .CK(clk), .Q(temp1_a_im[4]) );
  DFFHQX4 \sub_br_bi_reg[7]  ( .D(N67), .CK(clk), .Q(sub_br_bi[7]) );
  DFFHQX4 \add_br_bi_reg[7]  ( .D(N79), .CK(clk), .Q(add_br_bi[7]) );
  DFFHQX4 \sub_ar_ai_reg[1]  ( .D(N25), .CK(clk), .Q(sub_ar_ai[1]) );
  DFFHQX4 \sub_br_bi_reg[1]  ( .D(N61), .CK(clk), .Q(sub_br_bi[1]) );
  DFFHQX4 \sub_ar_ai_reg[5]  ( .D(N29), .CK(clk), .Q(sub_ar_ai[5]) );
  DFFHQX4 \add_br_bi_reg[1]  ( .D(N73), .CK(clk), .Q(add_br_bi[1]) );
  DFFHQX4 \sub_br_bi_reg[5]  ( .D(N65), .CK(clk), .Q(sub_br_bi[5]) );
  DFFHQX4 \add_br_bi_reg[5]  ( .D(N77), .CK(clk), .Q(add_br_bi[5]) );
  DFFHQX4 \sub_br_bi_reg[9]  ( .D(N69), .CK(clk), .Q(sub_br_bi[9]) );
  DFFHQX1 \add_br_bi_reg[11]  ( .D(N83), .CK(clk), .Q(add_br_bi[11]) );
  DFFHQX1 \temp1_b_im_reg[0]  ( .D(b_im[0]), .CK(clk), .Q(temp1_b_im[0]) );
  DFFHQX1 \temp1_a_re_reg[0]  ( .D(a_re[0]), .CK(clk), .Q(temp1_a_re[0]) );
  DFFHQX1 \temp1_a_im_reg[0]  ( .D(a_im[0]), .CK(clk), .Q(temp1_a_im[0]) );
  DFFHQX4 \sub_ar_ai_reg[7]  ( .D(N31), .CK(clk), .Q(sub_ar_ai[7]) );
  DFFHQX4 \sub_ar_ai_reg[9]  ( .D(N33), .CK(clk), .Q(sub_ar_ai[9]) );
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
  DFFHQX1 \dx_im_reg[11]  ( .D(N42), .CK(clk), .Q(dx_im[11]) );
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
  DFFHQX1 \dx_re_reg[11]  ( .D(N30), .CK(clk), .Q(dx_re[11]) );
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
  DFFHQX2 en_reg ( .D(temp4_en), .CK(clk), .Q(en) );
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

  signal_control_DW01_inc_0_DW01_inc_10 add_49 ( .A(cnt2), .SUM({N35, N34, N33, 
        N32, N31, N30, N29}) );
  DFFRHQX1 \cnt2_reg[0]  ( .D(n58), .CK(clk), .RN(n59), .Q(cnt2[0]) );
  DFFRHQX1 \cnt2_reg[1]  ( .D(n57), .CK(clk), .RN(n59), .Q(cnt2[1]) );
  DFFRHQX1 \cnt2_reg[2]  ( .D(n56), .CK(clk), .RN(n59), .Q(cnt2[2]) );
  DFFRHQX1 \cnt2_reg[3]  ( .D(n55), .CK(clk), .RN(n59), .Q(cnt2[3]) );
  DFFRHQX1 \cnt2_reg[4]  ( .D(n54), .CK(clk), .RN(n59), .Q(cnt2[4]) );
  DFFRHQX1 \cnt2_reg[5]  ( .D(n53), .CK(clk), .RN(n59), .Q(cnt2[5]) );
  DFFRHQX1 \cnt2_reg[6]  ( .D(n52), .CK(clk), .RN(n59), .Q(cnt2[6]) );
  DFFRHQX2 do_en_r_reg ( .D(N59), .CK(clk), .RN(n59), .Q(do_en) );
  DFFNRX1 start_count_reg ( .D(n60), .CKN(clk), .RN(n59), .Q(start_count), 
        .QN(n1) );
  DFFRHQX1 \cnt_reg[0]  ( .D(n64), .CK(clk), .RN(n59), .Q(cnt[0]) );
  DFFRHQX1 \cnt_reg[1]  ( .D(n63), .CK(clk), .RN(n59), .Q(cnt[1]) );
  DFFRHQX1 \cnt_reg[2]  ( .D(n62), .CK(clk), .RN(n59), .Q(cnt[2]) );
  DFFRHQX1 \cnt_reg[3]  ( .D(n61), .CK(clk), .RN(n59), .Q(cnt[3]) );
  DFFHQX1 \cnt3_reg[0]  ( .D(N51), .CK(clk), .Q(cnt3[0]) );
  DFFHQX1 \cnt3_reg[1]  ( .D(N52), .CK(clk), .Q(cnt3[1]) );
  DFFHQX1 \cnt3_reg[2]  ( .D(N53), .CK(clk), .Q(cnt3[2]) );
  DFFHQX1 \cnt3_reg[3]  ( .D(N54), .CK(clk), .Q(cnt3[3]) );
  NAND2X1 U3 ( .A(n3), .B(n4), .Y(n2) );
  MXI2X4 U4 ( .A(n25), .B(n26), .S0(n27), .Y(bf_nj) );
  XNOR2X4 U5 ( .A(cnt[3]), .B(n2), .Y(sel) );
  MX2X1 U6 ( .A(n5), .B(n6), .S0(cnt[0]), .Y(n64) );
  OAI2BB2X1 U7 ( .B0(n7), .B1(n8), .A0N(cnt[1]), .A1N(n6), .Y(n63) );
  MXI2X1 U8 ( .A(n9), .B(n10), .S0(cnt[2]), .Y(n62) );
  AOI21X1 U9 ( .A0(n5), .A1(n4), .B0(n6), .Y(n10) );
  NOR2X1 U10 ( .A(n11), .B(start_count), .Y(n6) );
  NAND2BX1 U11 ( .AN(n4), .B(n5), .Y(n9) );
  MXI2X1 U12 ( .A(n12), .B(n13), .S0(cnt[3]), .Y(n61) );
  OAI31X1 U13 ( .A0(n4), .A1(n3), .A2(n1), .B0(n14), .Y(n13) );
  OR3XL U14 ( .A(n3), .B(n8), .C(n4), .Y(n12) );
  NAND2X1 U15 ( .A(cnt[1]), .B(cnt[0]), .Y(n4) );
  INVX1 U16 ( .A(n5), .Y(n8) );
  NOR2X1 U17 ( .A(n1), .B(n11), .Y(n5) );
  NOR2BX1 U18 ( .AN(n7), .B(cnt[2]), .Y(n3) );
  XNOR2X1 U19 ( .A(cnt[0]), .B(cnt[1]), .Y(n7) );
  NAND2BX1 U20 ( .AN(di_en), .B(n1), .Y(n60) );
  INVX1 U21 ( .A(reset), .Y(n59) );
  OAI2BB2X1 U22 ( .B0(start_count), .B1(n15), .A0N(N29), .A1N(n16), .Y(n58) );
  OAI2BB2X1 U23 ( .B0(start_count), .B1(n17), .A0N(N30), .A1N(n16), .Y(n57) );
  OAI2BB2X1 U24 ( .B0(start_count), .B1(n18), .A0N(N31), .A1N(n16), .Y(n56) );
  OAI2BB2X1 U25 ( .B0(start_count), .B1(n19), .A0N(N32), .A1N(n16), .Y(n55) );
  OAI2BB2X1 U26 ( .B0(start_count), .B1(n20), .A0N(N33), .A1N(n16), .Y(n54) );
  OAI2BB2X1 U27 ( .B0(start_count), .B1(n21), .A0N(N34), .A1N(n16), .Y(n53) );
  OAI2BB2X1 U28 ( .B0(start_count), .B1(n22), .A0N(N35), .A1N(n16), .Y(n52) );
  AOI2BB1X1 U29 ( .A0N(n23), .A1N(n24), .B0(n1), .Y(n16) );
  NAND3X1 U30 ( .A(cnt2[6]), .B(cnt2[2]), .C(cnt2[5]), .Y(n24) );
  NAND4X1 U31 ( .A(n15), .B(n17), .C(n19), .D(n20), .Y(n23) );
  INVX1 U32 ( .A(cnt2[4]), .Y(n20) );
  NAND2BX1 U33 ( .AN(cnt3[3]), .B(n28), .Y(n26) );
  NAND2X1 U34 ( .A(cnt3[3]), .B(cnt3[2]), .Y(n25) );
  AOI21X1 U35 ( .A0(n29), .A1(n30), .B0(n11), .Y(N59) );
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
  INVX1 U49 ( .A(n11), .Y(n14) );
  NOR2X1 U50 ( .A(n22), .B(n30), .Y(n11) );
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
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3,
         n4;
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
  AOI22X1 U18 ( .A0(n4), .A1(high_sum2[5]), .B0(carry), .B1(high_sum1[5]), .Y(
        n3) );
  INVX1 U21 ( .A(carry), .Y(n4) );
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
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
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
  MX2X1 U3 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U4 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U5 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U6 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U7 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U8 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U9 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U10 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U12 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_14 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3,
         n4;
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
  AOI22X1 U18 ( .A0(n4), .A1(high_sum2[5]), .B0(carry), .B1(high_sum1[5]), .Y(
        n3) );
  INVX1 U21 ( .A(carry), .Y(n4) );
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
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
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
  MX2X1 U3 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U4 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U5 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U6 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U7 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  OR2X2 U8 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U9 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U10 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U12 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
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
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
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
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
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
  CLKINVX3 U118 ( .A(sel), .Y(n2) );
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

  signal_control2_DW01_inc_0_DW01_inc_8 add_36 ( .A(cnt), .SUM({N16, N15, N14, 
        N13, N12, N11, N10}) );
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
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3,
         n4;
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
  AOI22X1 U18 ( .A0(n4), .A1(high_sum2[5]), .B0(carry), .B1(high_sum1[5]), .Y(
        n3) );
  INVX1 U21 ( .A(carry), .Y(n4) );
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
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
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
  MX2X1 U3 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U4 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U5 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U6 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U7 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U8 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U9 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U10 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U12 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_10 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3,
         n4;
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
  AOI22X1 U18 ( .A0(n4), .A1(high_sum2[5]), .B0(carry), .B1(high_sum1[5]), .Y(
        n3) );
  INVX1 U21 ( .A(carry), .Y(n4) );
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
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
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
  MX2X1 U3 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U4 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U5 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U6 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U7 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U8 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U9 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U10 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U12 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
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
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
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
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
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
  INVX1 U37 ( .A(1'b1), .Y(tw_re[0]) );
  INVX1 U39 ( .A(1'b1), .Y(tw_im[0]) );
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

  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
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
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_0_DW01_inc_0_DW01_inc_28 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
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
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module multiply_WIDTH12_0_DW_mult_tc_7 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n1, n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n26, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n77, n79, n80, n85, n86, n87, n88, n89, n90, n92, n93, n95, n96, n97,
         n98, n103, n104, n106, n111, n112, n113, n115, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
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
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n442, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505;
  assign n1 = b[0];
  assign n389 = b[11];
  assign n390 = b[10];
  assign n391 = b[9];
  assign n392 = b[8];
  assign n393 = b[7];
  assign n394 = b[6];
  assign n395 = b[5];
  assign n396 = b[4];
  assign n397 = b[3];
  assign n398 = b[2];
  assign n399 = b[1];
  assign n425 = a[11];
  assign n426 = a[9];
  assign n427 = a[7];
  assign n428 = a[5];
  assign n429 = a[3];
  assign n430 = a[1];

  NAND2X4 U406 ( .A(n416), .B(n404), .Y(n410) );
  XNOR2X4 U408 ( .A(n429), .B(a[4]), .Y(n416) );
  NAND2X4 U417 ( .A(n415), .B(n403), .Y(n409) );
  XOR2X1 U418 ( .A(n428), .B(a[4]), .Y(n404) );
  XNOR2X2 U419 ( .A(n428), .B(a[6]), .Y(n415) );
  XNOR2X1 U420 ( .A(n50), .B(n8), .Y(product[16]) );
  AOI21X1 U421 ( .A0(n417), .A1(n411), .B0(n363), .Y(n494) );
  INVX1 U422 ( .A(n494), .Y(n287) );
  AOI21XL U423 ( .A0(n416), .A1(n410), .B0(n350), .Y(n495) );
  INVX1 U424 ( .A(n495), .Y(n275) );
  OAI21XL U425 ( .A0(n86), .A1(n74), .B0(n75), .Y(n73) );
  NAND2X1 U426 ( .A(n54), .B(n46), .Y(n44) );
  OAI22XL U427 ( .A0(n407), .A1(n315), .B0(n413), .B1(n314), .Y(n242) );
  AOI21X1 U428 ( .A0(n63), .A1(n54), .B0(n55), .Y(n53) );
  OAI22XL U429 ( .A0(n407), .A1(n320), .B0(n413), .B1(n319), .Y(n247) );
  AOI21X2 U430 ( .A0(n43), .A1(n35), .B0(n36), .Y(n34) );
  AOI21X1 U431 ( .A0(n415), .A1(n409), .B0(n337), .Y(n496) );
  INVX1 U432 ( .A(n496), .Y(n263) );
  OAI2BB1X1 U433 ( .A0N(n63), .A1N(n59), .B0(n62), .Y(n497) );
  INVX1 U434 ( .A(n497), .Y(n58) );
  INVX1 U435 ( .A(n64), .Y(n63) );
  AOI22X1 U436 ( .A0(n501), .A1(n111), .B0(n227), .B1(n237), .Y(n106) );
  AOI21X1 U437 ( .A0(n414), .A1(n408), .B0(n324), .Y(n498) );
  INVX1 U438 ( .A(n498), .Y(n251) );
  OAI21XL U439 ( .A0(n53), .A1(n51), .B0(n52), .Y(n50) );
  NAND2BX1 U440 ( .AN(n32), .B(n33), .Y(n5) );
  AOI21X1 U441 ( .A0(n442), .A1(n412), .B0(n376), .Y(n499) );
  INVX1 U442 ( .A(n499), .Y(n299) );
  NAND2BX1 U443 ( .AN(n48), .B(n49), .Y(n8) );
  XOR3X2 U444 ( .A(n31), .B(n140), .C(n139), .Y(product[20]) );
  OAI2BB2X1 U445 ( .B0(n106), .B1(n104), .A0N(n225), .A1N(n226), .Y(n103) );
  NAND2BX1 U446 ( .AN(n70), .B(n71), .Y(n13) );
  NAND2BX1 U447 ( .AN(n56), .B(n57), .Y(n10) );
  NAND2BX1 U448 ( .AN(n40), .B(n41), .Y(n7) );
  AOI22X1 U449 ( .A0(n31), .A1(n505), .B0(n140), .B1(n139), .Y(n26) );
  AOI22X1 U450 ( .A0(n503), .A1(n103), .B0(n221), .B1(n224), .Y(n98) );
  NAND2BX1 U451 ( .AN(n67), .B(n68), .Y(n12) );
  NAND2BX1 U452 ( .AN(n51), .B(n52), .Y(n9) );
  NAND2BX1 U453 ( .AN(n37), .B(n38), .Y(n6) );
  XOR2X1 U454 ( .A(n138), .B(n239), .Y(n3) );
  OR2X2 U455 ( .A(n196), .B(n201), .Y(n500) );
  OR2X2 U456 ( .A(n227), .B(n237), .Y(n501) );
  AND2X2 U457 ( .A(n202), .B(n208), .Y(n502) );
  OR2X2 U458 ( .A(n221), .B(n224), .Y(n503) );
  OR2X2 U459 ( .A(n202), .B(n208), .Y(n504) );
  OR2X2 U460 ( .A(n140), .B(n139), .Y(n505) );
  NOR2X2 U461 ( .A(n56), .B(n61), .Y(n54) );
  XNOR2X4 U462 ( .A(n426), .B(a[10]), .Y(n413) );
  OAI21X2 U463 ( .A0(n56), .A1(n62), .B0(n57), .Y(n55) );
  AOI21X2 U464 ( .A0(n55), .A1(n46), .B0(n47), .Y(n45) );
  NAND2X4 U465 ( .A(n417), .B(n405), .Y(n411) );
  XNOR2X4 U466 ( .A(n430), .B(a[2]), .Y(n417) );
  NAND2X2 U467 ( .A(n500), .B(n504), .Y(n74) );
  OAI21X2 U468 ( .A0(n44), .A1(n64), .B0(n45), .Y(n43) );
  AOI21X2 U469 ( .A0(n65), .A1(n73), .B0(n66), .Y(n64) );
  OAI21X4 U470 ( .A0(n34), .A1(n32), .B0(n33), .Y(n31) );
  XNOR2X4 U471 ( .A(n427), .B(a[8]), .Y(n414) );
  INVX1 U472 ( .A(n428), .Y(n422) );
  OAI22X1 U473 ( .A0(n411), .A1(n423), .B0(n417), .B1(n375), .Y(n237) );
  INVX1 U474 ( .A(n429), .Y(n423) );
  NAND2BX1 U475 ( .AN(n1), .B(n429), .Y(n375) );
  NOR2BX1 U476 ( .AN(n1), .B(n417), .Y(n298) );
  OAI22X1 U477 ( .A0(n412), .A1(n386), .B0(n385), .B1(n442), .Y(n309) );
  NAND2BX1 U478 ( .AN(n1), .B(n430), .Y(n388) );
  INVX1 U479 ( .A(n430), .Y(n424) );
  XNOR2X1 U480 ( .A(n430), .B(n399), .Y(n386) );
  XNOR2X1 U481 ( .A(n430), .B(n396), .Y(n383) );
  XNOR2X1 U482 ( .A(n430), .B(n398), .Y(n385) );
  XNOR2X1 U483 ( .A(n429), .B(n399), .Y(n373) );
  XNOR2X1 U484 ( .A(n430), .B(n397), .Y(n384) );
  XNOR2X1 U485 ( .A(n429), .B(n389), .Y(n363) );
  XNOR2X1 U486 ( .A(n430), .B(n395), .Y(n382) );
  OAI22X1 U487 ( .A0(n411), .A1(n371), .B0(n370), .B1(n417), .Y(n294) );
  XNOR2X1 U488 ( .A(n429), .B(n397), .Y(n371) );
  XNOR2X1 U489 ( .A(n429), .B(n398), .Y(n372) );
  XNOR2X1 U490 ( .A(n428), .B(n399), .Y(n360) );
  ADDHXL U491 ( .A(n306), .B(n236), .CO(n222), .S(n223) );
  OAI22X1 U492 ( .A0(n412), .A1(n383), .B0(n382), .B1(n442), .Y(n306) );
  OAI22X1 U493 ( .A0(n410), .A1(n422), .B0(n416), .B1(n362), .Y(n236) );
  NAND2BX1 U494 ( .AN(n1), .B(n428), .Y(n362) );
  NOR2X1 U495 ( .A(n309), .B(n298), .Y(n112) );
  NAND2X1 U496 ( .A(n309), .B(n298), .Y(n113) );
  NAND2X1 U497 ( .A(n310), .B(n238), .Y(n115) );
  OAI22X1 U498 ( .A0(n412), .A1(n387), .B0(n386), .B1(n442), .Y(n310) );
  OAI22X1 U499 ( .A0(n412), .A1(n424), .B0(n388), .B1(n442), .Y(n238) );
  XNOR2X1 U500 ( .A(n430), .B(n1), .Y(n387) );
  ADDFX2 U501 ( .A(n286), .B(n307), .CI(n296), .CO(n224), .S(n225) );
  OAI22X1 U502 ( .A0(n412), .A1(n384), .B0(n383), .B1(n442), .Y(n307) );
  NOR2BX1 U503 ( .AN(n1), .B(n416), .Y(n286) );
  OAI22X1 U504 ( .A0(n411), .A1(n373), .B0(n372), .B1(n417), .Y(n296) );
  ADDHXL U505 ( .A(n308), .B(n297), .CO(n226), .S(n227) );
  OAI22X1 U506 ( .A0(n412), .A1(n385), .B0(n384), .B1(n442), .Y(n308) );
  OAI22X1 U507 ( .A0(n411), .A1(n374), .B0(n373), .B1(n417), .Y(n297) );
  XNOR2X1 U508 ( .A(n429), .B(n1), .Y(n374) );
  NAND2BX1 U509 ( .AN(n1), .B(n427), .Y(n349) );
  XNOR2X1 U510 ( .A(n430), .B(n394), .Y(n381) );
  XNOR2X1 U511 ( .A(n427), .B(n1), .Y(n348) );
  XNOR2X1 U512 ( .A(n429), .B(n396), .Y(n370) );
  XNOR2X1 U513 ( .A(n428), .B(n398), .Y(n359) );
  NAND2BX1 U514 ( .AN(n1), .B(n426), .Y(n336) );
  XNOR2X1 U515 ( .A(n426), .B(n1), .Y(n335) );
  XNOR2X1 U516 ( .A(n427), .B(n398), .Y(n346) );
  XNOR2X1 U517 ( .A(n430), .B(n392), .Y(n379) );
  XNOR2X1 U518 ( .A(n430), .B(n393), .Y(n380) );
  XNOR2X1 U519 ( .A(n427), .B(n399), .Y(n347) );
  XNOR2X1 U520 ( .A(n426), .B(n399), .Y(n334) );
  XNOR2X1 U521 ( .A(n427), .B(n397), .Y(n345) );
  XNOR2X1 U522 ( .A(n426), .B(n396), .Y(n331) );
  XNOR2X1 U523 ( .A(n427), .B(n396), .Y(n344) );
  XNOR2X1 U524 ( .A(n425), .B(n1), .Y(n322) );
  XNOR2X1 U525 ( .A(n430), .B(n389), .Y(n376) );
  NAND2BX1 U526 ( .AN(n1), .B(n425), .Y(n323) );
  XNOR2X1 U527 ( .A(n429), .B(n390), .Y(n364) );
  XNOR2X1 U528 ( .A(n427), .B(n395), .Y(n343) );
  XNOR2X1 U529 ( .A(n429), .B(n391), .Y(n365) );
  XNOR2X1 U530 ( .A(n428), .B(n392), .Y(n353) );
  OAI22X1 U531 ( .A0(n408), .A1(n331), .B0(n330), .B1(n414), .Y(n257) );
  XNOR2X1 U532 ( .A(n426), .B(n395), .Y(n330) );
  OAI22X1 U533 ( .A0(n411), .A1(n364), .B0(n363), .B1(n417), .Y(n176) );
  XNOR2X1 U534 ( .A(n425), .B(n396), .Y(n318) );
  XNOR2X1 U535 ( .A(n426), .B(n394), .Y(n329) );
  XNOR2X1 U536 ( .A(n428), .B(n389), .Y(n350) );
  XNOR2X1 U537 ( .A(n425), .B(n395), .Y(n317) );
  XNOR2X1 U538 ( .A(n427), .B(n389), .Y(n337) );
  CMPR42X1 U539 ( .A(n274), .B(n305), .C(n294), .D(n284), .ICI(n222), .S(n219), 
        .ICO(n217), .CO(n218) );
  OAI22X1 U540 ( .A0(n412), .A1(n382), .B0(n381), .B1(n442), .Y(n305) );
  NOR2BX1 U541 ( .AN(n1), .B(n415), .Y(n274) );
  OAI22X1 U542 ( .A0(n410), .A1(n360), .B0(n359), .B1(n416), .Y(n284) );
  ADDFX2 U543 ( .A(n295), .B(n285), .CI(n223), .CO(n220), .S(n221) );
  OAI22X1 U544 ( .A0(n410), .A1(n361), .B0(n360), .B1(n416), .Y(n285) );
  OAI22X1 U545 ( .A0(n411), .A1(n372), .B0(n371), .B1(n417), .Y(n295) );
  XNOR2X1 U546 ( .A(n428), .B(n1), .Y(n361) );
  OAI21XL U547 ( .A0(n112), .A1(n115), .B0(n113), .Y(n111) );
  NOR2X1 U548 ( .A(n225), .B(n226), .Y(n104) );
  XNOR2X1 U549 ( .A(n428), .B(n396), .Y(n357) );
  XNOR2X1 U550 ( .A(n429), .B(n395), .Y(n369) );
  XNOR2X1 U551 ( .A(n428), .B(n397), .Y(n358) );
  ADDHXL U552 ( .A(n304), .B(n235), .CO(n215), .S(n216) );
  OAI22X1 U553 ( .A0(n412), .A1(n381), .B0(n380), .B1(n442), .Y(n304) );
  OAI22X1 U554 ( .A0(n409), .A1(n421), .B0(n415), .B1(n349), .Y(n235) );
  INVX1 U555 ( .A(n427), .Y(n421) );
  CMPR42X1 U556 ( .A(n293), .B(n273), .C(n283), .D(n216), .ICI(n217), .S(n214), 
        .ICO(n212), .CO(n213) );
  OAI22X1 U557 ( .A0(n410), .A1(n359), .B0(n358), .B1(n416), .Y(n283) );
  OAI22X1 U558 ( .A0(n409), .A1(n348), .B0(n347), .B1(n415), .Y(n273) );
  OAI22X1 U559 ( .A0(n411), .A1(n370), .B0(n369), .B1(n417), .Y(n293) );
  ADDHXL U560 ( .A(n302), .B(n234), .CO(n205), .S(n206) );
  OAI22X1 U561 ( .A0(n412), .A1(n379), .B0(n378), .B1(n442), .Y(n302) );
  OAI22X1 U562 ( .A0(n408), .A1(n420), .B0(n414), .B1(n336), .Y(n234) );
  INVX1 U563 ( .A(n426), .Y(n420) );
  ADDFX2 U564 ( .A(n271), .B(n261), .CI(n281), .CO(n203), .S(n204) );
  OAI22X1 U565 ( .A0(n410), .A1(n357), .B0(n356), .B1(n416), .Y(n281) );
  OAI22X1 U566 ( .A0(n408), .A1(n335), .B0(n334), .B1(n414), .Y(n261) );
  OAI22X1 U567 ( .A0(n409), .A1(n346), .B0(n345), .B1(n415), .Y(n271) );
  XNOR2X1 U568 ( .A(n429), .B(n394), .Y(n368) );
  ADDFX2 U569 ( .A(n262), .B(n303), .CI(n272), .CO(n210), .S(n211) );
  OAI22X1 U570 ( .A0(n412), .A1(n380), .B0(n379), .B1(n442), .Y(n303) );
  NOR2BX1 U571 ( .AN(n1), .B(n414), .Y(n262) );
  OAI22X1 U572 ( .A0(n409), .A1(n347), .B0(n346), .B1(n415), .Y(n272) );
  XNOR2X1 U573 ( .A(n428), .B(n395), .Y(n356) );
  XNOR2X1 U574 ( .A(n429), .B(n393), .Y(n367) );
  XNOR2X1 U575 ( .A(n430), .B(n390), .Y(n377) );
  XNOR2X1 U576 ( .A(n430), .B(n391), .Y(n378) );
  NAND2X2 U577 ( .A(n406), .B(n442), .Y(n412) );
  XOR2X1 U578 ( .A(n430), .B(a[0]), .Y(n406) );
  CLKINVX3 U579 ( .A(a[0]), .Y(n442) );
  XNOR2X1 U580 ( .A(n429), .B(n392), .Y(n366) );
  XOR2X1 U581 ( .A(n429), .B(a[2]), .Y(n405) );
  XNOR2X1 U582 ( .A(n426), .B(n398), .Y(n333) );
  XNOR2X1 U583 ( .A(n428), .B(n394), .Y(n355) );
  XNOR2X1 U584 ( .A(n426), .B(n397), .Y(n332) );
  XNOR2X1 U585 ( .A(n428), .B(n393), .Y(n354) );
  CMPR42X1 U586 ( .A(n250), .B(n260), .C(n270), .D(n205), .ICI(n203), .S(n199), 
        .ICO(n197), .CO(n198) );
  NOR2BX1 U587 ( .AN(n1), .B(n413), .Y(n250) );
  OAI22X1 U588 ( .A0(n409), .A1(n345), .B0(n344), .B1(n415), .Y(n270) );
  OAI22X1 U589 ( .A0(n408), .A1(n334), .B0(n333), .B1(n414), .Y(n260) );
  OAI22X1 U590 ( .A0(n408), .A1(n332), .B0(n331), .B1(n414), .Y(n258) );
  OAI22X1 U591 ( .A0(n410), .A1(n354), .B0(n353), .B1(n416), .Y(n278) );
  XNOR2X1 U592 ( .A(n425), .B(n399), .Y(n321) );
  CMPR42X1 U593 ( .A(n269), .B(n249), .C(n289), .D(n194), .ICI(n197), .S(n191), 
        .ICO(n189), .CO(n190) );
  OAI22X1 U594 ( .A0(n411), .A1(n366), .B0(n365), .B1(n417), .Y(n289) );
  OAI22X1 U595 ( .A0(n407), .A1(n322), .B0(n413), .B1(n321), .Y(n249) );
  OAI22X1 U596 ( .A0(n409), .A1(n344), .B0(n343), .B1(n415), .Y(n269) );
  ADDHXL U597 ( .A(n300), .B(n233), .CO(n192), .S(n193) );
  OAI22X1 U598 ( .A0(n412), .A1(n377), .B0(n376), .B1(n442), .Y(n300) );
  OAI22X1 U599 ( .A0(n407), .A1(n419), .B0(n413), .B1(n323), .Y(n233) );
  INVX1 U600 ( .A(n425), .Y(n419) );
  XNOR2X1 U601 ( .A(n427), .B(n394), .Y(n342) );
  XNOR2X1 U602 ( .A(n425), .B(n398), .Y(n320) );
  CMPR42X1 U603 ( .A(n268), .B(n288), .C(n299), .D(n189), .ICI(n186), .S(n183), 
        .ICO(n181), .CO(n182) );
  OAI22X1 U604 ( .A0(n411), .A1(n365), .B0(n364), .B1(n417), .Y(n288) );
  OAI22X1 U605 ( .A0(n409), .A1(n343), .B0(n342), .B1(n415), .Y(n268) );
  XNOR2X1 U606 ( .A(n425), .B(n397), .Y(n319) );
  XNOR2X1 U607 ( .A(n428), .B(n391), .Y(n352) );
  XNOR2X1 U608 ( .A(n427), .B(n393), .Y(n341) );
  CMPR42X1 U609 ( .A(n257), .B(n277), .C(n177), .D(n184), .ICI(n181), .S(n175), 
        .ICO(n173), .CO(n174) );
  OR2X2 U610 ( .A(n278), .B(n258), .Y(n184) );
  INVX1 U611 ( .A(n176), .Y(n177) );
  OAI22X1 U612 ( .A0(n410), .A1(n353), .B0(n352), .B1(n416), .Y(n277) );
  XNOR2X1 U613 ( .A(n427), .B(n392), .Y(n340) );
  XNOR2X1 U614 ( .A(n428), .B(n390), .Y(n351) );
  CMPR42X1 U615 ( .A(n246), .B(n176), .C(n256), .D(n287), .ICI(n173), .S(n169), 
        .ICO(n167), .CO(n168) );
  OAI22X1 U616 ( .A0(n408), .A1(n330), .B0(n329), .B1(n414), .Y(n256) );
  OAI22X1 U617 ( .A0(n407), .A1(n319), .B0(n413), .B1(n318), .Y(n246) );
  OAI22X1 U618 ( .A0(n410), .A1(n351), .B0(n350), .B1(n416), .Y(n162) );
  XNOR2X1 U619 ( .A(n426), .B(n393), .Y(n328) );
  XNOR2X1 U620 ( .A(n427), .B(n391), .Y(n339) );
  XNOR2X1 U621 ( .A(n427), .B(n390), .Y(n338) );
  ADDFX2 U622 ( .A(n245), .B(n255), .CI(n265), .CO(n160), .S(n161) );
  OAI22X1 U623 ( .A0(n409), .A1(n340), .B0(n339), .B1(n415), .Y(n265) );
  OAI22X1 U624 ( .A0(n408), .A1(n329), .B0(n328), .B1(n414), .Y(n255) );
  OAI22X1 U625 ( .A0(n407), .A1(n318), .B0(n413), .B1(n317), .Y(n245) );
  XNOR2X1 U626 ( .A(n426), .B(n392), .Y(n327) );
  XNOR2X1 U627 ( .A(n425), .B(n394), .Y(n316) );
  ADDFX2 U628 ( .A(n244), .B(n162), .CI(n275), .CO(n155), .S(n156) );
  OAI22X1 U629 ( .A0(n407), .A1(n317), .B0(n413), .B1(n316), .Y(n244) );
  OAI21XL U630 ( .A0(n52), .A1(n48), .B0(n49), .Y(n47) );
  XOR2X1 U631 ( .A(n427), .B(a[6]), .Y(n403) );
  XNOR2X1 U632 ( .A(n426), .B(n391), .Y(n326) );
  XNOR2X1 U633 ( .A(n425), .B(n393), .Y(n315) );
  OAI22X1 U634 ( .A0(n409), .A1(n338), .B0(n337), .B1(n415), .Y(n150) );
  XNOR2X1 U635 ( .A(n426), .B(n390), .Y(n325) );
  XNOR2X1 U636 ( .A(n425), .B(n392), .Y(n314) );
  NAND2X1 U637 ( .A(n209), .B(n213), .Y(n90) );
  NAND2X1 U638 ( .A(n214), .B(n218), .Y(n93) );
  NOR2X1 U639 ( .A(n209), .B(n213), .Y(n89) );
  NOR2X1 U640 ( .A(n214), .B(n218), .Y(n92) );
  NOR2X1 U641 ( .A(n219), .B(n220), .Y(n96) );
  NAND2X1 U642 ( .A(n219), .B(n220), .Y(n97) );
  CMPR42X1 U643 ( .A(n292), .B(n282), .C(n215), .D(n212), .ICI(n211), .S(n209), 
        .ICO(n207), .CO(n208) );
  OAI22X1 U644 ( .A0(n410), .A1(n358), .B0(n357), .B1(n416), .Y(n282) );
  OAI22X1 U645 ( .A0(n411), .A1(n369), .B0(n368), .B1(n417), .Y(n292) );
  CMPR42X1 U646 ( .A(n291), .B(n206), .C(n210), .D(n204), .ICI(n207), .S(n202), 
        .ICO(n200), .CO(n201) );
  OAI22X1 U647 ( .A0(n411), .A1(n368), .B0(n367), .B1(n417), .Y(n291) );
  CMPR42X1 U648 ( .A(n301), .B(n280), .C(n290), .D(n200), .ICI(n199), .S(n196), 
        .ICO(n194), .CO(n195) );
  OAI22X1 U649 ( .A0(n412), .A1(n378), .B0(n377), .B1(n442), .Y(n301) );
  OAI22X1 U650 ( .A0(n411), .A1(n367), .B0(n366), .B1(n417), .Y(n290) );
  OAI22X1 U651 ( .A0(n410), .A1(n356), .B0(n355), .B1(n416), .Y(n280) );
  CMPR42X1 U652 ( .A(n279), .B(n259), .C(n193), .D(n198), .ICI(n191), .S(n188), 
        .ICO(n186), .CO(n187) );
  OAI22X1 U653 ( .A0(n410), .A1(n355), .B0(n354), .B1(n416), .Y(n279) );
  OAI22X1 U654 ( .A0(n408), .A1(n333), .B0(n332), .B1(n414), .Y(n259) );
  AOI21X1 U655 ( .A0(n500), .A1(n502), .B0(n77), .Y(n75) );
  INVX1 U656 ( .A(n79), .Y(n77) );
  CMPR42X1 U657 ( .A(n248), .B(n192), .C(n185), .D(n190), .ICI(n183), .S(n180), 
        .ICO(n178), .CO(n179) );
  OAI22X1 U658 ( .A0(n407), .A1(n321), .B0(n413), .B1(n320), .Y(n248) );
  XNOR2X1 U659 ( .A(n278), .B(n258), .Y(n185) );
  NOR2X1 U660 ( .A(n172), .B(n179), .Y(n61) );
  CMPR42X1 U661 ( .A(n267), .B(n247), .C(n178), .D(n182), .ICI(n175), .S(n172), 
        .ICO(n170), .CO(n171) );
  OAI22X1 U662 ( .A0(n409), .A1(n342), .B0(n341), .B1(n415), .Y(n267) );
  NOR2X1 U663 ( .A(n67), .B(n70), .Y(n65) );
  OAI21XL U664 ( .A0(n67), .A1(n71), .B0(n68), .Y(n66) );
  CMPR42X1 U665 ( .A(n276), .B(n266), .C(n170), .D(n174), .ICI(n169), .S(n166), 
        .ICO(n164), .CO(n165) );
  OAI22X1 U666 ( .A0(n409), .A1(n341), .B0(n340), .B1(n415), .Y(n266) );
  OAI22X1 U667 ( .A0(n410), .A1(n352), .B0(n351), .B1(n416), .Y(n276) );
  CMPR42X1 U668 ( .A(n163), .B(n167), .C(n161), .D(n168), .ICI(n164), .S(n159), 
        .ICO(n157), .CO(n158) );
  INVX1 U669 ( .A(n162), .Y(n163) );
  CMPR42X1 U670 ( .A(n264), .B(n254), .C(n160), .D(n156), .ICI(n157), .S(n154), 
        .ICO(n152), .CO(n153) );
  OAI22X1 U671 ( .A0(n408), .A1(n328), .B0(n327), .B1(n414), .Y(n254) );
  OAI22X1 U672 ( .A0(n409), .A1(n339), .B0(n338), .B1(n415), .Y(n264) );
  CMPR42X1 U673 ( .A(n253), .B(n243), .C(n151), .D(n155), .ICI(n152), .S(n149), 
        .ICO(n147), .CO(n148) );
  OAI22X1 U674 ( .A0(n407), .A1(n316), .B0(n413), .B1(n315), .Y(n243) );
  INVX1 U675 ( .A(n150), .Y(n151) );
  OAI22X1 U676 ( .A0(n408), .A1(n327), .B0(n326), .B1(n414), .Y(n253) );
  NOR2X1 U677 ( .A(n51), .B(n48), .Y(n46) );
  CMPR42X1 U678 ( .A(n150), .B(n242), .C(n252), .D(n263), .ICI(n147), .S(n146), 
        .ICO(n144), .CO(n145) );
  OAI22X1 U679 ( .A0(n408), .A1(n326), .B0(n325), .B1(n414), .Y(n252) );
  XNOR2X1 U680 ( .A(n426), .B(n389), .Y(n324) );
  OAI22X1 U681 ( .A0(n408), .A1(n325), .B0(n324), .B1(n414), .Y(n142) );
  XNOR2X1 U682 ( .A(n425), .B(n391), .Y(n313) );
  NAND2X2 U683 ( .A(n414), .B(n402), .Y(n408) );
  XOR2X1 U684 ( .A(n426), .B(a[8]), .Y(n402) );
  NAND2X2 U685 ( .A(n413), .B(n401), .Y(n407) );
  XOR2X1 U686 ( .A(n425), .B(a[10]), .Y(n401) );
  XNOR2X1 U687 ( .A(n425), .B(n390), .Y(n312) );
  ADDFX2 U688 ( .A(n241), .B(n143), .CI(n144), .CO(n140), .S(n141) );
  OAI22X1 U689 ( .A0(n407), .A1(n314), .B0(n413), .B1(n313), .Y(n241) );
  INVX1 U690 ( .A(n142), .Y(n143) );
  NAND2X1 U691 ( .A(n196), .B(n201), .Y(n79) );
  AOI21X1 U692 ( .A0(n87), .A1(n95), .B0(n88), .Y(n86) );
  OAI21XL U693 ( .A0(n98), .A1(n96), .B0(n97), .Y(n95) );
  NOR2X1 U694 ( .A(n89), .B(n92), .Y(n87) );
  OAI21XL U695 ( .A0(n89), .A1(n93), .B0(n90), .Y(n88) );
  NOR2X1 U696 ( .A(n188), .B(n195), .Y(n70) );
  NOR2X1 U697 ( .A(n180), .B(n187), .Y(n67) );
  NAND2X1 U698 ( .A(n188), .B(n195), .Y(n71) );
  NAND2X1 U699 ( .A(n180), .B(n187), .Y(n68) );
  INVX1 U700 ( .A(n73), .Y(n72) );
  NAND2X1 U701 ( .A(n172), .B(n179), .Y(n62) );
  NOR2X1 U702 ( .A(n166), .B(n171), .Y(n56) );
  INVX1 U703 ( .A(n61), .Y(n59) );
  NAND2X1 U704 ( .A(n166), .B(n171), .Y(n57) );
  NOR2X1 U705 ( .A(n158), .B(n154), .Y(n48) );
  NOR2X1 U706 ( .A(n159), .B(n165), .Y(n51) );
  NAND2X1 U707 ( .A(n159), .B(n165), .Y(n52) );
  NAND2X1 U708 ( .A(n158), .B(n154), .Y(n49) );
  NOR2X1 U709 ( .A(n146), .B(n148), .Y(n37) );
  NOR2X1 U710 ( .A(n153), .B(n149), .Y(n40) );
  NAND2X1 U711 ( .A(n153), .B(n149), .Y(n41) );
  NAND2X1 U712 ( .A(n146), .B(n148), .Y(n38) );
  INVX1 U713 ( .A(n43), .Y(n42) );
  NOR2X1 U714 ( .A(n145), .B(n141), .Y(n32) );
  OAI21XL U715 ( .A0(n41), .A1(n37), .B0(n38), .Y(n36) );
  NOR2X1 U716 ( .A(n40), .B(n37), .Y(n35) );
  NAND2X1 U717 ( .A(n145), .B(n141), .Y(n33) );
  ADDFX2 U718 ( .A(n142), .B(n240), .CI(n251), .CO(n138), .S(n139) );
  OAI22X1 U719 ( .A0(n407), .A1(n313), .B0(n413), .B1(n312), .Y(n240) );
  OAI22X1 U720 ( .A0(n407), .A1(n312), .B0(n413), .B1(n311), .Y(n239) );
  XNOR2X1 U721 ( .A(n425), .B(n389), .Y(n311) );
  XOR2X1 U722 ( .A(n80), .B(n14), .Y(product[10]) );
  NAND2X1 U723 ( .A(n500), .B(n79), .Y(n14) );
  AOI21X1 U724 ( .A0(n85), .A1(n504), .B0(n502), .Y(n80) );
  INVX1 U725 ( .A(n86), .Y(n85) );
  XOR2X1 U726 ( .A(n72), .B(n13), .Y(product[11]) );
  XNOR2X1 U727 ( .A(n69), .B(n12), .Y(product[12]) );
  OAI21XL U728 ( .A0(n72), .A1(n70), .B0(n71), .Y(n69) );
  XNOR2X1 U729 ( .A(n63), .B(n11), .Y(product[13]) );
  NAND2X1 U730 ( .A(n59), .B(n62), .Y(n11) );
  XOR2X1 U731 ( .A(n58), .B(n10), .Y(product[14]) );
  XOR2X1 U732 ( .A(n53), .B(n9), .Y(product[15]) );
  XOR2X1 U733 ( .A(n42), .B(n7), .Y(product[17]) );
  XNOR2X1 U734 ( .A(n39), .B(n6), .Y(product[18]) );
  OAI21XL U735 ( .A0(n42), .A1(n40), .B0(n41), .Y(n39) );
  XOR2X1 U736 ( .A(n34), .B(n5), .Y(product[19]) );
  XOR2X1 U737 ( .A(n26), .B(n3), .Y(product[21]) );
endmodule


module multiply_WIDTH12_0_DW_mult_tc_9 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n1, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n26, n28, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n77, n79, n80, n85, n86, n87, n88, n89, n90, n92, n93, n95, n96,
         n97, n98, n103, n104, n106, n111, n112, n113, n115, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n442, n494, n495,
         n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506;
  assign n1 = b[0];
  assign n389 = b[11];
  assign n390 = b[10];
  assign n391 = b[9];
  assign n392 = b[8];
  assign n393 = b[7];
  assign n394 = b[6];
  assign n395 = b[5];
  assign n396 = b[4];
  assign n397 = b[3];
  assign n398 = b[2];
  assign n399 = b[1];
  assign n425 = a[11];
  assign n426 = a[9];
  assign n427 = a[7];
  assign n428 = a[5];
  assign n429 = a[3];
  assign n430 = a[1];

  AOI21XL U417 ( .A0(n415), .A1(n409), .B0(n337), .Y(n496) );
  OAI22XL U418 ( .A0(n409), .A1(n338), .B0(n337), .B1(n415), .Y(n150) );
  OAI22XL U419 ( .A0(n409), .A1(n341), .B0(n340), .B1(n415), .Y(n266) );
  OAI22XL U420 ( .A0(n409), .A1(n339), .B0(n338), .B1(n415), .Y(n264) );
  BUFX3 U421 ( .A(n430), .Y(n494) );
  CLKINVX3 U422 ( .A(a[0]), .Y(n442) );
  CLKBUFX8 U423 ( .A(n429), .Y(n495) );
  NAND2X4 U424 ( .A(n414), .B(n402), .Y(n408) );
  INVX1 U425 ( .A(n494), .Y(n424) );
  XNOR2X2 U426 ( .A(n495), .B(a[4]), .Y(n416) );
  NAND2X2 U427 ( .A(n416), .B(n404), .Y(n410) );
  XOR2X1 U428 ( .A(n428), .B(a[4]), .Y(n404) );
  CMPR42X1 U429 ( .A(n267), .B(n247), .C(n178), .D(n182), .ICI(n175), .S(n172), 
        .ICO(n170), .CO(n171) );
  AOI21X2 U430 ( .A0(n65), .A1(n73), .B0(n66), .Y(n64) );
  OAI21X1 U431 ( .A0(n56), .A1(n62), .B0(n57), .Y(n55) );
  NAND2X1 U432 ( .A(n172), .B(n179), .Y(n62) );
  INVX1 U433 ( .A(n496), .Y(n263) );
  AOI21X1 U434 ( .A0(n442), .A1(n412), .B0(n376), .Y(n497) );
  INVX1 U435 ( .A(n497), .Y(n299) );
  AOI21XL U436 ( .A0(n417), .A1(n411), .B0(n363), .Y(n498) );
  INVX1 U437 ( .A(n498), .Y(n287) );
  OAI21X2 U438 ( .A0(n86), .A1(n74), .B0(n75), .Y(n73) );
  NAND2X1 U439 ( .A(n54), .B(n46), .Y(n44) );
  AOI21X1 U440 ( .A0(n416), .A1(n410), .B0(n350), .Y(n499) );
  INVX1 U441 ( .A(n499), .Y(n275) );
  AOI21X1 U442 ( .A0(n63), .A1(n54), .B0(n55), .Y(n53) );
  AND2X2 U443 ( .A(n140), .B(n139), .Y(n28) );
  AOI22X1 U444 ( .A0(n502), .A1(n111), .B0(n227), .B1(n237), .Y(n106) );
  OAI21X2 U445 ( .A0(n34), .A1(n32), .B0(n33), .Y(n31) );
  AOI21X1 U446 ( .A0(n63), .A1(n59), .B0(n60), .Y(n58) );
  INVX1 U447 ( .A(n64), .Y(n63) );
  NAND2X2 U448 ( .A(n417), .B(n405), .Y(n411) );
  AOI21X1 U449 ( .A0(n414), .A1(n408), .B0(n324), .Y(n500) );
  INVX1 U450 ( .A(n500), .Y(n251) );
  NAND2BX1 U451 ( .AN(n48), .B(n49), .Y(n8) );
  NAND2BX1 U452 ( .AN(n32), .B(n33), .Y(n5) );
  OAI2BB2X1 U453 ( .B0(n106), .B1(n104), .A0N(n225), .A1N(n226), .Y(n103) );
  NAND2BX1 U454 ( .AN(n70), .B(n71), .Y(n13) );
  NAND2BX1 U455 ( .AN(n56), .B(n57), .Y(n10) );
  NAND2BX1 U456 ( .AN(n40), .B(n41), .Y(n7) );
  XOR3X2 U457 ( .A(n31), .B(n140), .C(n139), .Y(product[20]) );
  AOI22X1 U458 ( .A0(n504), .A1(n103), .B0(n221), .B1(n224), .Y(n98) );
  NAND2BX1 U459 ( .AN(n67), .B(n68), .Y(n12) );
  NAND2BX1 U460 ( .AN(n51), .B(n52), .Y(n9) );
  NAND2BX1 U461 ( .AN(n37), .B(n38), .Y(n6) );
  XOR3X2 U462 ( .A(n26), .B(n239), .C(n138), .Y(product[21]) );
  OR2X2 U463 ( .A(n196), .B(n201), .Y(n501) );
  OR2X2 U464 ( .A(n227), .B(n237), .Y(n502) );
  AND2X2 U465 ( .A(n202), .B(n208), .Y(n503) );
  OR2X2 U466 ( .A(n221), .B(n224), .Y(n504) );
  OR2X2 U467 ( .A(n202), .B(n208), .Y(n505) );
  OR2X2 U468 ( .A(n140), .B(n139), .Y(n506) );
  AOI21X4 U469 ( .A0(n43), .A1(n35), .B0(n36), .Y(n34) );
  NOR2X2 U470 ( .A(n51), .B(n48), .Y(n46) );
  OAI22XL U471 ( .A0(n411), .A1(n371), .B0(n370), .B1(n417), .Y(n294) );
  OAI22XL U472 ( .A0(n411), .A1(n372), .B0(n371), .B1(n417), .Y(n295) );
  OAI22XL U473 ( .A0(n411), .A1(n373), .B0(n372), .B1(n417), .Y(n296) );
  OAI22XL U474 ( .A0(n411), .A1(n423), .B0(n417), .B1(n375), .Y(n237) );
  NOR2BXL U475 ( .AN(n1), .B(n417), .Y(n298) );
  OAI22XL U476 ( .A0(n411), .A1(n368), .B0(n367), .B1(n417), .Y(n291) );
  NAND2BXL U477 ( .AN(n1), .B(n494), .Y(n388) );
  OAI22XL U478 ( .A0(n411), .A1(n369), .B0(n368), .B1(n417), .Y(n292) );
  OAI22XL U479 ( .A0(n411), .A1(n370), .B0(n369), .B1(n417), .Y(n293) );
  OAI22XL U480 ( .A0(n411), .A1(n374), .B0(n373), .B1(n417), .Y(n297) );
  OAI22XL U481 ( .A0(n411), .A1(n367), .B0(n366), .B1(n417), .Y(n290) );
  OAI22XL U482 ( .A0(n411), .A1(n365), .B0(n364), .B1(n417), .Y(n288) );
  XNOR2X4 U483 ( .A(n494), .B(a[2]), .Y(n417) );
  OAI21X4 U484 ( .A0(n44), .A1(n64), .B0(n45), .Y(n43) );
  NOR2X2 U485 ( .A(n166), .B(n171), .Y(n56) );
  OAI21X1 U486 ( .A0(n67), .A1(n71), .B0(n68), .Y(n66) );
  CMPR42X2 U487 ( .A(n248), .B(n192), .C(n185), .D(n190), .ICI(n183), .S(n180), 
        .ICO(n178), .CO(n179) );
  NAND2X2 U488 ( .A(n501), .B(n505), .Y(n74) );
  AOI21X2 U489 ( .A0(n55), .A1(n46), .B0(n47), .Y(n45) );
  XNOR2X4 U490 ( .A(n427), .B(a[8]), .Y(n414) );
  AOI21X4 U491 ( .A0(n31), .A1(n506), .B0(n28), .Y(n26) );
  INVX1 U492 ( .A(n428), .Y(n422) );
  INVX1 U493 ( .A(n495), .Y(n423) );
  NAND2BX1 U494 ( .AN(n1), .B(n495), .Y(n375) );
  OAI22X1 U495 ( .A0(n412), .A1(n386), .B0(n385), .B1(n442), .Y(n309) );
  XNOR2X1 U496 ( .A(n494), .B(n399), .Y(n386) );
  XNOR2X1 U497 ( .A(n494), .B(n396), .Y(n383) );
  XNOR2X1 U498 ( .A(n494), .B(n398), .Y(n385) );
  XNOR2X1 U499 ( .A(n495), .B(n399), .Y(n373) );
  XNOR2X1 U500 ( .A(n494), .B(n397), .Y(n384) );
  XNOR2X1 U501 ( .A(n495), .B(n389), .Y(n363) );
  XNOR2X1 U502 ( .A(n494), .B(n395), .Y(n382) );
  XNOR2X1 U503 ( .A(n495), .B(n397), .Y(n371) );
  XNOR2X1 U504 ( .A(n495), .B(n398), .Y(n372) );
  XNOR2X1 U505 ( .A(n428), .B(n399), .Y(n360) );
  ADDHXL U506 ( .A(n306), .B(n236), .CO(n222), .S(n223) );
  OAI22X1 U507 ( .A0(n412), .A1(n383), .B0(n382), .B1(n442), .Y(n306) );
  OAI22X1 U508 ( .A0(n410), .A1(n422), .B0(n416), .B1(n362), .Y(n236) );
  NAND2BX1 U509 ( .AN(n1), .B(n428), .Y(n362) );
  NOR2X1 U510 ( .A(n309), .B(n298), .Y(n112) );
  NAND2X1 U511 ( .A(n309), .B(n298), .Y(n113) );
  NAND2X1 U512 ( .A(n310), .B(n238), .Y(n115) );
  OAI22X1 U513 ( .A0(n412), .A1(n387), .B0(n386), .B1(n442), .Y(n310) );
  OAI22X1 U514 ( .A0(n412), .A1(n424), .B0(n388), .B1(n442), .Y(n238) );
  XNOR2X1 U515 ( .A(n494), .B(n1), .Y(n387) );
  ADDFX2 U516 ( .A(n286), .B(n307), .CI(n296), .CO(n224), .S(n225) );
  OAI22X1 U517 ( .A0(n412), .A1(n384), .B0(n383), .B1(n442), .Y(n307) );
  NOR2BX1 U518 ( .AN(n1), .B(n416), .Y(n286) );
  ADDHXL U519 ( .A(n308), .B(n297), .CO(n226), .S(n227) );
  OAI22X1 U520 ( .A0(n412), .A1(n385), .B0(n384), .B1(n442), .Y(n308) );
  XNOR2X1 U521 ( .A(n495), .B(n1), .Y(n374) );
  NAND2BX1 U522 ( .AN(n1), .B(n427), .Y(n349) );
  XNOR2X1 U523 ( .A(n494), .B(n394), .Y(n381) );
  XNOR2X1 U524 ( .A(n427), .B(n1), .Y(n348) );
  XNOR2X1 U525 ( .A(n495), .B(n396), .Y(n370) );
  XNOR2X1 U526 ( .A(n428), .B(n398), .Y(n359) );
  NAND2BX1 U527 ( .AN(n1), .B(n426), .Y(n336) );
  XNOR2X1 U528 ( .A(n426), .B(n1), .Y(n335) );
  XNOR2X1 U529 ( .A(n427), .B(n398), .Y(n346) );
  XNOR2X1 U530 ( .A(n494), .B(n392), .Y(n379) );
  XNOR2X1 U531 ( .A(n494), .B(n393), .Y(n380) );
  XNOR2X1 U532 ( .A(n427), .B(n399), .Y(n347) );
  XNOR2X1 U533 ( .A(n426), .B(n399), .Y(n334) );
  XNOR2X1 U534 ( .A(n427), .B(n397), .Y(n345) );
  XNOR2X1 U535 ( .A(n426), .B(n396), .Y(n331) );
  XNOR2X1 U536 ( .A(n427), .B(n396), .Y(n344) );
  XNOR2X1 U537 ( .A(n425), .B(n1), .Y(n322) );
  XNOR2X1 U538 ( .A(n494), .B(n389), .Y(n376) );
  NAND2BX1 U539 ( .AN(n1), .B(n425), .Y(n323) );
  XNOR2X1 U540 ( .A(n495), .B(n390), .Y(n364) );
  XNOR2X1 U541 ( .A(n427), .B(n395), .Y(n343) );
  XNOR2X1 U542 ( .A(n495), .B(n391), .Y(n365) );
  XNOR2X1 U543 ( .A(n428), .B(n392), .Y(n353) );
  OAI22X1 U544 ( .A0(n408), .A1(n331), .B0(n330), .B1(n414), .Y(n257) );
  XNOR2X1 U545 ( .A(n426), .B(n395), .Y(n330) );
  OAI22X1 U546 ( .A0(n411), .A1(n364), .B0(n363), .B1(n417), .Y(n176) );
  XNOR2X1 U547 ( .A(n425), .B(n396), .Y(n318) );
  XNOR2X1 U548 ( .A(n426), .B(n394), .Y(n329) );
  XNOR2X1 U549 ( .A(n428), .B(n389), .Y(n350) );
  XNOR2X1 U550 ( .A(n425), .B(n395), .Y(n317) );
  XNOR2X1 U551 ( .A(n427), .B(n389), .Y(n337) );
  CMPR42X1 U552 ( .A(n274), .B(n305), .C(n294), .D(n284), .ICI(n222), .S(n219), 
        .ICO(n217), .CO(n218) );
  OAI22X1 U553 ( .A0(n412), .A1(n382), .B0(n381), .B1(n442), .Y(n305) );
  NOR2BX1 U554 ( .AN(n1), .B(n415), .Y(n274) );
  OAI22X1 U555 ( .A0(n410), .A1(n360), .B0(n359), .B1(n416), .Y(n284) );
  ADDFX2 U556 ( .A(n295), .B(n285), .CI(n223), .CO(n220), .S(n221) );
  OAI22X1 U557 ( .A0(n410), .A1(n361), .B0(n360), .B1(n416), .Y(n285) );
  XNOR2X1 U558 ( .A(n428), .B(n1), .Y(n361) );
  OAI21XL U559 ( .A0(n112), .A1(n115), .B0(n113), .Y(n111) );
  NOR2X1 U560 ( .A(n225), .B(n226), .Y(n104) );
  XNOR2X1 U561 ( .A(n428), .B(n396), .Y(n357) );
  XNOR2X1 U562 ( .A(n495), .B(n395), .Y(n369) );
  XNOR2X1 U563 ( .A(n428), .B(n397), .Y(n358) );
  ADDHXL U564 ( .A(n304), .B(n235), .CO(n215), .S(n216) );
  OAI22X1 U565 ( .A0(n412), .A1(n381), .B0(n380), .B1(n442), .Y(n304) );
  OAI22X1 U566 ( .A0(n409), .A1(n421), .B0(n415), .B1(n349), .Y(n235) );
  INVX1 U567 ( .A(n427), .Y(n421) );
  CMPR42X1 U568 ( .A(n293), .B(n273), .C(n283), .D(n216), .ICI(n217), .S(n214), 
        .ICO(n212), .CO(n213) );
  OAI22X1 U569 ( .A0(n410), .A1(n359), .B0(n358), .B1(n416), .Y(n283) );
  OAI22X1 U570 ( .A0(n409), .A1(n348), .B0(n347), .B1(n415), .Y(n273) );
  ADDHXL U571 ( .A(n302), .B(n234), .CO(n205), .S(n206) );
  OAI22X1 U572 ( .A0(n412), .A1(n379), .B0(n378), .B1(n442), .Y(n302) );
  OAI22X1 U573 ( .A0(n408), .A1(n420), .B0(n414), .B1(n336), .Y(n234) );
  INVX1 U574 ( .A(n426), .Y(n420) );
  ADDFX2 U575 ( .A(n271), .B(n261), .CI(n281), .CO(n203), .S(n204) );
  OAI22X1 U576 ( .A0(n410), .A1(n357), .B0(n356), .B1(n416), .Y(n281) );
  OAI22X1 U577 ( .A0(n408), .A1(n335), .B0(n334), .B1(n414), .Y(n261) );
  OAI22X1 U578 ( .A0(n409), .A1(n346), .B0(n345), .B1(n415), .Y(n271) );
  XNOR2X1 U579 ( .A(n495), .B(n394), .Y(n368) );
  ADDFX2 U580 ( .A(n262), .B(n303), .CI(n272), .CO(n210), .S(n211) );
  OAI22X1 U581 ( .A0(n412), .A1(n380), .B0(n379), .B1(n442), .Y(n303) );
  NOR2BX1 U582 ( .AN(n1), .B(n414), .Y(n262) );
  OAI22X1 U583 ( .A0(n409), .A1(n347), .B0(n346), .B1(n415), .Y(n272) );
  XNOR2X1 U584 ( .A(n428), .B(n395), .Y(n356) );
  XNOR2X1 U585 ( .A(n495), .B(n393), .Y(n367) );
  XNOR2X1 U586 ( .A(n494), .B(n390), .Y(n377) );
  XNOR2X1 U587 ( .A(n494), .B(n391), .Y(n378) );
  NAND2X2 U588 ( .A(n406), .B(n442), .Y(n412) );
  XOR2X1 U589 ( .A(n494), .B(a[0]), .Y(n406) );
  XNOR2X1 U590 ( .A(n495), .B(n392), .Y(n366) );
  XOR2X1 U591 ( .A(n495), .B(a[2]), .Y(n405) );
  XNOR2X1 U592 ( .A(n426), .B(n398), .Y(n333) );
  XNOR2X1 U593 ( .A(n428), .B(n394), .Y(n355) );
  XNOR2X1 U594 ( .A(n426), .B(n397), .Y(n332) );
  XNOR2X1 U595 ( .A(n428), .B(n393), .Y(n354) );
  CMPR42X1 U596 ( .A(n250), .B(n260), .C(n270), .D(n205), .ICI(n203), .S(n199), 
        .ICO(n197), .CO(n198) );
  NOR2BX1 U597 ( .AN(n1), .B(n413), .Y(n250) );
  OAI22X1 U598 ( .A0(n409), .A1(n345), .B0(n344), .B1(n415), .Y(n270) );
  OAI22X1 U599 ( .A0(n408), .A1(n334), .B0(n333), .B1(n414), .Y(n260) );
  OAI22X1 U600 ( .A0(n408), .A1(n332), .B0(n331), .B1(n414), .Y(n258) );
  OAI22X1 U601 ( .A0(n410), .A1(n354), .B0(n353), .B1(n416), .Y(n278) );
  XNOR2X1 U602 ( .A(n425), .B(n399), .Y(n321) );
  CMPR42X1 U603 ( .A(n269), .B(n249), .C(n289), .D(n194), .ICI(n197), .S(n191), 
        .ICO(n189), .CO(n190) );
  OAI22X1 U604 ( .A0(n411), .A1(n366), .B0(n365), .B1(n417), .Y(n289) );
  OAI22X1 U605 ( .A0(n407), .A1(n322), .B0(n413), .B1(n321), .Y(n249) );
  OAI22X1 U606 ( .A0(n409), .A1(n344), .B0(n343), .B1(n415), .Y(n269) );
  ADDHXL U607 ( .A(n300), .B(n233), .CO(n192), .S(n193) );
  OAI22X1 U608 ( .A0(n412), .A1(n377), .B0(n376), .B1(n442), .Y(n300) );
  OAI22X1 U609 ( .A0(n407), .A1(n419), .B0(n413), .B1(n323), .Y(n233) );
  INVX1 U610 ( .A(n425), .Y(n419) );
  XNOR2X1 U611 ( .A(n427), .B(n394), .Y(n342) );
  XNOR2X1 U612 ( .A(n425), .B(n398), .Y(n320) );
  CMPR42X1 U613 ( .A(n268), .B(n288), .C(n299), .D(n189), .ICI(n186), .S(n183), 
        .ICO(n181), .CO(n182) );
  OAI22X1 U614 ( .A0(n409), .A1(n343), .B0(n342), .B1(n415), .Y(n268) );
  XNOR2X1 U615 ( .A(n425), .B(n397), .Y(n319) );
  XNOR2X1 U616 ( .A(n428), .B(n391), .Y(n352) );
  XNOR2X1 U617 ( .A(n427), .B(n393), .Y(n341) );
  CMPR42X1 U618 ( .A(n257), .B(n277), .C(n177), .D(n184), .ICI(n181), .S(n175), 
        .ICO(n173), .CO(n174) );
  OR2X2 U619 ( .A(n278), .B(n258), .Y(n184) );
  INVX1 U620 ( .A(n176), .Y(n177) );
  OAI22X1 U621 ( .A0(n410), .A1(n353), .B0(n352), .B1(n416), .Y(n277) );
  XNOR2X1 U622 ( .A(n427), .B(n392), .Y(n340) );
  XNOR2X1 U623 ( .A(n428), .B(n390), .Y(n351) );
  CMPR42X1 U624 ( .A(n246), .B(n176), .C(n256), .D(n287), .ICI(n173), .S(n169), 
        .ICO(n167), .CO(n168) );
  OAI22X1 U625 ( .A0(n408), .A1(n330), .B0(n329), .B1(n414), .Y(n256) );
  OAI22X1 U626 ( .A0(n407), .A1(n319), .B0(n413), .B1(n318), .Y(n246) );
  OAI22X1 U627 ( .A0(n410), .A1(n351), .B0(n350), .B1(n416), .Y(n162) );
  XNOR2X1 U628 ( .A(n426), .B(n393), .Y(n328) );
  XNOR2X1 U629 ( .A(n427), .B(n391), .Y(n339) );
  XNOR2X1 U630 ( .A(n427), .B(n390), .Y(n338) );
  ADDFX2 U631 ( .A(n245), .B(n255), .CI(n265), .CO(n160), .S(n161) );
  OAI22X1 U632 ( .A0(n409), .A1(n340), .B0(n339), .B1(n415), .Y(n265) );
  OAI22X1 U633 ( .A0(n408), .A1(n329), .B0(n328), .B1(n414), .Y(n255) );
  OAI22X1 U634 ( .A0(n407), .A1(n318), .B0(n413), .B1(n317), .Y(n245) );
  XNOR2X1 U635 ( .A(n426), .B(n392), .Y(n327) );
  XNOR2X1 U636 ( .A(n425), .B(n394), .Y(n316) );
  ADDFX2 U637 ( .A(n244), .B(n162), .CI(n275), .CO(n155), .S(n156) );
  OAI22X1 U638 ( .A0(n407), .A1(n317), .B0(n413), .B1(n316), .Y(n244) );
  OAI21XL U639 ( .A0(n52), .A1(n48), .B0(n49), .Y(n47) );
  XNOR2X2 U640 ( .A(n428), .B(a[6]), .Y(n415) );
  NAND2X2 U641 ( .A(n415), .B(n403), .Y(n409) );
  XOR2X1 U642 ( .A(n427), .B(a[6]), .Y(n403) );
  XNOR2X1 U643 ( .A(n426), .B(n391), .Y(n326) );
  XNOR2X1 U644 ( .A(n425), .B(n393), .Y(n315) );
  XNOR2X1 U645 ( .A(n426), .B(n390), .Y(n325) );
  XNOR2X1 U646 ( .A(n425), .B(n392), .Y(n314) );
  NAND2X1 U647 ( .A(n209), .B(n213), .Y(n90) );
  NAND2X1 U648 ( .A(n214), .B(n218), .Y(n93) );
  NOR2X1 U649 ( .A(n209), .B(n213), .Y(n89) );
  NOR2X1 U650 ( .A(n214), .B(n218), .Y(n92) );
  NOR2X1 U651 ( .A(n219), .B(n220), .Y(n96) );
  NAND2X1 U652 ( .A(n219), .B(n220), .Y(n97) );
  CMPR42X1 U653 ( .A(n292), .B(n282), .C(n215), .D(n212), .ICI(n211), .S(n209), 
        .ICO(n207), .CO(n208) );
  OAI22X1 U654 ( .A0(n410), .A1(n358), .B0(n357), .B1(n416), .Y(n282) );
  CMPR42X1 U655 ( .A(n291), .B(n206), .C(n210), .D(n204), .ICI(n207), .S(n202), 
        .ICO(n200), .CO(n201) );
  CMPR42X1 U656 ( .A(n301), .B(n280), .C(n290), .D(n200), .ICI(n199), .S(n196), 
        .ICO(n194), .CO(n195) );
  OAI22X1 U657 ( .A0(n412), .A1(n378), .B0(n377), .B1(n442), .Y(n301) );
  OAI22X1 U658 ( .A0(n410), .A1(n356), .B0(n355), .B1(n416), .Y(n280) );
  CMPR42X1 U659 ( .A(n279), .B(n259), .C(n193), .D(n198), .ICI(n191), .S(n188), 
        .ICO(n186), .CO(n187) );
  OAI22X1 U660 ( .A0(n410), .A1(n355), .B0(n354), .B1(n416), .Y(n279) );
  OAI22X1 U661 ( .A0(n408), .A1(n333), .B0(n332), .B1(n414), .Y(n259) );
  AOI21X1 U662 ( .A0(n501), .A1(n503), .B0(n77), .Y(n75) );
  INVX1 U663 ( .A(n79), .Y(n77) );
  OAI22X1 U664 ( .A0(n407), .A1(n321), .B0(n413), .B1(n320), .Y(n248) );
  XNOR2X1 U665 ( .A(n278), .B(n258), .Y(n185) );
  NOR2X1 U666 ( .A(n172), .B(n179), .Y(n61) );
  OAI22X1 U667 ( .A0(n407), .A1(n320), .B0(n413), .B1(n319), .Y(n247) );
  OAI22X1 U668 ( .A0(n409), .A1(n342), .B0(n341), .B1(n415), .Y(n267) );
  NOR2X1 U669 ( .A(n67), .B(n70), .Y(n65) );
  CMPR42X1 U670 ( .A(n276), .B(n266), .C(n170), .D(n174), .ICI(n169), .S(n166), 
        .ICO(n164), .CO(n165) );
  OAI22X1 U671 ( .A0(n410), .A1(n352), .B0(n351), .B1(n416), .Y(n276) );
  CMPR42X1 U672 ( .A(n163), .B(n167), .C(n161), .D(n168), .ICI(n164), .S(n159), 
        .ICO(n157), .CO(n158) );
  INVX1 U673 ( .A(n162), .Y(n163) );
  NOR2X1 U674 ( .A(n56), .B(n61), .Y(n54) );
  CMPR42X1 U675 ( .A(n264), .B(n254), .C(n160), .D(n156), .ICI(n157), .S(n154), 
        .ICO(n152), .CO(n153) );
  OAI22X1 U676 ( .A0(n408), .A1(n328), .B0(n327), .B1(n414), .Y(n254) );
  CMPR42X1 U677 ( .A(n253), .B(n243), .C(n151), .D(n155), .ICI(n152), .S(n149), 
        .ICO(n147), .CO(n148) );
  OAI22X1 U678 ( .A0(n407), .A1(n316), .B0(n413), .B1(n315), .Y(n243) );
  INVX1 U679 ( .A(n150), .Y(n151) );
  OAI22X1 U680 ( .A0(n408), .A1(n327), .B0(n326), .B1(n414), .Y(n253) );
  CMPR42X1 U681 ( .A(n150), .B(n242), .C(n252), .D(n263), .ICI(n147), .S(n146), 
        .ICO(n144), .CO(n145) );
  OAI22X1 U682 ( .A0(n408), .A1(n326), .B0(n325), .B1(n414), .Y(n252) );
  OAI22X1 U683 ( .A0(n407), .A1(n315), .B0(n413), .B1(n314), .Y(n242) );
  XNOR2X1 U684 ( .A(n426), .B(n389), .Y(n324) );
  OAI22X1 U685 ( .A0(n408), .A1(n325), .B0(n324), .B1(n414), .Y(n142) );
  XNOR2X1 U686 ( .A(n425), .B(n391), .Y(n313) );
  XOR2X1 U687 ( .A(n426), .B(a[8]), .Y(n402) );
  XNOR2X2 U688 ( .A(n426), .B(a[10]), .Y(n413) );
  NAND2X2 U689 ( .A(n413), .B(n401), .Y(n407) );
  XOR2X1 U690 ( .A(n425), .B(a[10]), .Y(n401) );
  XNOR2X1 U691 ( .A(n425), .B(n390), .Y(n312) );
  ADDFX2 U692 ( .A(n241), .B(n143), .CI(n144), .CO(n140), .S(n141) );
  OAI22X1 U693 ( .A0(n407), .A1(n314), .B0(n413), .B1(n313), .Y(n241) );
  INVX1 U694 ( .A(n142), .Y(n143) );
  NAND2X1 U695 ( .A(n196), .B(n201), .Y(n79) );
  AOI21X1 U696 ( .A0(n87), .A1(n95), .B0(n88), .Y(n86) );
  OAI21XL U697 ( .A0(n98), .A1(n96), .B0(n97), .Y(n95) );
  NOR2X1 U698 ( .A(n89), .B(n92), .Y(n87) );
  OAI21XL U699 ( .A0(n89), .A1(n93), .B0(n90), .Y(n88) );
  NOR2X1 U700 ( .A(n188), .B(n195), .Y(n70) );
  NOR2X1 U701 ( .A(n180), .B(n187), .Y(n67) );
  NAND2X1 U702 ( .A(n188), .B(n195), .Y(n71) );
  NAND2X1 U703 ( .A(n180), .B(n187), .Y(n68) );
  INVX1 U704 ( .A(n73), .Y(n72) );
  INVX1 U705 ( .A(n61), .Y(n59) );
  INVX1 U706 ( .A(n62), .Y(n60) );
  NAND2X1 U707 ( .A(n166), .B(n171), .Y(n57) );
  NOR2X1 U708 ( .A(n158), .B(n154), .Y(n48) );
  NOR2X1 U709 ( .A(n159), .B(n165), .Y(n51) );
  NAND2X1 U710 ( .A(n159), .B(n165), .Y(n52) );
  NAND2X1 U711 ( .A(n158), .B(n154), .Y(n49) );
  NOR2X1 U712 ( .A(n146), .B(n148), .Y(n37) );
  NOR2X1 U713 ( .A(n153), .B(n149), .Y(n40) );
  NAND2X1 U714 ( .A(n153), .B(n149), .Y(n41) );
  NAND2X1 U715 ( .A(n146), .B(n148), .Y(n38) );
  INVX1 U716 ( .A(n43), .Y(n42) );
  NOR2X1 U717 ( .A(n145), .B(n141), .Y(n32) );
  OAI21XL U718 ( .A0(n41), .A1(n37), .B0(n38), .Y(n36) );
  NOR2X1 U719 ( .A(n40), .B(n37), .Y(n35) );
  NAND2X1 U720 ( .A(n145), .B(n141), .Y(n33) );
  ADDFX2 U721 ( .A(n142), .B(n240), .CI(n251), .CO(n138), .S(n139) );
  OAI22X1 U722 ( .A0(n407), .A1(n313), .B0(n413), .B1(n312), .Y(n240) );
  OAI22X1 U723 ( .A0(n407), .A1(n312), .B0(n413), .B1(n311), .Y(n239) );
  XNOR2X1 U724 ( .A(n425), .B(n389), .Y(n311) );
  XOR2X1 U725 ( .A(n80), .B(n14), .Y(product[10]) );
  NAND2X1 U726 ( .A(n501), .B(n79), .Y(n14) );
  AOI21X1 U727 ( .A0(n85), .A1(n505), .B0(n503), .Y(n80) );
  INVX1 U728 ( .A(n86), .Y(n85) );
  XOR2X1 U729 ( .A(n72), .B(n13), .Y(product[11]) );
  XNOR2X1 U730 ( .A(n69), .B(n12), .Y(product[12]) );
  OAI21XL U731 ( .A0(n72), .A1(n70), .B0(n71), .Y(n69) );
  XNOR2X1 U732 ( .A(n63), .B(n11), .Y(product[13]) );
  NAND2X1 U733 ( .A(n59), .B(n62), .Y(n11) );
  XOR2X1 U734 ( .A(n58), .B(n10), .Y(product[14]) );
  XOR2X1 U735 ( .A(n53), .B(n9), .Y(product[15]) );
  XNOR2X1 U736 ( .A(n50), .B(n8), .Y(product[16]) );
  OAI21XL U737 ( .A0(n53), .A1(n51), .B0(n52), .Y(n50) );
  XOR2X1 U738 ( .A(n42), .B(n7), .Y(product[17]) );
  XNOR2X1 U739 ( .A(n39), .B(n6), .Y(product[18]) );
  OAI21XL U740 ( .A0(n42), .A1(n40), .B0(n41), .Y(n39) );
  XOR2X1 U741 ( .A(n34), .B(n5), .Y(product[19]) );
endmodule


module multiply_WIDTH12_0_DW_mult_tc_11 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n1, n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n26, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n77, n79, n80, n85, n86, n87, n88, n89, n90, n92, n93, n95, n96,
         n97, n98, n103, n104, n106, n111, n112, n113, n115, n119, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n419, n420, n421,
         n422, n423, n424, n425, n426, n427, n428, n429, n430, n442, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505;
  assign n1 = b[0];
  assign n389 = b[11];
  assign n390 = b[10];
  assign n391 = b[9];
  assign n392 = b[8];
  assign n393 = b[7];
  assign n394 = b[6];
  assign n395 = b[5];
  assign n396 = b[4];
  assign n397 = b[3];
  assign n398 = b[2];
  assign n399 = b[1];
  assign n425 = a[11];
  assign n426 = a[9];
  assign n427 = a[7];
  assign n428 = a[5];
  assign n429 = a[3];
  assign n430 = a[1];

  OAI22XL U417 ( .A0(n407), .A1(n312), .B0(n413), .B1(n311), .Y(n239) );
  OAI22XL U418 ( .A0(n407), .A1(n313), .B0(n413), .B1(n312), .Y(n240) );
  OAI22XL U419 ( .A0(n407), .A1(n314), .B0(n413), .B1(n313), .Y(n241) );
  OAI22XL U420 ( .A0(n407), .A1(n316), .B0(n413), .B1(n315), .Y(n243) );
  OAI22XL U421 ( .A0(n411), .A1(n372), .B0(n371), .B1(n417), .Y(n295) );
  OAI22XL U422 ( .A0(n411), .A1(n423), .B0(n417), .B1(n375), .Y(n237) );
  OAI22XL U423 ( .A0(n411), .A1(n373), .B0(n372), .B1(n417), .Y(n296) );
  OAI22XL U424 ( .A0(n411), .A1(n371), .B0(n370), .B1(n417), .Y(n294) );
  OAI22XL U425 ( .A0(n411), .A1(n368), .B0(n367), .B1(n417), .Y(n291) );
  NOR2BXL U426 ( .AN(n1), .B(n417), .Y(n298) );
  AOI21XL U427 ( .A0(n417), .A1(n411), .B0(n363), .Y(n496) );
  OAI22XL U428 ( .A0(n411), .A1(n374), .B0(n373), .B1(n417), .Y(n297) );
  OAI22XL U429 ( .A0(n411), .A1(n369), .B0(n368), .B1(n417), .Y(n292) );
  OAI22XL U430 ( .A0(n411), .A1(n370), .B0(n369), .B1(n417), .Y(n293) );
  OAI22XL U431 ( .A0(n411), .A1(n367), .B0(n366), .B1(n417), .Y(n290) );
  AOI21XL U432 ( .A0(n415), .A1(n409), .B0(n337), .Y(n497) );
  OAI22XL U433 ( .A0(n409), .A1(n338), .B0(n337), .B1(n415), .Y(n150) );
  OAI22XL U434 ( .A0(n409), .A1(n341), .B0(n340), .B1(n415), .Y(n266) );
  OAI22XL U435 ( .A0(n409), .A1(n339), .B0(n338), .B1(n415), .Y(n264) );
  OAI22XL U436 ( .A0(n409), .A1(n342), .B0(n341), .B1(n415), .Y(n267) );
  OAI22XL U437 ( .A0(n409), .A1(n340), .B0(n339), .B1(n415), .Y(n265) );
  NOR2BXL U438 ( .AN(n1), .B(n415), .Y(n274) );
  OAI22XL U439 ( .A0(n409), .A1(n347), .B0(n346), .B1(n415), .Y(n272) );
  OAI22XL U440 ( .A0(n409), .A1(n348), .B0(n347), .B1(n415), .Y(n273) );
  OAI22XL U441 ( .A0(n409), .A1(n345), .B0(n344), .B1(n415), .Y(n270) );
  OAI22XL U442 ( .A0(n409), .A1(n421), .B0(n415), .B1(n349), .Y(n235) );
  OAI22XL U443 ( .A0(n409), .A1(n346), .B0(n345), .B1(n415), .Y(n271) );
  OAI22XL U444 ( .A0(n412), .A1(n424), .B0(n388), .B1(n442), .Y(n238) );
  OAI22XL U445 ( .A0(n412), .A1(n387), .B0(n386), .B1(n442), .Y(n310) );
  OAI22XL U446 ( .A0(n412), .A1(n382), .B0(n381), .B1(n442), .Y(n305) );
  OAI22XL U447 ( .A0(n412), .A1(n384), .B0(n383), .B1(n442), .Y(n307) );
  OAI22XL U448 ( .A0(n412), .A1(n386), .B0(n385), .B1(n442), .Y(n309) );
  OAI22XL U449 ( .A0(n412), .A1(n383), .B0(n382), .B1(n442), .Y(n306) );
  OAI22XL U450 ( .A0(n412), .A1(n385), .B0(n384), .B1(n442), .Y(n308) );
  AOI21XL U451 ( .A0(n442), .A1(n412), .B0(n376), .Y(n499) );
  OAI22XL U452 ( .A0(n412), .A1(n381), .B0(n380), .B1(n442), .Y(n304) );
  CLKBUFX8 U453 ( .A(n429), .Y(n494) );
  NAND2X4 U454 ( .A(n414), .B(n402), .Y(n408) );
  XNOR2X2 U455 ( .A(n494), .B(a[4]), .Y(n416) );
  NAND2X2 U456 ( .A(n416), .B(n404), .Y(n410) );
  XOR2X1 U457 ( .A(n428), .B(a[4]), .Y(n404) );
  CMPR42X1 U458 ( .A(n267), .B(n247), .C(n178), .D(n182), .ICI(n175), .S(n172), 
        .ICO(n170), .CO(n171) );
  NOR2X1 U459 ( .A(n180), .B(n187), .Y(n67) );
  NAND2X1 U460 ( .A(n188), .B(n195), .Y(n71) );
  NAND2X1 U461 ( .A(n172), .B(n179), .Y(n62) );
  NOR2X1 U462 ( .A(n158), .B(n154), .Y(n48) );
  NAND2X1 U463 ( .A(n500), .B(n504), .Y(n74) );
  OAI21XL U464 ( .A0(n67), .A1(n71), .B0(n68), .Y(n66) );
  OAI21XL U465 ( .A0(n56), .A1(n62), .B0(n57), .Y(n55) );
  NOR2X1 U466 ( .A(n56), .B(n61), .Y(n54) );
  AOI21X1 U467 ( .A0(n416), .A1(n410), .B0(n350), .Y(n495) );
  INVX1 U468 ( .A(n495), .Y(n275) );
  AOI21X1 U469 ( .A0(n63), .A1(n54), .B0(n55), .Y(n53) );
  INVX1 U470 ( .A(n64), .Y(n63) );
  INVX1 U471 ( .A(n496), .Y(n287) );
  AOI21X2 U472 ( .A0(n43), .A1(n35), .B0(n36), .Y(n34) );
  AOI22X1 U473 ( .A0(n501), .A1(n111), .B0(n227), .B1(n237), .Y(n106) );
  INVX1 U474 ( .A(n497), .Y(n263) );
  AOI21X1 U475 ( .A0(n63), .A1(n59), .B0(n60), .Y(n58) );
  NAND2X1 U476 ( .A(n406), .B(n442), .Y(n412) );
  AOI21X1 U477 ( .A0(n414), .A1(n408), .B0(n324), .Y(n498) );
  INVX1 U478 ( .A(n498), .Y(n251) );
  OAI21XL U479 ( .A0(n53), .A1(n51), .B0(n52), .Y(n50) );
  NAND2BX1 U480 ( .AN(n32), .B(n33), .Y(n5) );
  INVX1 U481 ( .A(n499), .Y(n299) );
  NAND2BX1 U482 ( .AN(n48), .B(n49), .Y(n8) );
  XOR3X2 U483 ( .A(n31), .B(n140), .C(n139), .Y(product[20]) );
  OAI2BB2X1 U484 ( .B0(n106), .B1(n104), .A0N(n225), .A1N(n226), .Y(n103) );
  NAND2BX1 U485 ( .AN(n70), .B(n71), .Y(n13) );
  NAND2BX1 U486 ( .AN(n56), .B(n57), .Y(n10) );
  NAND2BX1 U487 ( .AN(n40), .B(n41), .Y(n7) );
  AOI22X1 U488 ( .A0(n31), .A1(n505), .B0(n140), .B1(n139), .Y(n26) );
  AOI22X1 U489 ( .A0(n503), .A1(n103), .B0(n221), .B1(n224), .Y(n98) );
  NAND2BX1 U490 ( .AN(n67), .B(n68), .Y(n12) );
  NAND2BX1 U491 ( .AN(n51), .B(n52), .Y(n9) );
  OAI21XL U492 ( .A0(n42), .A1(n40), .B0(n41), .Y(n39) );
  INVX1 U493 ( .A(n43), .Y(n42) );
  XOR2X1 U494 ( .A(n138), .B(n239), .Y(n3) );
  OR2X2 U495 ( .A(n196), .B(n201), .Y(n500) );
  OR2X2 U496 ( .A(n227), .B(n237), .Y(n501) );
  AND2X2 U497 ( .A(n202), .B(n208), .Y(n502) );
  OR2X2 U498 ( .A(n221), .B(n224), .Y(n503) );
  OR2X2 U499 ( .A(n202), .B(n208), .Y(n504) );
  OR2X2 U500 ( .A(n140), .B(n139), .Y(n505) );
  NOR2X2 U501 ( .A(n51), .B(n48), .Y(n46) );
  NOR2X1 U502 ( .A(n159), .B(n165), .Y(n51) );
  NOR2X2 U503 ( .A(n172), .B(n179), .Y(n61) );
  CMPR42X2 U504 ( .A(n248), .B(n192), .C(n185), .D(n190), .ICI(n183), .S(n180), 
        .ICO(n178), .CO(n179) );
  AOI21X2 U505 ( .A0(n55), .A1(n46), .B0(n47), .Y(n45) );
  NOR2X2 U506 ( .A(n166), .B(n171), .Y(n56) );
  OAI21X2 U507 ( .A0(n86), .A1(n74), .B0(n75), .Y(n73) );
  OAI21X2 U508 ( .A0(n44), .A1(n64), .B0(n45), .Y(n43) );
  AOI21X2 U509 ( .A0(n65), .A1(n73), .B0(n66), .Y(n64) );
  OAI21X4 U510 ( .A0(n34), .A1(n32), .B0(n33), .Y(n31) );
  XNOR2X4 U511 ( .A(n427), .B(a[8]), .Y(n414) );
  INVX1 U512 ( .A(n428), .Y(n422) );
  INVX1 U513 ( .A(n494), .Y(n423) );
  NAND2BX1 U514 ( .AN(n1), .B(n494), .Y(n375) );
  NAND2BX1 U515 ( .AN(n1), .B(n430), .Y(n388) );
  INVX1 U516 ( .A(n430), .Y(n424) );
  XNOR2X1 U517 ( .A(n430), .B(n399), .Y(n386) );
  XNOR2X1 U518 ( .A(n430), .B(n396), .Y(n383) );
  XNOR2X1 U519 ( .A(n430), .B(n398), .Y(n385) );
  XNOR2X1 U520 ( .A(n494), .B(n399), .Y(n373) );
  XNOR2X1 U521 ( .A(n430), .B(n397), .Y(n384) );
  XNOR2X1 U522 ( .A(n494), .B(n389), .Y(n363) );
  XNOR2X1 U523 ( .A(n430), .B(n395), .Y(n382) );
  XNOR2X1 U524 ( .A(n494), .B(n397), .Y(n371) );
  XNOR2X1 U525 ( .A(n494), .B(n398), .Y(n372) );
  XNOR2X1 U526 ( .A(n428), .B(n399), .Y(n360) );
  ADDHXL U527 ( .A(n306), .B(n236), .CO(n222), .S(n223) );
  OAI22X1 U528 ( .A0(n410), .A1(n422), .B0(n416), .B1(n362), .Y(n236) );
  NAND2BX1 U529 ( .AN(n1), .B(n428), .Y(n362) );
  NOR2X1 U530 ( .A(n309), .B(n298), .Y(n112) );
  NAND2X1 U531 ( .A(n309), .B(n298), .Y(n113) );
  NAND2X1 U532 ( .A(n310), .B(n238), .Y(n115) );
  XNOR2X1 U533 ( .A(n430), .B(n1), .Y(n387) );
  ADDFX2 U534 ( .A(n286), .B(n307), .CI(n296), .CO(n224), .S(n225) );
  NOR2BX1 U535 ( .AN(n1), .B(n416), .Y(n286) );
  ADDHXL U536 ( .A(n308), .B(n297), .CO(n226), .S(n227) );
  XNOR2X1 U537 ( .A(n494), .B(n1), .Y(n374) );
  NAND2BX1 U538 ( .AN(n1), .B(n427), .Y(n349) );
  XNOR2X1 U539 ( .A(n430), .B(n394), .Y(n381) );
  XNOR2X1 U540 ( .A(n427), .B(n1), .Y(n348) );
  XNOR2X1 U541 ( .A(n494), .B(n396), .Y(n370) );
  XNOR2X1 U542 ( .A(n428), .B(n398), .Y(n359) );
  NAND2BX1 U543 ( .AN(n1), .B(n426), .Y(n336) );
  XNOR2X1 U544 ( .A(n426), .B(n1), .Y(n335) );
  XNOR2X1 U545 ( .A(n427), .B(n398), .Y(n346) );
  XNOR2X1 U546 ( .A(n430), .B(n392), .Y(n379) );
  XNOR2X1 U547 ( .A(n430), .B(n393), .Y(n380) );
  XNOR2X1 U548 ( .A(n427), .B(n399), .Y(n347) );
  XNOR2X1 U549 ( .A(n426), .B(n399), .Y(n334) );
  XNOR2X1 U550 ( .A(n427), .B(n397), .Y(n345) );
  XNOR2X1 U551 ( .A(n426), .B(n396), .Y(n331) );
  XNOR2X1 U552 ( .A(n427), .B(n396), .Y(n344) );
  XNOR2X1 U553 ( .A(n425), .B(n1), .Y(n322) );
  XNOR2X1 U554 ( .A(n430), .B(n389), .Y(n376) );
  NAND2BX1 U555 ( .AN(n1), .B(n425), .Y(n323) );
  XNOR2X1 U556 ( .A(n494), .B(n390), .Y(n364) );
  XNOR2X1 U557 ( .A(n427), .B(n395), .Y(n343) );
  XNOR2X1 U558 ( .A(n494), .B(n391), .Y(n365) );
  XNOR2X1 U559 ( .A(n428), .B(n392), .Y(n353) );
  OAI22X1 U560 ( .A0(n408), .A1(n331), .B0(n330), .B1(n414), .Y(n257) );
  XNOR2X1 U561 ( .A(n426), .B(n395), .Y(n330) );
  OAI22X1 U562 ( .A0(n411), .A1(n364), .B0(n363), .B1(n417), .Y(n176) );
  XNOR2X1 U563 ( .A(n425), .B(n396), .Y(n318) );
  XNOR2X1 U564 ( .A(n426), .B(n394), .Y(n329) );
  XNOR2X1 U565 ( .A(n428), .B(n389), .Y(n350) );
  XNOR2X1 U566 ( .A(n425), .B(n395), .Y(n317) );
  XNOR2X1 U567 ( .A(n427), .B(n389), .Y(n337) );
  CMPR42X1 U568 ( .A(n274), .B(n305), .C(n294), .D(n284), .ICI(n222), .S(n219), 
        .ICO(n217), .CO(n218) );
  OAI22X1 U569 ( .A0(n410), .A1(n360), .B0(n359), .B1(n416), .Y(n284) );
  ADDFX2 U570 ( .A(n295), .B(n285), .CI(n223), .CO(n220), .S(n221) );
  OAI22X1 U571 ( .A0(n410), .A1(n361), .B0(n360), .B1(n416), .Y(n285) );
  XNOR2X1 U572 ( .A(n428), .B(n1), .Y(n361) );
  OAI21XL U573 ( .A0(n112), .A1(n115), .B0(n113), .Y(n111) );
  NOR2X1 U574 ( .A(n225), .B(n226), .Y(n104) );
  XNOR2X1 U575 ( .A(n428), .B(n396), .Y(n357) );
  XNOR2X1 U576 ( .A(n494), .B(n395), .Y(n369) );
  XNOR2X1 U577 ( .A(n428), .B(n397), .Y(n358) );
  ADDHXL U578 ( .A(n304), .B(n235), .CO(n215), .S(n216) );
  INVX1 U579 ( .A(n427), .Y(n421) );
  CMPR42X1 U580 ( .A(n293), .B(n273), .C(n283), .D(n216), .ICI(n217), .S(n214), 
        .ICO(n212), .CO(n213) );
  OAI22X1 U581 ( .A0(n410), .A1(n359), .B0(n358), .B1(n416), .Y(n283) );
  ADDHXL U582 ( .A(n302), .B(n234), .CO(n205), .S(n206) );
  OAI22X1 U583 ( .A0(n412), .A1(n379), .B0(n378), .B1(n442), .Y(n302) );
  OAI22X1 U584 ( .A0(n408), .A1(n420), .B0(n414), .B1(n336), .Y(n234) );
  INVX1 U585 ( .A(n426), .Y(n420) );
  ADDFX2 U586 ( .A(n271), .B(n261), .CI(n281), .CO(n203), .S(n204) );
  OAI22X1 U587 ( .A0(n410), .A1(n357), .B0(n356), .B1(n416), .Y(n281) );
  OAI22X1 U588 ( .A0(n408), .A1(n335), .B0(n334), .B1(n414), .Y(n261) );
  XNOR2X1 U589 ( .A(n494), .B(n394), .Y(n368) );
  ADDFX2 U590 ( .A(n262), .B(n303), .CI(n272), .CO(n210), .S(n211) );
  OAI22X1 U591 ( .A0(n412), .A1(n380), .B0(n379), .B1(n442), .Y(n303) );
  NOR2BX1 U592 ( .AN(n1), .B(n414), .Y(n262) );
  XNOR2X1 U593 ( .A(n428), .B(n395), .Y(n356) );
  XNOR2X1 U594 ( .A(n494), .B(n393), .Y(n367) );
  XNOR2X1 U595 ( .A(n430), .B(n390), .Y(n377) );
  XNOR2X1 U596 ( .A(n430), .B(n391), .Y(n378) );
  XOR2X1 U597 ( .A(n430), .B(a[0]), .Y(n406) );
  CLKINVX3 U598 ( .A(a[0]), .Y(n442) );
  XNOR2X1 U599 ( .A(n494), .B(n392), .Y(n366) );
  XNOR2X2 U600 ( .A(n430), .B(a[2]), .Y(n417) );
  NAND2X2 U601 ( .A(n417), .B(n405), .Y(n411) );
  XOR2X1 U602 ( .A(n494), .B(a[2]), .Y(n405) );
  XNOR2X1 U603 ( .A(n426), .B(n398), .Y(n333) );
  XNOR2X1 U604 ( .A(n428), .B(n394), .Y(n355) );
  XNOR2X1 U605 ( .A(n426), .B(n397), .Y(n332) );
  XNOR2X1 U606 ( .A(n428), .B(n393), .Y(n354) );
  CMPR42X1 U607 ( .A(n250), .B(n260), .C(n270), .D(n205), .ICI(n203), .S(n199), 
        .ICO(n197), .CO(n198) );
  NOR2BX1 U608 ( .AN(n1), .B(n413), .Y(n250) );
  OAI22X1 U609 ( .A0(n408), .A1(n334), .B0(n333), .B1(n414), .Y(n260) );
  OAI22X1 U610 ( .A0(n408), .A1(n332), .B0(n331), .B1(n414), .Y(n258) );
  OAI22X1 U611 ( .A0(n410), .A1(n354), .B0(n353), .B1(n416), .Y(n278) );
  XNOR2X1 U612 ( .A(n425), .B(n399), .Y(n321) );
  CMPR42X1 U613 ( .A(n269), .B(n249), .C(n289), .D(n194), .ICI(n197), .S(n191), 
        .ICO(n189), .CO(n190) );
  OAI22X1 U614 ( .A0(n411), .A1(n366), .B0(n365), .B1(n417), .Y(n289) );
  OAI22X1 U615 ( .A0(n407), .A1(n322), .B0(n413), .B1(n321), .Y(n249) );
  OAI22X1 U616 ( .A0(n409), .A1(n344), .B0(n343), .B1(n415), .Y(n269) );
  ADDHXL U617 ( .A(n300), .B(n233), .CO(n192), .S(n193) );
  OAI22X1 U618 ( .A0(n412), .A1(n377), .B0(n376), .B1(n442), .Y(n300) );
  OAI22X1 U619 ( .A0(n407), .A1(n419), .B0(n413), .B1(n323), .Y(n233) );
  INVX1 U620 ( .A(n425), .Y(n419) );
  XNOR2X1 U621 ( .A(n427), .B(n394), .Y(n342) );
  XNOR2X1 U622 ( .A(n425), .B(n398), .Y(n320) );
  CMPR42X1 U623 ( .A(n268), .B(n288), .C(n299), .D(n189), .ICI(n186), .S(n183), 
        .ICO(n181), .CO(n182) );
  OAI22X1 U624 ( .A0(n411), .A1(n365), .B0(n364), .B1(n417), .Y(n288) );
  OAI22X1 U625 ( .A0(n409), .A1(n343), .B0(n342), .B1(n415), .Y(n268) );
  XNOR2X1 U626 ( .A(n425), .B(n397), .Y(n319) );
  XNOR2X1 U627 ( .A(n428), .B(n391), .Y(n352) );
  XNOR2X1 U628 ( .A(n427), .B(n393), .Y(n341) );
  CMPR42X1 U629 ( .A(n257), .B(n277), .C(n177), .D(n184), .ICI(n181), .S(n175), 
        .ICO(n173), .CO(n174) );
  OR2X2 U630 ( .A(n278), .B(n258), .Y(n184) );
  INVX1 U631 ( .A(n176), .Y(n177) );
  OAI22X1 U632 ( .A0(n410), .A1(n353), .B0(n352), .B1(n416), .Y(n277) );
  XNOR2X1 U633 ( .A(n427), .B(n392), .Y(n340) );
  XNOR2X1 U634 ( .A(n428), .B(n390), .Y(n351) );
  CMPR42X1 U635 ( .A(n246), .B(n176), .C(n256), .D(n287), .ICI(n173), .S(n169), 
        .ICO(n167), .CO(n168) );
  OAI22X1 U636 ( .A0(n408), .A1(n330), .B0(n329), .B1(n414), .Y(n256) );
  OAI22X1 U637 ( .A0(n407), .A1(n319), .B0(n413), .B1(n318), .Y(n246) );
  OAI22X1 U638 ( .A0(n410), .A1(n351), .B0(n350), .B1(n416), .Y(n162) );
  XNOR2X1 U639 ( .A(n426), .B(n393), .Y(n328) );
  XNOR2X1 U640 ( .A(n427), .B(n391), .Y(n339) );
  XNOR2X1 U641 ( .A(n427), .B(n390), .Y(n338) );
  ADDFX2 U642 ( .A(n245), .B(n255), .CI(n265), .CO(n160), .S(n161) );
  OAI22X1 U643 ( .A0(n408), .A1(n329), .B0(n328), .B1(n414), .Y(n255) );
  OAI22X1 U644 ( .A0(n407), .A1(n318), .B0(n413), .B1(n317), .Y(n245) );
  XNOR2X1 U645 ( .A(n426), .B(n392), .Y(n327) );
  XNOR2X1 U646 ( .A(n425), .B(n394), .Y(n316) );
  ADDFX2 U647 ( .A(n244), .B(n162), .CI(n275), .CO(n155), .S(n156) );
  OAI22X1 U648 ( .A0(n407), .A1(n317), .B0(n413), .B1(n316), .Y(n244) );
  OAI21XL U649 ( .A0(n52), .A1(n48), .B0(n49), .Y(n47) );
  XNOR2X2 U650 ( .A(n428), .B(a[6]), .Y(n415) );
  NAND2X2 U651 ( .A(n415), .B(n403), .Y(n409) );
  XOR2X1 U652 ( .A(n427), .B(a[6]), .Y(n403) );
  XNOR2X1 U653 ( .A(n426), .B(n391), .Y(n326) );
  XNOR2X1 U654 ( .A(n425), .B(n393), .Y(n315) );
  XNOR2X1 U655 ( .A(n426), .B(n390), .Y(n325) );
  XNOR2X1 U656 ( .A(n425), .B(n392), .Y(n314) );
  NAND2X1 U657 ( .A(n209), .B(n213), .Y(n90) );
  NAND2X1 U658 ( .A(n214), .B(n218), .Y(n93) );
  NOR2X1 U659 ( .A(n209), .B(n213), .Y(n89) );
  NOR2X1 U660 ( .A(n214), .B(n218), .Y(n92) );
  NOR2X1 U661 ( .A(n219), .B(n220), .Y(n96) );
  NAND2X1 U662 ( .A(n219), .B(n220), .Y(n97) );
  CMPR42X1 U663 ( .A(n292), .B(n282), .C(n215), .D(n212), .ICI(n211), .S(n209), 
        .ICO(n207), .CO(n208) );
  OAI22X1 U664 ( .A0(n410), .A1(n358), .B0(n357), .B1(n416), .Y(n282) );
  CMPR42X1 U665 ( .A(n291), .B(n206), .C(n210), .D(n204), .ICI(n207), .S(n202), 
        .ICO(n200), .CO(n201) );
  CMPR42X1 U666 ( .A(n301), .B(n280), .C(n290), .D(n200), .ICI(n199), .S(n196), 
        .ICO(n194), .CO(n195) );
  OAI22X1 U667 ( .A0(n412), .A1(n378), .B0(n377), .B1(n442), .Y(n301) );
  OAI22X1 U668 ( .A0(n410), .A1(n356), .B0(n355), .B1(n416), .Y(n280) );
  CMPR42X1 U669 ( .A(n279), .B(n259), .C(n193), .D(n198), .ICI(n191), .S(n188), 
        .ICO(n186), .CO(n187) );
  OAI22X1 U670 ( .A0(n410), .A1(n355), .B0(n354), .B1(n416), .Y(n279) );
  OAI22X1 U671 ( .A0(n408), .A1(n333), .B0(n332), .B1(n414), .Y(n259) );
  AOI21X1 U672 ( .A0(n500), .A1(n502), .B0(n77), .Y(n75) );
  INVX1 U673 ( .A(n79), .Y(n77) );
  OAI22X1 U674 ( .A0(n407), .A1(n321), .B0(n413), .B1(n320), .Y(n248) );
  XNOR2X1 U675 ( .A(n278), .B(n258), .Y(n185) );
  OAI22X1 U676 ( .A0(n407), .A1(n320), .B0(n413), .B1(n319), .Y(n247) );
  NOR2X1 U677 ( .A(n67), .B(n70), .Y(n65) );
  CMPR42X1 U678 ( .A(n276), .B(n266), .C(n170), .D(n174), .ICI(n169), .S(n166), 
        .ICO(n164), .CO(n165) );
  OAI22X1 U679 ( .A0(n410), .A1(n352), .B0(n351), .B1(n416), .Y(n276) );
  CMPR42X1 U680 ( .A(n163), .B(n167), .C(n161), .D(n168), .ICI(n164), .S(n159), 
        .ICO(n157), .CO(n158) );
  INVX1 U681 ( .A(n162), .Y(n163) );
  CMPR42X1 U682 ( .A(n264), .B(n254), .C(n160), .D(n156), .ICI(n157), .S(n154), 
        .ICO(n152), .CO(n153) );
  OAI22X1 U683 ( .A0(n408), .A1(n328), .B0(n327), .B1(n414), .Y(n254) );
  CMPR42X1 U684 ( .A(n253), .B(n243), .C(n151), .D(n155), .ICI(n152), .S(n149), 
        .ICO(n147), .CO(n148) );
  INVX1 U685 ( .A(n150), .Y(n151) );
  OAI22X1 U686 ( .A0(n408), .A1(n327), .B0(n326), .B1(n414), .Y(n253) );
  NAND2X1 U687 ( .A(n54), .B(n46), .Y(n44) );
  CMPR42X1 U688 ( .A(n150), .B(n242), .C(n252), .D(n263), .ICI(n147), .S(n146), 
        .ICO(n144), .CO(n145) );
  OAI22X1 U689 ( .A0(n408), .A1(n326), .B0(n325), .B1(n414), .Y(n252) );
  OAI22X1 U690 ( .A0(n407), .A1(n315), .B0(n413), .B1(n314), .Y(n242) );
  XNOR2X1 U691 ( .A(n426), .B(n389), .Y(n324) );
  OAI22X1 U692 ( .A0(n408), .A1(n325), .B0(n324), .B1(n414), .Y(n142) );
  XNOR2X1 U693 ( .A(n425), .B(n391), .Y(n313) );
  XOR2X1 U694 ( .A(n426), .B(a[8]), .Y(n402) );
  XNOR2X2 U695 ( .A(n426), .B(a[10]), .Y(n413) );
  NAND2X2 U696 ( .A(n413), .B(n401), .Y(n407) );
  XOR2X1 U697 ( .A(n425), .B(a[10]), .Y(n401) );
  XNOR2X1 U698 ( .A(n425), .B(n390), .Y(n312) );
  ADDFX2 U699 ( .A(n241), .B(n143), .CI(n144), .CO(n140), .S(n141) );
  INVX1 U700 ( .A(n142), .Y(n143) );
  NAND2X1 U701 ( .A(n196), .B(n201), .Y(n79) );
  AOI21X1 U702 ( .A0(n87), .A1(n95), .B0(n88), .Y(n86) );
  OAI21XL U703 ( .A0(n98), .A1(n96), .B0(n97), .Y(n95) );
  NOR2X1 U704 ( .A(n89), .B(n92), .Y(n87) );
  OAI21XL U705 ( .A0(n89), .A1(n93), .B0(n90), .Y(n88) );
  NOR2X1 U706 ( .A(n188), .B(n195), .Y(n70) );
  NAND2X1 U707 ( .A(n180), .B(n187), .Y(n68) );
  INVX1 U708 ( .A(n73), .Y(n72) );
  INVX1 U709 ( .A(n61), .Y(n59) );
  INVX1 U710 ( .A(n62), .Y(n60) );
  NAND2X1 U711 ( .A(n166), .B(n171), .Y(n57) );
  NAND2X1 U712 ( .A(n159), .B(n165), .Y(n52) );
  NAND2X1 U713 ( .A(n158), .B(n154), .Y(n49) );
  NOR2X1 U714 ( .A(n146), .B(n148), .Y(n37) );
  NOR2X1 U715 ( .A(n153), .B(n149), .Y(n40) );
  NAND2X1 U716 ( .A(n153), .B(n149), .Y(n41) );
  NAND2X1 U717 ( .A(n146), .B(n148), .Y(n38) );
  NOR2X1 U718 ( .A(n145), .B(n141), .Y(n32) );
  OAI21XL U719 ( .A0(n41), .A1(n37), .B0(n38), .Y(n36) );
  NOR2X1 U720 ( .A(n40), .B(n37), .Y(n35) );
  NAND2X1 U721 ( .A(n145), .B(n141), .Y(n33) );
  ADDFX2 U722 ( .A(n142), .B(n240), .CI(n251), .CO(n138), .S(n139) );
  XNOR2X1 U723 ( .A(n425), .B(n389), .Y(n311) );
  XOR2X1 U724 ( .A(n80), .B(n14), .Y(product[10]) );
  NAND2X1 U725 ( .A(n500), .B(n79), .Y(n14) );
  AOI21X1 U726 ( .A0(n85), .A1(n504), .B0(n502), .Y(n80) );
  INVX1 U727 ( .A(n86), .Y(n85) );
  XOR2X1 U728 ( .A(n72), .B(n13), .Y(product[11]) );
  XNOR2X1 U729 ( .A(n69), .B(n12), .Y(product[12]) );
  OAI21XL U730 ( .A0(n72), .A1(n70), .B0(n71), .Y(n69) );
  XNOR2X1 U731 ( .A(n63), .B(n11), .Y(product[13]) );
  NAND2X1 U732 ( .A(n59), .B(n62), .Y(n11) );
  XOR2X1 U733 ( .A(n58), .B(n10), .Y(product[14]) );
  XOR2X1 U734 ( .A(n53), .B(n9), .Y(product[15]) );
  XNOR2X1 U735 ( .A(n50), .B(n8), .Y(product[16]) );
  XOR2X1 U736 ( .A(n42), .B(n7), .Y(product[17]) );
  XNOR2X1 U737 ( .A(n39), .B(n6), .Y(product[18]) );
  NAND2X1 U738 ( .A(n119), .B(n38), .Y(n6) );
  INVX1 U739 ( .A(n37), .Y(n119) );
  XOR2X1 U740 ( .A(n34), .B(n5), .Y(product[19]) );
  XOR2X1 U741 ( .A(n26), .B(n3), .Y(product[21]) );
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
  DFFHQX2 \sub_br_bi_reg[11]  ( .D(N71), .CK(clk), .Q(sub_br_bi[11]) );
  DFFHQX1 \sub_br_bi_reg[10]  ( .D(N70), .CK(clk), .Q(sub_br_bi[10]) );
  DFFHQX1 \sub_br_bi_reg[8]  ( .D(N68), .CK(clk), .Q(sub_br_bi[8]) );
  DFFHQX1 \sub_br_bi_reg[6]  ( .D(N66), .CK(clk), .Q(sub_br_bi[6]) );
  DFFHQX1 \sub_br_bi_reg[4]  ( .D(N64), .CK(clk), .Q(sub_br_bi[4]) );
  DFFHQX2 \sub_br_bi_reg[3]  ( .D(N63), .CK(clk), .Q(sub_br_bi[3]) );
  DFFHQX1 \sub_br_bi_reg[2]  ( .D(N62), .CK(clk), .Q(sub_br_bi[2]) );
  DFFHQX2 \sub_br_bi_reg[1]  ( .D(N61), .CK(clk), .Q(sub_br_bi[1]) );
  DFFHQX1 \sub_br_bi_reg[0]  ( .D(N60), .CK(clk), .Q(sub_br_bi[0]) );
  DFFHQX2 \add_br_bi_reg[11]  ( .D(N83), .CK(clk), .Q(add_br_bi[11]) );
  DFFHQX1 \add_br_bi_reg[10]  ( .D(N82), .CK(clk), .Q(add_br_bi[10]) );
  DFFHQX1 \add_br_bi_reg[8]  ( .D(N80), .CK(clk), .Q(add_br_bi[8]) );
  DFFHQX1 \add_br_bi_reg[6]  ( .D(N78), .CK(clk), .Q(add_br_bi[6]) );
  DFFHQX1 \add_br_bi_reg[4]  ( .D(N76), .CK(clk), .Q(add_br_bi[4]) );
  DFFHQX2 \add_br_bi_reg[3]  ( .D(N75), .CK(clk), .Q(add_br_bi[3]) );
  DFFHQX1 \add_br_bi_reg[2]  ( .D(N74), .CK(clk), .Q(add_br_bi[2]) );
  DFFHQX1 \add_br_bi_reg[0]  ( .D(N72), .CK(clk), .Q(add_br_bi[0]) );
  DFFHQX2 \sub_ar_ai_reg[11]  ( .D(N35), .CK(clk), .Q(sub_ar_ai[11]) );
  DFFHQX1 \sub_ar_ai_reg[10]  ( .D(N34), .CK(clk), .Q(sub_ar_ai[10]) );
  DFFHQX2 \sub_ar_ai_reg[9]  ( .D(N33), .CK(clk), .Q(sub_ar_ai[9]) );
  DFFHQX1 \sub_ar_ai_reg[8]  ( .D(N32), .CK(clk), .Q(sub_ar_ai[8]) );
  DFFHQX1 \sub_ar_ai_reg[6]  ( .D(N30), .CK(clk), .Q(sub_ar_ai[6]) );
  DFFHQX1 \sub_ar_ai_reg[4]  ( .D(N28), .CK(clk), .Q(sub_ar_ai[4]) );
  DFFHQX2 \sub_ar_ai_reg[3]  ( .D(N27), .CK(clk), .Q(sub_ar_ai[3]) );
  DFFHQX1 \sub_ar_ai_reg[2]  ( .D(N26), .CK(clk), .Q(sub_ar_ai[2]) );
  DFFHQX2 \sub_ar_ai_reg[1]  ( .D(N25), .CK(clk), .Q(sub_ar_ai[1]) );
  DFFHQX1 \sub_ar_ai_reg[0]  ( .D(N24), .CK(clk), .Q(sub_ar_ai[0]) );
  DFFHQX1 \md_reg[21]  ( .D(N95), .CK(clk), .Q(md[21]) );
  DFFHQX1 \md_reg[20]  ( .D(N94), .CK(clk), .Q(md[20]) );
  DFFHQX1 \md_reg[19]  ( .D(N93), .CK(clk), .Q(md[19]) );
  DFFHQX1 \md_reg[18]  ( .D(N92), .CK(clk), .Q(md[18]) );
  DFFHQX1 \md_reg[17]  ( .D(N91), .CK(clk), .Q(md[17]) );
  DFFHQX1 \md_reg[16]  ( .D(N90), .CK(clk), .Q(md[16]) );
  DFFHQX1 \md_reg[15]  ( .D(N89), .CK(clk), .Q(md[15]) );
  DFFHQX1 \md_reg[14]  ( .D(N88), .CK(clk), .Q(md[14]) );
  DFFHQX1 \md_reg[13]  ( .D(N87), .CK(clk), .Q(md[13]) );
  DFFHQX1 \md_reg[12]  ( .D(N86), .CK(clk), .Q(md[12]) );
  DFFHQX1 \md_reg[11]  ( .D(N85), .CK(clk), .Q(md[11]) );
  DFFHQX1 \md_reg[10]  ( .D(N84), .CK(clk), .Q(md[10]) );
  DFFHQX1 \ma_reg[21]  ( .D(N107), .CK(clk), .Q(ma[21]) );
  DFFHQX1 \ma_reg[20]  ( .D(N106), .CK(clk), .Q(ma[20]) );
  DFFHQX1 \ma_reg[19]  ( .D(N105), .CK(clk), .Q(ma[19]) );
  DFFHQX1 \ma_reg[18]  ( .D(N104), .CK(clk), .Q(ma[18]) );
  DFFHQX1 \ma_reg[17]  ( .D(N103), .CK(clk), .Q(ma[17]) );
  DFFHQX1 \ma_reg[16]  ( .D(N102), .CK(clk), .Q(ma[16]) );
  DFFHQX1 \ma_reg[15]  ( .D(N101), .CK(clk), .Q(ma[15]) );
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
  DFFHQX1 \mb_reg[16]  ( .D(N114), .CK(clk), .Q(mb[16]) );
  DFFHQX1 \mb_reg[15]  ( .D(N113), .CK(clk), .Q(mb[15]) );
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
  DFFHQX1 \temp1_b_im_reg[3]  ( .D(b_im[3]), .CK(clk), .Q(temp1_b_im[3]) );
  DFFHQX1 \temp1_b_im_reg[2]  ( .D(b_im[2]), .CK(clk), .Q(temp1_b_im[2]) );
  DFFHQX1 \temp1_b_im_reg[1]  ( .D(b_im[1]), .CK(clk), .Q(temp1_b_im[1]) );
  DFFHQX1 \temp1_b_im_reg[5]  ( .D(b_im[5]), .CK(clk), .Q(temp1_b_im[5]) );
  DFFHQX1 \temp1_b_im_reg[4]  ( .D(b_im[4]), .CK(clk), .Q(temp1_b_im[4]) );
  DFFHQX1 \temp1_a_re_reg[8]  ( .D(a_re[8]), .CK(clk), .Q(temp1_a_re[8]) );
  DFFHQX1 \temp1_a_re_reg[7]  ( .D(a_re[7]), .CK(clk), .Q(temp1_a_re[7]) );
  DFFHQX1 \temp1_a_re_reg[6]  ( .D(a_re[6]), .CK(clk), .Q(temp1_a_re[6]) );
  DFFHQX1 \temp1_a_re_reg[3]  ( .D(a_re[3]), .CK(clk), .Q(temp1_a_re[3]) );
  DFFHQX1 \temp1_a_re_reg[2]  ( .D(a_re[2]), .CK(clk), .Q(temp1_a_re[2]) );
  DFFHQX1 \temp1_a_re_reg[1]  ( .D(a_re[1]), .CK(clk), .Q(temp1_a_re[1]) );
  DFFHQX1 \temp1_a_re_reg[5]  ( .D(a_re[5]), .CK(clk), .Q(temp1_a_re[5]) );
  DFFHQX1 \temp1_a_re_reg[4]  ( .D(a_re[4]), .CK(clk), .Q(temp1_a_re[4]) );
  DFFHQX1 \temp1_a_im_reg[8]  ( .D(a_im[8]), .CK(clk), .Q(temp1_a_im[8]) );
  DFFHQX1 \temp1_a_im_reg[7]  ( .D(a_im[7]), .CK(clk), .Q(temp1_a_im[7]) );
  DFFHQX1 \temp1_a_im_reg[6]  ( .D(a_im[6]), .CK(clk), .Q(temp1_a_im[6]) );
  DFFHQX1 \temp1_a_im_reg[3]  ( .D(a_im[3]), .CK(clk), .Q(temp1_a_im[3]) );
  DFFHQX1 \temp1_a_im_reg[2]  ( .D(a_im[2]), .CK(clk), .Q(temp1_a_im[2]) );
  DFFHQX1 \temp1_a_im_reg[1]  ( .D(a_im[1]), .CK(clk), .Q(temp1_a_im[1]) );
  DFFHQX1 \temp1_a_im_reg[5]  ( .D(a_im[5]), .CK(clk), .Q(temp1_a_im[5]) );
  DFFHQX1 \temp1_a_im_reg[4]  ( .D(a_im[4]), .CK(clk), .Q(temp1_a_im[4]) );
  DFFHQX4 \sub_ar_ai_reg[7]  ( .D(N31), .CK(clk), .Q(sub_ar_ai[7]) );
  DFFHQX4 \sub_ar_ai_reg[5]  ( .D(N29), .CK(clk), .Q(sub_ar_ai[5]) );
  DFFHQX4 \add_br_bi_reg[1]  ( .D(N73), .CK(clk), .Q(add_br_bi[1]) );
  DFFHQX4 \add_br_bi_reg[5]  ( .D(N77), .CK(clk), .Q(add_br_bi[5]) );
  DFFHQX4 \sub_br_bi_reg[5]  ( .D(N65), .CK(clk), .Q(sub_br_bi[5]) );
  DFFHQX4 \add_br_bi_reg[9]  ( .D(N81), .CK(clk), .Q(add_br_bi[9]) );
  DFFHQX4 \sub_br_bi_reg[9]  ( .D(N69), .CK(clk), .Q(sub_br_bi[9]) );
  DFFHQX1 \temp1_a_im_reg[0]  ( .D(a_im[0]), .CK(clk), .Q(temp1_a_im[0]) );
  DFFHQX2 \add_br_bi_reg[7]  ( .D(N79), .CK(clk), .Q(add_br_bi[7]) );
  DFFHQX2 \sub_br_bi_reg[7]  ( .D(N67), .CK(clk), .Q(sub_br_bi[7]) );
  DFFHQX1 \temp1_b_im_reg[0]  ( .D(b_im[0]), .CK(clk), .Q(temp1_b_im[0]) );
  DFFHQX1 \temp1_a_re_reg[0]  ( .D(a_re[0]), .CK(clk), .Q(temp1_a_re[0]) );
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
  AOI22X1 U6 ( .A0(dout_im[1]), .A1(en), .B0(temp4_im[1]), .B1(n2), .Y(n3) );
  INVX1 U7 ( .A(n4), .Y(N96) );
  AOI22X1 U8 ( .A0(dout_im[2]), .A1(en), .B0(temp4_im[2]), .B1(n2), .Y(n4) );
  INVX1 U9 ( .A(n5), .Y(N95) );
  AOI22X1 U10 ( .A0(dout_im[3]), .A1(en), .B0(temp4_im[3]), .B1(n2), .Y(n5) );
  INVX1 U11 ( .A(n6), .Y(N94) );
  AOI22X1 U12 ( .A0(dout_im[4]), .A1(en), .B0(temp4_im[4]), .B1(n2), .Y(n6) );
  INVX1 U13 ( .A(n7), .Y(N93) );
  AOI22X1 U14 ( .A0(dout_im[5]), .A1(en), .B0(temp4_im[5]), .B1(n2), .Y(n7) );
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
  DFFX2 en_reg ( .D(\temp4_en[0] ), .CK(clk), .Q(en), .QN(n2) );
  CLKINVX3 U53 ( .A(sel), .Y(n27) );
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

  signal_control3_DW01_inc_0_DW01_inc_7 add_41 ( .A(cnt), .SUM({N16, N15, N14, 
        N13, N12, N11, N10}) );
  DFFRHQX1 \cnt_reg[0]  ( .D(n46), .CK(clk), .RN(n47), .Q(cnt[0]) );
  DFFRHQX1 \cnt_reg[1]  ( .D(n45), .CK(clk), .RN(n47), .Q(cnt[1]) );
  DFFRHQX1 \cnt_reg[2]  ( .D(n44), .CK(clk), .RN(n47), .Q(cnt[2]) );
  DFFRHQX1 \cnt_reg[3]  ( .D(n43), .CK(clk), .RN(n47), .Q(cnt[3]) );
  DFFRHQX1 \cnt_reg[4]  ( .D(n42), .CK(clk), .RN(n47), .Q(cnt[4]) );
  DFFRHQX1 \cnt_reg[5]  ( .D(n41), .CK(clk), .RN(n47), .Q(cnt[5]) );
  DFFRHQX1 \cnt_reg[6]  ( .D(n40), .CK(clk), .RN(n47), .Q(cnt[6]) );
  DFFRHQX1 \cnt3_reg[0]  ( .D(N38), .CK(clk), .RN(n47), .Q(N6) );
  DFFRHQX1 \cnt3_reg[1]  ( .D(N39), .CK(clk), .RN(n47), .Q(N7) );
  DFFRHQX2 do_en_r_reg ( .D(N44), .CK(clk), .RN(n47), .Q(do_en) );
  DFFNRX1 start_count_reg ( .D(n48), .CKN(clk), .RN(n47), .Q(n1), .QN(n26) );
  DFFRHQX1 \cnt2_reg[0]  ( .D(N30), .CK(clk), .RN(n47), .Q(N4) );
  DFFRHQX1 \cnt2_reg[1]  ( .D(N31), .CK(clk), .RN(n47), .Q(N5) );
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
  DFFRHQX1 \temp1_im_reg[0]  ( .D(x_im[0]), .CK(clk), .RN(n1), .Q(y_im[0]) );
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
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3,
         n4;
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
  AOI22X1 U18 ( .A0(n4), .A1(high_sum2[5]), .B0(carry), .B1(high_sum1[5]), .Y(
        n3) );
  INVX1 U21 ( .A(carry), .Y(n4) );
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
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
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
  MX2X1 U3 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U4 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U5 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U6 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U7 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  OR2X2 U8 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U9 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U10 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U12 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_6 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3,
         n4;
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
  AOI22X1 U18 ( .A0(n4), .A1(high_sum2[5]), .B0(carry), .B1(high_sum1[5]), .Y(
        n3) );
  INVX1 U21 ( .A(carry), .Y(n4) );
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
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
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
  MX2X1 U3 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  MX2X1 U4 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U5 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U6 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U7 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  OR2X2 U8 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U9 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U10 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U12 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
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
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
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
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
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
endmodule


module sdfunit5_WIDTH12_DEPTH1_DW01_inc_0_DW01_inc_15 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
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
  wire   n18, N6, N7, N8, N9, N10, N11, N12, N25, N30, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17;
  wire   [6:0] cnt;

  DFFRHQX4 cnt2_reg ( .D(N25), .CK(clk), .RN(n33), .Q(sel) );
  signal_control4_DW01_inc_0_DW01_inc_6 add_35 ( .A(cnt), .SUM({N12, N11, N10, 
        N9, N8, N7, N6}) );
  DFFRHQX1 \cnt_reg[0]  ( .D(n32), .CK(clk), .RN(n33), .Q(cnt[0]) );
  DFFRHQX1 \cnt_reg[1]  ( .D(n31), .CK(clk), .RN(n33), .Q(cnt[1]) );
  DFFRHQX1 \cnt_reg[2]  ( .D(n30), .CK(clk), .RN(n33), .Q(cnt[2]) );
  DFFRHQX1 \cnt_reg[3]  ( .D(n29), .CK(clk), .RN(n33), .Q(cnt[3]) );
  DFFRHQX1 \cnt_reg[4]  ( .D(n28), .CK(clk), .RN(n33), .Q(cnt[4]) );
  DFFRHQX1 \cnt_reg[5]  ( .D(n27), .CK(clk), .RN(n33), .Q(cnt[5]) );
  DFFRHQX1 \cnt_reg[6]  ( .D(n26), .CK(clk), .RN(n33), .Q(cnt[6]) );
  DFFRHQX1 do_en_r_reg ( .D(N30), .CK(clk), .RN(n33), .Q(n18) );
  DFFNRX1 start_count_reg ( .D(n34), .CKN(clk), .RN(n33), .Q(n2), .QN(n17) );
  BUFX20 U3 ( .A(n18), .Y(do_en) );
  NAND2BX1 U4 ( .AN(di_en), .B(n17), .Y(n34) );
  INVX1 U5 ( .A(reset), .Y(n33) );
  OAI2BB2X1 U6 ( .B0(n2), .B1(n3), .A0N(N6), .A1N(n4), .Y(n32) );
  OAI2BB2X1 U7 ( .B0(n2), .B1(n5), .A0N(N7), .A1N(n4), .Y(n31) );
  INVX1 U8 ( .A(n6), .Y(n30) );
  AOI22X1 U9 ( .A0(n17), .A1(cnt[2]), .B0(N8), .B1(n4), .Y(n6) );
  OAI2BB2X1 U10 ( .B0(n2), .B1(n7), .A0N(N9), .A1N(n4), .Y(n29) );
  OAI2BB2X1 U11 ( .B0(n2), .B1(n8), .A0N(N10), .A1N(n4), .Y(n28) );
  OAI2BB2X1 U12 ( .B0(n2), .B1(n9), .A0N(N11), .A1N(n4), .Y(n27) );
  INVX1 U13 ( .A(n10), .Y(n26) );
  AOI22X1 U14 ( .A0(n17), .A1(cnt[6]), .B0(N12), .B1(n4), .Y(n10) );
  AOI2BB1X1 U15 ( .A0N(n11), .A1N(n12), .B0(n17), .Y(n4) );
  NAND3X1 U16 ( .A(cnt[5]), .B(cnt[2]), .C(cnt[6]), .Y(n12) );
  NAND4X1 U17 ( .A(n3), .B(n5), .C(n7), .D(n8), .Y(n11) );
  INVX1 U18 ( .A(cnt[1]), .Y(n5) );
  AOI21X1 U19 ( .A0(cnt[6]), .A1(n13), .B0(n14), .Y(N30) );
  AOI221X1 U20 ( .A0(n14), .A1(n3), .B0(cnt[6]), .B1(n13), .C0(sel), .Y(N25)
         );
  NAND4X1 U21 ( .A(n8), .B(n9), .C(n7), .D(n15), .Y(n13) );
  AOI21X1 U22 ( .A0(cnt[1]), .A1(cnt[0]), .B0(cnt[2]), .Y(n15) );
  INVX1 U23 ( .A(cnt[3]), .Y(n7) );
  INVX1 U24 ( .A(cnt[5]), .Y(n9) );
  INVX1 U25 ( .A(cnt[4]), .Y(n8) );
  INVX1 U26 ( .A(cnt[0]), .Y(n3) );
  NOR4BX1 U27 ( .AN(n16), .B(cnt[2]), .C(cnt[3]), .D(cnt[1]), .Y(n14) );
  NOR3X1 U28 ( .A(cnt[4]), .B(cnt[6]), .C(cnt[5]), .Y(n16) );
endmodule


module carry_select_adder2_WIDTH12_3 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3,
         n4;
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
  AOI22X1 U18 ( .A0(n4), .A1(high_sum2[5]), .B0(carry), .B1(high_sum1[5]), .Y(
        n3) );
  INVX1 U21 ( .A(carry), .Y(n4) );
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
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
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
  MX2X1 U3 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U4 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U5 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U6 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U7 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  OR2X2 U8 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U9 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U10 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U12 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
endmodule


module carry_select_adder2_WIDTH12_2 ( x, y, z );
  input [11:0] x;
  input [11:0] y;
  output [12:0] z;
  wire   carry, \add_29/carry[5] , \add_29/carry[4] , \add_29/carry[3] ,
         \add_29/carry[2] , \add_1_root_add_28_2/carry[5] ,
         \add_1_root_add_28_2/carry[4] , \add_1_root_add_28_2/carry[3] ,
         \add_1_root_add_28_2/carry[2] , \add_27/carry[5] , \add_27/carry[4] ,
         \add_27/carry[3] , \add_27/carry[2] , \add_27/carry[1] , n1, n2, n3,
         n4;
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
  AOI22X1 U18 ( .A0(n4), .A1(high_sum2[5]), .B0(carry), .B1(high_sum1[5]), .Y(
        n3) );
  INVX1 U21 ( .A(carry), .Y(n4) );
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
  ADDFX2 \add_27/U1_4  ( .A(x[4]), .B(y[4]), .CI(\add_27/carry[4] ), .CO(
        \add_27/carry[5] ), .S(low_sum[4]) );
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
  MX2X1 U3 ( .A(high_sum2[4]), .B(high_sum1[4]), .S0(carry), .Y(z[10]) );
  MX2X1 U4 ( .A(high_sum2[3]), .B(high_sum1[3]), .S0(carry), .Y(z[9]) );
  MX2X1 U5 ( .A(high_sum2[2]), .B(high_sum1[2]), .S0(carry), .Y(z[8]) );
  MX2X1 U6 ( .A(high_sum2[1]), .B(high_sum1[1]), .S0(carry), .Y(z[7]) );
  MX2X1 U7 ( .A(high_sum2[0]), .B(high_sum1[0]), .S0(carry), .Y(z[6]) );
  OR2X2 U8 ( .A(x[6]), .B(y[6]), .Y(n1) );
  AND2X2 U9 ( .A(y[6]), .B(x[6]), .Y(n2) );
  XOR2X1 U10 ( .A(y[6]), .B(x[6]), .Y(high_sum2[0]) );
  XNOR2X1 U11 ( .A(y[6]), .B(x[6]), .Y(high_sum1[0]) );
  AND2X1 U12 ( .A(y[0]), .B(x[0]), .Y(\add_27/carry[1] ) );
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
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
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
  AND2X2 U10 ( .A(y[6]), .B(x[6]), .Y(n2) );
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
endmodule


module sdfunit6_WIDTH12 ( clk, di_en, reset, x_re, x_im, y_re, y_im, do_en );
  input [11:0] x_re;
  input [11:0] x_im;
  output [11:0] y_re;
  output [11:0] y_im;
  input clk, di_en, reset;
  output do_en;
  wire   n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, sel, N0, N1, N2, N3,
         N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18,
         N19, N20, N21, N22, N23, N25, N26, N27, N28, N29, N30, N31, N32, N33,
         N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47,
         N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60, N61,
         N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, N72, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49;
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
  INVX1 U5 ( .A(n1), .Y(N72) );
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
  signal_control4 s0 ( .clk(clk), .reset(reset), .di_en(di_en), .sel(sel), 
        .do_en(do_en) );
  butterfly2_WIDTH12_0 b0 ( .x0_re(mux1_re), .x0_im(mux1_im), .x1_re(x_re_r), 
        .x1_im(x_im_r), .y0_re(bf_y0_re), .y0_im(bf_y0_im), .y1_re(bf_y1_re), 
        .y1_im(bf_y1_im) );
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
  DFFHQX1 \mux1_im_reg[0]  ( .D(N48), .CK(clk), .Q(mux1_im[0]) );
  DFFHQX1 \mux1_im_reg[1]  ( .D(N47), .CK(clk), .Q(mux1_im[1]) );
  DFFHQX1 \mux1_im_reg[2]  ( .D(N46), .CK(clk), .Q(mux1_im[2]) );
  DFFHQX1 \mux1_im_reg[3]  ( .D(N45), .CK(clk), .Q(mux1_im[3]) );
  DFFHQX1 \mux1_im_reg[4]  ( .D(N44), .CK(clk), .Q(mux1_im[4]) );
  DFFHQX1 \mux1_im_reg[5]  ( .D(N43), .CK(clk), .Q(mux1_im[5]) );
  DFFHQX1 \mux1_im_reg[6]  ( .D(N42), .CK(clk), .Q(mux1_im[6]) );
  DFFHQX1 \mux1_im_reg[7]  ( .D(N41), .CK(clk), .Q(mux1_im[7]) );
  DFFHQX1 \mux1_im_reg[8]  ( .D(N40), .CK(clk), .Q(mux1_im[8]) );
  DFFHQX1 \mux1_im_reg[9]  ( .D(N39), .CK(clk), .Q(mux1_im[9]) );
  DFFHQX1 \mux1_im_reg[10]  ( .D(N38), .CK(clk), .Q(mux1_im[10]) );
  DFFHQX1 \mux1_im_reg[11]  ( .D(N37), .CK(clk), .Q(mux1_im[11]) );
  DFFHQX1 \mux1_re_reg[0]  ( .D(N36), .CK(clk), .Q(mux1_re[0]) );
  DFFHQX1 \mux1_re_reg[1]  ( .D(N35), .CK(clk), .Q(mux1_re[1]) );
  DFFHQX1 \mux1_re_reg[2]  ( .D(N34), .CK(clk), .Q(mux1_re[2]) );
  DFFHQX1 \mux1_re_reg[3]  ( .D(N33), .CK(clk), .Q(mux1_re[3]) );
  DFFHQX1 \mux1_re_reg[4]  ( .D(N32), .CK(clk), .Q(mux1_re[4]) );
  DFFHQX1 \mux1_re_reg[5]  ( .D(N31), .CK(clk), .Q(mux1_re[5]) );
  DFFHQX1 \mux1_re_reg[6]  ( .D(N30), .CK(clk), .Q(mux1_re[6]) );
  DFFHQX1 \mux1_re_reg[7]  ( .D(N29), .CK(clk), .Q(mux1_re[7]) );
  DFFHQX1 \mux1_re_reg[8]  ( .D(N28), .CK(clk), .Q(mux1_re[8]) );
  DFFHQX1 \mux1_re_reg[9]  ( .D(N27), .CK(clk), .Q(mux1_re[9]) );
  DFFHQX1 \mux1_re_reg[10]  ( .D(N26), .CK(clk), .Q(mux1_re[10]) );
  DFFHQX1 \mux1_re_reg[11]  ( .D(N25), .CK(clk), .Q(mux1_re[11]) );
  DFFHQX1 \mux2_im_reg[0]  ( .D(N72), .CK(clk), .Q(n97) );
  DFFHQX1 \mux2_im_reg[1]  ( .D(N71), .CK(clk), .Q(n96) );
  DFFHQX1 \mux2_im_reg[2]  ( .D(N70), .CK(clk), .Q(n95) );
  DFFHQX1 \mux2_im_reg[3]  ( .D(N69), .CK(clk), .Q(n94) );
  DFFHQX1 \mux2_im_reg[4]  ( .D(N68), .CK(clk), .Q(n93) );
  DFFHQX1 \mux2_im_reg[5]  ( .D(N67), .CK(clk), .Q(n92) );
  DFFHQX1 \mux2_im_reg[6]  ( .D(N66), .CK(clk), .Q(n91) );
  DFFHQX1 \mux2_im_reg[7]  ( .D(N65), .CK(clk), .Q(n90) );
  DFFHQX1 \mux2_im_reg[8]  ( .D(N64), .CK(clk), .Q(n89) );
  DFFHQX1 \mux2_im_reg[9]  ( .D(N63), .CK(clk), .Q(n88) );
  DFFHQX1 \mux2_im_reg[10]  ( .D(N62), .CK(clk), .Q(n87) );
  DFFHQX1 \mux2_im_reg[11]  ( .D(N61), .CK(clk), .Q(n86) );
  DFFHQX1 \mux2_re_reg[0]  ( .D(N60), .CK(clk), .Q(n85) );
  DFFHQX1 \mux2_re_reg[1]  ( .D(N59), .CK(clk), .Q(n84) );
  DFFHQX1 \mux2_re_reg[2]  ( .D(N58), .CK(clk), .Q(n83) );
  DFFHQX1 \mux2_re_reg[3]  ( .D(N57), .CK(clk), .Q(n82) );
  DFFHQX1 \mux2_re_reg[4]  ( .D(N56), .CK(clk), .Q(n81) );
  DFFHQX1 \mux2_re_reg[5]  ( .D(N55), .CK(clk), .Q(n80) );
  DFFHQX1 \mux2_re_reg[6]  ( .D(N54), .CK(clk), .Q(n79) );
  DFFHQX1 \mux2_re_reg[7]  ( .D(N53), .CK(clk), .Q(n78) );
  DFFHQX1 \mux2_re_reg[8]  ( .D(N52), .CK(clk), .Q(n77) );
  DFFHQX1 \mux2_re_reg[9]  ( .D(N51), .CK(clk), .Q(n76) );
  DFFHQX1 \mux2_re_reg[10]  ( .D(N50), .CK(clk), .Q(n75) );
  DFFHQX1 \mux2_re_reg[11]  ( .D(N49), .CK(clk), .Q(n74) );
  BUFX20 U106 ( .A(n74), .Y(y_re[11]) );
  BUFX20 U124 ( .A(n75), .Y(y_re[10]) );
  BUFX20 U125 ( .A(n76), .Y(y_re[9]) );
  BUFX20 U126 ( .A(n77), .Y(y_re[8]) );
  BUFX20 U127 ( .A(n78), .Y(y_re[7]) );
  BUFX20 U128 ( .A(n79), .Y(y_re[6]) );
  BUFX20 U129 ( .A(n80), .Y(y_re[5]) );
  BUFX20 U130 ( .A(n81), .Y(y_re[4]) );
  BUFX20 U131 ( .A(n82), .Y(y_re[3]) );
  BUFX20 U132 ( .A(n83), .Y(y_re[2]) );
  BUFX20 U133 ( .A(n84), .Y(y_re[1]) );
  BUFX20 U134 ( .A(n85), .Y(y_re[0]) );
  BUFX20 U135 ( .A(n86), .Y(y_im[11]) );
  BUFX20 U136 ( .A(n87), .Y(y_im[10]) );
  BUFX20 U137 ( .A(n88), .Y(y_im[9]) );
  BUFX20 U138 ( .A(n89), .Y(y_im[8]) );
  BUFX20 U139 ( .A(n90), .Y(y_im[7]) );
  BUFX20 U140 ( .A(n91), .Y(y_im[6]) );
  BUFX20 U141 ( .A(n92), .Y(y_im[5]) );
  BUFX20 U142 ( .A(n93), .Y(y_im[4]) );
  BUFX20 U143 ( .A(n94), .Y(y_im[3]) );
  BUFX20 U144 ( .A(n95), .Y(y_im[2]) );
  BUFX20 U145 ( .A(n96), .Y(y_im[1]) );
  BUFX20 U146 ( .A(n97), .Y(y_im[0]) );
  CLKINVX3 U147 ( .A(sel), .Y(n2) );
endmodule


module FFT64 ( clk, reset, di_en, x_re, x_im, y_re, y_im, do_en );
  input [11:0] x_re;
  input [11:0] x_im;
  output [11:0] y_re;
  output [11:0] y_im;
  input clk, reset, di_en;
  output do_en;
  wire   do1, do2, do3, do4, do5;
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
        .x_im(temp5_im), .y_re(y_re), .y_im(y_im), .do_en(do_en) );
endmodule

