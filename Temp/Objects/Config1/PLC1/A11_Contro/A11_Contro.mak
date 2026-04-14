UnmarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/BagMachine_Section/Perf/Axis11_VirtualAxis/A11_Control
MarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/BagMachine_Section/Perf/Axis11_VirtualAxis/A11_Control

$(AS_CPU_PATH)/A11_Contro.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/A11_Contro/A11_Contro.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/A11_Contro/A11_Contro.ox" -o "$(AS_CPU_PATH)/A11_Contro.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic2 -p 5 -s BagMachine_Section.Perf.Axis11_VirtualAxis.A11_Control -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, Acp10sdc: V3.18.2, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V3.18.2, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/A11_Contro/A11_Contro.ox: \
	$(AS_CPU_PATH)/A11_Contro/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/A11_Contro/a.out" -o "$(AS_CPU_PATH)/A11_Contro/A11_Contro.ox" -T SG4 -r Cyclic2   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/A11_Contro/a.out: \
	$(AS_CPU_PATH)/A11_Contro/A11_ControlCyclic.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/A11_Contro/A11_Contro.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/A11_Contro.xref: \
	$(AS_CPU_PATH)/A11_Contro/A11_ControlCyclic.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/A11_Contro/A11_ControlCyclic.xrefo" -o "$(AS_CPU_PATH)/A11_Contro.xref"

$(AS_CPU_PATH)/A11_Contro/A11_ControlCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Perf/Axis11_VirtualAxis/A11_Control/A11_ControlCyclic.ld \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Perf/Axis11_VirtualAxis/A11_Control/A11_Control.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Perf/Axis11_VirtualAxis/A11_Control/A11_ControlCyclic.ld" -o "$(AS_CPU_PATH)/A11_Contro/A11_ControlCyclic.o"  -O "$(AS_CPU_PATH)/A11_Contro/A11_ControlCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

