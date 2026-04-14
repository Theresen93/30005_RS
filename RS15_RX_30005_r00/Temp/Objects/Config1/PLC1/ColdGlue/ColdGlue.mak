UnmarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/BagMachine_Section/ColdGlue
MarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/BagMachine_Section/ColdGlue

$(AS_CPU_PATH)/ColdGlue.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/ColdGlue/ColdGlue.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/ColdGlue/ColdGlue.ox" -o "$(AS_CPU_PATH)/ColdGlue.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic2 -p 43 -s BagMachine_Section.ColdGlue -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, Acp10sdc: V3.18.2, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V3.18.2, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/ColdGlue/ColdGlue.ox: \
	$(AS_CPU_PATH)/ColdGlue/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/ColdGlue/a.out" -o "$(AS_CPU_PATH)/ColdGlue/ColdGlue.ox" -T SG4 -r Cyclic2   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/ColdGlue/a.out: \
	$(AS_CPU_PATH)/ColdGlue/ColdGlueCyclic.o \
	$(AS_CPU_PATH)/ColdGlue/ColdGlueInit.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/ColdGlue/ColdGlue.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/ColdGlue.xref: \
	$(AS_CPU_PATH)/ColdGlue/ColdGlueCyclic.xrefo \
	$(AS_CPU_PATH)/ColdGlue/ColdGlueInit.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/ColdGlue/ColdGlueCyclic.xrefo" "$(AS_CPU_PATH)/ColdGlue/ColdGlueInit.xrefo" -o "$(AS_CPU_PATH)/ColdGlue.xref"

$(AS_CPU_PATH)/ColdGlue/ColdGlueCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/ColdGlue/ColdGlueCyclic.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/ColdGlue/ColdGlue.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/ColdGlue/ColdGlueCyclic.st" -o "$(AS_CPU_PATH)/ColdGlue/ColdGlueCyclic.o"  -O "$(AS_CPU_PATH)/ColdGlue/ColdGlueCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/ColdGlue/ColdGlueInit.o: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/ColdGlue/ColdGlueInit.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/ColdGlue/ColdGlue.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/ColdGlue/ColdGlueInit.st" -o "$(AS_CPU_PATH)/ColdGlue/ColdGlueInit.o"  -O "$(AS_CPU_PATH)/ColdGlue/ColdGlueInit.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

