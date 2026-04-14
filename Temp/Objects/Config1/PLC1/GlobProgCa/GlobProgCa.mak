UnmarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/BagMachine_Section/GlobProgCalc
MarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/BagMachine_Section/GlobProgCalc

$(AS_CPU_PATH)/GlobProgCa.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/GlobProgCa/GlobProgCa.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/GlobProgCa/GlobProgCa.ox" -o "$(AS_CPU_PATH)/GlobProgCa.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic1 -p 2 -s BagMachine_Section.GlobProgCalc -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, Acp10sdc: V3.18.2, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V3.18.2, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/GlobProgCa/GlobProgCa.ox: \
	$(AS_CPU_PATH)/GlobProgCa/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/GlobProgCa/a.out" -o "$(AS_CPU_PATH)/GlobProgCa/GlobProgCa.ox" -T SG4 -r Cyclic1   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/GlobProgCa/a.out: \
	$(AS_CPU_PATH)/GlobProgCa/GlobProgCalcCyclic.o \
	$(AS_CPU_PATH)/GlobProgCa/GlobProgCalcInit.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/GlobProgCa/GlobProgCa.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/GlobProgCa.xref: \
	$(AS_CPU_PATH)/GlobProgCa/GlobProgCalcCyclic.xrefo \
	$(AS_CPU_PATH)/GlobProgCa/GlobProgCalcInit.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/GlobProgCa/GlobProgCalcCyclic.xrefo" "$(AS_CPU_PATH)/GlobProgCa/GlobProgCalcInit.xrefo" -o "$(AS_CPU_PATH)/GlobProgCa.xref"

$(AS_CPU_PATH)/GlobProgCa/GlobProgCalcCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/GlobProgCalc/GlobProgCalcCyclic.st \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/GlobProgCalc/GlobProgCalc.var \
	$(AS_PROJECT_PATH)/Logical/Cycles/GenCycles.var \
	$(AS_PROJECT_PATH)/Logical/Cycles/GenCycles.typ \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/GlobProgCalc/GlobProgCalcCyclic.st" -o "$(AS_CPU_PATH)/GlobProgCa/GlobProgCalcCyclic.o"  -O "$(AS_CPU_PATH)/GlobProgCa/GlobProgCalcCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/GlobProgCa/GlobProgCalcInit.o: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/GlobProgCalc/GlobProgCalcInit.st \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/GlobProgCalc/GlobProgCalc.var \
	$(AS_PROJECT_PATH)/Logical/Cycles/GenCycles.var \
	$(AS_PROJECT_PATH)/Logical/Cycles/GenCycles.typ \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/GlobProgCalc/GlobProgCalcInit.st" -o "$(AS_CPU_PATH)/GlobProgCa/GlobProgCalcInit.o"  -O "$(AS_CPU_PATH)/GlobProgCa/GlobProgCalcInit.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

