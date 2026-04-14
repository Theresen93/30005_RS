######################################################
#                                                    #
# Automatic generated Makefile for Visual Components #
#                                                    #
#                  Do NOT edit!                      #
#                                                    #
######################################################

VCC:=@'$(AS_BIN_PATH)/br.vc.pc.exe'
LINK:=@'$(AS_BIN_PATH)/BR.VC.Link.exe'
MODGEN:=@'$(AS_BIN_PATH)/BR.VC.ModGen.exe'
VCPL:=@'$(AS_BIN_PATH)/BR.VC.PL.exe'
VCHWPP:=@'$(AS_BIN_PATH)/BR.VC.HWPP.exe'
VCDEP:=@'$(AS_BIN_PATH)/BR.VC.Depend.exe'
VCFLGEN:=@'$(AS_BIN_PATH)/BR.VC.lfgen.exe'
VCREFHANDLER:=@'$(AS_BIN_PATH)/BR.VC.CrossReferenceHandler.exe'
VCXREFEXTENDER:=@'$(AS_BIN_PATH)/BR.AS.CrossRefVCExtender.exe'
RM=CMD /C DEL
PALFILE_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Palette.vcr
VCCFLAGS_HMI_10=-server -proj HMI_10 -vc '$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/VCObject.vc' -prj_path '$(AS_PROJECT_PATH)' -temp_path '$(AS_TEMP_PATH)' -cfg $(AS_CONFIGURATION) -plc $(AS_PLC) -plctemp $(AS_TEMP_PLC) -cpu_path '$(AS_CPU_PATH)'
VCFIRMWARE=4.73.2
VCFIRMWAREPATH=$(AS_VC_PATH)/Firmware/V4.73.2/SG4
VCOBJECT_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/VCObject.vc
VCSTARTUP='vcstart.br'
VCLOD='vclod.br'
VCSTPOST='vcstpost.br'
TARGET_FILE_HMI_10=$(AS_CPU_PATH)/HMI_10.br
OBJ_SCOPE_HMI_10=HMI
PRJ_PATH_HMI_10=$(AS_PROJECT_PATH)
SRC_PATH_HMI_10=$(AS_PROJECT_PATH)/Logical/$(OBJ_SCOPE_HMI_10)/HMI_10
TEMP_PATH_HMI_10=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/HMI_10
TEMP_PATH_Shared=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared
TEMP_PATH_ROOT_HMI_10=$(AS_TEMP_PATH)
VC_LIBRARY_LIST_HMI_10=$(TEMP_PATH_HMI_10)/libraries.vci
VC_XREF_BUILDFILE_HMI_10=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcxref.build
VC_XREF_CLEANFILE=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcxref.clean
VC_LANGUAGES_HMI_10=$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr
CPUHWC='$(TEMP_PATH_HMI_10)/cpuhwc.vci'
VC_STATIC_OPTIONS_HMI_10='$(TEMP_PATH_HMI_10)/vcStaticOptions.xml'
VC_STATIC_OPTIONS_Shared='$(TEMP_PATH_Shared)/vcStaticOptions.xml'
# include Shared and Font Makefile (only once)
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCFntDat/Font_HMI_10.mak
ifneq ($(VCINC),1)
	VCINC=1
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/VCShared.mak
endif

DEPENDENCIES_HMI_10=-d vcgclass -profile 'False'
DEFAULT_STYLE_SHEET_HMI_10='Source[local].StyleSheet[Color]'
SHARED_MODULE=$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcshared.br
LFNTFLAGS_HMI_10=-P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)'
BDRFLAGS_HMI_10=-P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)'

# Local Libs
LIB_LOCAL_OBJ_HMI_10=$(TEMP_PATH_HMI_10)/localobj.vca

# Hardware sources
PANEL_HW_OBJECT_HMI_10=$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/HMI_10/dis.Hardware.vco
PANEL_HW_VCI_HMI_10=$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/HMI_10/dis.Hardware.vci
PANEL_HW_SOURCE_HMI_10=C:/HolwegWeber/Holweg/RS15_RX_30005_r00/Physical/Config1/Hardware.hw 
DIS_OBJECTS_HMI_10=$(PANEL_HW_OBJECT_HMI_10) $(KEYMAP_OBJECTS_HMI_10)

# KeyMapping flags
KEYMAP_SOURCES_HMI_10=
KEYMAP_OBJECTS_HMI_10=

# All Source Objects
TXTGRP_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/UnwindTension1_OffOn.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DrawRoll_OffsetActive.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/MachineDisplay_1.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/MachineDisplay_2.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/Count.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DrawrollRegistration_2.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/Drive_Health.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DrawrollRegistration_1.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_MaintenanceScreen.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/BottomPaste_OffAutoOn.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/OnOff.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/PerfSize_Ind.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/NotReady_Ready.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/Users.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_StatusScreen.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/SystemTransfer_Ind.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/Trace_Ind.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/OffOn_Ind1.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/ManAuto_Ind.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/OffOn_Ind2.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/GlueTray_Ind.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/GlueTraySlowRot_Ind.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/Homing_Ind.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/CountPB_Ind.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/Perf_Ind.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/Vacuum_Ind.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/TubeSelection_Ind.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/MachineMode_Ind.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/ManualMode_Ind.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/StartStopInitBund.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/SetSpeedAutoManu.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/HighLow.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/SelectGlue.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_MaintenanceScreen_V1.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_NumPrintPerRound.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/ClosedOpen.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/StartStopOffsetFlexo.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/HotMicroPerf_Mode.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DeflectorFan_Ind.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/HMPerf_OperState.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/FlexoPress_Dryer.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/FP_PrintAuto.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/HMPerf_HeatState.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/ActPerfCylinder.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/RefPB.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_MaintenanceScreenV2.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_StatusScreenV1.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/ShowHide.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_StatusScreenV2.txtgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_MaintenanceScreenV3.txtgrp 

FNINFO_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/DefaultFont.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial9px.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial9pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial10pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial12px.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial9pxValue.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_26b_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_12_Bold_Italic.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_17_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_15_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_14_Bold_Italic.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_13_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_14_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_12_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_10_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_20_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_26_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_9_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_12.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_10.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_8_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_18_Italic.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_36_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_18_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_11_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_10_Bold_Italic.fninfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Fonts/Arial_10_Bold1.fninfo 

BMINFO_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA1.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA2.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA3.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadVGA_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA2_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA3_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA1_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadVGA.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/NumPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/NumPad.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AcknowledgeReset.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmActive.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmBypassOFF.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmBypassON.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmInactive.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmLatched.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmNotQuit.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmQuit.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Reset.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ResetAcknowledge.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Triggered.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ListPadHor.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ListPadHor_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ListPadVer.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ListPadVer_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/backward_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/backward_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/global_area_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/global_area_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/forward_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/forward_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/control_button_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/control_button_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/right_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/right_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/left_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/left_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/up_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/up_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/down_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/down_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/multi_up_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/multi_up_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/multi_down_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/multi_down_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ProgressBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/down_active_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/down_pressed_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/up_active_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/global_area_gradient_upside.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/global_area_gradient_downside.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/frame_header.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/up_pressed_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EditPadVGA.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EditPadVGA_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneNumPad_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneListPadVer_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPad_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPadQVGA1_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPadQVGA1_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPadQVGA2_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPadQVGA3_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneEditpadQVGA2_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneEditPadQVGA3_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneEditPadVga_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneEditPadVga_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneListPadHor_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneListPadHor_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneListPadVer_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneNumPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Logo_150.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/login_16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/logout_16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowup_16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowdown_16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Splash_607.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Alarm_24x24.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/OK_24x24.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/NotOK_14x14.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/OK_14x14.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Cancel_24x24.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/filesave_24x24.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/folder_24x24.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Alarm_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/OK_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/HolwegLogo_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Holweg_dcm.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_40x23.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_down_Blue.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_down_Blue_20x12.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_down_Blue_26X15.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_down_Blue_40x23.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Left_Blue26X15A.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Left_Blue.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Left_Blue_26X15.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Left_Blue_40x23.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Right_Blue.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Right_Blue_26X15.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Right_Blue_40x23.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_26X15.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_20x12.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_26X15_V1.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_20x12_V1.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_20x12_V2.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Vue_ensemble_PH_RS15_V1_500x250.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Vue_ensemble_PH_RS15_V2_500x250.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Vue_ensemble_PH_RS15_V3_440x220.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Vue_ensemble_PH_RS15_V1_440x220.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/_BBKEM0002_coupe_gen_V1_480x228.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/_BBKEM0002_Tilter_330x220.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/_BBKEM0002_Sep_336x220.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/_BBKEM0002_Eject_388x220.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Re_44x22.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Gr_44x22.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Gra_44x22.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Re_44x22.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Gr_44x22.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Gra_44x22.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Gra_1_44x22.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Gra_3D.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Bla_3D.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Re_1_44x22.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Gr_1_44x22.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Gr_1_44x22.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Re_1_44x22.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Gra_1_44x22.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Re_42x45.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Gr_42x45.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Gra_42x45.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Re_44x47.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Gr_44x47.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Gra_44x47.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Re_1_44x47.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Gr_1_42x45.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Gra_1_42x45.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Re_1_42x45.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Gr_1_44x47.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Gra_1_44x47.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Gra_43x33.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Gr_41x31.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Gra_41x31.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Re_43x33.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Gr_43x33.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Re_41x31.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Gra_1_43x33.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Gr_1_41x31.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Gra_1_41x31.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Re_1_43x33.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Gr_1_43x33.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Re_1_41x31.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Re_1_43x33.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowRot.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowup_10x10.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowdown_10x10.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowDownBla_10x10.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowUpBla_10x10.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowUpBlu_16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowDownBlu_16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowDownBla_16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowUpBla_16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowRightBla_16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowLeftBla_16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowLeftBlu_16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowRightBlu_16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/BundMaint_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxPerf_RS15_mm.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxPerf_RS15_Inch.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoInfo.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoInfo_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/BundMaint_2.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxPerf_RS26_Inch.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxPerf_RS26_mm.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_96x96.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_96x96.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_96x96.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_96x96.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_96x96.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_64x64.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_64x64.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_64x64.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_64x64.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_64x64.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_169x169.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_169x169.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_169x169.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_169x169.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_169x169.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_0_169x169.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_0_169x169.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_0_169x169.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_0_169x169.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_0_169x169.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_85x85.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_85x85.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_85x85.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_85x85.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_85x85.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf2Pinces_242x224.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf4Pinces_1_235x224.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf4Pinces_2_238x224.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/TE_2P_148x224.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/TE_4P_145x224.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxRS26Perfo1_2_mm.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxRS26Perfo1_2_Inch.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoType1_2_mm_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoType1_2_Inch_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoType1_mm.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoType1_in.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf2Pinces_1_242x224.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/RS26_VueGen_420x223.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Logotype_HOLWEG2_64x23.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Logotype_HOLWEG2_2_70x25.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoApPo_520_mm.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoApPo_520_Inch.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_EnvBag_4_235x223.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_EnvBag_5_235x224.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_1_235x218.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_2_235x218.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_3_235x218.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_1_235x223.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_2_235x223.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_3_235x223.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_4_235x218.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_5_235x220.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Logotype_HOLWEG2_500x180_Modifie.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PochetteVertical_135x140.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Pochette_FinZoneSynchro_140x135.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PochetteHorizontal_140x135.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Pochette_DepZoneSynchro_140x135.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PochetteVertical_70x70.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Pochette_DepZoneSynchro_70x70.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Pochette_FinZoneSynchro_70x70.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PochetteHorizontal_70x70.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ContrePressionPerfo_87x87.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ZoneAvSynchroPerf_49x30.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ZoneApSynchroPerf_49x30.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PerfLargeVertical_42x70.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PerfLarge_DepZSynchro_70x60.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PerfLarge_FinZSynchro_70x60.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PosHomePerf_51x77.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoInfo_16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_EnvBag_4_118x112.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_1_118x109.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_2_118x109.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_3_118x109.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_1_118x112.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_2_118x112.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_3_118x112.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_4_118x110.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_5_118x110.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zzEnvB_HoldTear_EnvBag_5_118x112.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/TE_2P_74x112.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/TE_4P_72x111.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_EnvBag_5_118x112.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/A.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Bla_3D_16x17.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowleft_16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowright_16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/BP_AU_25x27.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoWarmRestart_17x17.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoColdRestart_17x17.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoWarmRestart_24x24.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoColdRestart_24x24.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf4Main_238x224.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf2Main_238x224.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Bitmap_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Bitmap_2.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CrbCadMax_RS15_PerfoT1_2_IF_mm.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CrbCadMax_RS15_PerfoT1_2_IF_In.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/TE_4P_RS15_185x226.bminfo \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ksysguard.bminfo 

BMGRP_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/AlphaPadQVGA.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/NumPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/AlphaPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/AlarmEvent.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/AlarmState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/BypassState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/AcknowledgeState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/NavigationPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/Borders.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/OK_Ind.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/NotOK_Ind.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/Alarm_OK_Large.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/Alarm_OK_Small.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/MovManuBundEject.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/MovManuBundSep.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/MovManuBundTilt.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/CadMaxPerf_RS15_Perfo1_2.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/CadMaxPerf_RS26_Perfo1.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/VisuSynchro_96x96.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/VisuSynchro_32x32.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/VisuSynchro_64x64.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/VisuSynchro_169x169.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/VisuSynchro_169x169_1.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/VisuSynchro_85x85.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/HoldTearPositionRS26.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/DrumPos.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/CadMaxPerf_RS26_Perfo1_2.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/CadMaxPerf_RS26_ApPo_520_IF.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/HoldTearEnvBPosition.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/HoldTearPosition_CasEnvB.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/HoldTearPosition_CasEnvB_1.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/HoldTearEnvBPosition_1.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/DrumPos_1.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/HoldTearPositionRS15.bmgrp \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/CadMaxPerf_RS15_Perfo1_2_IF.bmgrp 

PAGE_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P1_Main_BagMachine.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P0_Splash.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P10_Setup_BagMachine.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P40_Maint_BagMachine.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P20_Status_BagMachine.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P30_Alarms_Active.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P31_Alarms_History.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P50_Maint_IO_MainCabinet_1.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P55_Maint_IO_L3_1.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P56_Maint_IO_L3_2.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P43_Maint_Misc.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P44_Maint_Password.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P45_Maint_Info.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P4_Main_Glue.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P5_Main_Registration.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P3_Main_Count.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P41_Maint_Reference1.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P11_Setup_Perf.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/ZZZ.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P100_Main_Bundler.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P101_Main_BundManuEject.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P102_Main_BundManuSep.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P103_Main_BundManuTilt.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P245_Maint_Bundler.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P209_Maint_IO_L9_1.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P210_Maint_IO_L9_2.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P6_Main_Flexo.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P92_Main_ExitTable.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P204_Main_Glue_V2.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P51_Maint_IO_MainCabinet_2.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P52_Maint_IO_MainCabinet_3.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P57_Maint_IO_L3_3.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P307_Main_MicroPerf.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P12_Setup_HoldTearDr.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P107_Main_EnvelopeBag.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P42_Maint_Reference2.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/ZZZZ.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P13_Setup_HoldTearDr_1.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/ZZZZZ.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P104_Main_Glue_V0.page \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P7_TrendHearter.page 

LAYER_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/Header.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/Control.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/Underlay_Main.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/Underlay_Setup.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/InvalidPassword.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PasswordChange.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PasswordChangeAccepted.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PasswordChangeFail.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PasswordConfirm.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PopUp_ProductCountReset.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/Underlay_Status.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/Underlay_Alarms.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/Underlay_Maintenance.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/ZZZ.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PopUp_LineSpeedAutoConfirm.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PerfSpeedCurve_RS15_Perfo1_2.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/BagMachineSetUp.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PerfSpeedCurve_RS26_Perfo1_IF.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PopUp_AxisSynchroInProgress.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PerfSpeedCurve_RS26_Perfo1_2_IF.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/EnvBagPerfSetUp.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/StandPerfSetUp.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/HoldTearEnvB_Offset.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PerfSpeedCurve_RS26_ApPo_520_IF.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/SetUpHoldTearDrumRS26.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/SetUpHoldTearApPoDrumRS26.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/SetUpHoldTearDrumRS15.layer \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PerfSpeedCurve_RS15_Perfo1_2_IF.layer 

VCS_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/StyleSheets/Gray.vcs \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/StyleSheets/Color.vcs 

BDR_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Raised.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Sunken.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Etched.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Bump.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/SunkenOuter.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/RaisedInner.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Flat_black.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Flat_grey.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/BackwardActive.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/BackwardPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ControlActive.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ControlPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/DownActiveControl.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/DownPressedControl.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ForwardActive.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ForwardPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/GlobalAreaActive.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/GlobalAreaPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/MultiScrollDownActive.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/MultiScrollDownPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/MultiScrollUpActive.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/MultiScrollUpPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ProgressBarBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollDownActive.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollDownPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollUpActive.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollUpPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollLeftActive.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollLeftPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollRightActive.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollRightPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/UpActiveControl.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/UpPressedControl.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/FrameHeader.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Button1_Pressed1.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Button1_Active1.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Button1_Pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Button1_Active.bdr 

TPR_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TouchPads/NumPad.tpr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TouchPads/AlphaPadQVGA.tpr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TouchPads/AlphaPad.tpr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TouchPads/NavigationPad_ver.tpr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TouchPads/NavigationPad_hor.tpr \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TouchPads/EditPad.tpr 

TDC_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Trends/TrendData.tdc 

TRD_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Trends/TrendData_1.trd \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Trends/TrendData_2.trd \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Trends/TrendData_3.trd 

TRE_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Trends/TrendHeaterDryerControl.tre 

CLM_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/ColorMaps/Sensor.clm \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/ColorMaps/Set_PB.clm \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/ColorMaps/SetCol_1.clm \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/ColorMaps/EnableDisable.clm \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/ColorMaps/GreenRed.clm \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/ColorMaps/FreeLock.clm 

VCVK_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/VirtualKeys.vcvk 

VCR_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Palette.vcr 

# Runtime Object sources
VCR_OBJECT_HMI_10=$(TEMP_PATH_HMI_10)/vcrt.vco
VCR_SOURCE_HMI_10=$(SRC_PATH_HMI_10)/package.vcp
# All Source Objects END

#Panel Hardware
$(PANEL_HW_VCI_HMI_10): $(PANEL_HW_SOURCE_HMI_10) $(VC_LIBRARY_LIST_HMI_10) $(KEYMAP_SOURCES_HMI_10) $(PALFILE_HMI_10)
	$(VCHWPP) -f '$<' -o '$@' -n HMI_10 -d HMI_10 -pal '$(PALFILE_HMI_10)' -c '$(AS_CONFIGURATION)' -p '$(AS_PLC)' -ptemp '$(AS_TEMP_PLC)' -B 'H4.91' -L 'Visapi: V*' -verbose 'False' -profile 'False' -hw '$(CPUHWC)' -warninglevel 2 -so $(VC_STATIC_OPTIONS_HMI_10) -sos $(VC_STATIC_OPTIONS_Shared) -fp '$(AS_VC_PATH)/Firmware/V4.73.2/SG4' -sfas -prj '$(AS_PROJECT_PATH)' -apj 'RS15_RX_30005_r00' -vcob '$(VCOBJECT_HMI_10)'

$(PANEL_HW_OBJECT_HMI_10): $(PANEL_HW_VCI_HMI_10) $(VC_LIBRARY_LIST_HMI_10)
	$(VCC) -f '$(subst .vco,.vci,$@)' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -k '$(VCVK_SOURCES_HMI_10)' $(VCCFLAGS_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


# Pages
PAGE_OBJECTS_HMI_10 = $(addprefix $(TEMP_PATH_HMI_10)/page., $(notdir $(PAGE_SOURCES_HMI_10:.page=.vco)))

$(TEMP_PATH_HMI_10)/page.P1_Main_BagMachine.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P1_Main_BagMachine.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P0_Splash.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P0_Splash.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P10_Setup_BagMachine.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P10_Setup_BagMachine.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P40_Maint_BagMachine.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P40_Maint_BagMachine.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P20_Status_BagMachine.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P20_Status_BagMachine.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P30_Alarms_Active.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P30_Alarms_Active.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P31_Alarms_History.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P31_Alarms_History.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P50_Maint_IO_MainCabinet_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P50_Maint_IO_MainCabinet_1.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P55_Maint_IO_L3_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P55_Maint_IO_L3_1.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P56_Maint_IO_L3_2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P56_Maint_IO_L3_2.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P43_Maint_Misc.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P43_Maint_Misc.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P44_Maint_Password.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P44_Maint_Password.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P45_Maint_Info.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P45_Maint_Info.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P4_Main_Glue.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P4_Main_Glue.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P5_Main_Registration.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P5_Main_Registration.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P3_Main_Count.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P3_Main_Count.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P41_Maint_Reference1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P41_Maint_Reference1.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P11_Setup_Perf.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P11_Setup_Perf.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.ZZZ.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/ZZZ.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P100_Main_Bundler.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P100_Main_Bundler.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P101_Main_BundManuEject.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P101_Main_BundManuEject.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P102_Main_BundManuSep.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P102_Main_BundManuSep.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P103_Main_BundManuTilt.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P103_Main_BundManuTilt.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P245_Maint_Bundler.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P245_Maint_Bundler.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P209_Maint_IO_L9_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P209_Maint_IO_L9_1.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P210_Maint_IO_L9_2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P210_Maint_IO_L9_2.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P6_Main_Flexo.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P6_Main_Flexo.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P92_Main_ExitTable.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P92_Main_ExitTable.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P204_Main_Glue_V2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P204_Main_Glue_V2.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P51_Maint_IO_MainCabinet_2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P51_Maint_IO_MainCabinet_2.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P52_Maint_IO_MainCabinet_3.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P52_Maint_IO_MainCabinet_3.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P57_Maint_IO_L3_3.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P57_Maint_IO_L3_3.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P307_Main_MicroPerf.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P307_Main_MicroPerf.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P12_Setup_HoldTearDr.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P12_Setup_HoldTearDr.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P107_Main_EnvelopeBag.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P107_Main_EnvelopeBag.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P42_Maint_Reference2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P42_Maint_Reference2.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.ZZZZ.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/ZZZZ.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P13_Setup_HoldTearDr_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P13_Setup_HoldTearDr_1.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.ZZZZZ.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/ZZZZZ.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P104_Main_Glue_V0.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P104_Main_Glue_V0.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/page.P7_TrendHearter.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Pages/P7_TrendHearter.page $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_HMI_10)/StyleSheets/Color.vcs' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


#Pages END




# Stylesheets
VCS_OBJECTS_HMI_10 = $(addprefix $(TEMP_PATH_HMI_10)/vcs., $(notdir $(VCS_SOURCES_HMI_10:.vcs=.vco)))

$(TEMP_PATH_HMI_10)/vcs.Gray.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/StyleSheets/Gray.vcs
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/vcs.Color.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/StyleSheets/Color.vcs
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -P '$(AS_PROJECT_PATH)' -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


#Stylesheets END




# Layers
LAYER_OBJECTS_HMI_10 = $(addprefix $(TEMP_PATH_HMI_10)/layer., $(notdir $(LAYER_SOURCES_HMI_10:.layer=.vco)))

$(TEMP_PATH_HMI_10)/layer.Header.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/Header.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.Control.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/Control.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.Underlay_Main.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/Underlay_Main.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.Underlay_Setup.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/Underlay_Setup.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.InvalidPassword.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/InvalidPassword.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.PasswordChange.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PasswordChange.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.PasswordChangeAccepted.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PasswordChangeAccepted.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.PasswordChangeFail.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PasswordChangeFail.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.PasswordConfirm.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PasswordConfirm.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.PopUp_ProductCountReset.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PopUp_ProductCountReset.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.Underlay_Status.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/Underlay_Status.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.Underlay_Alarms.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/Underlay_Alarms.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.Underlay_Maintenance.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/Underlay_Maintenance.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.ZZZ.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/ZZZ.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.PopUp_LineSpeedAutoConfirm.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PopUp_LineSpeedAutoConfirm.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.PerfSpeedCurve_RS15_Perfo1_2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PerfSpeedCurve_RS15_Perfo1_2.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.BagMachineSetUp.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/BagMachineSetUp.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.PerfSpeedCurve_RS26_Perfo1_IF.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PerfSpeedCurve_RS26_Perfo1_IF.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.PopUp_AxisSynchroInProgress.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PopUp_AxisSynchroInProgress.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.PerfSpeedCurve_RS26_Perfo1_2_IF.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PerfSpeedCurve_RS26_Perfo1_2_IF.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.EnvBagPerfSetUp.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/EnvBagPerfSetUp.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.StandPerfSetUp.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/StandPerfSetUp.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.HoldTearEnvB_Offset.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/HoldTearEnvB_Offset.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.PerfSpeedCurve_RS26_ApPo_520_IF.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PerfSpeedCurve_RS26_ApPo_520_IF.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.SetUpHoldTearDrumRS26.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/SetUpHoldTearDrumRS26.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.SetUpHoldTearApPoDrumRS26.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/SetUpHoldTearApPoDrumRS26.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.SetUpHoldTearDrumRS15.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/SetUpHoldTearDrumRS15.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/layer.PerfSpeedCurve_RS15_Perfo1_2_IF.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Layers/PerfSpeedCurve_RS15_Perfo1_2_IF.layer $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -ds $(DEFAULT_STYLE_SHEET_HMI_10) -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


#Layers END




# Virtual Keys
VCVK_OBJECTS_HMI_10 = $(addprefix $(TEMP_PATH_HMI_10)/vcvk., $(notdir $(VCVK_SOURCES_HMI_10:.vcvk=.vco)))

$(TEMP_PATH_HMI_10)/vcvk.VirtualKeys.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/VirtualKeys.vcvk
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas

$(VCVK_OBJECTS_HMI_10): $(VC_LANGUAGES_HMI_10)

#Virtual Keys END




# Touch Pads
TPR_OBJECTS_HMI_10 = $(addprefix $(TEMP_PATH_HMI_10)/tpr., $(notdir $(TPR_SOURCES_HMI_10:.tpr=.vco)))

$(TEMP_PATH_HMI_10)/tpr.NumPad.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TouchPads/NumPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -prj 'C:/HolwegWeber/Holweg/RS15_RX_30005_r00/Logical/HMI/HMI_10' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/tpr.AlphaPadQVGA.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TouchPads/AlphaPadQVGA.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -prj 'C:/HolwegWeber/Holweg/RS15_RX_30005_r00/Logical/HMI/HMI_10' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/tpr.AlphaPad.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TouchPads/AlphaPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -prj 'C:/HolwegWeber/Holweg/RS15_RX_30005_r00/Logical/HMI/HMI_10' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/tpr.NavigationPad_ver.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TouchPads/NavigationPad_ver.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -prj 'C:/HolwegWeber/Holweg/RS15_RX_30005_r00/Logical/HMI/HMI_10' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/tpr.NavigationPad_hor.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TouchPads/NavigationPad_hor.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -prj 'C:/HolwegWeber/Holweg/RS15_RX_30005_r00/Logical/HMI/HMI_10' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/tpr.EditPad.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TouchPads/EditPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10) -prj 'C:/HolwegWeber/Holweg/RS15_RX_30005_r00/Logical/HMI/HMI_10' -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


#Touch Pads END




# Text Groups
TXTGRP_OBJECTS_HMI_10 = $(addprefix $(TEMP_PATH_HMI_10)/txtgrp., $(notdir $(TXTGRP_SOURCES_HMI_10:.txtgrp=.vco)))

$(TEMP_PATH_HMI_10)/txtgrp.UnwindTension1_OffOn.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/UnwindTension1_OffOn.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.DrawRoll_OffsetActive.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DrawRoll_OffsetActive.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.MachineDisplay_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/MachineDisplay_1.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.MachineDisplay_2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/MachineDisplay_2.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.Count.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/Count.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.DrawrollRegistration_2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DrawrollRegistration_2.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.Drive_Health.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/Drive_Health.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.DrawrollRegistration_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DrawrollRegistration_1.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.DropDown_MaintenanceScreen.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_MaintenanceScreen.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.BottomPaste_OffAutoOn.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/BottomPaste_OffAutoOn.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.OnOff.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/OnOff.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.PerfSize_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/PerfSize_Ind.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.NotReady_Ready.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/NotReady_Ready.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.Users.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/Users.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.DropDown_StatusScreen.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_StatusScreen.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.SystemTransfer_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/SystemTransfer_Ind.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.Trace_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/Trace_Ind.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.OffOn_Ind1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/OffOn_Ind1.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.ManAuto_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/ManAuto_Ind.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.OffOn_Ind2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/OffOn_Ind2.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.GlueTray_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/GlueTray_Ind.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.GlueTraySlowRot_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/GlueTraySlowRot_Ind.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.Homing_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/Homing_Ind.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.CountPB_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/CountPB_Ind.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.Perf_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/Perf_Ind.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.Vacuum_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/Vacuum_Ind.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.TubeSelection_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/TubeSelection_Ind.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.MachineMode_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/MachineMode_Ind.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.ManualMode_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/ManualMode_Ind.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.StartStopInitBund.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/StartStopInitBund.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.SetSpeedAutoManu.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/SetSpeedAutoManu.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.HighLow.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/HighLow.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.SelectGlue.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/SelectGlue.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.DropDown_MaintenanceScreen_V1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_MaintenanceScreen_V1.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.DropDown_NumPrintPerRound.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_NumPrintPerRound.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.ClosedOpen.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/ClosedOpen.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.StartStopOffsetFlexo.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/StartStopOffsetFlexo.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.HotMicroPerf_Mode.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/HotMicroPerf_Mode.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.DeflectorFan_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DeflectorFan_Ind.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.HMPerf_OperState.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/HMPerf_OperState.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.FlexoPress_Dryer.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/FlexoPress_Dryer.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.FP_PrintAuto.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/FP_PrintAuto.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.HMPerf_HeatState.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/HMPerf_HeatState.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.ActPerfCylinder.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/ActPerfCylinder.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.RefPB.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/RefPB.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.DropDown_MaintenanceScreenV2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_MaintenanceScreenV2.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.DropDown_StatusScreenV1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_StatusScreenV1.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.ShowHide.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/ShowHide.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.DropDown_StatusScreenV2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_StatusScreenV2.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/txtgrp.DropDown_MaintenanceScreenV3.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/TextGroups/DropDown_MaintenanceScreenV3.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


#Text Groups END




# BitmapGroups
BMGRP_OBJECTS_HMI_10 = $(addprefix $(TEMP_PATH_HMI_10)/bmgrp., $(notdir $(BMGRP_SOURCES_HMI_10:.bmgrp=.vco)))

$(TEMP_PATH_HMI_10)/bmgrp.AlphaPadQVGA.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/AlphaPadQVGA.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.NumPad.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/NumPad.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.AlphaPad.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/AlphaPad.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.AlarmEvent.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/AlarmEvent.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.AlarmState.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/AlarmState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.BypassState.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/BypassState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.AcknowledgeState.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/AcknowledgeState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.NavigationPad.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/NavigationPad.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.Borders.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/Borders.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.OK_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/OK_Ind.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.NotOK_Ind.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/NotOK_Ind.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.Alarm_OK_Large.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/Alarm_OK_Large.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.Alarm_OK_Small.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/Alarm_OK_Small.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.MovManuBundEject.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/MovManuBundEject.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.MovManuBundSep.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/MovManuBundSep.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.MovManuBundTilt.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/MovManuBundTilt.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.CadMaxPerf_RS15_Perfo1_2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/CadMaxPerf_RS15_Perfo1_2.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.CadMaxPerf_RS26_Perfo1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/CadMaxPerf_RS26_Perfo1.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.VisuSynchro_96x96.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/VisuSynchro_96x96.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.VisuSynchro_32x32.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/VisuSynchro_32x32.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.VisuSynchro_64x64.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/VisuSynchro_64x64.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.VisuSynchro_169x169.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/VisuSynchro_169x169.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.VisuSynchro_169x169_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/VisuSynchro_169x169_1.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.VisuSynchro_85x85.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/VisuSynchro_85x85.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.HoldTearPositionRS26.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/HoldTearPositionRS26.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.DrumPos.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/DrumPos.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.CadMaxPerf_RS26_Perfo1_2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/CadMaxPerf_RS26_Perfo1_2.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.CadMaxPerf_RS26_ApPo_520_IF.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/CadMaxPerf_RS26_ApPo_520_IF.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.HoldTearEnvBPosition.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/HoldTearEnvBPosition.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.HoldTearPosition_CasEnvB.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/HoldTearPosition_CasEnvB.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.HoldTearPosition_CasEnvB_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/HoldTearPosition_CasEnvB_1.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.HoldTearEnvBPosition_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/HoldTearEnvBPosition_1.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.DrumPos_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/DrumPos_1.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.HoldTearPositionRS15.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/HoldTearPositionRS15.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bmgrp.CadMaxPerf_RS15_Perfo1_2_IF.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/BitmapGroups/CadMaxPerf_RS15_Perfo1_2_IF.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


#BitmapGroups END




# Bitmaps
BMINFO_OBJECTS_HMI_10 = $(addprefix $(TEMP_PATH_HMI_10)/bminfo., $(notdir $(BMINFO_SOURCES_HMI_10:.bminfo=.vco)))

$(TEMP_PATH_HMI_10)/bminfo.AlphaPadQVGA1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA1.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.AlphaPadQVGA2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA2.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA2.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.AlphaPadQVGA3.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA3.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA3.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.AlphaPadVGA_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadVGA_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadVGA_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.AlphaPadQVGA2_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA2_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA2_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.AlphaPadQVGA3_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA3_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA3_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.AlphaPadQVGA1_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA1_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadQVGA1_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.AlphaPadVGA.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadVGA.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlphaPadVGA.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.NumPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/NumPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/NumPad_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.NumPad.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/NumPad.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/NumPad.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.AcknowledgeReset.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AcknowledgeReset.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AcknowledgeReset.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.AlarmActive.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmActive.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmActive.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.AlarmBypassOFF.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmBypassOFF.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmBypassOFF.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.AlarmBypassON.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmBypassON.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmBypassON.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.AlarmInactive.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmInactive.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmInactive.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.AlarmLatched.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmLatched.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmLatched.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.AlarmNotQuit.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmNotQuit.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmNotQuit.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.AlarmQuit.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmQuit.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/AlarmQuit.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Reset.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Reset.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Reset.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ResetAcknowledge.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ResetAcknowledge.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ResetAcknowledge.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Triggered.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Triggered.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Triggered.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ListPadHor.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ListPadHor.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ListPadHor.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ListPadHor_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ListPadHor_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ListPadHor_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ListPadVer.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ListPadVer.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ListPadVer.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ListPadVer_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ListPadVer_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ListPadVer_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.backward_active.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/backward_active.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/backward_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.backward_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/backward_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/backward_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.global_area_active.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/global_area_active.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/global_area_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.global_area_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/global_area_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/global_area_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.forward_active.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/forward_active.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/forward_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.forward_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/forward_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/forward_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.control_button_active.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/control_button_active.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/control_button_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.control_button_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/control_button_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/control_button_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.right_active.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/right_active.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/right_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.right_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/right_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/right_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.left_active.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/left_active.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/left_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.left_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/left_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/left_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.up_active.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/up_active.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/up_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.up_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/up_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/up_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.down_active.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/down_active.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/down_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.down_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/down_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/down_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.multi_up_active.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/multi_up_active.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/multi_up_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.multi_up_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/multi_up_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/multi_up_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.multi_down_active.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/multi_down_active.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/multi_down_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.multi_down_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/multi_down_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/multi_down_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ProgressBorder.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ProgressBorder.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ProgressBorder.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.down_active_control.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/down_active_control.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/down_active_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.down_pressed_control.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/down_pressed_control.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/down_pressed_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.up_active_control.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/up_active_control.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/up_active_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.global_area_gradient_upside.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/global_area_gradient_upside.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/global_area_gradient_upside.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.global_area_gradient_downside.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/global_area_gradient_downside.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/global_area_gradient_downside.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.frame_header.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/frame_header.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/frame_header.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.up_pressed_control.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/up_pressed_control.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/up_pressed_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EditPadVGA.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EditPadVGA.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EditPadVGA.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EditPadVGA_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EditPadVGA_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EditPadVGA_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneNumPad_released.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneNumPad_released.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneNumPad_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneListPadVer_released.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneListPadVer_released.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneListPadVer_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneAlphaPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPad_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneAlphaPad_released.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPad_released.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPad_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneAlphaPadQVGA1_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPadQVGA1_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPadQVGA1_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneAlphaPadQVGA1_released.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPadQVGA1_released.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPadQVGA1_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneAlphaPadQVGA2_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPadQVGA2_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPadQVGA2_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneAlphaPadQVGA3_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPadQVGA3_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneAlphaPadQVGA3_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneEditpadQVGA2_released.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneEditpadQVGA2_released.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneEditpadQVGA2_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneEditPadQVGA3_released.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneEditPadQVGA3_released.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneEditPadQVGA3_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneEditPadVga_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneEditPadVga_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneEditPadVga_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneEditPadVga_released.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneEditPadVga_released.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneEditPadVga_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneListPadHor_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneListPadHor_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneListPadHor_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneListPadHor_released.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneListPadHor_released.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneListPadHor_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneListPadVer_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneListPadVer_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneListPadVer_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zuneNumPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneNumPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zuneNumPad_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Logo_150.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Logo_150.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Logo_150.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.login_16x16.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/login_16x16.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/login_16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.logout_16x16.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/logout_16x16.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/logout_16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.arrowup_16x16.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowup_16x16.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowup_16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.arrowdown_16x16.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowdown_16x16.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowdown_16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Splash_607.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Splash_607.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Splash_607.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Alarm_24x24.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Alarm_24x24.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Alarm_24x24.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.OK_24x24.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/OK_24x24.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/OK_24x24.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.NotOK_14x14.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/NotOK_14x14.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/NotOK_14x14.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.OK_14x14.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/OK_14x14.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/OK_14x14.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Cancel_24x24.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Cancel_24x24.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Cancel_24x24.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.filesave_24x24.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/filesave_24x24.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/filesave_24x24.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.folder_24x24.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/folder_24x24.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/folder_24x24.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Alarm_32x32.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Alarm_32x32.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Alarm_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.OK_32x32.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/OK_32x32.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/OK_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.HolwegLogo_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/HolwegLogo_1.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/HolwegLogo_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Holweg_dcm.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Holweg_dcm.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Holweg_dcm.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_up_Blue_40x23.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_40x23.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_40x23.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_down_Blue.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_down_Blue.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_down_Blue.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_down_Blue_20x12.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_down_Blue_20x12.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_down_Blue_20x12.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_down_Blue_26X15.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_down_Blue_26X15.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_down_Blue_26X15.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_down_Blue_40x23.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_down_Blue_40x23.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_down_Blue_40x23.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_Left_Blue26X15A.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Left_Blue26X15A.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Left_Blue26X15A.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_Left_Blue.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Left_Blue.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Left_Blue.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_Left_Blue_26X15.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Left_Blue_26X15.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Left_Blue_26X15.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_Left_Blue_40x23.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Left_Blue_40x23.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Left_Blue_40x23.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_Right_Blue.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Right_Blue.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Right_Blue.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_Right_Blue_26X15.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Right_Blue_26X15.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Right_Blue_26X15.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_Right_Blue_40x23.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Right_Blue_40x23.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_Right_Blue_40x23.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_up_Blue.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_up_Blue_26X15.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_26X15.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_26X15.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_up_Blue_20x12.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_20x12.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_20x12.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_up_Blue_26X15_V1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_26X15_V1.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_26X15_V1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_up_Blue_20x12_V1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_20x12_V1.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_20x12_V1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow_up_Blue_20x12_V2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_20x12_V2.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow_up_Blue_20x12_V2.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Vue_ensemble_PH_RS15_V1_500x250.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Vue_ensemble_PH_RS15_V1_500x250.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Vue_ensemble_PH_RS15_V1_500x250.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Vue_ensemble_PH_RS15_V2_500x250.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Vue_ensemble_PH_RS15_V2_500x250.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Vue_ensemble_PH_RS15_V2_500x250.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Vue_ensemble_PH_RS15_V3_440x220.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Vue_ensemble_PH_RS15_V3_440x220.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Vue_ensemble_PH_RS15_V3_440x220.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Vue_ensemble_PH_RS15_V1_440x220.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Vue_ensemble_PH_RS15_V1_440x220.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Vue_ensemble_PH_RS15_V1_440x220.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo._BBKEM0002_coupe_gen_V1_480x228.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/_BBKEM0002_coupe_gen_V1_480x228.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/_BBKEM0002_coupe_gen_V1_480x228.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo._BBKEM0002_Tilter_330x220.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/_BBKEM0002_Tilter_330x220.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/_BBKEM0002_Tilter_330x220.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo._BBKEM0002_Sep_336x220.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/_BBKEM0002_Sep_336x220.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/_BBKEM0002_Sep_336x220.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo._BBKEM0002_Eject_388x220.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/_BBKEM0002_Eject_388x220.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/_BBKEM0002_Eject_388x220.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowG_Re_44x22.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Re_44x22.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Re_44x22.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowD_Gr_44x22.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Gr_44x22.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Gr_44x22.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowD_Gra_44x22.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Gra_44x22.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Gra_44x22.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowD_Re_44x22.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Re_44x22.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Re_44x22.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowG_Gr_44x22.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Gr_44x22.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Gr_44x22.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowG_Gra_44x22.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Gra_44x22.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Gra_44x22.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowD_Gra_1_44x22.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Gra_1_44x22.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Gra_1_44x22.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowD_Gra_3D.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Gra_3D.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Gra_3D.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowD_Bla_3D.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Bla_3D.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Bla_3D.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowG_Re_1_44x22.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Re_1_44x22.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Re_1_44x22.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowG_Gr_1_44x22.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Gr_1_44x22.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Gr_1_44x22.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowD_Gr_1_44x22.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Gr_1_44x22.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Gr_1_44x22.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowD_Re_1_44x22.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Re_1_44x22.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Re_1_44x22.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowG_Gra_1_44x22.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Gra_1_44x22.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowG_Gra_1_44x22.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow10H_Re_42x45.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Re_42x45.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Re_42x45.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow4H_Gr_42x45.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Gr_42x45.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Gr_42x45.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow4H_Gra_42x45.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Gra_42x45.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Gra_42x45.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow4H_Re_44x47.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Re_44x47.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Re_44x47.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow10H_Gr_44x47.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Gr_44x47.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Gr_44x47.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow10H_Gra_44x47.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Gra_44x47.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Gra_44x47.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow10H_Re_1_44x47.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Re_1_44x47.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Re_1_44x47.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow4H_Gr_1_42x45.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Gr_1_42x45.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Gr_1_42x45.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow4H_Gra_1_42x45.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Gra_1_42x45.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Gra_1_42x45.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow4H_Re_1_42x45.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Re_1_42x45.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow4H_Re_1_42x45.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow10H_Gr_1_44x47.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Gr_1_44x47.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Gr_1_44x47.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow10H_Gra_1_44x47.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Gra_1_44x47.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow10H_Gra_1_44x47.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow7H_Gra_43x33.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Gra_43x33.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Gra_43x33.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow1H_Gr_41x31.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Gr_41x31.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Gr_41x31.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow1H_Gra_41x31.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Gra_41x31.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Gra_41x31.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow7H_Re_43x33.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Re_43x33.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Re_43x33.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow7H_Gr_43x33.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Gr_43x33.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Gr_43x33.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow1H_Re_41x31.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Re_41x31.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Re_41x31.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow7H_Gra_1_43x33.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Gra_1_43x33.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Gra_1_43x33.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow1H_Gr_1_41x31.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Gr_1_41x31.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Gr_1_41x31.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow1H_Gra_1_41x31.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Gra_1_41x31.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Gra_1_41x31.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow1H_Re_1_43x33.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Re_1_43x33.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Re_1_43x33.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow7H_Gr_1_43x33.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Gr_1_43x33.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Gr_1_43x33.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow1H_Re_1_41x31.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Re_1_41x31.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow1H_Re_1_41x31.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Arrow7H_Re_1_43x33.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Re_1_43x33.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Arrow7H_Re_1_43x33.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowRot.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowRot.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowRot.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.arrowup_10x10.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowup_10x10.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowup_10x10.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.arrowdown_10x10.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowdown_10x10.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowdown_10x10.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowDownBla_10x10.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowDownBla_10x10.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowDownBla_10x10.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowUpBla_10x10.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowUpBla_10x10.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowUpBla_10x10.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowUpBlu_16x16.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowUpBlu_16x16.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowUpBlu_16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowDownBlu_16x16.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowDownBlu_16x16.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowDownBlu_16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowDownBla_16x16.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowDownBla_16x16.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowDownBla_16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowUpBla_16x16.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowUpBla_16x16.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowUpBla_16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowRightBla_16x16.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowRightBla_16x16.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowRightBla_16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowLeftBla_16x16.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowLeftBla_16x16.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowLeftBla_16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowLeftBlu_16x16.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowLeftBlu_16x16.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowLeftBlu_16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowRightBlu_16x16.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowRightBlu_16x16.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowRightBlu_16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.BundMaint_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/BundMaint_1.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/BundMaint_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.CadMaxPerf_RS15_mm.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxPerf_RS15_mm.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxPerf_RS15_mm.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.CadMaxPerf_RS15_Inch.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxPerf_RS15_Inch.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxPerf_RS15_Inch.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.IcoInfo.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoInfo.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoInfo.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.IcoInfo_32x32.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoInfo_32x32.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoInfo_32x32.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.BundMaint_2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/BundMaint_2.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/BundMaint_2.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.CadMaxPerf_RS26_Inch.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxPerf_RS26_Inch.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxPerf_RS26_Inch.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.CadMaxPerf_RS26_mm.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxPerf_RS26_mm.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxPerf_RS26_mm.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad1_32x32.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_32x32.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_32x32.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad1_96x96.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_96x96.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_96x96.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad2_32x32.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_32x32.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_32x32.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad2_96x96.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_96x96.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_96x96.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad3_32x32.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_32x32.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_32x32.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad3_96x96.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_96x96.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_96x96.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad4_32x32.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_32x32.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_32x32.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad4_96x96.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_96x96.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_96x96.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad5_32x32.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_32x32.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_32x32.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad5_96x96.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_96x96.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_96x96.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad1_64x64.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_64x64.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_64x64.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad2_64x64.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_64x64.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_64x64.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad3_64x64.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_64x64.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_64x64.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad4_64x64.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_64x64.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_64x64.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad5_64x64.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_64x64.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_64x64.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad1_169x169.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_169x169.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_169x169.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad2_169x169.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_169x169.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_169x169.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad3_169x169.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_169x169.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_169x169.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad4_169x169.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_169x169.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_169x169.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad5_169x169.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_169x169.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_169x169.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad1_0_169x169.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_0_169x169.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_0_169x169.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad2_0_169x169.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_0_169x169.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_0_169x169.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad3_0_169x169.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_0_169x169.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_0_169x169.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad4_0_169x169.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_0_169x169.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_0_169x169.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad5_0_169x169.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_0_169x169.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_0_169x169.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad5_85x85.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_85x85.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad5_85x85.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad1_85x85.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_85x85.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad1_85x85.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad2_85x85.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_85x85.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad2_85x85.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad3_85x85.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_85x85.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad3_85x85.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zahnrad4_85x85.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_85x85.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zahnrad4_85x85.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Conf2Pinces_242x224.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf2Pinces_242x224.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf2Pinces_242x224.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Conf4Pinces_1_235x224.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf4Pinces_1_235x224.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf4Pinces_1_235x224.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Conf4Pinces_2_238x224.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf4Pinces_2_238x224.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf4Pinces_2_238x224.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.TE_2P_148x224.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/TE_2P_148x224.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/TE_2P_148x224.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.TE_4P_145x224.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/TE_4P_145x224.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/TE_4P_145x224.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.CadMaxRS26Perfo1_2_mm.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxRS26Perfo1_2_mm.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxRS26Perfo1_2_mm.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.CadMaxRS26Perfo1_2_Inch.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxRS26Perfo1_2_Inch.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMaxRS26Perfo1_2_Inch.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.CadMax_RS26_PerfoType1_2_mm_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoType1_2_mm_1.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoType1_2_mm_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.CadMax_RS26_PerfoType1_2_Inch_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoType1_2_Inch_1.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoType1_2_Inch_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.CadMax_RS26_PerfoType1_mm.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoType1_mm.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoType1_mm.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.CadMax_RS26_PerfoType1_in.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoType1_in.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoType1_in.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Conf2Pinces_1_242x224.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf2Pinces_1_242x224.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf2Pinces_1_242x224.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.RS26_VueGen_420x223.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/RS26_VueGen_420x223.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/RS26_VueGen_420x223.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Logotype_HOLWEG2_64x23.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Logotype_HOLWEG2_64x23.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Logotype_HOLWEG2_64x23.jpg
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Logotype_HOLWEG2_2_70x25.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Logotype_HOLWEG2_2_70x25.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Logotype_HOLWEG2_2_70x25.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.CadMax_RS26_PerfoApPo_520_mm.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoApPo_520_mm.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoApPo_520_mm.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.CadMax_RS26_PerfoApPo_520_Inch.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoApPo_520_Inch.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CadMax_RS26_PerfoApPo_520_Inch.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HoldTear_EnvBag_4_235x223.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_EnvBag_4_235x223.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_EnvBag_4_235x223.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HoldTear_EnvBag_5_235x224.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_EnvBag_5_235x224.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_EnvBag_5_235x224.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HoldTear_NormBag_1_235x218.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_1_235x218.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_1_235x218.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HoldTear_NormBag_2_235x218.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_2_235x218.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_2_235x218.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HoldTear_NormBag_3_235x218.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_3_235x218.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_3_235x218.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HTEnvB_NormBag_1_235x223.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_1_235x223.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_1_235x223.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HTEnvB_NormBag_2_235x223.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_2_235x223.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_2_235x223.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HTEnvB_NormBag_3_235x223.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_3_235x223.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_3_235x223.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HTEnvB_NormBag_4_235x218.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_4_235x218.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_4_235x218.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HTEnvB_NormBag_5_235x220.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_5_235x220.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_5_235x220.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Logotype_HOLWEG2_500x180_Modifie.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Logotype_HOLWEG2_500x180_Modifie.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Logotype_HOLWEG2_500x180_Modifie.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.PochetteVertical_135x140.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PochetteVertical_135x140.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PochetteVertical_135x140.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Pochette_FinZoneSynchro_140x135.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Pochette_FinZoneSynchro_140x135.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Pochette_FinZoneSynchro_140x135.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.PochetteHorizontal_140x135.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PochetteHorizontal_140x135.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PochetteHorizontal_140x135.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Pochette_DepZoneSynchro_140x135.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Pochette_DepZoneSynchro_140x135.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Pochette_DepZoneSynchro_140x135.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.PochetteVertical_70x70.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PochetteVertical_70x70.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PochetteVertical_70x70.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Pochette_DepZoneSynchro_70x70.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Pochette_DepZoneSynchro_70x70.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Pochette_DepZoneSynchro_70x70.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Pochette_FinZoneSynchro_70x70.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Pochette_FinZoneSynchro_70x70.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Pochette_FinZoneSynchro_70x70.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.PochetteHorizontal_70x70.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PochetteHorizontal_70x70.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PochetteHorizontal_70x70.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ContrePressionPerfo_87x87.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ContrePressionPerfo_87x87.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ContrePressionPerfo_87x87.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ZoneAvSynchroPerf_49x30.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ZoneAvSynchroPerf_49x30.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ZoneAvSynchroPerf_49x30.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ZoneApSynchroPerf_49x30.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ZoneApSynchroPerf_49x30.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ZoneApSynchroPerf_49x30.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.PerfLargeVertical_42x70.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PerfLargeVertical_42x70.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PerfLargeVertical_42x70.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.PerfLarge_DepZSynchro_70x60.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PerfLarge_DepZSynchro_70x60.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PerfLarge_DepZSynchro_70x60.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.PerfLarge_FinZSynchro_70x60.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PerfLarge_FinZSynchro_70x60.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PerfLarge_FinZSynchro_70x60.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.PosHomePerf_51x77.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PosHomePerf_51x77.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/PosHomePerf_51x77.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.IcoInfo_16x16.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoInfo_16x16.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoInfo_16x16.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HoldTear_EnvBag_4_118x112.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_EnvBag_4_118x112.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_EnvBag_4_118x112.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HoldTear_NormBag_1_118x109.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_1_118x109.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_1_118x109.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HoldTear_NormBag_2_118x109.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_2_118x109.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_2_118x109.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HoldTear_NormBag_3_118x109.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_3_118x109.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_NormBag_3_118x109.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HTEnvB_NormBag_1_118x112.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_1_118x112.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_1_118x112.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HTEnvB_NormBag_2_118x112.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_2_118x112.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_2_118x112.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HTEnvB_NormBag_3_118x112.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_3_118x112.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_3_118x112.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HTEnvB_NormBag_4_118x110.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_4_118x110.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_4_118x110.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HTEnvB_NormBag_5_118x110.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_5_118x110.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HTEnvB_NormBag_5_118x110.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.zzEnvB_HoldTear_EnvBag_5_118x112.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zzEnvB_HoldTear_EnvBag_5_118x112.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/zzEnvB_HoldTear_EnvBag_5_118x112.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.TE_2P_74x112.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/TE_2P_74x112.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/TE_2P_74x112.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.TE_4P_72x111.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/TE_4P_72x111.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/TE_4P_72x111.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.EnvB_HoldTear_EnvBag_5_118x112.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_EnvBag_5_118x112.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/EnvB_HoldTear_EnvBag_5_118x112.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.A.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/A.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/A.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ArrowD_Bla_3D_16x17.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Bla_3D_16x17.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ArrowD_Bla_3D_16x17.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.arrowleft_16x16.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowleft_16x16.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowleft_16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.arrowright_16x16.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowright_16x16.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/arrowright_16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.BP_AU_25x27.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/BP_AU_25x27.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/BP_AU_25x27.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.IcoWarmRestart_17x17.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoWarmRestart_17x17.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoWarmRestart_17x17.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.IcoColdRestart_17x17.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoColdRestart_17x17.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoColdRestart_17x17.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.IcoWarmRestart_24x24.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoWarmRestart_24x24.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoWarmRestart_24x24.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.IcoColdRestart_24x24.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoColdRestart_24x24.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/IcoColdRestart_24x24.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Conf4Main_238x224.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf4Main_238x224.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf4Main_238x224.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Conf2Main_238x224.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf2Main_238x224.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Conf2Main_238x224.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Bitmap_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Bitmap_1.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Bitmap_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.Bitmap_2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Bitmap_2.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/Bitmap_2.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.CrbCadMax_RS15_PerfoT1_2_IF_mm.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CrbCadMax_RS15_PerfoT1_2_IF_mm.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CrbCadMax_RS15_PerfoT1_2_IF_mm.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.CrbCadMax_RS15_PerfoT1_2_IF_In.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CrbCadMax_RS15_PerfoT1_2_IF_In.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/CrbCadMax_RS15_PerfoT1_2_IF_In.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.TE_4P_RS15_185x226.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/TE_4P_RS15_185x226.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/TE_4P_RS15_185x226.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/bminfo.ksysguard.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ksysguard.bminfo $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Bitmaps/ksysguard.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


#Bitmaps END




# Trend Configuration
TRE_OBJECTS_HMI_10 = $(addprefix $(TEMP_PATH_HMI_10)/tre., $(notdir $(TRE_SOURCES_HMI_10:.tre=.vco)))

$(TEMP_PATH_HMI_10)/tre.TrendHeaterDryerControl.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Trends/TrendHeaterDryerControl.tre
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


#Trend Configuration END




# Trend Data
TRD_OBJECTS_HMI_10 = $(addprefix $(TEMP_PATH_HMI_10)/trd., $(notdir $(TRD_SOURCES_HMI_10:.trd=.vco)))

$(TEMP_PATH_HMI_10)/trd.TrendData_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Trends/TrendData_1.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/trd.TrendData_2.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Trends/TrendData_2.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/trd.TrendData_3.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Trends/TrendData_3.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


#Trend Data END




# Trend Data Configuration
TDC_OBJECTS_HMI_10 = $(addprefix $(TEMP_PATH_HMI_10)/tdc., $(notdir $(TDC_SOURCES_HMI_10:.tdc=.vco)))

$(TEMP_PATH_HMI_10)/tdc.TrendData.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Trends/TrendData.tdc
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


#Trend Data Configuration END




# ColorMap Table
CLM_OBJECTS_HMI_10 = $(addprefix $(TEMP_PATH_HMI_10)/clm., $(notdir $(CLM_SOURCES_HMI_10:.clm=.vco)))

$(TEMP_PATH_HMI_10)/clm.Sensor.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/ColorMaps/Sensor.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/clm.Set_PB.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/ColorMaps/Set_PB.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/clm.SetCol_1.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/ColorMaps/SetCol_1.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/clm.EnableDisable.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/ColorMaps/EnableDisable.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/clm.GreenRed.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/ColorMaps/GreenRed.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


$(TEMP_PATH_HMI_10)/clm.FreeLock.vco: $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/ColorMaps/FreeLock.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas


#ColorMap Table END


#
# Borders
#
BDR_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Raised.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Sunken.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Etched.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Bump.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/SunkenOuter.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/RaisedInner.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Flat_black.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Flat_grey.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/BackwardActive.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/BackwardPressed.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ControlActive.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ControlPressed.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/DownActiveControl.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/DownPressedControl.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ForwardActive.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ForwardPressed.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/GlobalAreaActive.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/GlobalAreaPressed.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/MultiScrollDownActive.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/MultiScrollDownPressed.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/MultiScrollUpActive.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/MultiScrollUpPressed.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ProgressBarBorder.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollDownActive.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollDownPressed.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollUpActive.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollUpPressed.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollLeftActive.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollLeftPressed.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollRightActive.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/ScrollRightPressed.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/UpActiveControl.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/UpPressedControl.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/FrameHeader.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Button1_Pressed1.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Button1_Active1.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Button1_Pressed.bdr $(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Borders/Button1_Active.bdr 
BDR_OBJECTS_HMI_10=$(TEMP_PATH_HMI_10)/bdr.Bordermanager.vco
$(TEMP_PATH_HMI_10)/bdr.Bordermanager.vco: $(BDR_SOURCES_HMI_10)
	$(VCC) -f '$<' -o '$@' -pkg '$(SRC_PATH_HMI_10)' $(BDRFLAGS_HMI_10) $(VCCFLAGS_HMI_10) -p HMI_10$(SRC_PATH_HMI_10)
#
# Logical fonts
#
$(TEMP_PATH_HMI_10)/lfnt.en.vco: $(TEMP_PATH_HMI_10)/en.lfnt $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_HMI_10) $(VCCFLAGS_HMI_10) -p HMI_10 -sfas
$(TEMP_PATH_HMI_10)/lfnt.fr-FR.vco: $(TEMP_PATH_HMI_10)/fr-FR.lfnt $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_HMI_10) $(VCCFLAGS_HMI_10) -p HMI_10 -sfas
LFNT_OBJECTS_HMI_10=$(TEMP_PATH_HMI_10)/lfnt.en.vco $(TEMP_PATH_HMI_10)/lfnt.fr-FR.vco 

#Runtime Object
$(VCR_OBJECT_HMI_10) : $(VCR_SOURCE_HMI_10)
	$(VCC) -f '$<' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -sl en $(VCCFLAGS_HMI_10) -rt  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 4732 -sfas
# Local resources Library rules
LIB_LOCAL_RES_HMI_10=$(TEMP_PATH_HMI_10)/localres.vca
$(LIB_LOCAL_RES_HMI_10) : $(TEMP_PATH_HMI_10)/HMI_1002.ccf

# Bitmap Library rules
LIB_BMP_RES_HMI_10=$(TEMP_PATH_HMI_10)/bmpres.vca
$(LIB_BMP_RES_HMI_10) : $(TEMP_PATH_HMI_10)/HMI_1003.ccf
$(BMGRP_OBJECTS_HMI_10) : $(PALFILE_HMI_10) $(VC_LANGUAGES_HMI_10)
$(BMINFO_OBJECTS_HMI_10) : $(PALFILE_HMI_10)

BUILD_FILE_HMI_10=$(TEMP_PATH_HMI_10)/BuildFiles.arg
$(BUILD_FILE_HMI_10) : BUILD_FILE_CLEAN_HMI_10 $(BUILD_SOURCES_HMI_10)
BUILD_FILE_CLEAN_HMI_10:
	$(RM) /F /Q '$(BUILD_FILE_HMI_10)' 2>nul
#All Modules depending to this project
PROJECT_MODULES_HMI_10=$(AS_CPU_PATH)/HMI_1001.br $(AS_CPU_PATH)/HMI_1002.br $(AS_CPU_PATH)/HMI_1003.br $(FONT_MODULES_HMI_10) $(SHARED_MODULE)

# General Build rules

$(TARGET_FILE_HMI_10): $(PROJECT_MODULES_HMI_10) $(TEMP_PATH_HMI_10)/HMI_10.prj
	$(MODGEN) -so $(VC_STATIC_OPTIONS_HMI_10) -fw '$(VCFIRMWAREPATH)' -m $(VCSTPOST) -v V1.00.0 -f '$(TEMP_PATH_HMI_10)/HMI_10.prj' -o '$@' -vc '$(VCOBJECT_HMI_10)' $(DEPENDENCIES_HMI_10) $(addprefix -d ,$(notdir $(PROJECT_MODULES_HMI_10:.br=)))

$(AS_CPU_PATH)/HMI_1001.br: $(TEMP_PATH_HMI_10)/HMI_1001.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_HMI_10) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -v V1.00.0 -b -vc '$(VCOBJECT_HMI_10)' -f '$<' -o '$@' $(DEPENDENCIES_HMI_10)

$(AS_CPU_PATH)/HMI_1002.br: $(TEMP_PATH_HMI_10)/HMI_1002.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_HMI_10) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -v V1.00.0 -b -vc '$(VCOBJECT_HMI_10)' -f '$<' -o '$@' $(DEPENDENCIES_HMI_10)

$(AS_CPU_PATH)/HMI_1003.br: $(TEMP_PATH_HMI_10)/HMI_1003.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_HMI_10) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -v V1.00.0 -b -vc '$(VCOBJECT_HMI_10)' -f '$<' -o '$@' $(DEPENDENCIES_HMI_10)

# General Build rules END
$(LIB_LOCAL_OBJ_HMI_10) : $(TEMP_PATH_HMI_10)/HMI_1001.ccf

# Main Module
$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/HMI_10.vcm:
$(TEMP_PATH_HMI_10)/HMI_10.prj: $(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/HMI_10.vcm
	$(VCDEP) -m '$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/HMI_10.vcm' -s '$(AS_CPU_PATH)/VCShared/Shared.vcm' -p '$(AS_PATH)/AS/VC/Firmware' -c '$(AS_CPU_PATH)' -fw '$(VCFIRMWAREPATH)' -hw '$(CPUHWC)' -so $(VC_STATIC_OPTIONS_HMI_10) -o HMI_10 -proj HMI_10
	$(VCPL) $(notdir $(PROJECT_MODULES_HMI_10:.br=,4)) HMI_10,2 -o '$@' -p HMI_10 -vc 'HMI_10' -verbose 'False' -fl '$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/HMI_10.vcm' -vcr '$(VCR_SOURCE_HMI_10)' -prj '$(AS_PROJECT_PATH)' -warningLevel2 -sfas
	$(VCREFHANDLER) -X 'C:/HolwegWeber/Holweg/RS15_RX_30005_r00/Temp/Objects/Config1/PLC1/vcxref.build' -o '$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/' -verbose 'False' -profile 'False' -ds '$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/dpt.DataPointList.vcxref' -warninglevel 2 -sfas
	$(VCXREFEXTENDER) '$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/HMI_10/HMI_10.xrefvc' -o '$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/HMI_10.xref' -P '$(AS_PROJECT_PATH)/' -c '$(AS_CONFIGURATION)' -S '$(AS_PLC)' -t '$(AS_TEMP_PATH)' 

# 01 Module

DEL_TARGET01_LFL_HMI_10=$(TEMP_PATH_HMI_10)\HMI_1001.ccf.lfl
$(TEMP_PATH_HMI_10)/HMI_1001.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_HMI_10) $(TEMP_PATH_HMI_10)/HMI_1003.ccf $(LIB_LOCAL_RES_HMI_10) $(TEMP_PATH_HMI_10)/HMI_1002.ccf $(DIS_OBJECTS_HMI_10) $(PAGE_OBJECTS_HMI_10) $(VCS_OBJECTS_HMI_10) $(VCVK_OBJECTS_HMI_10) $(VCRT_OBJECTS_HMI_10) $(TPR_OBJECTS_HMI_10) $(TXTGRP_OBJECTS_HMI_10) $(LAYER_OBJECTS_HMI_10) $(VCR_OBJECT_HMI_10) $(TDC_OBJECTS_HMI_10) $(TRD_OBJECTS_HMI_10) $(TRE_OBJECTS_HMI_10) $(PRC_OBJECTS_HMI_10) $(SCR_OBJECTS_HMI_10)
	-@CMD /Q /C if exist "$(DEL_TARGET01_LFL_HMI_10)" DEL /F /Q "$(DEL_TARGET01_LFL_HMI_10)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LIB_BMP_RES_HMI_10)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LIB_LOCAL_RES_HMI_10)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(DIS_OBJECTS_HMI_10:.vco=.vco|)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .page -vcp '$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Package.vcp' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(VCS_OBJECTS_HMI_10:.vco=.vco|)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .vcvk -vcp '$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Package.vcp' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(VCRT_OBJECTS_HMI_10:.vco=.vco|)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(TPR_OBJECTS_HMI_10:.vco=.vco|)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .txtgrp -vcp '$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Package.vcp' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .layer -vcp '$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Package.vcp' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(VCR_OBJECT_HMI_10:.vco=.vco|)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .tdc -vcp '$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Package.vcp' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .trd -vcp '$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Package.vcp' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(TEMP_PATH_HMI_10)/tre.TrendHeaterDryerControl.vco' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(SCR_OBJECTS_HMI_10:.vco=.vco|)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	$(LINK) '$@.lfl' -o '$@' -p HMI_10 -lib '$(LIB_LOCAL_OBJ_HMI_10)' -P '$(AS_PROJECT_PATH)' -m 'local objects' -profile 'False' -warningLevel2 -vcr 4732 -sfas
# 01 Module END

# 02 Module

DEL_TARGET02_LFL_HMI_10=$(TEMP_PATH_HMI_10)\HMI_1002.ccf.lfl
$(TEMP_PATH_HMI_10)/HMI_1002.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_HMI_10) $(TEMP_PATH_HMI_10)/HMI_1003.ccf $(BDR_OBJECTS_HMI_10) $(LFNT_OBJECTS_HMI_10) $(CLM_OBJECTS_HMI_10)
	-@CMD /Q /C if exist "$(DEL_TARGET02_LFL_HMI_10)" DEL /F /Q "$(DEL_TARGET02_LFL_HMI_10)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LIB_BMP_RES_HMI_10)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(BDR_OBJECTS_HMI_10:.vco=.vco|)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LFNT_OBJECTS_HMI_10:.vco=.vco|)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(CLM_OBJECTS_HMI_10:.vco=.vco|)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	$(LINK) '$@.lfl' -o '$@' -p HMI_10 -lib '$(LIB_LOCAL_RES_HMI_10)' -P '$(AS_PROJECT_PATH)' -m 'local resources' -profile 'False' -warningLevel2 -vcr 4732 -sfas
# 02 Module END

# 03 Module

DEL_TARGET03_LFL_HMI_10=$(TEMP_PATH_HMI_10)\HMI_1003.ccf.lfl
$(TEMP_PATH_HMI_10)/HMI_1003.ccf: $(LIB_SHARED) $(SHARED_CCF) $(BMGRP_OBJECTS_HMI_10) $(BMINFO_OBJECTS_HMI_10) $(PALFILE_HMI_10)
	-@CMD /Q /C if exist "$(DEL_TARGET03_LFL_HMI_10)" DEL /F /Q "$(DEL_TARGET03_LFL_HMI_10)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .bmgrp -vcp '$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Package.vcp' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .bminfo -vcp '$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Package.vcp' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)' -sfas
	$(LINK) '$@.lfl' -o '$@' -p HMI_10 -lib '$(LIB_BMP_RES_HMI_10)' -P '$(AS_PROJECT_PATH)' -m 'bitmap resources' -profile 'False' -warningLevel2 -vcr 4732 -sfas
# 03 Module END

# Post Build Steps

.PHONY : vcPostBuild_HMI_10

vcPostBuild_HMI_10 :
	$(VCC) -pb -vcm '$(TEMP_PATH_HMI_10)/MODULEFILES.vcm' -fw '$(VCFIRMWAREPATH)' $(VCCFLAGS_HMI_10) -p HMI_10 -vcr 4732 -sfas

# Post Build Steps END
