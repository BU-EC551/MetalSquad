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
static const char *ng0 = "//ad/eng/users/p/t/ptd/EC551/Demo/DMem.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {31, 0};
static unsigned int ng3[] = {36909U, 0U};
static int ng4[] = {32, 0};
static int ng5[] = {33, 0};
static unsigned int ng6[] = {20480U, 0U};
static int ng7[] = {34, 0};
static int ng8[] = {35, 0};
static int ng9[] = {36, 0};
static int ng10[] = {37, 0};
static unsigned int ng11[] = {36928U, 0U};
static int ng12[] = {38, 0};
static unsigned int ng13[] = {36997U, 0U};
static int ng14[] = {39, 0};
static unsigned int ng15[] = {37057U, 0U};
static int ng16[] = {40, 0};
static unsigned int ng17[] = {37120U, 0U};
static int ng18[] = {41, 0};
static unsigned int ng19[] = {37184U, 0U};
static int ng20[] = {42, 0};
static unsigned int ng21[] = {45061U, 0U};
static int ng22[] = {43, 0};
static unsigned int ng23[] = {4096U, 0U};
static int ng24[] = {44, 0};
static unsigned int ng25[] = {41283U, 0U};
static int ng26[] = {45, 0};
static unsigned int ng27[] = {20804U, 0U};
static int ng28[] = {46, 0};
static unsigned int ng29[] = {41156U, 0U};
static int ng30[] = {47, 0};
static unsigned int ng31[] = {41221U, 0U};
static int ng32[] = {48, 0};
static unsigned int ng33[] = {4097U, 0U};
static int ng34[] = {49, 0};
static unsigned int ng35[] = {32834U, 0U};
static int ng36[] = {50, 0};
static unsigned int ng37[] = {12328U, 0U};
static int ng38[] = {51, 0};



static void Initial_30_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(30, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2520);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);

LAB1:    return;
}

static void Cont_32_1(char *t0)
{
    char t5[8];
    char t12[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;

LAB0:    t1 = (t0 + 4008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 2680);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 2680);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 2680);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t13 = (t0 + 1640U);
    t14 = *((char **)t13);
    memset(t12, 0, 8);
    t13 = (t12 + 4);
    t15 = (t14 + 4);
    t16 = *((unsigned int *)t14);
    t17 = (t16 >> 0);
    *((unsigned int *)t12) = t17;
    t18 = *((unsigned int *)t15);
    t19 = (t18 >> 0);
    *((unsigned int *)t13) = t19;
    t20 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t20 & 127U);
    t21 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t21 & 127U);
    xsi_vlog_generic_get_array_select_value(t5, 16, t4, t8, t11, 2, 1, t12, 7, 2);
    t22 = (t0 + 4936);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memset(t26, 0, 8);
    t27 = 65535U;
    t28 = t27;
    t29 = (t5 + 4);
    t30 = *((unsigned int *)t5);
    t27 = (t27 & t30);
    t31 = *((unsigned int *)t29);
    t28 = (t28 & t31);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t33 | t27);
    t34 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t34 | t28);
    xsi_driver_vfirst_trans(t22, 0, 15);
    t35 = (t0 + 4824);
    *((int *)t35) = 1;

LAB1:    return;
}

static void Always_33_2(char *t0)
{
    char t13[8];
    char t14[8];
    char t21[8];
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
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    int t33;
    char *t34;
    unsigned int t35;
    int t36;
    int t37;
    unsigned int t38;
    unsigned int t39;
    int t40;
    int t41;

LAB0:    t1 = (t0 + 4256U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 4840);
    *((int *)t2) = 1;
    t3 = (t0 + 4288);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(34, ng0);

LAB5:    xsi_set_current_line(35, ng0);
    t4 = (t0 + 1800U);
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

LAB6:    xsi_set_current_line(36, ng0);

LAB9:    xsi_set_current_line(37, ng0);
    t11 = (t0 + 1320U);
    t12 = *((char **)t11);
    t11 = (t0 + 2680);
    t15 = (t0 + 2680);
    t16 = (t15 + 72U);
    t17 = *((char **)t16);
    t18 = (t0 + 2680);
    t19 = (t18 + 64U);
    t20 = *((char **)t19);
    t22 = (t0 + 1640U);
    t23 = *((char **)t22);
    memset(t21, 0, 8);
    t22 = (t21 + 4);
    t24 = (t23 + 4);
    t25 = *((unsigned int *)t23);
    t26 = (t25 >> 0);
    *((unsigned int *)t21) = t26;
    t27 = *((unsigned int *)t24);
    t28 = (t27 >> 0);
    *((unsigned int *)t22) = t28;
    t29 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t29 & 127U);
    t30 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t30 & 127U);
    xsi_vlog_generic_convert_array_indices(t13, t14, t17, t20, 2, 1, t21, 7, 2);
    t31 = (t13 + 4);
    t32 = *((unsigned int *)t31);
    t33 = (!(t32));
    t34 = (t14 + 4);
    t35 = *((unsigned int *)t34);
    t36 = (!(t35));
    t37 = (t33 && t36);
    if (t37 == 1)
        goto LAB10;

LAB11:    goto LAB8;

LAB10:    t38 = *((unsigned int *)t13);
    t39 = *((unsigned int *)t14);
    t40 = (t38 - t39);
    t41 = (t40 + 1);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, *((unsigned int *)t14), t41, 0LL);
    goto LAB11;

}

static void Always_41_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;

LAB0:    t1 = (t0 + 4504U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 4856);
    *((int *)t2) = 1;
    t3 = (t0 + 4536);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(42, ng0);

LAB5:    xsi_set_current_line(43, ng0);
    t4 = (t0 + 1480U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t4, 32);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng14)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng16)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng18)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng20)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng22)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng24)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng26)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng28)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB37;

LAB38:    t2 = ((char*)((ng30)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB39;

LAB40:    t2 = ((char*)((ng32)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB41;

LAB42:    t2 = ((char*)((ng34)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB43;

LAB44:    t2 = ((char*)((ng36)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB45;

LAB46:    t2 = ((char*)((ng38)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 16, t2, 32);
    if (t6 == 1)
        goto LAB47;

LAB48:
LAB49:    goto LAB2;

LAB7:    xsi_set_current_line(69, ng0);
    t7 = ((char*)((ng3)));
    t8 = (t0 + 2520);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 16);
    goto LAB49;

LAB9:    xsi_set_current_line(70, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB11:    xsi_set_current_line(71, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB13:    xsi_set_current_line(72, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB15:    xsi_set_current_line(73, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB17:    xsi_set_current_line(74, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB19:    xsi_set_current_line(75, ng0);
    t3 = ((char*)((ng11)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB21:    xsi_set_current_line(76, ng0);
    t3 = ((char*)((ng13)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB23:    xsi_set_current_line(77, ng0);
    t3 = ((char*)((ng15)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB25:    xsi_set_current_line(78, ng0);
    t3 = ((char*)((ng17)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB27:    xsi_set_current_line(79, ng0);
    t3 = ((char*)((ng19)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB29:    xsi_set_current_line(80, ng0);
    t3 = ((char*)((ng21)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB31:    xsi_set_current_line(81, ng0);
    t3 = ((char*)((ng23)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB33:    xsi_set_current_line(82, ng0);
    t3 = ((char*)((ng25)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB35:    xsi_set_current_line(83, ng0);
    t3 = ((char*)((ng27)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB37:    xsi_set_current_line(84, ng0);
    t3 = ((char*)((ng29)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB39:    xsi_set_current_line(85, ng0);
    t3 = ((char*)((ng31)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB41:    xsi_set_current_line(86, ng0);
    t3 = ((char*)((ng33)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB43:    xsi_set_current_line(87, ng0);
    t3 = ((char*)((ng35)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB45:    xsi_set_current_line(88, ng0);
    t3 = ((char*)((ng37)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

LAB47:    xsi_set_current_line(89, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2520);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 16);
    goto LAB49;

}


extern void work_m_00000000000032032859_1368203981_init()
{
	static char *pe[] = {(void *)Initial_30_0,(void *)Cont_32_1,(void *)Always_33_2,(void *)Always_41_3};
	xsi_register_didat("work_m_00000000000032032859_1368203981", "isim/test1_isim_beh.exe.sim/work/m_00000000000032032859_1368203981.didat");
	xsi_register_executes(pe);
}
