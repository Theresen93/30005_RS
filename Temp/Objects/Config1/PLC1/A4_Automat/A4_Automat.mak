UnmarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/BagMachine_Section/Tearing/Axis4/A4_Automat
MarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/BagMachine_Section/Tearing/Axis4/A4_Automat

$(AS_CPU_PATH)/A4_Automat.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/A4_Automat/A4_Automat.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/A4_Automat/A4_Automat.ox" -o "$(AS_CPU_PATH)/A4_Automat.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic1 -p 26 -s BagMachine_Section.Tearing.Axis4.A4_Automat -L "Acp10_MC: V2.24.0, Acp10man: V2.24.0, Acp10par: V2.24.0, Acp10sdc: V2.24.0, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V0.60.3, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/A4_Automat/A4_Automat.ox: \
	$(AS_CPU_PATH)/A4_Automat/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/A4_Automat/a.out" -o "$(AS_CPU_PATH)/A4_Automat/A4_Automat.ox" -T SG4 -r Cyclic1   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/A4_Automat/a.out: \
	$(AS_CPU_PATH)/A4_Automat/A4_AutomatCyclic.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/A4_Automat/A4_Automat.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/A4_Automat.xref: \
	$(AS_CPU_PATH)/A4_Automat/A4_AutomatCyclic.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/A4_Automat/A4_AutomatCyclic.xrefo" -o "$(AS_CPU_PATH)/A4_Automat.xref"

$(AS_CPU_PATH)/A4_Automat/A4_AutomatCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Tearing/Axis4/A4_Automat/A4_AutomatCyclic.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.typ \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Tearing/Axis4/A4_Automat/A4_Automat.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/NcGlobal/Ncglobal.var \
	$(AS_PROJECT_PATH)/Logical/Cycles/GenCycles.var \
	$(AS_PROJECT_PATH)/Logical/Cycles/GenCycles.typ \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Tearing/Axis4/A4_Automat/A4_AutomatCyclic.st" -o "$(AS_CPU_PATH)/A4_Automat/A4_AutomatCyclic.o"  -O "$(AS_CPU_PATH)/A4_Automat/A4_AutomatCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

