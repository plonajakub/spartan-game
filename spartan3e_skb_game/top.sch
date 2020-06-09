<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_9(7:0)" />
        <signal name="XLXN_2(7:0)" />
        <signal name="XLXN_1" />
        <signal name="XLXN_17(7:0)" />
        <signal name="XLXN_18" />
        <signal name="XLXN_23(7:0)" />
        <signal name="Clk_50MHz" />
        <signal name="VGA_HS" />
        <signal name="VGA_VS" />
        <signal name="VGA_RGB" />
        <signal name="start_game" />
        <signal name="new_game" />
        <signal name="reset_game" />
        <signal name="PS2_Data" />
        <signal name="PS2_Clk" />
        <signal name="XLXN_52" />
        <signal name="VGA_R" />
        <signal name="VGA_G" />
        <signal name="VGA_B" />
        <signal name="XLXN_61" />
        <signal name="XLXN_64(2:0)" />
        <signal name="XLXN_65" />
        <signal name="XLXN_68" />
        <signal name="XLXN_69(0:4)" />
        <port polarity="Input" name="Clk_50MHz" />
        <port polarity="Output" name="VGA_HS" />
        <port polarity="Output" name="VGA_VS" />
        <port polarity="Input" name="start_game" />
        <port polarity="Input" name="new_game" />
        <port polarity="Input" name="reset_game" />
        <port polarity="Input" name="PS2_Data" />
        <port polarity="Input" name="PS2_Clk" />
        <port polarity="Output" name="VGA_R" />
        <port polarity="Output" name="VGA_G" />
        <port polarity="Output" name="VGA_B" />
        <blockdef name="keyboard_key_resolver">
            <timestamp>2020-5-30T22:10:30</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="PS2_Kbd">
            <timestamp>2008-9-19T9:9:36</timestamp>
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <blockdef name="task_master">
            <timestamp>2020-6-7T22:17:34</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="608" y="20" height="24" />
            <line x2="672" y1="32" y2="32" x1="608" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="672" y1="-224" y2="-224" x1="608" />
            <rect width="64" x="608" y="-172" height="24" />
            <line x2="672" y1="-160" y2="-160" x1="608" />
            <rect width="64" x="608" y="-108" height="24" />
            <line x2="672" y1="-96" y2="-96" x1="608" />
            <rect width="544" x="64" y="-320" height="384" />
        </blockdef>
        <blockdef name="clock_divider">
            <timestamp>2020-5-30T22:10:46</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="VGAtxt48x20">
            <timestamp>2020-4-25T15:18:46</timestamp>
            <rect width="304" x="64" y="-640" height="728" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="64" y2="64" x1="64" />
            <line x2="0" y1="0" y2="0" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <line x2="432" y1="-608" y2="-608" x1="368" />
            <line x2="432" y1="-544" y2="-544" x1="368" />
            <line x2="432" y1="-480" y2="-480" x1="368" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
        </blockdef>
        <blockdef name="game_master">
            <timestamp>2020-6-9T19:55:57</timestamp>
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="592" y1="-352" y2="-352" x1="528" />
            <rect width="64" x="528" y="-268" height="24" />
            <line x2="592" y1="-256" y2="-256" x1="528" />
            <rect width="64" x="528" y="-172" height="24" />
            <line x2="592" y1="-160" y2="-160" x1="528" />
            <rect width="464" x="64" y="-380" height="428" />
            <line x2="592" y1="16" y2="16" x1="528" />
            <rect width="64" x="528" y="4" height="24" />
        </blockdef>
        <blockdef name="graphic_controller">
            <timestamp>2020-6-9T19:38:35</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="496" y1="-416" y2="-416" x1="432" />
            <rect width="64" x="432" y="-44" height="24" />
            <line x2="496" y1="-32" y2="-32" x1="432" />
            <rect width="368" x="64" y="-448" height="640" />
        </blockdef>
        <block symbolname="PS2_Kbd" name="XLXI_3">
            <blockpin signalname="PS2_Clk" name="PS2_Clk" />
            <blockpin signalname="PS2_Data" name="PS2_Data" />
            <blockpin signalname="Clk_50MHz" name="Clk_50MHz" />
            <blockpin name="E0" />
            <blockpin name="F0" />
            <blockpin signalname="XLXN_1" name="DO_Rdy" />
            <blockpin signalname="XLXN_2(7:0)" name="DO(7:0)" />
            <blockpin signalname="Clk_50MHz" name="Clk_Sys" />
        </block>
        <block symbolname="keyboard_key_resolver" name="XLXI_1">
            <blockpin signalname="XLXN_2(7:0)" name="B(7:0)" />
            <blockpin signalname="XLXN_9(7:0)" name="Ret(7:0)" />
        </block>
        <block symbolname="VGAtxt48x20" name="XLXI_11">
            <blockpin signalname="XLXN_23(7:0)" name="Char_DI(7:0)" />
            <blockpin name="Home" />
            <blockpin name="NewLine" />
            <blockpin name="Goto00" />
            <blockpin signalname="Clk_50MHz" name="Clk_Sys" />
            <blockpin signalname="Clk_50MHz" name="Clk_50MHz" />
            <blockpin name="CursorOn" />
            <blockpin name="ScrollEn" />
            <blockpin name="ScrollClear" />
            <blockpin name="Busy" />
            <blockpin signalname="VGA_HS" name="VGA_HS" />
            <blockpin signalname="VGA_VS" name="VGA_VS" />
            <blockpin signalname="VGA_RGB" name="VGA_RGB" />
            <blockpin signalname="XLXN_52" name="Char_WE" />
        </block>
        <block symbolname="buf" name="XLXI_14">
            <blockpin signalname="VGA_RGB" name="I" />
            <blockpin signalname="VGA_R" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_15">
            <blockpin signalname="VGA_RGB" name="I" />
            <blockpin signalname="VGA_G" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_16">
            <blockpin signalname="VGA_RGB" name="I" />
            <blockpin signalname="VGA_B" name="O" />
        </block>
        <block symbolname="task_master" name="XLXI_9">
            <blockpin signalname="Clk_50MHz" name="game_clock_i" />
            <blockpin signalname="XLXN_61" name="start_task_i" />
            <blockpin signalname="XLXN_9(7:0)" name="coded_answer(7:0)" />
            <blockpin signalname="XLXN_18" name="task_finished" />
            <blockpin name="current_task_state(2:0)" />
            <blockpin signalname="XLXN_17(7:0)" name="task_points(7:0)" />
            <blockpin signalname="XLXN_1" name="keyboard_data_received_i" />
            <blockpin name="current_task_number(2:0)" />
        </block>
        <block symbolname="clock_divider" name="XLXI_13">
            <blockpin signalname="Clk_50MHz" name="clock_in" />
            <blockpin name="reset" />
            <blockpin name="clock_out" />
            <blockpin signalname="XLXN_52" name="impulse" />
        </block>
        <block symbolname="constant" name="XLXI_17">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_64(2:0)" name="O" />
        </block>
        <block symbolname="clock_divider" name="XLXI_18">
            <blockpin signalname="Clk_50MHz" name="clock_in" />
            <blockpin name="reset" />
            <blockpin name="clock_out" />
            <blockpin signalname="XLXN_65" name="impulse" />
        </block>
        <block symbolname="constant" name="XLXI_19">
            <attr value="2" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_68" name="O" />
        </block>
        <block symbolname="game_master" name="XLXI_22">
            <blockpin signalname="Clk_50MHz" name="game_clock_i" />
            <blockpin signalname="start_game" name="start_game" />
            <blockpin signalname="new_game" name="new_game" />
            <blockpin signalname="reset_game" name="reset_game" />
            <blockpin signalname="XLXN_18" name="subgame_data_ready" />
            <blockpin signalname="XLXN_17(7:0)" name="subgame_data(7:0)" />
            <blockpin signalname="XLXN_61" name="subgame_start" />
            <blockpin name="game_state(2:0)" />
            <blockpin name="subgame_address(1:0)" />
            <blockpin signalname="XLXN_69(0:4)" name="game_points(0:4)" />
        </block>
        <block symbolname="graphic_controller" name="XLXI_23">
            <blockpin signalname="Clk_50MHz" name="clock" />
            <blockpin signalname="XLXN_65" name="command_rdy" />
            <blockpin signalname="XLXN_68" name="in_gr_id" />
            <blockpin name="in_gr_row_idx" />
            <blockpin name="in_gr_col_idx" />
            <blockpin signalname="XLXN_64(2:0)" name="command(2:0)" />
            <blockpin signalname="XLXN_69(0:4)" name="string_to_write(0:4)" />
            <blockpin name="busy" />
            <blockpin signalname="XLXN_23(7:0)" name="ascii_out(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="XLXN_9(7:0)">
            <wire x2="2976" y1="816" y2="816" x1="2752" />
        </branch>
        <branch name="XLXN_2(7:0)">
            <wire x2="2368" y1="816" y2="816" x1="2128" />
        </branch>
        <branch name="XLXN_1">
            <wire x2="2976" y1="1008" y2="1008" x1="2128" />
        </branch>
        <instance x="1744" y="1040" name="XLXI_3" orien="R0">
        </instance>
        <instance x="2368" y="848" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_23(7:0)">
            <wire x2="2624" y1="1696" y2="1696" x1="1888" />
        </branch>
        <instance x="2624" y="2304" name="XLXI_11" orien="R0">
        </instance>
        <branch name="VGA_HS">
            <wire x2="3088" y1="1696" y2="1696" x1="3056" />
        </branch>
        <iomarker fontsize="28" x="3088" y="1696" name="VGA_HS" orien="R0" />
        <branch name="VGA_VS">
            <wire x2="3088" y1="1760" y2="1760" x1="3056" />
        </branch>
        <iomarker fontsize="28" x="3088" y="1760" name="VGA_VS" orien="R0" />
        <branch name="VGA_RGB">
            <wire x2="3088" y1="1824" y2="1824" x1="3056" />
            <wire x2="3168" y1="1824" y2="1824" x1="3088" />
            <wire x2="3088" y1="1824" y2="1904" x1="3088" />
            <wire x2="3168" y1="1904" y2="1904" x1="3088" />
            <wire x2="3088" y1="1904" y2="1984" x1="3088" />
            <wire x2="3168" y1="1984" y2="1984" x1="3088" />
        </branch>
        <branch name="XLXN_17(7:0)">
            <wire x2="1072" y1="64" y2="544" x1="1072" />
            <wire x2="1328" y1="544" y2="544" x1="1072" />
            <wire x2="3744" y1="64" y2="64" x1="1072" />
            <wire x2="3744" y1="64" y2="880" x1="3744" />
            <wire x2="3744" y1="880" y2="880" x1="3648" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="3696" y1="112" y2="112" x1="1104" />
            <wire x2="3696" y1="112" y2="752" x1="3696" />
            <wire x2="1104" y1="112" y2="480" x1="1104" />
            <wire x2="1328" y1="480" y2="480" x1="1104" />
            <wire x2="3696" y1="752" y2="752" x1="3648" />
        </branch>
        <branch name="start_game">
            <wire x2="1328" y1="288" y2="288" x1="1312" />
        </branch>
        <branch name="new_game">
            <wire x2="1328" y1="352" y2="352" x1="1312" />
        </branch>
        <branch name="reset_game">
            <wire x2="1328" y1="416" y2="416" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="1312" y="416" name="reset_game" orien="R180" />
        <iomarker fontsize="28" x="1312" y="352" name="new_game" orien="R180" />
        <iomarker fontsize="28" x="1312" y="288" name="start_game" orien="R180" />
        <iomarker fontsize="28" x="240" y="592" name="Clk_50MHz" orien="R180" />
        <branch name="PS2_Data">
            <wire x2="1744" y1="880" y2="880" x1="1712" />
        </branch>
        <iomarker fontsize="28" x="1712" y="880" name="PS2_Data" orien="R180" />
        <branch name="PS2_Clk">
            <wire x2="1744" y1="816" y2="816" x1="1712" />
        </branch>
        <iomarker fontsize="28" x="1712" y="816" name="PS2_Clk" orien="R180" />
        <instance x="3168" y="1856" name="XLXI_14" orien="R0" />
        <instance x="3168" y="1936" name="XLXI_15" orien="R0" />
        <instance x="3168" y="2016" name="XLXI_16" orien="R0" />
        <branch name="VGA_R">
            <wire x2="3424" y1="1824" y2="1824" x1="3392" />
        </branch>
        <iomarker fontsize="28" x="3424" y="1824" name="VGA_R" orien="R0" />
        <branch name="VGA_G">
            <wire x2="3424" y1="1904" y2="1904" x1="3392" />
        </branch>
        <iomarker fontsize="28" x="3424" y="1904" name="VGA_G" orien="R0" />
        <branch name="VGA_B">
            <wire x2="3424" y1="1984" y2="1984" x1="3392" />
        </branch>
        <iomarker fontsize="28" x="3424" y="1984" name="VGA_B" orien="R0" />
        <instance x="2976" y="976" name="XLXI_9" orien="R0">
        </instance>
        <branch name="XLXN_52">
            <wire x2="1952" y1="2016" y2="2016" x1="1280" />
            <wire x2="2624" y1="1760" y2="1760" x1="1952" />
            <wire x2="1952" y1="1760" y2="2016" x1="1952" />
        </branch>
        <instance x="896" y="2048" name="XLXI_13" orien="R0">
        </instance>
        <branch name="XLXN_61">
            <wire x2="2880" y1="224" y2="224" x1="1920" />
            <wire x2="2880" y1="224" y2="752" x1="2880" />
            <wire x2="2976" y1="752" y2="752" x1="2880" />
        </branch>
        <branch name="Clk_50MHz">
            <wire x2="304" y1="592" y2="592" x1="240" />
            <wire x2="304" y1="592" y2="688" x1="304" />
            <wire x2="2976" y1="688" y2="688" x1="304" />
            <wire x2="304" y1="688" y2="944" x1="304" />
            <wire x2="1744" y1="944" y2="944" x1="304" />
            <wire x2="304" y1="944" y2="1008" x1="304" />
            <wire x2="1744" y1="1008" y2="1008" x1="304" />
            <wire x2="304" y1="1008" y2="1456" x1="304" />
            <wire x2="304" y1="1456" y2="1952" x1="304" />
            <wire x2="304" y1="1952" y2="2304" x1="304" />
            <wire x2="304" y1="2304" y2="2368" x1="304" />
            <wire x2="2624" y1="2368" y2="2368" x1="304" />
            <wire x2="2624" y1="2304" y2="2304" x1="304" />
            <wire x2="896" y1="1952" y2="1952" x1="304" />
            <wire x2="416" y1="1456" y2="1456" x1="304" />
            <wire x2="304" y1="352" y2="592" x1="304" />
            <wire x2="1040" y1="352" y2="352" x1="304" />
            <wire x2="1040" y1="352" y2="1312" x1="1040" />
            <wire x2="1392" y1="1312" y2="1312" x1="1040" />
            <wire x2="1328" y1="224" y2="224" x1="1040" />
            <wire x2="1040" y1="224" y2="352" x1="1040" />
        </branch>
        <branch name="XLXN_64(2:0)">
            <wire x2="1392" y1="1440" y2="1440" x1="1360" />
        </branch>
        <instance x="416" y="1552" name="XLXI_18" orien="R0">
        </instance>
        <branch name="XLXN_65">
            <wire x2="1088" y1="1520" y2="1520" x1="800" />
            <wire x2="1088" y1="1376" y2="1520" x1="1088" />
            <wire x2="1392" y1="1376" y2="1376" x1="1088" />
        </branch>
        <branch name="XLXN_68">
            <wire x2="1392" y1="1760" y2="1760" x1="1360" />
        </branch>
        <instance x="1328" y="576" name="XLXI_22" orien="R0">
        </instance>
        <instance x="1392" y="1728" name="XLXI_23" orien="R0">
        </instance>
        <instance x="1216" y="1728" name="XLXI_19" orien="R0">
        </instance>
        <instance x="1216" y="1408" name="XLXI_17" orien="R0">
        </instance>
        <branch name="XLXN_69(0:4)">
            <wire x2="1152" y1="656" y2="1696" x1="1152" />
            <wire x2="1392" y1="1696" y2="1696" x1="1152" />
            <wire x2="1920" y1="656" y2="656" x1="1152" />
            <wire x2="1920" y1="592" y2="656" x1="1920" />
        </branch>
    </sheet>
</drawing>