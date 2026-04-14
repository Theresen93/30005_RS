UnmarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/HMI/Units
MarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/HMI/Units

$(AS_CPU_PATH)/Units.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/Units/Units.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/Units/Units.ox" -o "$(AS_CPU_PATH)/Units.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic4 -p 4 -s HMI.Units -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, Acp10sdc: V3.18.2, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V3.18.2, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/Units/Units.ox: \
	$(AS_CPU_PATH)/Units/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/Units/a.out" -o "$(AS_CPU_PATH)/Units/Units.ox" -T SG4 -r Cyclic4   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/Units/a.out: \
	$(AS_CPU_PATH)/Units/UnitsCyclic.o \
	$(AS_CPU_PATH)/Units/UnitsInit.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/Units/Units.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/Units.xref: \
	$(AS_CPU_PATH)/Units/UnitsCyclic.xrefo \
	$(AS_CPU_PATH)/Units/UnitsInit.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/Units/UnitsCyclic.xrefo" "$(AS_CPU_PATH)/Units/UnitsInit.xrefo" -o "$(AS_CPU_PATH)/Units.xref"

$(AS_CPU_PATH)/Units/UnitsCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/HMI/Units/UnitsCyclic.st \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/HMI/Units/Units.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HMI/Units/UnitsCyclic.st" -o "$(AS_CPU_PATH)/Units/UnitsCyclic.o"  -O "$(AS_CPU_PATH)/Units/UnitsCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/Units/UnitsInit.o: \
	$(AS_PROJECT_PATH)/Logical/HMI/Units/UnitsInit.st \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/HMI/Units/Units.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HMI/Units/UnitsInit.st" -o "$(AS_CPU_PATH)/Units/UnitsInit.o"  -O "$(AS_CPU_PATH)/Units/UnitsInit.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

