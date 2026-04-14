UnmarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/HMI/HMI_Control
MarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/HMI/HMI_Control

$(AS_CPU_PATH)/HMI_Contro.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/HMI_Contro/HMI_Contro.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/HMI_Contro/HMI_Contro.ox" -o "$(AS_CPU_PATH)/HMI_Contro.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic4 -p 3 -s HMI.HMI_Control -L "Acp10_MC: V2.24.0, Acp10man: V2.24.0, Acp10par: V2.24.0, Acp10sdc: V2.24.0, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V0.60.3, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/HMI_Contro/HMI_Contro.ox: \
	$(AS_CPU_PATH)/HMI_Contro/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/HMI_Contro/a.out" -o "$(AS_CPU_PATH)/HMI_Contro/HMI_Contro.ox" -T SG4 -r Cyclic4   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/HMI_Contro/a.out: \
	$(AS_CPU_PATH)/HMI_Contro/HMI_ControlCyclic.o \
	$(AS_CPU_PATH)/HMI_Contro/HMI_ControlInit.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/HMI_Contro/HMI_Contro.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/HMI_Contro.xref: \
	$(AS_CPU_PATH)/HMI_Contro/HMI_ControlCyclic.xrefo \
	$(AS_CPU_PATH)/HMI_Contro/HMI_ControlInit.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/HMI_Contro/HMI_ControlCyclic.xrefo" "$(AS_CPU_PATH)/HMI_Contro/HMI_ControlInit.xrefo" -o "$(AS_CPU_PATH)/HMI_Contro.xref"

$(AS_CPU_PATH)/HMI_Contro/HMI_ControlCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_Control/HMI_ControlCyclic.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsARCfg/AsARCfg.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_Control/HMI_Control.var \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HMI/HMI_Control/HMI_ControlCyclic.st" -o "$(AS_CPU_PATH)/HMI_Contro/HMI_ControlCyclic.o"  -O "$(AS_CPU_PATH)/HMI_Contro/HMI_ControlCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HMI_Contro/HMI_ControlInit.o: \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_Control/HMI_ControlInit.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsARCfg/AsARCfg.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/HMI/HMI_Control/HMI_Control.var \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HMI/HMI_Control/HMI_ControlInit.st" -o "$(AS_CPU_PATH)/HMI_Contro/HMI_ControlInit.o"  -O "$(AS_CPU_PATH)/HMI_Contro/HMI_ControlInit.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

