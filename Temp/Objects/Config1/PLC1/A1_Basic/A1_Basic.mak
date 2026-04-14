UnmarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/BagMachine_Section/Perf/Axis1/A1_Basic
MarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/BagMachine_Section/Perf/Axis1/A1_Basic

$(AS_CPU_PATH)/A1_Basic.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/A1_Basic/A1_Basic.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/A1_Basic/A1_Basic.ox" -o "$(AS_CPU_PATH)/A1_Basic.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic1 -p 7 -s BagMachine_Section.Perf.Axis1.A1_Basic -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, Acp10sdc: V3.18.2, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V3.18.2, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/A1_Basic/A1_Basic.ox: \
	$(AS_CPU_PATH)/A1_Basic/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/A1_Basic/a.out" -o "$(AS_CPU_PATH)/A1_Basic/A1_Basic.ox" -T SG4 -r Cyclic1   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/A1_Basic/a.out: \
	$(AS_CPU_PATH)/A1_Basic/A1_BasicCyclic.o \
	$(AS_CPU_PATH)/A1_Basic/A1_BasicInit.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/A1_Basic/A1_Basic.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/A1_Basic.xref: \
	$(AS_CPU_PATH)/A1_Basic/A1_BasicCyclic.xrefo \
	$(AS_CPU_PATH)/A1_Basic/A1_BasicInit.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/A1_Basic/A1_BasicCyclic.xrefo" "$(AS_CPU_PATH)/A1_Basic/A1_BasicInit.xrefo" -o "$(AS_CPU_PATH)/A1_Basic.xref"

$(AS_CPU_PATH)/A1_Basic/A1_BasicCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Perf/Axis1/A1_Basic/A1_BasicCyclic.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/NcGlobal/NcGlobal.fun \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Perf/Axis1/A1_Basic/A1_Basic.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/NcGlobal/NcGlobal.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.var \
	$(AS_PROJECT_PATH)/Logical/Cycles/GenCycles.var \
	$(AS_PROJECT_PATH)/Logical/Cycles/GenCycles.typ \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Physical/Config1/PLC1/Cpu.per \
	$(AS_PROJECT_PATH)/Logical/Global.typ
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Perf/Axis1/A1_Basic/A1_BasicCyclic.st" -o "$(AS_CPU_PATH)/A1_Basic/A1_BasicCyclic.o"  -O "$(AS_CPU_PATH)/A1_Basic/A1_BasicCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/A1_Basic/A1_BasicInit.o: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Perf/Axis1/A1_Basic/A1_BasicInit.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/NcGlobal/NcGlobal.fun \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Perf/Axis1/A1_Basic/A1_Basic.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/NcGlobal/NcGlobal.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.var \
	$(AS_PROJECT_PATH)/Logical/Cycles/GenCycles.var \
	$(AS_PROJECT_PATH)/Logical/Cycles/GenCycles.typ \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Physical/Config1/PLC1/Cpu.per \
	$(AS_PROJECT_PATH)/Logical/Global.typ
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Perf/Axis1/A1_Basic/A1_BasicInit.st" -o "$(AS_CPU_PATH)/A1_Basic/A1_BasicInit.o"  -O "$(AS_CPU_PATH)/A1_Basic/A1_BasicInit.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

