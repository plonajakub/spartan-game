<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Clk_50MHz" />
        <signal name="PS2_Clk" />
        <signal name="PS2_Data" />
        <signal name="XLXN_2(7:0)" />
        <signal name="XLXN_9(7:0)" />
        <signal name="XLXN_1" />
        <signal name="start_game" />
        <signal name="new_game" />
        <signal name="reset_game" />
        <signal name="XLXN_119" />
        <signal name="XLXN_127(7:0)" />
        <signal name="VGA_HS" />
        <signal name="VGA_VS" />
        <signal name="VGA_RGB" />
        <signal name="VGA_R" />
        <signal name="VGA_G" />
        <signal name="VGA_B" />
        <port polarity="Input" name="Clk_50MHz" />
        <port polarity="Input" name="PS2_Clk" />
        <port polarity="Input" name="PS2_Data" />
        <port polarity="Input" name="start_game" />
        <port polarity="Input" name="new_game" />
        <port polarity="Input" name="reset_game" />
        <port polarity="Output" name="VGA_HS" />
        <port polarity="Output" name="VGA_VS" />
        <port polarity="Output" name="VGA_R" />
        <port polarity="Output" name="VGA_G" />
        <port polarity="Output" name="VGA_B" />
        <blockdef name="keyboard_key_resolver">
            <timestamp>2020-6-12T20:7:42</timestamp>
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
        <blockdef name="clock_divider">
            <timestamp>2020-6-12T20:8:21</timestamp>
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
        <blockdef name="game_core">
            <timestamp>2020-6-12T20:8:4</timestamp>
            <rect width="432" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="560" y1="-416" y2="-416" x1="496" />
            <rect width="64" x="496" y="-44" height="24" />
            <line x2="560" y1="-32" y2="-32" x1="496" />
        </blockdef>
        <block symbolname="clock_divider" name="XLXI_18">
            <blockpin signalname="Clk_50MHz" name="clock_in" />
            <blockpin name="reset" />
            <blockpin name="clock_out" />
            <blockpin signalname="XLXN_119" name="impulse" />
        </block>
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
        <block symbolname="game_core" name="XLXI_24">
            <blockpin signalname="Clk_50MHz" name="game_clock_i" />
            <blockpin signalname="start_game" name="start_game" />
            <blockpin signalname="new_game" name="new_game" />
            <blockpin signalname="reset_game" name="reset_game" />
            <blockpin signalname="XLXN_1" name="keyboard_data_received_i" />
            <blockpin signalname="XLXN_119" name="command_rdy" />
            <blockpin signalname="XLXN_9(7:0)" name="coded_answer(7:0)" />
            <blockpin name="busy" />
            <blockpin signalname="XLXN_127(7:0)" name="ascii_out(7:0)" />
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
        <block symbolname="VGAtxt48x20" name="XLXI_11">
            <blockpin signalname="XLXN_127(7:0)" name="Char_DI(7:0)" />
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
            <blockpin signalname="XLXN_119" name="Char_WE" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <iomarker fontsize="28" x="240" y="592" name="Clk_50MHz" orien="R180" />
        <instance x="416" y="1552" name="XLXI_18" orien="R0">
        </instance>
        <branch name="PS2_Clk">
            <wire x2="576" y1="816" y2="816" x1="544" />
        </branch>
        <branch name="PS2_Data">
            <wire x2="576" y1="880" y2="880" x1="544" />
        </branch>
        <branch name="XLXN_2(7:0)">
            <wire x2="1200" y1="816" y2="816" x1="960" />
        </branch>
        <branch name="XLXN_9(7:0)">
            <wire x2="1808" y1="816" y2="816" x1="1584" />
            <wire x2="1808" y1="816" y2="960" x1="1808" />
            <wire x2="2144" y1="960" y2="960" x1="1808" />
        </branch>
        <branch name="XLXN_1">
            <wire x2="1968" y1="1008" y2="1008" x1="960" />
            <wire x2="1968" y1="832" y2="1008" x1="1968" />
            <wire x2="2144" y1="832" y2="832" x1="1968" />
        </branch>
        <instance x="576" y="1040" name="XLXI_3" orien="R0">
        </instance>
        <instance x="1200" y="848" name="XLXI_1" orien="R0">
        </instance>
        <iomarker fontsize="28" x="544" y="880" name="PS2_Data" orien="R180" />
        <iomarker fontsize="28" x="544" y="816" name="PS2_Clk" orien="R180" />
        <branch name="start_game">
            <wire x2="2144" y1="640" y2="640" x1="2112" />
        </branch>
        <branch name="new_game">
            <wire x2="2144" y1="704" y2="704" x1="2112" />
        </branch>
        <branch name="reset_game">
            <wire x2="2144" y1="768" y2="768" x1="2112" />
        </branch>
        <instance x="2144" y="992" name="XLXI_24" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2112" y="768" name="reset_game" orien="R180" />
        <iomarker fontsize="28" x="2112" y="704" name="new_game" orien="R180" />
        <iomarker fontsize="28" x="2112" y="640" name="start_game" orien="R180" />
        <branch name="XLXN_119">
            <wire x2="1088" y1="1520" y2="1520" x1="800" />
            <wire x2="2128" y1="1520" y2="1520" x1="1088" />
            <wire x2="1088" y1="1376" y2="1520" x1="1088" />
            <wire x2="2032" y1="1376" y2="1376" x1="1088" />
            <wire x2="2032" y1="896" y2="1376" x1="2032" />
            <wire x2="2144" y1="896" y2="896" x1="2032" />
            <wire x2="2816" y1="1024" y2="1024" x1="2128" />
            <wire x2="2128" y1="1024" y2="1520" x1="2128" />
        </branch>
        <branch name="Clk_50MHz">
            <wire x2="304" y1="592" y2="592" x1="240" />
            <wire x2="304" y1="592" y2="944" x1="304" />
            <wire x2="576" y1="944" y2="944" x1="304" />
            <wire x2="304" y1="944" y2="1008" x1="304" />
            <wire x2="576" y1="1008" y2="1008" x1="304" />
            <wire x2="304" y1="1008" y2="1456" x1="304" />
            <wire x2="416" y1="1456" y2="1456" x1="304" />
            <wire x2="304" y1="1456" y2="1568" x1="304" />
            <wire x2="304" y1="1568" y2="1632" x1="304" />
            <wire x2="2816" y1="1632" y2="1632" x1="304" />
            <wire x2="2816" y1="1568" y2="1568" x1="304" />
            <wire x2="2144" y1="576" y2="576" x1="304" />
            <wire x2="304" y1="576" y2="592" x1="304" />
        </branch>
        <branch name="XLXN_127(7:0)">
            <wire x2="2816" y1="960" y2="960" x1="2704" />
        </branch>
        <branch name="VGA_HS">
            <wire x2="3280" y1="960" y2="960" x1="3248" />
        </branch>
        <branch name="VGA_VS">
            <wire x2="3280" y1="1024" y2="1024" x1="3248" />
        </branch>
        <branch name="VGA_RGB">
            <wire x2="3280" y1="1088" y2="1088" x1="3248" />
            <wire x2="3360" y1="1088" y2="1088" x1="3280" />
            <wire x2="3280" y1="1088" y2="1168" x1="3280" />
            <wire x2="3360" y1="1168" y2="1168" x1="3280" />
            <wire x2="3280" y1="1168" y2="1248" x1="3280" />
            <wire x2="3360" y1="1248" y2="1248" x1="3280" />
        </branch>
        <branch name="VGA_R">
            <wire x2="3616" y1="1088" y2="1088" x1="3584" />
        </branch>
        <branch name="VGA_G">
            <wire x2="3616" y1="1168" y2="1168" x1="3584" />
        </branch>
        <branch name="VGA_B">
            <wire x2="3616" y1="1248" y2="1248" x1="3584" />
        </branch>
        <instance x="3360" y="1120" name="XLXI_14" orien="R0" />
        <instance x="3360" y="1200" name="XLXI_15" orien="R0" />
        <instance x="3360" y="1280" name="XLXI_16" orien="R0" />
        <instance x="2816" y="1568" name="XLXI_11" orien="R0">
        </instance>
        <iomarker fontsize="28" x="3280" y="960" name="VGA_HS" orien="R0" />
        <iomarker fontsize="28" x="3280" y="1024" name="VGA_VS" orien="R0" />
        <iomarker fontsize="28" x="3616" y="1088" name="VGA_R" orien="R0" />
        <iomarker fontsize="28" x="3616" y="1168" name="VGA_G" orien="R0" />
        <iomarker fontsize="28" x="3616" y="1248" name="VGA_B" orien="R0" />
    </sheet>
</drawing>