UnmarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/SupervisoryControl_Section/HourMeter
MarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/SupervisoryControl_Section/HourMeter

$(AS_CPU_PATH)/HourMeter.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/HourMeter/HourMeter.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/HourMeter/HourMeter.ox" -o "$(AS_CPU_PATH)/HourMeter.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic7 -p 2 -s SupervisoryControl_Section.HourMeter -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, Acp10sdc: V3.18.2, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V3.18.2, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/HourMeter/HourMeter.ox: \
	$(AS_CPU_PATH)/HourMeter/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/HourMeter/a.out" -o "$(AS_CPU_PATH)/HourMeter/HourMeter.ox" -T SG4 -r Cyclic7   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/HourMeter/a.out: \
	$(AS_CPU_PATH)/HourMeter/HourMeterCyclic.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/HourMeter/HourMeter.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/HourMeter.xref: \
	$(AS_CPU_PATH)/HourMeter/HourMeterCyclic.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/HourMeter/HourMeterCyclic.xrefo" -o "$(AS_CPU_PATH)/HourMeter.xref"

$(AS_CPU_PATH)/HourMeter/HourMeterCyclic.o: \
	$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/HourMeter/HourMeterCyclic.st \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Physical/Config1/PLC1/Cpu.per \
	$(AS_PROJECT_PATH)/Logical/Global.typ \
	$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/HourMeter/HourMeter.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/SupervisoryControl_Section/HourMeter/HourMeterCyclic.st" -o "$(AS_CPU_PATH)/HourMeter/HourMeterCyclic.o"  -O "$(AS_CPU_PATH)/HourMeter/HourMeterCyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

