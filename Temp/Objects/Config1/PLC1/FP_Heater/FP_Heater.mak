UnmarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/BagMachine_Section/FP/FP_Heater
MarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/BagMachine_Section/FP/FP_Heater

$(AS_CPU_PATH)/FP_Heater.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/FP_Heater/FP_Heater.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/FP_Heater/FP_Heater.ox" -o "$(AS_CPU_PATH)/FP_Heater.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic3 -p 2 -s BagMachine_Section.FP.FP_Heater -L "Acp10_MC: V2.24.0, Acp10man: V2.24.0, Acp10par: V2.24.0, Acp10sdc: V2.24.0, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V0.60.3, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/FP_Heater/FP_Heater.ox: \
	$(AS_CPU_PATH)/FP_Heater/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/FP_Heater/a.out" -o "$(AS_CPU_PATH)/FP_Heater/FP_Heater.ox" -T SG4 -r Cyclic3   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/FP_Heater/a.out: \
	$(AS_CPU_PATH)/FP_Heater/FP_HeaterCyclic.o \
	$(AS_CPU_PATH)/FP_Heater/FP_HeaterInit.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/FP_Heater/FP_Heater.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/FP_Heater.xref: \
	$(AS_CPU_PATH)/FP_Heater/FP_HeaterCyclic.xrefo \
	$(AS_CPU_PATH)/FP_Heater/FP_HeaterInit.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/FP_Heater/FP_HeaterCyclic.xrefo" "$(AS_CPU_PATH)/FP_Heater/FP_HeaterInit.xrefo" -o "$(AS_CPU_PATH)/FP_Heater.xref"

$(AS_CPU_PATH)/FP_Heater/FP_HeaterCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/FP/FP_Heater/FP_HeaterCyclic.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/LoopConR/LoopConR.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Brsystem/brsystem.fun \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/FP/FP_Heater/FP_Heater.var \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/FP/FP_Heater/FP_HeaterCyclic.st" -o "$(AS_CPU_PATH)/FP_Heater/FP_HeaterCyclic.o"  -O "$(AS_CPU_PATH)/FP_Heater/FP_HeaterCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/FP_Heater/FP_HeaterInit.o: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/FP/FP_Heater/FP_HeaterInit.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/LoopConR/LoopConR.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Brsystem/brsystem.fun \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/FP/FP_Heater/FP_Heater.var \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/FP/FP_Heater/FP_HeaterInit.st" -o "$(AS_CPU_PATH)/FP_Heater/FP_HeaterInit.o"  -O "$(AS_CPU_PATH)/FP_Heater/FP_HeaterInit.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

