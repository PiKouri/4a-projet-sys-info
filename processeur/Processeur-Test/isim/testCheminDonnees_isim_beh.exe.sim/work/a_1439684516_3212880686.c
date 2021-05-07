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
static const char *ng0 = "/home/ise/processeur/Processeur-Test/Banc_Registres.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1439684516_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    int t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)2);
    if (t5 == 1)
        goto LAB5;

LAB6:    t2 = (t0 + 1352U);
    t6 = *((char **)t2);
    t2 = (t0 + 1032U);
    t7 = *((char **)t2);
    t8 = 1;
    if (4U == 4U)
        goto LAB8;

LAB9:    t8 = 0;

LAB10:    t1 = (!(t8));

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB14:    t25 = (t0 + 1672U);
    t26 = *((char **)t25);
    t25 = (t0 + 4552);
    t27 = (t25 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t26, 8U);
    xsi_driver_first_trans_fast_port(t25);

LAB2:    t31 = (t0 + 4440);
    *((int *)t31) = 1;

LAB1:    return;
LAB3:    t11 = (t0 + 2472U);
    t12 = *((char **)t11);
    t11 = (t0 + 1032U);
    t13 = *((char **)t11);
    t11 = (t0 + 7192U);
    t14 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t13, t11);
    t15 = (t14 - 0);
    t16 = (t15 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t14);
    t17 = (8U * t16);
    t18 = (0 + t17);
    t19 = (t12 + t18);
    t20 = (t0 + 4552);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t19, 8U);
    xsi_driver_first_trans_fast_port(t20);
    goto LAB2;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t9 = 0;

LAB11:    if (t9 < 4U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t2 = (t6 + t9);
    t10 = (t7 + t9);
    if (*((unsigned char *)t2) != *((unsigned char *)t10))
        goto LAB9;

LAB13:    t9 = (t9 + 1);
    goto LAB11;

LAB15:    goto LAB2;

}

static void work_a_1439684516_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(51, ng0);

LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = (t0 + 7208U);
    t4 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t3, t1);
    t5 = (t4 - 0);
    t6 = (t5 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t4);
    t7 = (8U * t6);
    t8 = (0 + t7);
    t9 = (t2 + t8);
    t10 = (t0 + 4616);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 8U);
    xsi_driver_first_trans_fast_port(t10);

LAB2:    t15 = (t0 + 4456);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1439684516_3212880686_p_2(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned int t8;
    char *t9;
    unsigned char t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    int t17;
    int t18;
    unsigned int t19;

LAB0:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1952U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4472);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(56, ng0);
    t3 = (t0 + 1832U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)2);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB10;

LAB12:
LAB11:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(57, ng0);
    t3 = xsi_get_transient_memory(128U);
    memset(t3, 0, 128U);
    t7 = t3;
    t8 = (8U * 1U);
    t9 = t7;
    memset(t9, (unsigned char)2, t8);
    t10 = (t8 != 0);
    if (t10 == 1)
        goto LAB8;

LAB9:    t12 = (t0 + 4680);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t3, 128U);
    xsi_driver_first_trans_fast(t12);
    goto LAB6;

LAB8:    t11 = (128U / t8);
    xsi_mem_set_data(t7, t7, t8, t11);
    goto LAB9;

LAB10:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1672U);
    t4 = *((char **)t1);
    t1 = (t0 + 1352U);
    t7 = *((char **)t1);
    t1 = (t0 + 7224U);
    t17 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t7, t1);
    t18 = (t17 - 0);
    t8 = (t18 * 1);
    t11 = (8U * t8);
    t19 = (0U + t11);
    t9 = (t0 + 4680);
    t12 = (t9 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t4, 8U);
    xsi_driver_first_trans_delta(t9, t19, 8U, 0LL);
    goto LAB11;

}


extern void work_a_1439684516_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1439684516_3212880686_p_0,(void *)work_a_1439684516_3212880686_p_1,(void *)work_a_1439684516_3212880686_p_2};
	xsi_register_didat("work_a_1439684516_3212880686", "isim/testCheminDonnees_isim_beh.exe.sim/work/a_1439684516_3212880686.didat");
	xsi_register_executes(pe);
}
