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
static const char *ng0 = "C:/Users/utp/Desktop/Proces/Arquitectura-master/sexta entrega procesador/DataMemory.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_3261551314_3212880686_p_0(char *t0)
{
    char t19[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    int t20;
    unsigned int t21;
    int t22;
    int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;

LAB0:    xsi_set_current_line(23, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3632);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(24, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(25, ng0);
    t3 = (t0 + 1352U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)3);
    if (t9 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(29, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t1 = (t0 + 1672U);
    t4 = *((char **)t1);
    t16 = (31 - 5);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t1 = (t4 + t18);
    t7 = (t19 + 0U);
    t10 = (t7 + 0U);
    *((int *)t10) = 5;
    t10 = (t7 + 4U);
    *((int *)t10) = 0;
    t10 = (t7 + 8U);
    *((int *)t10) = -1;
    t20 = (0 - 5);
    t21 = (t20 * -1);
    t21 = (t21 + 1);
    t10 = (t7 + 12U);
    *((unsigned int *)t10) = t21;
    t22 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t1, t19);
    t23 = (t22 - 0);
    t21 = (t23 * 1);
    t24 = (32U * t21);
    t25 = (0U + t24);
    t10 = (t0 + 3776);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t3, 32U);
    xsi_driver_first_trans_delta(t10, t25, 32U, 0LL);

LAB14:
LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(26, ng0);
    t3 = xsi_get_transient_memory(32U);
    memset(t3, 0, 32U);
    t10 = t3;
    memset(t10, (unsigned char)2, 32U);
    t11 = (t0 + 3712);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t3, 32U);
    xsi_driver_first_trans_fast_port(t11);
    xsi_set_current_line(27, ng0);
    t1 = xsi_get_transient_memory(2048U);
    memset(t1, 0, 2048U);
    t3 = t1;
    t4 = (t0 + 8692);
    t2 = (32U != 0);
    if (t2 == 1)
        goto LAB11;

LAB12:    t10 = (t0 + 3776);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 2048U);
    xsi_driver_first_trans_fast(t10);
    goto LAB9;

LAB11:    t16 = (2048U / 32U);
    xsi_mem_set_data(t3, t4, 32U, t16);
    goto LAB12;

LAB13:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 2152U);
    t4 = *((char **)t1);
    t1 = (t0 + 1672U);
    t7 = *((char **)t1);
    t16 = (31 - 5);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t1 = (t7 + t18);
    t10 = (t19 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 5;
    t11 = (t10 + 4U);
    *((int *)t11) = 0;
    t11 = (t10 + 8U);
    *((int *)t11) = -1;
    t20 = (0 - 5);
    t21 = (t20 * -1);
    t21 = (t21 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t21;
    t22 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t1, t19);
    t23 = (t22 - 0);
    t21 = (t23 * 1);
    xsi_vhdl_check_range_of_index(0, 63, 1, t22);
    t24 = (32U * t21);
    t25 = (0 + t24);
    t11 = (t4 + t25);
    t12 = (t0 + 3712);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t26 = *((char **)t15);
    memcpy(t26, t11, 32U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB14;

}


extern void work_a_3261551314_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3261551314_3212880686_p_0};
	xsi_register_didat("work_a_3261551314_3212880686", "isim/Procesador_tb_isim_beh.exe.sim/work/a_3261551314_3212880686.didat");
	xsi_register_executes(pe);
}
