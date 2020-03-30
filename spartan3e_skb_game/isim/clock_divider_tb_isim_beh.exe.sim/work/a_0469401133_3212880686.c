/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "Function num_of_bits ended without a return statement";
static const char *ng1 = "C:/Users/mariu/Desktop/PWr/Semestr VI/UCiSW_2/spartan-game/spartan3e_skb_game/clock_divider.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_1242562249_sub_1781507893_1035706684(char *, char *, char *, int );
char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


int work_a_0469401133_3212880686_sub_2526101452_3057020925(char *t1, int t2)
{
    char t4[8];
    int t0;
    char *t5;
    unsigned char t6;
    int t7;
    int t8;
    int t9;

LAB0:    t5 = (t4 + 4U);
    *((int *)t5) = t2;
    t6 = (t2 > 0);
    if (t6 != 0)
        goto LAB2;

LAB4:    t0 = 1;

LAB1:    return t0;
LAB2:    t7 = (t2 / 2);
    t8 = work_a_0469401133_3212880686_sub_2526101452_3057020925(t1, t7);
    t9 = (1 + t8);
    t0 = t9;
    goto LAB1;

LAB3:    xsi_error(ng0);
    t0 = 0;
    goto LAB1;

LAB5:    goto LAB3;

LAB6:    goto LAB3;

}

static void work_a_0469401133_3212880686_p_0(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    int t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;

LAB0:    xsi_set_current_line(55, ng1);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB7;

LAB8:
LAB3:    t1 = (t0 + 4608);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(56, ng1);
    t1 = (t0 + 2808U);
    t6 = *((char **)t1);
    t7 = *((int *)t6);
    t1 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t5, 0, t7);
    t8 = (23U != 23U);
    if (t8 == 1)
        goto LAB5;

LAB6:    t9 = (t0 + 4720);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 23U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(57, ng1);
    t1 = (t0 + 4784);
    t2 = (t1 + 56U);
    t6 = *((char **)t2);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(58, ng1);
    t1 = (t0 + 4848);
    t2 = (t1 + 56U);
    t6 = *((char **)t2);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_size_not_matching(23U, 23U, 0);
    goto LAB6;

LAB7:    xsi_set_current_line(60, ng1);
    t2 = (t0 + 1672U);
    t6 = *((char **)t2);
    t2 = (t0 + 8172U);
    t9 = (t0 + 2688U);
    t10 = *((char **)t9);
    t7 = *((int *)t10);
    t4 = ieee_p_1242562249_sub_1781507893_1035706684(IEEE_P_1242562249, t6, t2, t7);
    if (t4 != 0)
        goto LAB9;

LAB11:    xsi_set_current_line(72, ng1);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 8172U);
    t6 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t5, t2, t1, 1);
    t9 = (t5 + 12U);
    t18 = *((unsigned int *)t9);
    t19 = (1U * t18);
    t3 = (23U != t19);
    if (t3 == 1)
        goto LAB17;

LAB18:    t10 = (t0 + 4720);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    memcpy(t15, t6, 23U);
    xsi_driver_first_trans_fast(t10);

LAB10:    goto LAB3;

LAB9:    xsi_set_current_line(61, ng1);
    t9 = (t0 + 2808U);
    t11 = *((char **)t9);
    t14 = *((int *)t11);
    t9 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t5, 0, t14);
    t8 = (23U != 23U);
    if (t8 == 1)
        goto LAB12;

LAB13:    t12 = (t0 + 4720);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t9, 23U);
    xsi_driver_first_trans_fast(t12);
    xsi_set_current_line(62, ng1);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t3);
    t1 = (t0 + 4912);
    t6 = (t1 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t4;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(64, ng1);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t7 = *((int *)t2);
    t3 = (t7 != 0);
    if (t3 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(67, ng1);
    t1 = (t0 + 4784);
    t2 = (t1 + 56U);
    t6 = *((char **)t2);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB15:    xsi_set_current_line(70, ng1);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t7 = *((int *)t2);
    t14 = (t7 + 1);
    t1 = (t0 + 4848);
    t6 = (t1 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t11) = t14;
    xsi_driver_first_trans_fast(t1);
    goto LAB10;

LAB12:    xsi_size_not_matching(23U, 23U, 0);
    goto LAB13;

LAB14:    xsi_set_current_line(65, ng1);
    t1 = (t0 + 4784);
    t6 = (t1 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB15;

LAB17:    xsi_size_not_matching(23U, t19, 0);
    goto LAB18;

}

static void work_a_0469401133_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(77, ng1);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4976);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 4624);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0469401133_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(78, ng1);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5040);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 4640);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0469401133_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0469401133_3212880686_p_0,(void *)work_a_0469401133_3212880686_p_1,(void *)work_a_0469401133_3212880686_p_2};
	static char *se[] = {(void *)work_a_0469401133_3212880686_sub_2526101452_3057020925};
	xsi_register_didat("work_a_0469401133_3212880686", "isim/clock_divider_tb_isim_beh.exe.sim/work/a_0469401133_3212880686.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
