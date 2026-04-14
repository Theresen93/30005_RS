UnmarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/HMI/Recipe_2
MarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/HMI/Recipe_2

$(AS_CPU_PATH)/Recipe_2.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/Recipe_2/Recipe_2.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/Recipe_2/Recipe_2.ox" -o "$(AS_CPU_PATH)/Recipe_2.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic4 -p 9 -s HMI.Recipe_2 -L "Acp10_MC: V2.24.0, Acp10man: V2.24.0, Acp10par: V2.24.0, Acp10sdc: V2.24.0, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V0.60.3, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/Recipe_2/Recipe_2.ox: \
	$(AS_CPU_PATH)/Recipe_2/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/Recipe_2/a.out" -o "$(AS_CPU_PATH)/Recipe_2/Recipe_2.ox" -T SG4 -r Cyclic4   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/Recipe_2/a.out: \
	$(AS_CPU_PATH)/Recipe_2/Recipe_2Cyclic.o \
	$(AS_CPU_PATH)/Recipe_2/Recipe_2Init.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/Recipe_2/Recipe_2.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/Recipe_2.xref: \
	$(AS_CPU_PATH)/Recipe_2/Recipe_2Cyclic.xrefo \
	$(AS_CPU_PATH)/Recipe_2/Recipe_2Init.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/Recipe_2/Recipe_2Cyclic.xrefo" "$(AS_CPU_PATH)/Recipe_2/Recipe_2Init.xrefo" -o "$(AS_CPU_PATH)/Recipe_2.xref"

$(AS_CPU_PATH)/Recipe_2/Recipe_2Cyclic.o: \
	$(AS_PROJECT_PATH)/Logical/HMI/Recipe_2/Recipe_2Cyclic.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/asstring/asstring.fun \
	$(AS_PROJECT_PATH)/Logical/HMI/Recipe_2/Recipe_2.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.typ \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HMI/Recipe_2/Recipe_2Cyclic.st" -o "$(AS_CPU_PATH)/Recipe_2/Recipe_2Cyclic.o"  -O "$(AS_CPU_PATH)/Recipe_2/Recipe_2Cyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/Recipe_2/Recipe_2Init.o: \
	$(AS_PROJECT_PATH)/Logical/HMI/Recipe_2/Recipe_2Init.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/asstring/asstring.fun \
	$(AS_PROJECT_PATH)/Logical/HMI/Recipe_2/Recipe_2.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.typ \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/HMI/Recipe_2/Recipe_2Init.st" -o "$(AS_CPU_PATH)/Recipe_2/Recipe_2Init.o"  -O "$(AS_CPU_PATH)/Recipe_2/Recipe_2Init.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

