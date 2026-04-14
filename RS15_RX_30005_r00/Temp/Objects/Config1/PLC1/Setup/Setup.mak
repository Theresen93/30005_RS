UnmarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/SupervisoryControl_Section/Setup
MarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/SupervisoryControl_Section/Setup

$(AS_CPU_PATH)/Setup.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/Setup/Setup.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/Setup/Setup.ox" -o "$(AS_CPU_PATH)/Setup.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic2 -p 39 -s SupervisoryControl_Section.Setup -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, Acp10sdc: V3.18.2, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V3.18.2, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/Setup/Setup.ox: \
	$(AS_CPU_PATH)/Setup/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/Setup/a.out" -o "$(AS_CPU_PATH)/Setup/Setup.ox" -T SG4 -r Cyclic2   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/Setup/a.out: \
	$(AS_CPU_PATH)/Setup/SetupCyclic.o \
	$(AS_CPU_PATH)/Setup/SetupInit.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/Setup/Setup.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/Setup.xref: \
	$(AS_CPU_PATH)/Setup/SetupCyclic.xrefo \
	$(AS_CPU_PATH)/Setup/SetupInit.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/Setup/SetupCyclic.xrefo" "$(AS_CPU_PATH)/Setup/SetupInit.xrefo" -o "$(AS_CPU_PATH)/Setup.xref"

$(AS_CPU_PATH)/Setup/SetupCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/Setup/SetupCyclic.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Cycles/GenCycles.var \
	$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/Setup/Setup.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/Setup/SetupCyclic.st" -o "$(AS_CPU_PATH)/Setup/SetupCyclic.o"  -O "$(AS_CPU_PATH)/Setup/SetupCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/Setup/SetupInit.o: \
	$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/Setup/SetupInit.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Cycles/GenCycles.var \
	$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/Setup/Setup.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/Setup/SetupInit.st" -o "$(AS_CPU_PATH)/Setup/SetupInit.o"  -O "$(AS_CPU_PATH)/Setup/SetupInit.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

