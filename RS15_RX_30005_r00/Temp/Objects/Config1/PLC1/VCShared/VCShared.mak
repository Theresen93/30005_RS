######################################################
#                                                    #
# Automatic generated Makefile for Visual Components #
#                                                    #
#                  Do NOT edit!                      #
#                                                    #
######################################################

VCC=@'$(AS_BIN_PATH)/br.vc.pc.exe'
LINK=@'$(AS_BIN_PATH)/BR.VC.Link.exe'
MODGEN=@'$(AS_BIN_PATH)/BR.VC.ModGen.exe'
VCPL=@'$(AS_BIN_PATH)/BR.VC.PL.exe'
VCHWPP=@'$(AS_BIN_PATH)/BR.VC.HWPP.exe'
VCDEP=@'$(AS_BIN_PATH)/BR.VC.Depend.exe'
VCFLGEN=@'$(AS_BIN_PATH)/BR.VC.lfgen.exe'
VCREFHANDLER=@'$(AS_BIN_PATH)/BR.VC.CrossReferenceHandler.exe'
VCXREFEXTENDER=@'$(AS_BIN_PATH)/BR.AS.CrossRefVCExtender.exe'
RM=CMD /C DEL
PALFILE_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/Palette.vcr
VCCFLAGS_HMI_10=-server -proj HMI_10 -vc '$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/VCObject.vc' -prj_path '$(AS_PROJECT_PATH)' -temp_path '$(AS_TEMP_PATH)' -cfg $(AS_CONFIGURATION) -plc $(AS_PLC) -cpu_path '$(AS_CPU_PATH)'
VCFIRMWARE=V3.73.4
VCFIRMWAREPATH=$(AS_VC_PATH)/Firmware/V3.73.4/SG4
VCOBJECT_HMI_10=$(AS_PROJECT_PATH)/Logical/HMI/HMI_10/VCObject.vc
VCSTARTUP='$(VCFIRMWAREPATH)\vcstart.br'
VCLOD='$(VCFIRMWAREPATH)\vclod.br'
VCSTPOST='$(VCFIRMWAREPATH)\vcstpost.br'
TARGET_FILE_HMI_10=$(AS_CPU_PATH)/HMI_10.br
OBJ_SCOPE_HMI_10=HMI
PRJ_PATH_HMI_10=$(AS_PROJECT_PATH)
SRC_PATH_HMI_10=$(AS_PROJECT_PATH)/Logical/$(OBJ_SCOPE_HMI_10)/HMI_10
TEMP_PATH_HMI_10=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/HMI_10
TEMP_PATH_ROOT_HMI_10=$(AS_TEMP_PATH)
VC_LIBRARY_LIST_HMI_10=$(TEMP_PATH_HMI_10)/libraries.vci
VC_XREF_BUILDFILE_HMI_10=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/vcxref.build
VC_XREF_CLEANFILE=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/vcxref.clean
VC_LANGUAGES_HMI_10=$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr
CPUHWC=$(TEMP_PATH_HMI_10)/cpuhwc.vci
VC_STATIC_OPTIONS_HMI_10='$(TEMP_PATH_HMI_10)/vcStaticOptions.xml'

DSOFLAGS=-P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)'
LIB_SHARED=$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/vcshared.vca

#
# Shared Runtime Options
#
VCRS_OBJECT=$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/vcrt_s.vco
VCRS_SOURCE=$(AS_PROJECT_PATH)/Logical/VCShared/Package.vcp

# All Shared Source Objects
VCR_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr 

TXTGRP_SHARED_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AcknowledgeState_long.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AcknowledgeState_short.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmEvent_long.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmEvent_short.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmState_long.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmState_short.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/BypassState_long.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/BypassState_short.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/DateTimeFormats.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/Time_Day.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/Time_Hour.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/Time_Minute.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/Time_Month.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/Time_Year.txtgrp 

VCUG_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Mass.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Memory.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Percentage.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Power.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Pressure.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Rotary.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Temperatures.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Volume.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Length.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Torque.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Velocity_FPM_MPM.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Velocity_RPM.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Velocity_BPM.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Time.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Stretch.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Deg.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/PercentPerBagPerMin.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Temperatures_1.vcug 

ALCFG_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/AlarmSystem.alcfg 

ALGRP_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/SystemAlarms.algrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/BagMachine_Alarms.algrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/BagMachine_I0_E1_Fail.algrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/BagMachine_I0_L3_Fail.algrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/BagMachine_I0_L9_Fail.algrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/BagMachine_I0_15_Fail.algrp 

DSO_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Internal.dso \
	$(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Local.dso 

CVINFO_SOURCES_HMI_10=$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo 



# UnitGroups
VCUG_OBJECTS_HMI_10 = $(addprefix $(AS_CPU_PATH)/VCShared/vcug., $(notdir $(VCUG_SOURCES_HMI_10:.vcug=.vco)))

$(AS_CPU_PATH)/VCShared/vcug.Mass.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Mass.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Memory.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Memory.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Percentage.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Percentage.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Power.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Power.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Pressure.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Pressure.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Rotary.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Rotary.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Temperatures.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Temperatures.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Volume.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Volume.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Length.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Length.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Torque.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Torque.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Velocity_FPM_MPM.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Velocity_FPM_MPM.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Velocity_RPM.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Velocity_RPM.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Velocity_BPM.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Velocity_BPM.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Time.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Time.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Stretch.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Stretch.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Deg.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Deg.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.PercentPerBagPerMin.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/PercentPerBagPerMin.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/vcug.Temperatures_1.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Temperatures_1.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


#UnitGroups END




# AlarmGroups
ALGRP_OBJECTS_HMI_10 = $(addprefix $(AS_CPU_PATH)/VCShared/algrp., $(notdir $(ALGRP_SOURCES_HMI_10:.algrp=.vco)))

$(AS_CPU_PATH)/VCShared/algrp.SystemAlarms.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/SystemAlarms.algrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/algrp.BagMachine_Alarms.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/BagMachine_Alarms.algrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/algrp.BagMachine_I0_E1_Fail.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/BagMachine_I0_E1_Fail.algrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/algrp.BagMachine_I0_L3_Fail.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/BagMachine_I0_L3_Fail.algrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/algrp.BagMachine_I0_L9_Fail.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/BagMachine_I0_L9_Fail.algrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/algrp.BagMachine_I0_15_Fail.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/BagMachine_I0_15_Fail.algrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


#AlarmGroups END




# AlarmSystem
ALCFG_OBJECTS_HMI_10 = $(addprefix $(AS_CPU_PATH)/VCShared/alcfg., $(notdir $(ALCFG_SOURCES_HMI_10:.alcfg=.vco)))

$(AS_CPU_PATH)/VCShared/alcfg.AlarmSystem.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/AlarmSystem.alcfg
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


#AlarmSystem END




# Text Groups
TXTGRP_SHARED_OBJECTS_HMI_10 = $(addprefix $(AS_CPU_PATH)/VCShared/txtgrp., $(notdir $(TXTGRP_SHARED_SOURCES_HMI_10:.txtgrp=.vco)))

$(AS_CPU_PATH)/VCShared/txtgrp.AcknowledgeState_long.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AcknowledgeState_long.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/txtgrp.AcknowledgeState_short.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AcknowledgeState_short.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/txtgrp.AlarmEvent_long.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmEvent_long.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/txtgrp.AlarmEvent_short.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmEvent_short.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/txtgrp.AlarmState_long.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmState_long.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/txtgrp.AlarmState_short.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmState_short.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/txtgrp.BypassState_long.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/BypassState_long.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/txtgrp.BypassState_short.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/BypassState_short.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/txtgrp.DateTimeFormats.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/DateTimeFormats.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/txtgrp.Time_Day.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/Time_Day.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/txtgrp.Time_Hour.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/Time_Hour.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/txtgrp.Time_Minute.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/Time_Minute.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/txtgrp.Time_Month.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/Time_Month.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


$(AS_CPU_PATH)/VCShared/txtgrp.Time_Year.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/Time_Year.txtgrp $(VC_LANGUAGES_HMI_10)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_HMI_10)' $(VCCFLAGS_HMI_10)  -p HMI_10 -so $(VC_STATIC_OPTIONS_HMI_10) -vcr 3734


#Text Groups END


#
# Datapoint Objects
#
$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/dso.Internal.vco: $(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Internal.dso 
	 $(VCC) -f '$<' -o '$@' $(DSOFLAGS) $(VCCFLAGS_HMI_10) -p HMI_10 -vcr 3734

$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/dso.Local.vco: $(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Local.dso 
	 $(VCC) -f '$<' -o '$@' $(DSOFLAGS) $(VCCFLAGS_HMI_10) -p HMI_10 -vcr 3734

DPT_OBJECTS = $(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/dpt.DataPointList.vco
DSO_OBJECTS_HMI_10=$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/dso.Internal.vco $(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/dso.Local.vco 
$(DSO_OBJECTS_HMI_10): $(DSO_SOURCES_HMI_10)


#
# Building the Shared Runtime Options
#
$(VCRS_OBJECT) : $(VCRS_SOURCE)
	$(VCC) -f '$<' -o '$@' -ct shared -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -sl  $(VCCFLAGS_HMI_10) -p HMI_10 -vcr 3734

#
# The Shared Module
#
SHARED_MODULE=$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/vcshared.br
SHARED_CCF=$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/vcshared.ccf
DEL_SHARED_CCF=$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)/VCShared/vcshared.ccf.lfl

$(SHARED_MODULE) : $(SHARED_CCF)
	 $(MODGEN) -m $(VCSTARTUP) -v V1.00.0 -vc '$(VCOBJECT_HMI_10)' -f '$<' -o '$@' -d vcgclass -profile 'False'

$(VCUG_OBJECTS_HMI_10): $(VC_LANGUAGES_HMI_10)
$(TXTGRP_SHARED_OBJECTS_HMI_10): $(VC_LANGUAGES_HMI_10)
$(ALGRP_OBJECTS_HMI_10): $(VC_LANGUAGES_HMI_10)
$(ALCFG_OBJECTS_HMI_10): $(VC_LANGUAGES_HMI_10)

$(SHARED_CCF): $(VCRS_OBJECT) $(VCR_OBJECTS_HMI_10) $(VCUG_OBJECTS_HMI_10) $(ALGRP_OBJECTS_HMI_10) $(ALCFG_OBJECTS_HMI_10) $(DSO_OBJECTS_HMI_10) $(TXTGRP_SHARED_OBJECTS_HMI_10) $(CVINFO_OBJECTS_HMI_10)
	-@CMD if exist /Q "$(DEL_SHARED_CCF)" /C DEL /F /Q "$(DEL_SHARED_CCF)" 2>nul
	 @$(VCFLGEN) '$@.lfl' '$(VCR_OBJECTS_HMI_10:.vco=.vco,)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)'
	 @$(VCFLGEN) '$@.lfl' '$(VCUG_OBJECTS_HMI_10:.vco=.vco,)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)'
	 @$(VCFLGEN) '$@.lfl' '$(ALGRP_OBJECTS_HMI_10:.vco=.vco,)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)'
	 @$(VCFLGEN) '$@.lfl' '$(ALCFG_OBJECTS_HMI_10:.vco=.vco,)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)'
	 @$(VCFLGEN) '$@.lfl' '$(TXTGRP_SHARED_OBJECTS_HMI_10:.vco=.vco,)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)'
	 @$(VCFLGEN) '$@.lfl' '$(DSO_OBJECTS_HMI_10:.vco=.vco,)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)'
	 @$(VCFLGEN) '$@.lfl' '$(DPT_OBJECTS:.vco=.vco,)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)'
	 @$(VCFLGEN) '$@.lfl' '$(VCRS_OBJECT)' -temp '$(TEMP_PATH_HMI_10)' -prj '$(PRJ_PATH_HMI_10)'
	 $(LINK) '$@.lfl' -o '$@' -lib '$(LIB_SHARED)' -P '$(AS_PROJECT_PATH)' -m 'shared resources' -profile 'False' -warningLevel2 -name HMI_10 -sfas


$(LIB_SHARED): $(SHARED_CCF)
