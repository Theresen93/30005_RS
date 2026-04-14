UnmarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/SupervisoryControl_Section/ManMode
MarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/SupervisoryControl_Section/ManMode

$(AS_CPU_PATH)/ManMode.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/ManMode/ManMode.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/ManMode/ManMode.ox" -o "$(AS_CPU_PATH)/ManMode.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic4 -p 19 -s SupervisoryControl_Section.ManMode -L "Acp10_MC: V2.24.0, Acp10man: V2.24.0, Acp10par: V2.24.0, Acp10sdc: V2.24.0, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V0.60.3, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/ManMode/ManMode.ox: \
	$(AS_CPU_PATH)/ManMode/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/ManMode/a.out" -o "$(AS_CPU_PATH)/ManMode/ManMode.ox" -T SG4 -r Cyclic4   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/ManMode/a.out: \
	$(AS_CPU_PATH)/ManMode/ManModeCyclic.o \
	$(AS_CPU_PATH)/ManMode/ManModeInit.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/ManMode/ManMode.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/ManMode.xref: \
	$(AS_CPU_PATH)/ManMode/ManModeCyclic.xrefo \
	$(AS_CPU_PATH)/ManMode/ManModeInit.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/ManMode/ManModeCyclic.xrefo" "$(AS_CPU_PATH)/ManMode/ManModeInit.xrefo" -o "$(AS_CPU_PATH)/ManMode.xref"

$(AS_CPU_PATH)/ManMode/ManModeCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/ManMode/ManModeCyclic.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun \
	$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/ManMode/ManMode.var \
	$(AS_PROJECT_PATH)/Logical/Global.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/ManMode/ManModeCyclic.st" -o "$(AS_CPU_PATH)/ManMode/ManModeCyclic.o"  -O "$(AS_CPU_PATH)/ManMode/ManModeCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/ManMode/ManModeInit.o: \
	$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/ManMode/ManModeInit.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun \
	$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/ManMode/ManMode.var \
	$(AS_PROJECT_PATH)/Logical/Global.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/ManMode/ManModeInit.st" -o "$(AS_CPU_PATH)/ManMode/ManModeInit.o"  -O "$(AS_CPU_PATH)/ManMode/ManModeInit.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

