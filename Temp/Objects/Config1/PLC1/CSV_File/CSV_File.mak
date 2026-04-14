UnmarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/Libraries/CSV_File
MarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/Libraries/CSV_File

$(AS_CPU_PATH)/CSV_File.br: \
	$(AS_PROJECT_PATH)\Logical\Libraries\CSV_File\IEC.lby \
	$(AS_CPU_PATH)/CSV_File/CSV_File.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/CSV_File/CSV_File.ox" -o "$(AS_CPU_PATH)/CSV_File.br" -v V2.01.7 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*,AsMath: V* - V*,AsMem: V1.00.2 - V*,AsString: V* - V*,FileIO: V1.03.6 - V*,standard: V1.35.0 - V*,sys_lib: V1.40.2 - V*,astime: V2.00.0 - V*" -r Library -s Libraries.CSV_File -L "Acp10_MC: V2.24.0, Acp10man: V2.24.0, Acp10par: V2.24.0, Acp10sdc: V2.24.0, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V0.60.3, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/CSV_File/CSV_File.ox: \
	$(AS_CPU_PATH)/CSV_File/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/CSV_File/a.out" -o "$(AS_CPU_PATH)/CSV_File/CSV_File.ox" -T SG4 -r Library   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/CSV_File/a.out: \
	$(AS_CPU_PATH)/CSV_File/CSV_CheckFile.o \
	$(AS_CPU_PATH)/CSV_File/CSV_InitCheckFile.o \
	$(AS_CPU_PATH)/CSV_File/CSV_Search.o \
	$(AS_CPU_PATH)/CSV_File/CSV_Init.o \
	$(AS_CPU_PATH)/CSV_File/CSV_ListFile.o \
	$(AS_CPU_PATH)/CSV_File/SearchFileName.o \
	$(AS_CPU_PATH)/CSV_File/CSV_ReadFile.o \
	$(AS_CPU_PATH)/CSV_File/ExListFile.o \
	$(AS_CPU_PATH)/CSV_File/CSV_WriteFile.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/CSV_File/CSV_File.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/CSV_File.xref: \
	$(AS_CPU_PATH)/CSV_File/CSV_CheckFile.xrefo \
	$(AS_CPU_PATH)/CSV_File/CSV_InitCheckFile.xrefo \
	$(AS_CPU_PATH)/CSV_File/CSV_Search.xrefo \
	$(AS_CPU_PATH)/CSV_File/CSV_Init.xrefo \
	$(AS_CPU_PATH)/CSV_File/CSV_ListFile.xrefo \
	$(AS_CPU_PATH)/CSV_File/SearchFileName.xrefo \
	$(AS_CPU_PATH)/CSV_File/CSV_ReadFile.xrefo \
	$(AS_CPU_PATH)/CSV_File/ExListFile.xrefo \
	$(AS_CPU_PATH)/CSV_File/CSV_WriteFile.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/CSV_File/CSV_CheckFile.xrefo" "$(AS_CPU_PATH)/CSV_File/CSV_InitCheckFile.xrefo" "$(AS_CPU_PATH)/CSV_File/CSV_Search.xrefo" "$(AS_CPU_PATH)/CSV_File/CSV_Init.xrefo" "$(AS_CPU_PATH)/CSV_File/CSV_ListFile.xrefo" "$(AS_CPU_PATH)/CSV_File/SearchFileName.xrefo" "$(AS_CPU_PATH)/CSV_File/CSV_ReadFile.xrefo" "$(AS_CPU_PATH)/CSV_File/ExListFile.xrefo" "$(AS_CPU_PATH)/CSV_File/CSV_WriteFile.xrefo" -o "$(AS_CPU_PATH)/CSV_File.xref"

$(AS_CPU_PATH)/CSV_File/CSV_CheckFile.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_CheckFile.ab \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMem/AsMem.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/sys_lib/sys_lib.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/asstring/asstring.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMath/AsMath.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_CheckFile.ab" -o "$(AS_CPU_PATH)/CSV_File/CSV_CheckFile.o"  -O "$(AS_CPU_PATH)/CSV_File/CSV_CheckFile.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/CSV_File/CSV_InitCheckFile.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_InitCheckFile.ab \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMem/AsMem.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/sys_lib/sys_lib.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/asstring/asstring.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMath/AsMath.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_InitCheckFile.ab" -o "$(AS_CPU_PATH)/CSV_File/CSV_InitCheckFile.o"  -O "$(AS_CPU_PATH)/CSV_File/CSV_InitCheckFile.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/CSV_File/CSV_Search.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_Search.ab \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMem/AsMem.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/sys_lib/sys_lib.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/asstring/asstring.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMath/AsMath.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_Search.ab" -o "$(AS_CPU_PATH)/CSV_File/CSV_Search.o"  -O "$(AS_CPU_PATH)/CSV_File/CSV_Search.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/CSV_File/CSV_Init.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_Init.ab \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMem/AsMem.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/sys_lib/sys_lib.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/asstring/asstring.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMath/AsMath.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_Init.ab" -o "$(AS_CPU_PATH)/CSV_File/CSV_Init.o"  -O "$(AS_CPU_PATH)/CSV_File/CSV_Init.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/CSV_File/CSV_ListFile.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_ListFile.ab \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMem/AsMem.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/sys_lib/sys_lib.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/asstring/asstring.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMath/AsMath.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_ListFile.ab" -o "$(AS_CPU_PATH)/CSV_File/CSV_ListFile.o"  -O "$(AS_CPU_PATH)/CSV_File/CSV_ListFile.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/CSV_File/SearchFileName.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/SearchFileName.ab \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMem/AsMem.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/sys_lib/sys_lib.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/asstring/asstring.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMath/AsMath.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/SearchFileName.ab" -o "$(AS_CPU_PATH)/CSV_File/SearchFileName.o"  -O "$(AS_CPU_PATH)/CSV_File/SearchFileName.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/CSV_File/CSV_ReadFile.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_ReadFile.ab \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMem/AsMem.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/sys_lib/sys_lib.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/asstring/asstring.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMath/AsMath.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_ReadFile.ab" -o "$(AS_CPU_PATH)/CSV_File/CSV_ReadFile.o"  -O "$(AS_CPU_PATH)/CSV_File/CSV_ReadFile.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/CSV_File/ExListFile.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/ExListFile.ab \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMem/AsMem.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/sys_lib/sys_lib.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/asstring/asstring.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMath/AsMath.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/ExListFile.ab" -o "$(AS_CPU_PATH)/CSV_File/ExListFile.o"  -O "$(AS_CPU_PATH)/CSV_File/ExListFile.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/CSV_File/CSV_WriteFile.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_WriteFile.ab \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMem/AsMem.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/sys_lib/sys_lib.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/asstring/asstring.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/AsMath/AsMath.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/FileIO/FileIO.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_File.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/CSV_File/CSV_WriteFile.ab" -o "$(AS_CPU_PATH)/CSV_File/CSV_WriteFile.o"  -O "$(AS_CPU_PATH)/CSV_File/CSV_WriteFile.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

