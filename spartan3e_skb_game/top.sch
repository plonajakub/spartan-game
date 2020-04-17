<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="keyboard_key_resolver">
            <timestamp>2020-4-17T14:11:3</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="DDR">
            <timestamp>2008-10-6T14:56:36</timestamp>
            <line x2="384" y1="-1184" y2="-1184" x1="320" />
            <rect width="64" x="320" y="-1068" height="24" />
            <line x2="384" y1="-1056" y2="-1056" x1="320" />
            <line x2="384" y1="-1120" y2="-1120" x1="320" />
            <rect width="64" x="0" y="-1164" height="24" />
            <line x2="0" y1="-1152" y2="-1152" x1="64" />
            <rect width="64" x="0" y="-1100" height="24" />
            <line x2="0" y1="-1088" y2="-1088" x1="64" />
            <rect width="64" x="0" y="-1036" height="24" />
            <line x2="0" y1="-1024" y2="-1024" x1="64" />
            <rect width="64" x="0" y="-972" height="24" />
            <line x2="0" y1="-960" y2="-960" x1="64" />
            <rect width="256" x="64" y="-1216" height="1216" />
            <rect width="64" x="320" y="-1004" height="24" />
            <line x2="384" y1="-992" y2="-992" x1="320" />
            <rect width="64" x="320" y="-940" height="24" />
            <line x2="384" y1="-928" y2="-928" x1="320" />
            <line x2="384" y1="-864" y2="-864" x1="320" />
            <line x2="384" y1="-800" y2="-800" x1="320" />
            <line x2="384" y1="-736" y2="-736" x1="320" />
            <line x2="384" y1="-672" y2="-672" x1="320" />
            <line x2="384" y1="-608" y2="-608" x1="320" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="320" y1="-96" y2="-96" x1="384" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
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
        <blockdef name="VGAtxt48x20">
            <timestamp>2008-9-4T9:59:2</timestamp>
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
        <block symbolname="keyboard_key_resolver" name="XLXI_1">
            <blockpin name="B(7:0)" />
            <blockpin name="Ret(7:0)" />
        </block>
        <block symbolname="DDR" name="XLXI_2">
            <blockpin name="BA(1:0)" />
            <blockpin name="A(12:0)" />
            <blockpin name="Cmd(2:0)" />
            <blockpin name="WrD(31:0)" />
            <blockpin name="SD_CK_FB" />
            <blockpin name="SD_DQ(15:0)" />
            <blockpin name="SD_BA(1:0)" />
            <blockpin name="SD_A(12:0)" />
            <blockpin name="SD_CKE" />
            <blockpin name="SD_CS" />
            <blockpin name="SD_RAS" />
            <blockpin name="SD_CAS" />
            <blockpin name="SD_WE" />
            <blockpin name="SD_LDM" />
            <blockpin name="SD_UDM" />
            <blockpin name="SD_UDQS" />
            <blockpin name="SD_LDQS" />
            <blockpin name="RdQ(31:0)" />
            <blockpin name="Busy" />
            <blockpin name="SD_CK_P" />
            <blockpin name="SD_CK_N" />
            <blockpin name="RefReq" />
            <blockpin name="Clk_Out" />
            <blockpin name="Clk_In" />
        </block>
        <block symbolname="PS2_Kbd" name="XLXI_3">
            <blockpin name="PS2_Clk" />
            <blockpin name="PS2_Data" />
            <blockpin name="Clk_50MHz" />
            <blockpin name="E0" />
            <blockpin name="F0" />
            <blockpin name="DO_Rdy" />
            <blockpin name="DO(7:0)" />
            <blockpin name="Clk_Sys" />
        </block>
        <block symbolname="VGAtxt48x20" name="XLXI_4">
            <blockpin name="Char_DI(7:0)" />
            <blockpin name="Home" />
            <blockpin name="NewLine" />
            <blockpin name="Goto00" />
            <blockpin name="Clk_Sys" />
            <blockpin name="Clk_50MHz" />
            <blockpin name="CursorOn" />
            <blockpin name="ScrollEn" />
            <blockpin name="ScrollClear" />
            <blockpin name="Busy" />
            <blockpin name="VGA_HS" />
            <blockpin name="VGA_VS" />
            <blockpin name="VGA_RGB" />
            <blockpin name="Char_WE" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <instance x="2400" y="1072" name="XLXI_4" orien="R0">
        </instance>
        <instance x="704" y="688" name="XLXI_3" orien="R0">
        </instance>
        <instance x="656" y="1392" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1600" y="1600" name="XLXI_2" orien="R0">
        </instance>
    </sheet>
</drawing>