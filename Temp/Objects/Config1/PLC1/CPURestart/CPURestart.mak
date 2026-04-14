UnmarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/HMI/CPURestart
MarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/HMI/CPURestart

$(AS_CPU_PATH)/CPURestart.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/CPURestart/CPURestart.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/CPURestart/CPURestart.ox" -o "$(AS_CPU_PATH)/CPURestart.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic4 -p 17 -s HMI.CPURestart -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, Acp10sdc: V3.18.2, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V3.18.2, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/CPURestart/CPURestart.ox: \
	$(AS_CPU_PATH)/CPURestart/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/CPURestart/a.out" -o "$(AS_CPU_PATH)/CPURestart/CPURestart.ox" -T SG4 -r Cyclic4   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/CPURestart/a.out: \
	$(AS_CPU_PATH)/CPURestart/CPURestartCyclic.o \
	$(AS_CPU_PATH)/CPURestart/CPURestartInit.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/CPURestart/CPURestart.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/CPURestart.xref: \
	$(AS_CPU_PATH)/CPURestart/CPURestartCyclic.xrefo \
	$(AS_CPU_PATH)/CPURestart/CPURestartInit.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/CPURestart/CPURestartCyclic.xrefo" "$(AS_CPU_PATH)/CPURestart/CPURestartInit.xrefo" -o "$(AS_CPU_PATH)/CPURestart.xref"

$(AS_CPU_PATH)/CPURestart/CPURestartCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/HMI/CPURestart/CPURestartCyclic.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/sys_lib/sys_lib.fun \
	$(AS_PROJECT_PATH)/Logical/HMI/CPURestart/CPURestart.var \
	$(AS_PROJECT_PATH)/Logical/Global.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HMI/CPURestart/CPURestartCyclic.st" -o "$(AS_CPU_PATH)/CPURestart/CPURestartCyclic.o"  -O "$(AS_CPU_PATH)/CPURestart/CPURestartCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/CPURestart/CPURestartInit.o: \
	$(AS_PROJECT_PATH)/Logical/HMI/CPURestart/CPURestartInit.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/sys_lib/sys_lib.fun \
	$(AS_PROJECT_PATH)/Logical/HMI/CPURestart/CPURestart.var \
	$(AS_PROJECT_PATH)/Logical/Global.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HMI/CPURestart/CPURestartInit.st" -o "$(AS_CPU_PATH)/CPURestart/CPURestartInit.o"  -O "$(AS_CPU_PATH)/CPURestart/CPURestartInit.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

