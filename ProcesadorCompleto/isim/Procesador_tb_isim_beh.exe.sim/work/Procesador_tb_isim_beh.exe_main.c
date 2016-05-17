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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;
char *STD_TEXTIO;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    std_textio_init();
    work_a_1991350011_2212415762_init();
    work_a_0194618706_3212880686_init();
    work_a_0123541133_0142796555_init();
    work_a_0295498852_3212880686_init();
    work_a_0779289101_3212880686_init();
    work_a_2425904575_3212880686_init();
    work_a_0953353097_3212880686_init();
    work_a_0330389600_3212880686_init();
    work_a_0290344353_3212880686_init();
    work_a_3961274036_3212880686_init();
    work_a_0832606739_3212880686_init();
    work_a_2521819606_1285209636_init();
    work_a_3261551314_3212880686_init();
    work_a_0737135909_3212880686_init();
    work_a_1153420228_3212880686_init();
    work_a_3030031889_3212880686_init();
    work_a_2977041509_3212880686_init();
    work_a_1883656157_3212880686_init();
    work_a_3863512822_3212880686_init();
    work_a_0327277337_2372691052_init();


    xsi_register_tops("work_a_0327277337_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");

    return xsi_run_simulation(argc, argv);

}
