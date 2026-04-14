UnmarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/HMI/Message_2
MarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/HMI/Message_2

$(AS_CPU_PATH)/Message_2.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/Message_2/Message_2.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/Message_2/Message_2.ox" -o "$(AS_CPU_PATH)/Message_2.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic4 -p 11 -s HMI.Message_2 -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, Acp10sdc: V3.18.2, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V3.18.2, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/Message_2/Message_2.ox: \
	$(AS_CPU_PATH)/Message_2/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/Message_2/a.out" -o "$(AS_CPU_PATH)/Message_2/Message_2.ox" -T SG4 -r Cyclic4   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/Message_2/a.out: \
	$(AS_CPU_PATH)/Message_2/Message_2Cyclic.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/Message_2/Message_2.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/Message_2.xref: \
	$(AS_CPU_PATH)/Message_2/Message_2Cyclic.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/Message_2/Message_2Cyclic.xrefo" -o "$(AS_CPU_PATH)/Message_2.xref"

$(AS_CPU_PATH)/Message_2/Message_2Cyclic.o: \
	$(AS_PROJECT_PATH)/Logical/HMI/Message_2/Message_2Cyclic.ld \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/BagBundler/BagBundler.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ \
	$(AS_PROJECT_PATH)/Logical/HMI/Message_2/Message_2.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HMI/Message_2/Message_2Cyclic.ld" -o "$(AS_CPU_PATH)/Message_2/Message_2Cyclic.o"  -O "$(AS_CPU_PATH)/Message_2/Message_2Cyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

