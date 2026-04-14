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
TTFFLAGS_HMI_10= -P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo'

#
# Font arialbd
#
ifneq ($(VC_FONT_arialbd),1)
VC_FONT_arialbd=1
$(AS_CPU_PATH)/VcFntDat/arialbd.vco:$(AS_CPU_PATH)/VcFntDat/arialbd.vci
	 $(VCC) -f '$<' -o '$@' $(TTFFLAGS_HMI_10) $(VCCFLAGS_HMI_10) -sfas

$(AS_CPU_PATH)/VcFntDat/arialbd.ccf:$(AS_CPU_PATH)/VcFntDat/arialbd.vco
	 $(LINK) '$^' -o '$@' -warningLevel2 -m arialbd.ttf -name HMI_10 -profile 'False' -vcr 4732 -sfas

$(AS_CPU_PATH)/arialbd.br:$(AS_CPU_PATH)/VcFntDat/arialbd.ccf
	 $(MODGEN) -so $(VC_STATIC_OPTIONS_Shared) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -f '$<' -o '$@' -d vcgclass -v V1.00.0 -profile False -vc '$(VCOBJECT_HMI_10)' -b
endif

#
# Font arialbi
#
ifneq ($(VC_FONT_arialbi),1)
VC_FONT_arialbi=1
$(AS_CPU_PATH)/VcFntDat/arialbi.vco:$(AS_CPU_PATH)/VcFntDat/arialbi.vci
	 $(VCC) -f '$<' -o '$@' $(TTFFLAGS_HMI_10) $(VCCFLAGS_HMI_10) -sfas

$(AS_CPU_PATH)/VcFntDat/arialbi.ccf:$(AS_CPU_PATH)/VcFntDat/arialbi.vco
	 $(LINK) '$^' -o '$@' -warningLevel2 -m arialbi.ttf -name HMI_10 -profile 'False' -vcr 4732 -sfas

$(AS_CPU_PATH)/arialbi.br:$(AS_CPU_PATH)/VcFntDat/arialbi.ccf
	 $(MODGEN) -so $(VC_STATIC_OPTIONS_Shared) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -f '$<' -o '$@' -d vcgclass -v V1.00.0 -profile False -vc '$(VCOBJECT_HMI_10)' -b
endif

#
# Font arial
#
ifneq ($(VC_FONT_arial),1)
VC_FONT_arial=1
$(AS_CPU_PATH)/VcFntDat/arial.vco:$(AS_CPU_PATH)/VcFntDat/arial.vci
	 $(VCC) -f '$<' -o '$@' $(TTFFLAGS_HMI_10) $(VCCFLAGS_HMI_10) -sfas

$(AS_CPU_PATH)/VcFntDat/arial.ccf:$(AS_CPU_PATH)/VcFntDat/arial.vco
	 $(LINK) '$^' -o '$@' -warningLevel2 -m arial.ttf -name HMI_10 -profile 'False' -vcr 4732 -sfas

$(AS_CPU_PATH)/arial.br:$(AS_CPU_PATH)/VcFntDat/arial.ccf
	 $(MODGEN) -so $(VC_STATIC_OPTIONS_Shared) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -f '$<' -o '$@' -d vcgclass -v V1.00.0 -profile False -vc '$(VCOBJECT_HMI_10)' -b
endif

FONT_MODULES_HMI_10=$(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/arialbd.br $(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/arialbi.br $(TEMP_PATH_ROOT_HMI_10)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/arial.br 
