<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="B(7:0)" />
        <signal name="XLXN_3(7:0)" />
        <signal name="XLXN_4(7:0)" />
        <signal name="XLXN_5(7:0)" />
        <signal name="XLXN_6(7:0)" />
        <signal name="XLXN_7(7:0)" />
        <signal name="XLXN_8(7:0)" />
        <signal name="XLXN_9(7:0)" />
        <signal name="XLXN_10(7:0)" />
        <signal name="Ret(7:0)" />
        <signal name="Ret(0)" />
        <signal name="Ret(1)" />
        <signal name="Ret(2)" />
        <signal name="Ret(3)" />
        <signal name="Ret(4)" />
        <signal name="Ret(5)" />
        <signal name="Ret(6)" />
        <signal name="Ret(7)" />
        <port polarity="Input" name="B(7:0)" />
        <port polarity="Output" name="Ret(7:0)" />
        <blockdef name="comp8">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-384" height="320" />
            <line x2="320" y1="-224" y2="-224" x1="384" />
            <rect width="64" x="0" y="-332" height="24" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
        </blockdef>
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
        </blockdef>
        <block symbolname="comp8" name="XLXI_1">
            <blockpin signalname="XLXN_3(7:0)" name="A(7:0)" />
            <blockpin signalname="B(7:0)" name="B(7:0)" />
            <blockpin signalname="Ret(0)" name="EQ" />
        </block>
        <block symbolname="comp8" name="XLXI_2">
            <blockpin signalname="XLXN_4(7:0)" name="A(7:0)" />
            <blockpin signalname="B(7:0)" name="B(7:0)" />
            <blockpin signalname="Ret(1)" name="EQ" />
        </block>
        <block symbolname="comp8" name="XLXI_3">
            <blockpin signalname="XLXN_5(7:0)" name="A(7:0)" />
            <blockpin signalname="B(7:0)" name="B(7:0)" />
            <blockpin signalname="Ret(2)" name="EQ" />
        </block>
        <block symbolname="comp8" name="XLXI_4">
            <blockpin signalname="XLXN_6(7:0)" name="A(7:0)" />
            <blockpin signalname="B(7:0)" name="B(7:0)" />
            <blockpin signalname="Ret(3)" name="EQ" />
        </block>
        <block symbolname="comp8" name="XLXI_5">
            <blockpin signalname="XLXN_7(7:0)" name="A(7:0)" />
            <blockpin signalname="B(7:0)" name="B(7:0)" />
            <blockpin signalname="Ret(4)" name="EQ" />
        </block>
        <block symbolname="comp8" name="XLXI_6">
            <blockpin signalname="XLXN_8(7:0)" name="A(7:0)" />
            <blockpin signalname="B(7:0)" name="B(7:0)" />
            <blockpin signalname="Ret(5)" name="EQ" />
        </block>
        <block symbolname="comp8" name="XLXI_7">
            <blockpin signalname="XLXN_9(7:0)" name="A(7:0)" />
            <blockpin signalname="B(7:0)" name="B(7:0)" />
            <blockpin signalname="Ret(6)" name="EQ" />
        </block>
        <block symbolname="comp8" name="XLXI_8">
            <blockpin signalname="XLXN_10(7:0)" name="A(7:0)" />
            <blockpin signalname="B(7:0)" name="B(7:0)" />
            <blockpin signalname="Ret(7)" name="EQ" />
        </block>
        <block symbolname="constant" name="XLXI_10">
            <attr value="30" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_3(7:0)" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_11">
            <attr value="31" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_4(7:0)" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_12">
            <attr value="32" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_5(7:0)" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_13">
            <attr value="33" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_6(7:0)" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_14">
            <attr value="34" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_7(7:0)" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_15">
            <attr value="35" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_8(7:0)" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_16">
            <attr value="36" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_9(7:0)" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_17">
            <attr value="37" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_10(7:0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="576" y="512" name="XLXI_1" orien="R0" />
        <instance x="576" y="912" name="XLXI_2" orien="R0" />
        <instance x="576" y="1328" name="XLXI_3" orien="R0" />
        <instance x="576" y="1728" name="XLXI_4" orien="R0" />
        <instance x="576" y="2144" name="XLXI_5" orien="R0" />
        <instance x="576" y="2544" name="XLXI_6" orien="R0" />
        <instance x="592" y="2944" name="XLXI_7" orien="R0" />
        <instance x="592" y="3360" name="XLXI_8" orien="R0" />
        <branch name="B(7:0)">
            <wire x2="240" y1="496" y2="496" x1="96" />
            <wire x2="240" y1="496" y2="784" x1="240" />
            <wire x2="240" y1="784" y2="1200" x1="240" />
            <wire x2="240" y1="1200" y2="1600" x1="240" />
            <wire x2="240" y1="1600" y2="2016" x1="240" />
            <wire x2="240" y1="2016" y2="2416" x1="240" />
            <wire x2="576" y1="2416" y2="2416" x1="240" />
            <wire x2="240" y1="2416" y2="2816" x1="240" />
            <wire x2="592" y1="2816" y2="2816" x1="240" />
            <wire x2="240" y1="2816" y2="3232" x1="240" />
            <wire x2="240" y1="3232" y2="3312" x1="240" />
            <wire x2="592" y1="3232" y2="3232" x1="240" />
            <wire x2="576" y1="2016" y2="2016" x1="240" />
            <wire x2="576" y1="1600" y2="1600" x1="240" />
            <wire x2="576" y1="1200" y2="1200" x1="240" />
            <wire x2="576" y1="784" y2="784" x1="240" />
            <wire x2="576" y1="384" y2="384" x1="240" />
            <wire x2="240" y1="384" y2="496" x1="240" />
        </branch>
        <iomarker fontsize="28" x="96" y="496" name="B(7:0)" orien="R180" />
        <branch name="XLXN_3(7:0)">
            <wire x2="576" y1="192" y2="192" x1="544" />
        </branch>
        <instance x="400" y="160" name="XLXI_10" orien="R0">
        </instance>
        <branch name="XLXN_4(7:0)">
            <wire x2="576" y1="592" y2="592" x1="544" />
        </branch>
        <instance x="400" y="560" name="XLXI_11" orien="R0">
        </instance>
        <branch name="XLXN_5(7:0)">
            <wire x2="576" y1="1008" y2="1008" x1="544" />
        </branch>
        <instance x="400" y="976" name="XLXI_12" orien="R0">
        </instance>
        <branch name="XLXN_6(7:0)">
            <wire x2="576" y1="1408" y2="1408" x1="544" />
        </branch>
        <instance x="400" y="1376" name="XLXI_13" orien="R0">
        </instance>
        <branch name="XLXN_7(7:0)">
            <wire x2="576" y1="1824" y2="1824" x1="544" />
        </branch>
        <instance x="400" y="1792" name="XLXI_14" orien="R0">
        </instance>
        <branch name="XLXN_8(7:0)">
            <wire x2="576" y1="2224" y2="2224" x1="544" />
        </branch>
        <instance x="400" y="2192" name="XLXI_15" orien="R0">
        </instance>
        <branch name="XLXN_9(7:0)">
            <wire x2="592" y1="2624" y2="2624" x1="560" />
        </branch>
        <instance x="416" y="2592" name="XLXI_16" orien="R0">
        </instance>
        <branch name="XLXN_10(7:0)">
            <wire x2="592" y1="3040" y2="3040" x1="560" />
        </branch>
        <instance x="416" y="3008" name="XLXI_17" orien="R0">
        </instance>
        <iomarker fontsize="28" x="1344" y="320" name="Ret(7:0)" orien="R0" />
        <branch name="Ret(7:0)">
            <wire x2="1344" y1="320" y2="416" x1="1344" />
            <wire x2="1344" y1="416" y2="528" x1="1344" />
            <wire x2="1344" y1="528" y2="656" x1="1344" />
            <wire x2="1344" y1="656" y2="752" x1="1344" />
            <wire x2="1344" y1="752" y2="864" x1="1344" />
            <wire x2="1344" y1="864" y2="992" x1="1344" />
            <wire x2="1344" y1="992" y2="1120" x1="1344" />
            <wire x2="1344" y1="1120" y2="1264" x1="1344" />
            <wire x2="1344" y1="1264" y2="3248" x1="1344" />
        </branch>
        <bustap x2="1248" y1="416" y2="416" x1="1344" />
        <bustap x2="1248" y1="528" y2="528" x1="1344" />
        <bustap x2="1248" y1="656" y2="656" x1="1344" />
        <bustap x2="1248" y1="752" y2="752" x1="1344" />
        <bustap x2="1248" y1="864" y2="864" x1="1344" />
        <bustap x2="1248" y1="992" y2="992" x1="1344" />
        <bustap x2="1248" y1="1120" y2="1120" x1="1344" />
        <bustap x2="1248" y1="1264" y2="1264" x1="1344" />
        <branch name="Ret(0)">
            <wire x2="1104" y1="288" y2="288" x1="960" />
            <wire x2="1104" y1="288" y2="416" x1="1104" />
            <wire x2="1248" y1="416" y2="416" x1="1104" />
        </branch>
        <branch name="Ret(1)">
            <wire x2="1104" y1="688" y2="688" x1="960" />
            <wire x2="1104" y1="528" y2="688" x1="1104" />
            <wire x2="1248" y1="528" y2="528" x1="1104" />
        </branch>
        <branch name="Ret(2)">
            <wire x2="1120" y1="1104" y2="1104" x1="960" />
            <wire x2="1120" y1="656" y2="1104" x1="1120" />
            <wire x2="1248" y1="656" y2="656" x1="1120" />
        </branch>
        <branch name="Ret(3)">
            <wire x2="1136" y1="1504" y2="1504" x1="960" />
            <wire x2="1136" y1="752" y2="1504" x1="1136" />
            <wire x2="1248" y1="752" y2="752" x1="1136" />
        </branch>
        <branch name="Ret(4)">
            <wire x2="1152" y1="1920" y2="1920" x1="960" />
            <wire x2="1152" y1="864" y2="1920" x1="1152" />
            <wire x2="1248" y1="864" y2="864" x1="1152" />
        </branch>
        <branch name="Ret(5)">
            <wire x2="1168" y1="2320" y2="2320" x1="960" />
            <wire x2="1168" y1="992" y2="2320" x1="1168" />
            <wire x2="1248" y1="992" y2="992" x1="1168" />
        </branch>
        <branch name="Ret(6)">
            <wire x2="1184" y1="2720" y2="2720" x1="976" />
            <wire x2="1248" y1="1120" y2="1120" x1="1184" />
            <wire x2="1184" y1="1120" y2="2720" x1="1184" />
        </branch>
        <branch name="Ret(7)">
            <wire x2="1248" y1="3136" y2="3136" x1="976" />
            <wire x2="1248" y1="1264" y2="3136" x1="1248" />
        </branch>
    </sheet>
</drawing>