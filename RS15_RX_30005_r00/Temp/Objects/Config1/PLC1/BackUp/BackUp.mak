UnmarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/HMI/BackUp
MarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/HMI/BackUp

$(AS_CPU_PATH)/BackUp.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/BackUp/BackUp.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/BackUp/BackUp.ox" -o "$(AS_CPU_PATH)/BackUp.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic4 -p 14 -s HMI.BackUp -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, Acp10sdc: V3.18.2, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V3.18.2, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/BackUp/BackUp.ox: \
	$(AS_CPU_PATH)/BackUp/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/BackUp/a.out" -o "$(AS_CPU_PATH)/BackUp/BackUp.ox" -T SG4 -r Cyclic4   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/BackUp/a.out: \
	$(AS_CPU_PATH)/BackUp/BackUpCyclic.o \
	$(AS_CPU_PATH)/BackUp/BackUpInit.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/BackUp/BackUp.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/BackUp.xref: \
	$(AS_CPU_PATH)/BackUp/BackUpCyclic.xrefo \
	$(AS_CPU_PATH)/BackUp/BackUpInit.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/BackUp/BackUpCyclic.xrefo" "$(AS_CPU_PATH)/BackUp/BackUpInit.xrefo" -o "$(AS_CPU_PATH)/BackUp.xref"

$(AS_CPU_PATH)/BackUp/BackUpCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/HMI/BackUp/BackUpCyclic.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/HMI/BackUp/BackUp.var \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ \
	$(AS_PROJECT_PATH)/Physical/Config1/PLC1/Cpu.per \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HMI/BackUp/BackUpCyclic.st" -o "$(AS_CPU_PATH)/BackUp/BackUpCyclic.o"  -O "$(AS_CPU_PATH)/BackUp/BackUpCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/BackUp/BackUpInit.o: \
	$(AS_PROJECT_PATH)/Logical/HMI/BackUp/BackUpInit.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/HMI/BackUp/BackUp.var \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ \
	$(AS_PROJECT_PATH)/Physical/Config1/PLC1/Cpu.per \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HMI/BackUp/BackUpInit.st" -o "$(AS_CPU_PATH)/BackUp/BackUpInit.o"  -O "$(AS_CPU_PATH)/BackUp/BackUpInit.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

