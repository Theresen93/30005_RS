UnmarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/BagMachine_Section/EntryPull/Registration/A5_Reg1
MarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/BagMachine_Section/EntryPull/Registration/A5_Reg1

$(AS_CPU_PATH)/A5_Reg1.br: \
	$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Cpu.per \
	$(AS_CPU_PATH)/A5_Reg1/A5_Reg1.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/A5_Reg1/A5_Reg1.ox" -o "$(AS_CPU_PATH)/A5_Reg1.br" -v V1.00.0 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Cyclic1 -p 12 -s BagMachine_Section.EntryPull.Registration.A5_Reg1 -L "Acp10_MC: V2.24.0, Acp10man: V2.24.0, Acp10par: V2.24.0, Acp10sdc: V2.24.0, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V0.60.3, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/A5_Reg1/A5_Reg1.ox: \
	$(AS_CPU_PATH)/A5_Reg1/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/A5_Reg1/a.out" -o "$(AS_CPU_PATH)/A5_Reg1/A5_Reg1.ox" -T SG4 -r Cyclic1   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/A5_Reg1/a.out: \
	$(AS_CPU_PATH)/A5_Reg1/A5_Reg1Cyclic.o \
	$(AS_CPU_PATH)/A5_Reg1/A5_Reg1Init.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/A5_Reg1/A5_Reg1.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/A5_Reg1.xref: \
	$(AS_CPU_PATH)/A5_Reg1/A5_Reg1Cyclic.xrefo \
	$(AS_CPU_PATH)/A5_Reg1/A5_Reg1Init.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/A5_Reg1/A5_Reg1Cyclic.xrefo" "$(AS_CPU_PATH)/A5_Reg1/A5_Reg1Init.xrefo" -o "$(AS_CPU_PATH)/A5_Reg1.xref"

$(AS_CPU_PATH)/A5_Reg1/A5_Reg1Cyclic.o: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/EntryPull/Registration/A5_Reg1/A5_Reg1Cyclic.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.typ \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/EntryPull/Registration/A5_Reg1/A5_Reg1.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.var \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10par/Acp10par.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/EntryPull/Registration/A5_Reg1/A5_Reg1Cyclic.st" -o "$(AS_CPU_PATH)/A5_Reg1/A5_Reg1Cyclic.o"  -O "$(AS_CPU_PATH)/A5_Reg1/A5_Reg1Cyclic.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/A5_Reg1/A5_Reg1Init.o: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/EntryPull/Registration/A5_Reg1/A5_Reg1Init.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.typ \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/EntryPull/Registration/A5_Reg1/A5_Reg1.var \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10_MC/acp10_mc.var \
	$(AS_PROJECT_PATH)/Logical/Global.var \
	$(AS_PROJECT_PATH)/Logical/Global.typ \
	$(AS_PROJECT_PATH)/Logical/Libraries/Acp10par/Acp10par.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/EntryPull/Registration/A5_Reg1/A5_Reg1Init.st" -o "$(AS_CPU_PATH)/A5_Reg1/A5_Reg1Init.o"  -O "$(AS_CPU_PATH)/A5_Reg1/A5_Reg1Init.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

