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

/* This file is designed for use with ISim build 0xa0883be4 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//ad/eng/users/p/t/ptd/EC551/Demo/processor.v";
static unsigned int ng1[] = {31U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};
static int ng6[] = {1, 0};
static unsigned int ng7[] = {4U, 0U};
static unsigned int ng8[] = {8U, 0U};
static unsigned int ng9[] = {16U, 0U};
static unsigned int ng10[] = {32U, 0U};
static unsigned int ng11[] = {5U, 0U};
static unsigned int ng12[] = {64U, 0U};
static unsigned int ng13[] = {6U, 0U};
static unsigned int ng14[] = {39U, 0U};



static void Initial_66_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(66, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 7776);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);

LAB1:    return;
}

static void Initial_67_1(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(67, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 8576);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 3);

LAB1:    return;
}

static void Initial_68_2(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(68, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 7936);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 2);

LAB1:    return;
}

static void Always_107_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;

LAB0:    t1 = (t0 + 10240U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 12296);
    *((int *)t2) = 1;
    t3 = (t0 + 10272);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(108, ng0);

LAB5:    xsi_set_current_line(109, ng0);
    t4 = (t0 + 5936U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t4, 2);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB13;

LAB14:
LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(110, ng0);
    t7 = (t0 + 5296U);
    t8 = *((char **)t7);
    t7 = (t0 + 8256);
    xsi_vlogvar_assign_value(t7, t8, 0, 0, 16);
    goto LAB15;

LAB9:    xsi_set_current_line(111, ng0);
    t3 = (t0 + 5456U);
    t4 = *((char **)t3);
    t3 = (t0 + 8256);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB15;

LAB11:    xsi_set_current_line(112, ng0);
    t3 = (t0 + 4976U);
    t4 = *((char **)t3);
    t3 = (t0 + 8256);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB15;

LAB13:    xsi_set_current_line(113, ng0);
    t3 = (t0 + 4016U);
    t4 = *((char **)t3);
    t3 = (t0 + 8256);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 16);
    goto LAB15;

}

static void Always_117_4(char *t0)
{
    char t4[8];
    char t27[8];
    char t43[8];
    char t83[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    int t67;
    int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    char *t81;
    char *t82;
    char *t84;

LAB0:    t1 = (t0 + 10488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(117, ng0);
    t2 = (t0 + 12312);
    *((int *)t2) = 1;
    t3 = (t0 + 10520);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(118, ng0);

LAB5:    xsi_set_current_line(119, ng0);
    t5 = (t0 + 3696U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t5) == 0)
        goto LAB6;

LAB8:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB9:    t13 = (t4 + 4);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t6);
    t16 = (~(t15));
    *((unsigned int *)t4) = t16;
    *((unsigned int *)t13) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB11;

LAB10:    t21 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t21 & 1U);
    t22 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t22 & 1U);
    t23 = (t0 + 7936);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = ((char*)((ng3)));
    memset(t27, 0, 8);
    t28 = (t25 + 4);
    t29 = (t26 + 4);
    t30 = *((unsigned int *)t25);
    t31 = *((unsigned int *)t26);
    t32 = (t30 ^ t31);
    t33 = *((unsigned int *)t28);
    t34 = *((unsigned int *)t29);
    t35 = (t33 ^ t34);
    t36 = (t32 | t35);
    t37 = *((unsigned int *)t28);
    t38 = *((unsigned int *)t29);
    t39 = (t37 | t38);
    t40 = (~(t39));
    t41 = (t36 & t40);
    if (t41 != 0)
        goto LAB15;

LAB12:    if (t39 != 0)
        goto LAB14;

LAB13:    *((unsigned int *)t27) = 1;

LAB15:    t44 = *((unsigned int *)t4);
    t45 = *((unsigned int *)t27);
    t46 = (t44 & t45);
    *((unsigned int *)t43) = t46;
    t47 = (t4 + 4);
    t48 = (t27 + 4);
    t49 = (t43 + 4);
    t50 = *((unsigned int *)t47);
    t51 = *((unsigned int *)t48);
    t52 = (t50 | t51);
    *((unsigned int *)t49) = t52;
    t53 = *((unsigned int *)t49);
    t54 = (t53 != 0);
    if (t54 == 1)
        goto LAB16;

LAB17:
LAB18:    t75 = (t43 + 4);
    t76 = *((unsigned int *)t75);
    t77 = (~(t76));
    t78 = *((unsigned int *)t43);
    t79 = (t78 & t77);
    t80 = (t79 != 0);
    if (t80 > 0)
        goto LAB19;

LAB20:
LAB21:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 3696U);
    t3 = *((char **)t2);
    t2 = (t0 + 3376U);
    t5 = *((char **)t2);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t5);
    t9 = (t7 & t8);
    *((unsigned int *)t4) = t9;
    t2 = (t3 + 4);
    t6 = (t5 + 4);
    t12 = (t4 + 4);
    t10 = *((unsigned int *)t2);
    t11 = *((unsigned int *)t6);
    t15 = (t10 | t11);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB22;

LAB23:
LAB24:    t23 = (t4 + 4);
    t41 = *((unsigned int *)t23);
    t44 = (~(t41));
    t45 = *((unsigned int *)t4);
    t46 = (t45 & t44);
    t50 = (t46 != 0);
    if (t50 > 0)
        goto LAB25;

LAB26:
LAB27:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 6256U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB28;

LAB29:    xsi_set_current_line(122, ng0);
    t2 = (t0 + 3376U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB34;

LAB32:    if (*((unsigned int *)t2) == 0)
        goto LAB31;

LAB33:    t5 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t5) = 1;

LAB34:    t6 = (t4 + 4);
    t12 = (t3 + 4);
    t15 = *((unsigned int *)t3);
    t16 = (~(t15));
    *((unsigned int *)t4) = t16;
    *((unsigned int *)t6) = 0;
    if (*((unsigned int *)t12) != 0)
        goto LAB36;

LAB35:    t21 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t21 & 1U);
    t22 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t22 & 1U);
    t13 = (t0 + 7936);
    t14 = (t13 + 56U);
    t23 = *((char **)t14);
    t24 = ((char*)((ng4)));
    memset(t27, 0, 8);
    t25 = (t23 + 4);
    t26 = (t24 + 4);
    t30 = *((unsigned int *)t23);
    t31 = *((unsigned int *)t24);
    t32 = (t30 ^ t31);
    t33 = *((unsigned int *)t25);
    t34 = *((unsigned int *)t26);
    t35 = (t33 ^ t34);
    t36 = (t32 | t35);
    t37 = *((unsigned int *)t25);
    t38 = *((unsigned int *)t26);
    t39 = (t37 | t38);
    t40 = (~(t39));
    t41 = (t36 & t40);
    if (t41 != 0)
        goto LAB40;

LAB37:    if (t39 != 0)
        goto LAB39;

LAB38:    *((unsigned int *)t27) = 1;

LAB40:    t44 = *((unsigned int *)t4);
    t45 = *((unsigned int *)t27);
    t46 = (t44 | t45);
    *((unsigned int *)t43) = t46;
    t29 = (t4 + 4);
    t42 = (t27 + 4);
    t47 = (t43 + 4);
    t50 = *((unsigned int *)t29);
    t51 = *((unsigned int *)t42);
    t52 = (t50 | t51);
    *((unsigned int *)t47) = t52;
    t53 = *((unsigned int *)t47);
    t54 = (t53 != 0);
    if (t54 == 1)
        goto LAB41;

LAB42:
LAB43:    t57 = (t43 + 4);
    t71 = *((unsigned int *)t57);
    t72 = (~(t71));
    t73 = *((unsigned int *)t43);
    t74 = (t73 & t72);
    t76 = (t74 != 0);
    if (t76 > 0)
        goto LAB44;

LAB45:
LAB46:
LAB30:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB11:    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t14);
    *((unsigned int *)t4) = (t17 | t18);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t19 | t20);
    goto LAB10;

LAB14:    t42 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t42) = 1;
    goto LAB15;

LAB16:    t55 = *((unsigned int *)t43);
    t56 = *((unsigned int *)t49);
    *((unsigned int *)t43) = (t55 | t56);
    t57 = (t4 + 4);
    t58 = (t27 + 4);
    t59 = *((unsigned int *)t4);
    t60 = (~(t59));
    t61 = *((unsigned int *)t57);
    t62 = (~(t61));
    t63 = *((unsigned int *)t27);
    t64 = (~(t63));
    t65 = *((unsigned int *)t58);
    t66 = (~(t65));
    t67 = (t60 & t62);
    t68 = (t64 & t66);
    t69 = (~(t67));
    t70 = (~(t68));
    t71 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t71 & t69);
    t72 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t72 & t70);
    t73 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t73 & t69);
    t74 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t74 & t70);
    goto LAB18;

LAB19:    xsi_set_current_line(119, ng0);
    t81 = ((char*)((ng4)));
    t82 = (t0 + 7936);
    xsi_vlogvar_assign_value(t82, t81, 0, 0, 2);
    goto LAB21;

LAB22:    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t4) = (t18 | t19);
    t13 = (t3 + 4);
    t14 = (t5 + 4);
    t20 = *((unsigned int *)t3);
    t21 = (~(t20));
    t22 = *((unsigned int *)t13);
    t30 = (~(t22));
    t31 = *((unsigned int *)t5);
    t32 = (~(t31));
    t33 = *((unsigned int *)t14);
    t34 = (~(t33));
    t67 = (t21 & t30);
    t68 = (t32 & t34);
    t35 = (~(t67));
    t36 = (~(t68));
    t37 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t37 & t35);
    t38 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t38 & t36);
    t39 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t39 & t35);
    t40 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t40 & t36);
    goto LAB24;

LAB25:    xsi_set_current_line(120, ng0);
    t24 = ((char*)((ng3)));
    t25 = (t0 + 7936);
    xsi_vlogvar_assign_value(t25, t24, 0, 0, 2);
    goto LAB27;

LAB28:    xsi_set_current_line(121, ng0);
    t5 = (t0 + 5136U);
    t6 = *((char **)t5);
    t5 = ((char*)((ng2)));
    xsi_vlogtype_concat(t4, 16, 16, 2U, t5, 4, t6, 12);
    t12 = (t0 + 7776);
    xsi_vlogvar_assign_value(t12, t4, 0, 0, 16);
    goto LAB30;

LAB31:    *((unsigned int *)t4) = 1;
    goto LAB34;

LAB36:    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t12);
    *((unsigned int *)t4) = (t17 | t18);
    t19 = *((unsigned int *)t6);
    t20 = *((unsigned int *)t12);
    *((unsigned int *)t6) = (t19 | t20);
    goto LAB35;

LAB39:    t28 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB40;

LAB41:    t55 = *((unsigned int *)t43);
    t56 = *((unsigned int *)t47);
    *((unsigned int *)t43) = (t55 | t56);
    t48 = (t4 + 4);
    t49 = (t27 + 4);
    t59 = *((unsigned int *)t48);
    t60 = (~(t59));
    t61 = *((unsigned int *)t4);
    t67 = (t61 & t60);
    t62 = *((unsigned int *)t49);
    t63 = (~(t62));
    t64 = *((unsigned int *)t27);
    t68 = (t64 & t63);
    t65 = (~(t67));
    t66 = (~(t68));
    t69 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t69 & t65);
    t70 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t70 & t66);
    goto LAB43;

LAB44:    xsi_set_current_line(123, ng0);

LAB47:    xsi_set_current_line(124, ng0);
    t58 = (t0 + 7776);
    t75 = (t58 + 56U);
    t81 = *((char **)t75);
    t82 = ((char*)((ng6)));
    memset(t83, 0, 8);
    xsi_vlog_unsigned_add(t83, 32, t81, 16, t82, 32);
    t84 = (t0 + 7776);
    xsi_vlogvar_assign_value(t84, t83, 0, 0, 16);
    xsi_set_current_line(125, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 7936);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB46;

}

static void Always_129_5(char *t0)
{
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;

LAB0:    t1 = (t0 + 10736U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 12328);
    *((int *)t2) = 1;
    t3 = (t0 + 10768);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(130, ng0);

LAB5:    xsi_set_current_line(131, ng0);
    t4 = (t0 + 7216U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 1, t4, 1);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 1, t2, 1);
    if (t6 == 1)
        goto LAB9;

LAB10:
LAB11:    goto LAB2;

LAB7:    xsi_set_current_line(132, ng0);
    t8 = (t0 + 4016U);
    t9 = *((char **)t8);
    memset(t7, 0, 8);
    t8 = (t7 + 4);
    t10 = (t9 + 4);
    t11 = *((unsigned int *)t9);
    t12 = (t11 >> 0);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t10);
    t14 = (t13 >> 0);
    *((unsigned int *)t8) = t14;
    t15 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t15 & 4095U);
    t16 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t16 & 4095U);
    t17 = (t0 + 8416);
    xsi_vlogvar_assign_value(t17, t7, 0, 0, 12);
    goto LAB11;

LAB9:    xsi_set_current_line(133, ng0);
    t3 = (t0 + 3856U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t3 = (t7 + 4);
    t8 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 0);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 0);
    *((unsigned int *)t3) = t14;
    t15 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t15 & 4095U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 4095U);
    t9 = (t0 + 8416);
    xsi_vlogvar_assign_value(t9, t7, 0, 0, 12);
    goto LAB11;

}

static void Always_137_6(char *t0)
{
    char t13[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;

LAB0:    t1 = (t0 + 10984U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(137, ng0);
    t2 = (t0 + 12344);
    *((int *)t2) = 1;
    t3 = (t0 + 11016);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(138, ng0);

LAB5:    xsi_set_current_line(139, ng0);
    t4 = (t0 + 6096U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(139, ng0);
    t11 = (t0 + 5456U);
    t12 = *((char **)t11);
    t11 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t14 = (t12 + 4);
    t15 = (t11 + 4);
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t11);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB12;

LAB9:    if (t25 != 0)
        goto LAB11;

LAB10:    *((unsigned int *)t13) = 1;

LAB12:    t29 = (t0 + 8096);
    xsi_vlogvar_assign_value(t29, t13, 0, 0, 1);
    goto LAB8;

LAB11:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB12;

}

static void Always_142_7(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;

LAB0:    t1 = (t0 + 11232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(142, ng0);
    t2 = (t0 + 12360);
    *((int *)t2) = 1;
    t3 = (t0 + 11264);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(143, ng0);

LAB5:    xsi_set_current_line(144, ng0);
    t4 = (t0 + 2896U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 7, t4, 7);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 7, t2, 7);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 7, t2, 7);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 7, t2, 7);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 7, t2, 7);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 7, t2, 7);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 7, t2, 7);
    if (t6 == 1)
        goto LAB19;

LAB20:
LAB22:
LAB21:    xsi_set_current_line(152, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 8576);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);

LAB23:    goto LAB2;

LAB7:    xsi_set_current_line(145, ng0);
    t7 = ((char*)((ng2)));
    t8 = (t0 + 8576);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 3);
    goto LAB23;

LAB9:    xsi_set_current_line(146, ng0);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 8576);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 3);
    goto LAB23;

LAB11:    xsi_set_current_line(147, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 8576);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 3);
    goto LAB23;

LAB13:    xsi_set_current_line(148, ng0);
    t3 = ((char*)((ng5)));
    t4 = (t0 + 8576);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 3);
    goto LAB23;

LAB15:    xsi_set_current_line(149, ng0);
    t3 = ((char*)((ng7)));
    t4 = (t0 + 8576);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 3);
    goto LAB23;

LAB17:    xsi_set_current_line(150, ng0);
    t3 = ((char*)((ng11)));
    t4 = (t0 + 8576);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 3);
    goto LAB23;

LAB19:    xsi_set_current_line(151, ng0);
    t3 = ((char*)((ng13)));
    t4 = (t0 + 8576);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 3);
    goto LAB23;

}

static void Cont_156_8(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;

LAB0:    t1 = (t0 + 11480U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(156, ng0);
    t2 = (t0 + 7776);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng14)));
    memset(t6, 0, 8);
    t7 = (t4 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB5;

LAB4:    t8 = (t5 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB5;

LAB8:    if (*((unsigned int *)t4) > *((unsigned int *)t5))
        goto LAB6;

LAB7:    t10 = (t0 + 12472);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memset(t14, 0, 8);
    t15 = 1U;
    t16 = t15;
    t17 = (t6 + 4);
    t18 = *((unsigned int *)t6);
    t15 = (t15 & t18);
    t19 = *((unsigned int *)t17);
    t16 = (t16 & t19);
    t20 = (t14 + 4);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t21 | t15);
    t22 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t22 | t16);
    xsi_driver_vfirst_trans(t10, 0, 0);
    t23 = (t0 + 12376);
    *((int *)t23) = 1;

LAB1:    return;
LAB5:    t9 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB7;

LAB6:    *((unsigned int *)t6) = 1;
    goto LAB7;

}

static void Cont_157_9(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 11728U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(157, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 12536);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void implSig1_execute(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;

LAB0:    t1 = (t0 + 11976U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 8576);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng13)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB7;

LAB4:    if (t20 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t8) = 1;

LAB7:    memset(t4, 0, 8);
    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t24) != 0)
        goto LAB10;

LAB11:    t31 = (t4 + 4);
    t32 = *((unsigned int *)t4);
    t33 = *((unsigned int *)t31);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB12;

LAB13:    t38 = *((unsigned int *)t4);
    t39 = (~(t38));
    t40 = *((unsigned int *)t31);
    t41 = (t39 || t40);
    if (t41 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t31) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t43, 8);

LAB20:    t42 = (t0 + 12600);
    t44 = (t42 + 56U);
    t45 = *((char **)t44);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    memset(t47, 0, 8);
    t48 = 65535U;
    t49 = t48;
    t50 = (t3 + 4);
    t51 = *((unsigned int *)t3);
    t48 = (t48 & t51);
    t52 = *((unsigned int *)t50);
    t49 = (t49 & t52);
    t53 = (t47 + 4);
    t54 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t54 | t48);
    t55 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t55 | t49);
    xsi_driver_vfirst_trans(t42, 0, 15);
    t56 = (t0 + 12392);
    *((int *)t56) = 1;

LAB1:    return;
LAB6:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t30 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB11;

LAB12:    t35 = (t0 + 7776);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    goto LAB13;

LAB14:    t42 = (t0 + 6416U);
    t43 = *((char **)t42);
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 16, t37, 16, t43, 16);
    goto LAB20;

LAB18:    memcpy(t3, t37, 8);
    goto LAB20;

}


extern void work_m_00000000002705505175_1667949733_init()
{
	static char *pe[] = {(void *)Initial_66_0,(void *)Initial_67_1,(void *)Initial_68_2,(void *)Always_107_3,(void *)Always_117_4,(void *)Always_129_5,(void *)Always_137_6,(void *)Always_142_7,(void *)Cont_156_8,(void *)Cont_157_9,(void *)implSig1_execute};
	xsi_register_didat("work_m_00000000002705505175_1667949733", "isim/test1_isim_beh.exe.sim/work/m_00000000002705505175_1667949733.didat");
	xsi_register_executes(pe);
}
