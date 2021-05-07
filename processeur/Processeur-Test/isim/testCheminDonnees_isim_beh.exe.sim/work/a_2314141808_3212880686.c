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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/processeur/Processeur-Test/Memoire_Instructions.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_1006216973935652998_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_1006216973935724872_1035706684(char *, char *, char *, char *, int );
int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2314141808_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    int t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t18 = xsi_get_transient_memory(32U);
    memset(t18, 0, 32U);
    t19 = t18;
    memset(t19, (unsigned char)2, 32U);
    t20 = (t0 + 5824);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t18, 32U);
    xsi_driver_first_trans_fast(t20);

LAB2:    t25 = (t0 + 5664);
    *((int *)t25) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 2632U);
    t5 = *((char **)t1);
    t1 = (t0 + 2952U);
    t6 = *((char **)t1);
    t1 = (t0 + 9320U);
    t7 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t6, t1);
    t8 = (t7 - 0);
    t9 = (t8 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t7);
    t10 = (32U * t9);
    t11 = (0 + t10);
    t12 = (t5 + t11);
    t13 = (t0 + 5824);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t12, 32U);
    xsi_driver_first_trans_fast(t13);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_2314141808_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(62, ng0);

LAB3:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t3 = (31 - 31);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 5888);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast_port(t6);

LAB2:    t11 = (t0 + 5680);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2314141808_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(63, ng0);

LAB3:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t3 = (31 - 23);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 5952);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast_port(t6);

LAB2:    t11 = (t0 + 5696);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2314141808_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(64, ng0);

LAB3:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t3 = (31 - 15);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 6016);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast_port(t6);

LAB2:    t11 = (t0 + 5712);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2314141808_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(65, ng0);

LAB3:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t3 = (31 - 7);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 6080);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast_port(t6);

LAB2:    t11 = (t0 + 5728);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2314141808_3212880686_p_5(char *t0)
{
    char t16[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    unsigned char t14;
    unsigned int t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1152U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5744);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(71, ng0);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)2);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB11;

LAB13:
LAB12:
LAB9:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(72, ng0);
    t3 = (t0 + 17589);
    t8 = (t0 + 6144);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 8U);
    xsi_driver_first_trans_fast(t8);
    goto LAB6;

LAB8:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1032U);
    t4 = *((char **)t1);
    t1 = (t0 + 6144);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t4, 8U);
    xsi_driver_first_trans_fast(t1);
    goto LAB9;

LAB11:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 1832U);
    t4 = *((char **)t1);
    t6 = *((unsigned char *)t4);
    t13 = (t6 == (unsigned char)2);
    if (t13 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t1 = (t0 + 17605);
    t2 = 1;
    if (8U == 8U)
        goto LAB29;

LAB30:    t2 = 0;

LAB31:    if ((!(t2)) != 0)
        goto LAB26;

LAB28:
LAB27:
LAB15:    goto LAB12;

LAB14:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 2952U);
    t7 = *((char **)t1);
    t1 = (t0 + 17597);
    t14 = 1;
    if (8U == 8U)
        goto LAB20;

LAB21:    t14 = 0;

LAB22:    if ((!(t14)) != 0)
        goto LAB17;

LAB19:
LAB18:    goto LAB15;

LAB17:    xsi_set_current_line(80, ng0);
    t11 = (t0 + 2952U);
    t12 = *((char **)t11);
    t11 = (t0 + 9320U);
    t17 = ieee_p_1242562249_sub_1006216973935724872_1035706684(IEEE_P_1242562249, t16, t12, t11, 1);
    t18 = (t0 + 6144);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t17, 8U);
    xsi_driver_first_trans_fast(t18);
    goto LAB18;

LAB20:    t15 = 0;

LAB23:    if (t15 < 8U)
        goto LAB24;
    else
        goto LAB22;

LAB24:    t9 = (t7 + t15);
    t10 = (t1 + t15);
    if (*((unsigned char *)t9) != *((unsigned char *)t10))
        goto LAB21;

LAB25:    t15 = (t15 + 1);
    goto LAB23;

LAB26:    xsi_set_current_line(84, ng0);
    t9 = (t0 + 2952U);
    t10 = *((char **)t9);
    t9 = (t0 + 9320U);
    t11 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t16, t10, t9, 1);
    t12 = (t0 + 6144);
    t17 = (t12 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t11, 8U);
    xsi_driver_first_trans_fast(t12);
    goto LAB27;

LAB29:    t15 = 0;

LAB32:    if (t15 < 8U)
        goto LAB33;
    else
        goto LAB31;

LAB33:    t7 = (t3 + t15);
    t8 = (t1 + t15);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB30;

LAB34:    t15 = (t15 + 1);
    goto LAB32;

}


extern void work_a_2314141808_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2314141808_3212880686_p_0,(void *)work_a_2314141808_3212880686_p_1,(void *)work_a_2314141808_3212880686_p_2,(void *)work_a_2314141808_3212880686_p_3,(void *)work_a_2314141808_3212880686_p_4,(void *)work_a_2314141808_3212880686_p_5};
	xsi_register_didat("work_a_2314141808_3212880686", "isim/testCheminDonnees_isim_beh.exe.sim/work/a_2314141808_3212880686.didat");
	xsi_register_executes(pe);
}
