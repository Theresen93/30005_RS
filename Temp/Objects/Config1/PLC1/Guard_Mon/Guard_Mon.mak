UnmarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/SupervisoryControl_Section/Guard_Mon
MarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/SupervisoryControl_Section/Guard_Mon

$(AS_CPU_PATH)/Guard_Mon.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/Guard_Mon/Guard_Mon.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/Guard_Mon/Guard_Mon.ox" -o "$(AS_CPU_PATH)/Guard_Mon.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic2 -p 48 -s SupervisoryControl_Section.Guard_Mon -L "Acp10_MC: V2.24.0, Acp10man: V2.24.0, Acp10par: V2.24.0, Acp10sdc: V2.24.0, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V0.60.3, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/Guard_Mon/Guard_Mon.ox: \
	$(AS_CPU_PATH)/Guard_Mon/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/Guard_Mon/a.out" -o "$(AS_CPU_PATH)/Guard_Mon/Guard_Mon.ox" -T SG4 -r Cyclic2   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/Guard_Mon/a.out: \
	$(AS_CPU_PATH)/Guard_Mon/Guard_MonCyclic.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/Guard_Mon/Guard_Mon.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/Guard_Mon.xref: \
	$(AS_CPU_PATH)/Guard_Mon/Guard_MonCyclic.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/Guard_Mon/Guard_MonCyclic.xrefo" -o "$(AS_CPU_PATH)/Guard_Mon.xref"

$(AS_CPU_PATH)/Guard_Mon/Guard_MonCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/Guard_Mon/Guard_MonCyclic.ld \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/BagBundler/BagBundler.var \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/Guard_Mon/Guard_Mon.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/Guard_Mon/Guard_MonCyclic.ld" -o "$(AS_CPU_PATH)/Guard_Mon/Guard_MonCyclic.o"  -O "$(AS_CPU_PATH)/Guard_Mon/Guard_MonCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

