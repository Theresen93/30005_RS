UnmarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/SupervisoryControl_Section/Revision
MarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/SupervisoryControl_Section/Revision

$(AS_CPU_PATH)/Revision.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/Revision/Revision.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/Revision/Revision.ox" -o "$(AS_CPU_PATH)/Revision.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic4 -p 15 -s SupervisoryControl_Section.Revision -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, Acp10sdc: V3.18.2, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V3.18.2, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/Revision/Revision.ox: \
	$(AS_CPU_PATH)/Revision/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/Revision/a.out" -o "$(AS_CPU_PATH)/Revision/Revision.ox" -T SG4 -r Cyclic4   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/Revision/a.out: \
	$(AS_CPU_PATH)/Revision/RevisionCyclic.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/Revision/Revision.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/Revision.xref: \
	$(AS_CPU_PATH)/Revision/RevisionCyclic.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/Revision/RevisionCyclic.xrefo" -o "$(AS_CPU_PATH)/Revision.xref"

$(AS_CPU_PATH)/Revision/RevisionCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/Revision/RevisionCyclic.st \
	$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/Revision/Revision.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/Revision/RevisionCyclic.st" -o "$(AS_CPU_PATH)/Revision/RevisionCyclic.o"  -O "$(AS_CPU_PATH)/Revision/RevisionCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

