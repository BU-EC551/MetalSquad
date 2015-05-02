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



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000001388426102_2035480523_init();
    work_m_00000000000634004029_1010895172_init();
    work_m_00000000000881486454_0886308060_init();
    work_m_00000000000032032859_1368203981_init();
    work_m_00000000004191208956_1180885634_init();
    work_m_00000000003844835856_1106866723_init();
    xilinxcorelib_ver_m_00000000001358910285_1041744345_init();
    xilinxcorelib_ver_m_00000000001687936702_0159979907_init();
    xilinxcorelib_ver_m_00000000000277421008_3491520672_init();
    xilinxcorelib_ver_m_00000000001485706734_1006216740_init();
    work_m_00000000002489990758_4063729699_init();
    work_m_00000000002440481736_1345247661_init();
    work_m_00000000002658114990_1418117064_init();
    work_m_00000000002705505175_1667949733_init();
    work_m_00000000001435468744_2221974671_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001435468744_2221974671");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
