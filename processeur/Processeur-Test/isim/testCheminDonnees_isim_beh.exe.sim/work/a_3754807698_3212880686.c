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
static const char *ng0 = "/home/ise/processeur/Processeur-Test/Chemin_Donnees.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3754807698_3212880686_p_0(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned char t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned char t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned char t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned char t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;

LAB0:    xsi_set_current_line(214, ng0);
    t5 = (t0 + 7432U);
    t6 = *((char **)t5);
    t5 = (t0 + 9248U);
    t7 = *((char **)t5);
    t8 = 1;
    if (8U == 8U)
        goto LAB17;

LAB18:    t8 = 0;

LAB19:    if (t8 == 1)
        goto LAB14;

LAB15:    t11 = (t0 + 7432U);
    t12 = *((char **)t11);
    t11 = (t0 + 9128U);
    t13 = *((char **)t11);
    t14 = 1;
    if (8U == 8U)
        goto LAB23;

LAB24:    t14 = 0;

LAB25:    t4 = t14;

LAB16:    if (t4 == 1)
        goto LAB11;

LAB12:    t17 = (t0 + 7432U);
    t18 = *((char **)t17);
    t17 = (t0 + 8648U);
    t19 = *((char **)t17);
    t20 = 1;
    if (8U == 8U)
        goto LAB29;

LAB30:    t20 = 0;

LAB31:    t3 = t20;

LAB13:    if (t3 == 1)
        goto LAB8;

LAB9:    t23 = (t0 + 7432U);
    t24 = *((char **)t23);
    t23 = (t0 + 8768U);
    t25 = *((char **)t23);
    t26 = 1;
    if (8U == 8U)
        goto LAB35;

LAB36:    t26 = 0;

LAB37:    t2 = t26;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t29 = (t0 + 7432U);
    t30 = *((char **)t29);
    t29 = (t0 + 8888U);
    t31 = *((char **)t29);
    t32 = 1;
    if (8U == 8U)
        goto LAB41;

LAB42:    t32 = 0;

LAB43:    t1 = t32;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB47:    t40 = (t0 + 11920);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    *((unsigned char *)t44) = (unsigned char)2;
    xsi_driver_first_trans_fast(t40);

LAB2:    t45 = (t0 + 11776);
    *((int *)t45) = 1;

LAB1:    return;
LAB3:    t35 = (t0 + 11920);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    *((unsigned char *)t39) = (unsigned char)3;
    xsi_driver_first_trans_fast(t35);
    goto LAB2;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t2 = (unsigned char)1;
    goto LAB10;

LAB11:    t3 = (unsigned char)1;
    goto LAB13;

LAB14:    t4 = (unsigned char)1;
    goto LAB16;

LAB17:    t9 = 0;

LAB20:    if (t9 < 8U)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t5 = (t6 + t9);
    t10 = (t7 + t9);
    if (*((unsigned char *)t5) != *((unsigned char *)t10))
        goto LAB18;

LAB22:    t9 = (t9 + 1);
    goto LAB20;

LAB23:    t15 = 0;

LAB26:    if (t15 < 8U)
        goto LAB27;
    else
        goto LAB25;

LAB27:    t11 = (t12 + t15);
    t16 = (t13 + t15);
    if (*((unsigned char *)t11) != *((unsigned char *)t16))
        goto LAB24;

LAB28:    t15 = (t15 + 1);
    goto LAB26;

LAB29:    t21 = 0;

LAB32:    if (t21 < 8U)
        goto LAB33;
    else
        goto LAB31;

LAB33:    t17 = (t18 + t21);
    t22 = (t19 + t21);
    if (*((unsigned char *)t17) != *((unsigned char *)t22))
        goto LAB30;

LAB34:    t21 = (t21 + 1);
    goto LAB32;

LAB35:    t27 = 0;

LAB38:    if (t27 < 8U)
        goto LAB39;
    else
        goto LAB37;

LAB39:    t23 = (t24 + t27);
    t28 = (t25 + t27);
    if (*((unsigned char *)t23) != *((unsigned char *)t28))
        goto LAB36;

LAB40:    t27 = (t27 + 1);
    goto LAB38;

LAB41:    t33 = 0;

LAB44:    if (t33 < 8U)
        goto LAB45;
    else
        goto LAB43;

LAB45:    t29 = (t30 + t33);
    t34 = (t31 + t33);
    if (*((unsigned char *)t29) != *((unsigned char *)t34))
        goto LAB42;

LAB46:    t33 = (t33 + 1);
    goto LAB44;

LAB48:    goto LAB2;

}

static void work_a_3754807698_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    xsi_set_current_line(217, ng0);
    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    t1 = (t0 + 9128U);
    t3 = *((char **)t1);
    t4 = 1;
    if (8U == 8U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:
LAB11:    t13 = (t0 + 4872U);
    t14 = *((char **)t13);
    t13 = (t0 + 11984);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t14, 8U);
    xsi_driver_first_trans_fast(t13);

LAB2:    t19 = (t0 + 11792);
    *((int *)t19) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 5192U);
    t8 = *((char **)t7);
    t7 = (t0 + 11984);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t8, 8U);
    xsi_driver_first_trans_fast(t7);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 8U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t1 = (t2 + t5);
    t6 = (t3 + t5);
    if (*((unsigned char *)t1) != *((unsigned char *)t6))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB12:    goto LAB2;

}

static void work_a_3754807698_3212880686_p_2(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    unsigned char t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    unsigned char t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned char t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned char t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    unsigned char t31;
    unsigned int t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    unsigned char t37;
    unsigned int t38;
    char *t39;
    char *t40;
    unsigned char t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    unsigned char t47;
    unsigned char t48;
    char *t49;
    char *t50;
    unsigned char t51;
    unsigned char t52;
    unsigned char t53;
    unsigned char t54;
    unsigned char t55;
    unsigned char t56;
    char *t57;
    char *t58;
    unsigned char t59;
    unsigned int t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;
    unsigned char t65;
    unsigned int t66;
    char *t67;
    char *t68;
    char *t69;
    char *t70;
    unsigned char t71;
    unsigned int t72;
    char *t73;
    char *t74;
    char *t75;
    char *t76;
    unsigned char t77;
    unsigned int t78;
    char *t79;
    char *t80;
    char *t81;
    char *t82;
    unsigned char t83;
    unsigned int t84;
    char *t85;
    char *t86;
    unsigned char t87;
    char *t88;
    char *t89;
    char *t90;
    char *t91;
    char *t92;
    char *t93;
    char *t94;
    unsigned char t95;
    char *t96;
    char *t97;
    char *t98;
    char *t99;
    char *t100;

LAB0:    xsi_set_current_line(220, ng0);
    t3 = (t0 + 3752U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)2);
    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:    t49 = (t0 + 3752U);
    t50 = *((char **)t49);
    t51 = *((unsigned char *)t50);
    t52 = (t51 == (unsigned char)3);
    if (t52 == 1)
        goto LAB58;

LAB59:    t48 = (unsigned char)0;

LAB60:    if (t48 == 1)
        goto LAB55;

LAB56:    t47 = (unsigned char)0;

LAB57:    if (t47 != 0)
        goto LAB53;

LAB54:
LAB103:    t93 = (t0 + 3752U);
    t94 = *((char **)t93);
    t95 = *((unsigned char *)t94);
    t93 = (t0 + 12048);
    t96 = (t93 + 56U);
    t97 = *((char **)t96);
    t98 = (t97 + 56U);
    t99 = *((char **)t98);
    *((unsigned char *)t99) = t95;
    xsi_driver_first_trans_fast(t93);

LAB2:    t100 = (t0 + 11808);
    *((int *)t100) = 1;

LAB1:    return;
LAB3:    t42 = (t0 + 12048);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    *((unsigned char *)t46) = (unsigned char)3;
    xsi_driver_first_trans_fast(t42);
    goto LAB2;

LAB5:    t40 = (t0 + 992U);
    t41 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t40, 0U, 0U);
    t1 = t41;
    goto LAB7;

LAB8:    t3 = (t0 + 4072U);
    t11 = *((char **)t3);
    t3 = (t0 + 9248U);
    t12 = *((char **)t3);
    t13 = 1;
    if (8U == 8U)
        goto LAB23;

LAB24:    t13 = 0;

LAB25:    if (t13 == 1)
        goto LAB20;

LAB21:    t16 = (t0 + 4072U);
    t17 = *((char **)t16);
    t16 = (t0 + 9128U);
    t18 = *((char **)t16);
    t19 = 1;
    if (8U == 8U)
        goto LAB29;

LAB30:    t19 = 0;

LAB31:    t10 = t19;

LAB22:    if (t10 == 1)
        goto LAB17;

LAB18:    t22 = (t0 + 4072U);
    t23 = *((char **)t22);
    t22 = (t0 + 8648U);
    t24 = *((char **)t22);
    t25 = 1;
    if (8U == 8U)
        goto LAB35;

LAB36:    t25 = 0;

LAB37:    t9 = t25;

LAB19:    if (t9 == 1)
        goto LAB14;

LAB15:    t28 = (t0 + 4072U);
    t29 = *((char **)t28);
    t28 = (t0 + 8768U);
    t30 = *((char **)t28);
    t31 = 1;
    if (8U == 8U)
        goto LAB41;

LAB42:    t31 = 0;

LAB43:    t8 = t31;

LAB16:    if (t8 == 1)
        goto LAB11;

LAB12:    t34 = (t0 + 4072U);
    t35 = *((char **)t34);
    t34 = (t0 + 8888U);
    t36 = *((char **)t34);
    t37 = 1;
    if (8U == 8U)
        goto LAB47;

LAB48:    t37 = 0;

LAB49:    t7 = t37;

LAB13:    t2 = t7;
    goto LAB10;

LAB11:    t7 = (unsigned char)1;
    goto LAB13;

LAB14:    t8 = (unsigned char)1;
    goto LAB16;

LAB17:    t9 = (unsigned char)1;
    goto LAB19;

LAB20:    t10 = (unsigned char)1;
    goto LAB22;

LAB23:    t14 = 0;

LAB26:    if (t14 < 8U)
        goto LAB27;
    else
        goto LAB25;

LAB27:    t3 = (t11 + t14);
    t15 = (t12 + t14);
    if (*((unsigned char *)t3) != *((unsigned char *)t15))
        goto LAB24;

LAB28:    t14 = (t14 + 1);
    goto LAB26;

LAB29:    t20 = 0;

LAB32:    if (t20 < 8U)
        goto LAB33;
    else
        goto LAB31;

LAB33:    t16 = (t17 + t20);
    t21 = (t18 + t20);
    if (*((unsigned char *)t16) != *((unsigned char *)t21))
        goto LAB30;

LAB34:    t20 = (t20 + 1);
    goto LAB32;

LAB35:    t26 = 0;

LAB38:    if (t26 < 8U)
        goto LAB39;
    else
        goto LAB37;

LAB39:    t22 = (t23 + t26);
    t27 = (t24 + t26);
    if (*((unsigned char *)t22) != *((unsigned char *)t27))
        goto LAB36;

LAB40:    t26 = (t26 + 1);
    goto LAB38;

LAB41:    t32 = 0;

LAB44:    if (t32 < 8U)
        goto LAB45;
    else
        goto LAB43;

LAB45:    t28 = (t29 + t32);
    t33 = (t30 + t32);
    if (*((unsigned char *)t28) != *((unsigned char *)t33))
        goto LAB42;

LAB46:    t32 = (t32 + 1);
    goto LAB44;

LAB47:    t38 = 0;

LAB50:    if (t38 < 8U)
        goto LAB51;
    else
        goto LAB49;

LAB51:    t34 = (t35 + t38);
    t39 = (t36 + t38);
    if (*((unsigned char *)t34) != *((unsigned char *)t39))
        goto LAB48;

LAB52:    t38 = (t38 + 1);
    goto LAB50;

LAB53:    t88 = (t0 + 12048);
    t89 = (t88 + 56U);
    t90 = *((char **)t89);
    t91 = (t90 + 56U);
    t92 = *((char **)t91);
    *((unsigned char *)t92) = (unsigned char)2;
    xsi_driver_first_trans_fast(t88);
    goto LAB2;

LAB55:    t86 = (t0 + 992U);
    t87 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t86, 0U, 0U);
    t47 = t87;
    goto LAB57;

LAB58:    t49 = (t0 + 6792U);
    t57 = *((char **)t49);
    t49 = (t0 + 9248U);
    t58 = *((char **)t49);
    t59 = 1;
    if (8U == 8U)
        goto LAB73;

LAB74:    t59 = 0;

LAB75:    if (t59 == 1)
        goto LAB70;

LAB71:    t62 = (t0 + 6792U);
    t63 = *((char **)t62);
    t62 = (t0 + 9128U);
    t64 = *((char **)t62);
    t65 = 1;
    if (8U == 8U)
        goto LAB79;

LAB80:    t65 = 0;

LAB81:    t56 = t65;

LAB72:    if (t56 == 1)
        goto LAB67;

LAB68:    t68 = (t0 + 6792U);
    t69 = *((char **)t68);
    t68 = (t0 + 8648U);
    t70 = *((char **)t68);
    t71 = 1;
    if (8U == 8U)
        goto LAB85;

LAB86:    t71 = 0;

LAB87:    t55 = t71;

LAB69:    if (t55 == 1)
        goto LAB64;

LAB65:    t74 = (t0 + 6792U);
    t75 = *((char **)t74);
    t74 = (t0 + 8768U);
    t76 = *((char **)t74);
    t77 = 1;
    if (8U == 8U)
        goto LAB91;

LAB92:    t77 = 0;

LAB93:    t54 = t77;

LAB66:    if (t54 == 1)
        goto LAB61;

LAB62:    t80 = (t0 + 6792U);
    t81 = *((char **)t80);
    t80 = (t0 + 8888U);
    t82 = *((char **)t80);
    t83 = 1;
    if (8U == 8U)
        goto LAB97;

LAB98:    t83 = 0;

LAB99:    t53 = t83;

LAB63:    t48 = t53;
    goto LAB60;

LAB61:    t53 = (unsigned char)1;
    goto LAB63;

LAB64:    t54 = (unsigned char)1;
    goto LAB66;

LAB67:    t55 = (unsigned char)1;
    goto LAB69;

LAB70:    t56 = (unsigned char)1;
    goto LAB72;

LAB73:    t60 = 0;

LAB76:    if (t60 < 8U)
        goto LAB77;
    else
        goto LAB75;

LAB77:    t49 = (t57 + t60);
    t61 = (t58 + t60);
    if (*((unsigned char *)t49) != *((unsigned char *)t61))
        goto LAB74;

LAB78:    t60 = (t60 + 1);
    goto LAB76;

LAB79:    t66 = 0;

LAB82:    if (t66 < 8U)
        goto LAB83;
    else
        goto LAB81;

LAB83:    t62 = (t63 + t66);
    t67 = (t64 + t66);
    if (*((unsigned char *)t62) != *((unsigned char *)t67))
        goto LAB80;

LAB84:    t66 = (t66 + 1);
    goto LAB82;

LAB85:    t72 = 0;

LAB88:    if (t72 < 8U)
        goto LAB89;
    else
        goto LAB87;

LAB89:    t68 = (t69 + t72);
    t73 = (t70 + t72);
    if (*((unsigned char *)t68) != *((unsigned char *)t73))
        goto LAB86;

LAB90:    t72 = (t72 + 1);
    goto LAB88;

LAB91:    t78 = 0;

LAB94:    if (t78 < 8U)
        goto LAB95;
    else
        goto LAB93;

LAB95:    t74 = (t75 + t78);
    t79 = (t76 + t78);
    if (*((unsigned char *)t74) != *((unsigned char *)t79))
        goto LAB92;

LAB96:    t78 = (t78 + 1);
    goto LAB94;

LAB97:    t84 = 0;

LAB100:    if (t84 < 8U)
        goto LAB101;
    else
        goto LAB99;

LAB101:    t80 = (t81 + t84);
    t85 = (t82 + t84);
    if (*((unsigned char *)t80) != *((unsigned char *)t85))
        goto LAB98;

LAB102:    t84 = (t84 + 1);
    goto LAB100;

LAB104:    goto LAB2;

}

static void work_a_3754807698_3212880686_p_3(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned char t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned char t18;
    unsigned int t19;
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
    char *t32;
    char *t33;

LAB0:    xsi_set_current_line(250, ng0);
    t3 = (t0 + 5832U);
    t4 = *((char **)t3);
    t3 = (t0 + 8648U);
    t5 = *((char **)t3);
    t6 = 1;
    if (8U == 8U)
        goto LAB11;

LAB12:    t6 = 0;

LAB13:    if (t6 == 1)
        goto LAB8;

LAB9:    t9 = (t0 + 5832U);
    t10 = *((char **)t9);
    t9 = (t0 + 8768U);
    t11 = *((char **)t9);
    t12 = 1;
    if (8U == 8U)
        goto LAB17;

LAB18:    t12 = 0;

LAB19:    t2 = t12;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t15 = (t0 + 5832U);
    t16 = *((char **)t15);
    t15 = (t0 + 8888U);
    t17 = *((char **)t15);
    t18 = 1;
    if (8U == 8U)
        goto LAB23;

LAB24:    t18 = 0;

LAB25:    t1 = t18;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB29:    t27 = (t0 + 5992U);
    t28 = *((char **)t27);
    t27 = (t0 + 12112);
    t29 = (t27 + 56U);
    t30 = *((char **)t29);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    memcpy(t32, t28, 8U);
    xsi_driver_first_trans_fast(t27);

LAB2:    t33 = (t0 + 11824);
    *((int *)t33) = 1;

LAB1:    return;
LAB3:    t21 = (t0 + 6472U);
    t22 = *((char **)t21);
    t21 = (t0 + 12112);
    t23 = (t21 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t22, 8U);
    xsi_driver_first_trans_fast(t21);
    goto LAB2;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t2 = (unsigned char)1;
    goto LAB10;

LAB11:    t7 = 0;

LAB14:    if (t7 < 8U)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t3 = (t4 + t7);
    t8 = (t5 + t7);
    if (*((unsigned char *)t3) != *((unsigned char *)t8))
        goto LAB12;

LAB16:    t7 = (t7 + 1);
    goto LAB14;

LAB17:    t13 = 0;

LAB20:    if (t13 < 8U)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t9 = (t10 + t13);
    t14 = (t11 + t13);
    if (*((unsigned char *)t9) != *((unsigned char *)t14))
        goto LAB18;

LAB22:    t13 = (t13 + 1);
    goto LAB20;

LAB23:    t19 = 0;

LAB26:    if (t19 < 8U)
        goto LAB27;
    else
        goto LAB25;

LAB27:    t15 = (t16 + t19);
    t20 = (t17 + t19);
    if (*((unsigned char *)t15) != *((unsigned char *)t20))
        goto LAB24;

LAB28:    t19 = (t19 + 1);
    goto LAB26;

LAB30:    goto LAB2;

}

static void work_a_3754807698_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(290, ng0);

LAB3:    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    t1 = (t0 + 12176);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 11840);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3754807698_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3754807698_3212880686_p_0,(void *)work_a_3754807698_3212880686_p_1,(void *)work_a_3754807698_3212880686_p_2,(void *)work_a_3754807698_3212880686_p_3,(void *)work_a_3754807698_3212880686_p_4};
	xsi_register_didat("work_a_3754807698_3212880686", "isim/testCheminDonnees_isim_beh.exe.sim/work/a_3754807698_3212880686.didat");
	xsi_register_executes(pe);
}
