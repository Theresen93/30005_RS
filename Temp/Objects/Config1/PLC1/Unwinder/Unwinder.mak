UnmarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/BagMachine_Section/Unwinder
MarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/BagMachine_Section/Unwinder

$(AS_CPU_PATH)/Unwinder.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/Unwinder/Unwinder.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/Unwinder/Unwinder.ox" -o "$(AS_CPU_PATH)/Unwinder.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic4 -p 22 -s BagMachine_Section.Unwinder -L "Acp10_MC: V2.24.0, Acp10man: V2.24.0, Acp10par: V2.24.0, Acp10sdc: V2.24.0, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V0.60.3, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/Unwinder/Unwinder.ox: \
	$(AS_CPU_PATH)/Unwinder/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/Unwinder/a.out" -o "$(AS_CPU_PATH)/Unwinder/Unwinder.ox" -T SG4 -r Cyclic4   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/Unwinder/a.out: \
	$(AS_CPU_PATH)/Unwinder/UnwinderCyclic.o \
	$(AS_CPU_PATH)/Unwinder/UnwinderInit.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/Unwinder/Unwinder.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/Unwinder.xref: \
	$(AS_CPU_PATH)/Unwinder/UnwinderCyclic.xrefo \
	$(AS_CPU_PATH)/Unwinder/UnwinderInit.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/Unwinder/UnwinderCyclic.xrefo" "$(AS_CPU_PATH)/Unwinder/UnwinderInit.xrefo" -o "$(AS_CPU_PATH)/Unwinder.xref"

$(AS_CPU_PATH)/Unwinder/UnwinderCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Unwinder/UnwinderCyclic.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Unwinder/Unwinder.var \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Unwinder/UnwinderCyclic.st" -o "$(AS_CPU_PATH)/Unwinder/UnwinderCyclic.o"  -O "$(AS_CPU_PATH)/Unwinder/UnwinderCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/Unwinder/UnwinderInit.o: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Unwinder/UnwinderInit.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Unwinder/Unwinder.var \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Unwinder/UnwinderInit.st" -o "$(AS_CPU_PATH)/Unwinder/UnwinderInit.o"  -O "$(AS_CPU_PATH)/Unwinder/UnwinderInit.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

