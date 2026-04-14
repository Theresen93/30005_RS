UnmarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/Libraries/HGWeber
MarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/Libraries/HGWeber

$(AS_CPU_PATH)/HGWeber.br: \
	$(AS_PROJECT_PATH)\Logical\Libraries\HGWeber\IEC.lby \
	$(AS_CPU_PATH)/HGWeber/HGWeber.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/HGWeber/HGWeber.ox" -o "$(AS_CPU_PATH)/HGWeber.br" -v V1.00.1 -f "$(AS_CPU_PATH)/Global.ofs" -T SG4  -B F3.01 -extConstants -d "runtime: V* - V*" -r Library -R "HG Weber Function Blocks"  -s Libraries.HGWeber -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, Acp10sdc: V3.18.2, AsARCfg: V*, AsIOAcc: V*, AsMath: V*, AsMem: V*, asstring: V*, astime: V*, Brsystem: V*, Convert: V*, CSV_File: V*, FileIO: V*, HGWeber: V*, LoopConR: V2.80.0, NcGlobal: V3.18.2, Operator: V*, powerlnk: V*, Runtime: V*, standard: V*, sys_lib: V*, Visapi: V*" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/HGWeber/HGWeber.ox: \
	$(AS_CPU_PATH)/HGWeber/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/HGWeber/a.out" -o "$(AS_CPU_PATH)/HGWeber/HGWeber.ox" -T SG4 -r Library   -G V4.1.1  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/HGWeber/a.out: \
	$(AS_CPU_PATH)/HGWeber/HGW_2StatePB.o \
	$(AS_CPU_PATH)/HGWeber/HGW_3StatePB.o \
	$(AS_CPU_PATH)/HGWeber/HGW_4StatePB.o \
	$(AS_CPU_PATH)/HGWeber/HGW_2StateIND.o \
	$(AS_CPU_PATH)/HGWeber/HGW_2StateIND1.o \
	$(AS_CPU_PATH)/HGWeber/HGW_3StateIND.o \
	$(AS_CPU_PATH)/HGWeber/HGW_4StateIND.o \
	$(AS_CPU_PATH)/HGWeber/HGW_Toggle.o \
	$(AS_CPU_PATH)/HGWeber/HGW_2StepMove.o \
	$(AS_CPU_PATH)/HGWeber/HGW_3StateIND1.o \
	$(AS_CPU_PATH)/HGWeber/HGW_ScaleReal.o \
	$(AS_CPU_PATH)/HGWeber/HGW_ChangeReal.o \
	$(AS_CPU_PATH)/HGWeber/HGW_RelativeChangeReal.o \
	$(AS_CPU_PATH)/HGWeber/HGW_Average.o \
	$(AS_CPU_PATH)/HGWeber/HGW_RegCorrectABS.o \
	$(AS_CPU_PATH)/HGWeber/HGW_KeyRepeat.o \
	$(AS_CPU_PATH)/HGWeber/H_FC_Modulus_V0.o \
	$(AS_CPU_PATH)/HGWeber/HGW_2StepMove1.o \
	$(AS_CPU_PATH)/HGWeber/H_FB_2StepMove.o \
	$(AS_CPU_PATH)/HGWeber/H_FB_ToggleTB.o \
	$(AS_CPU_PATH)/HGWeber/H_FB_Flash.o \
	$(AS_CPU_PATH)/HGWeber/H_FB_WatchSensor.o \
	$(AS_CPU_PATH)/HGWeber/H_FB_RelativeChangeLimitReal.o \
	$(AS_CPU_PATH)/HGWeber/H_FB_RelativeChangeLimitReal1.o \
	$(AS_CPU_PATH)/HGWeber/H_FC_Modulus.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link  -O "$(AS_CPU_PATH)/HGWeber/HGWeber.out.opt" -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/HGWeber.xref: \
	$(AS_CPU_PATH)/HGWeber/HGW_2StatePB.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_3StatePB.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_4StatePB.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_2StateIND.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_2StateIND1.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_3StateIND.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_4StateIND.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_Toggle.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_2StepMove.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_3StateIND1.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_ScaleReal.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_ChangeReal.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_RelativeChangeReal.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_Average.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_RegCorrectABS.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_KeyRepeat.xrefo \
	$(AS_CPU_PATH)/HGWeber/H_FC_Modulus_V0.xrefo \
	$(AS_CPU_PATH)/HGWeber/HGW_2StepMove1.xrefo \
	$(AS_CPU_PATH)/HGWeber/H_FB_2StepMove.xrefo \
	$(AS_CPU_PATH)/HGWeber/H_FB_ToggleTB.xrefo \
	$(AS_CPU_PATH)/HGWeber/H_FB_Flash.xrefo \
	$(AS_CPU_PATH)/HGWeber/H_FB_WatchSensor.xrefo \
	$(AS_CPU_PATH)/HGWeber/H_FB_RelativeChangeLimitReal.xrefo \
	$(AS_CPU_PATH)/HGWeber/H_FB_RelativeChangeLimitReal1.xrefo \
	$(AS_CPU_PATH)/HGWeber/H_FC_Modulus.xrefo
	@"$(AS_BIN_PATH)/BR.AS.IECCrossRefLinker.exe"  "$(AS_CPU_PATH)/HGWeber/HGW_2StatePB.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_3StatePB.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_4StatePB.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_2StateIND.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_2StateIND1.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_3StateIND.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_4StateIND.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_Toggle.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_2StepMove.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_3StateIND1.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_ScaleReal.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_ChangeReal.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_RelativeChangeReal.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_Average.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_RegCorrectABS.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_KeyRepeat.xrefo" "$(AS_CPU_PATH)/HGWeber/H_FC_Modulus_V0.xrefo" "$(AS_CPU_PATH)/HGWeber/HGW_2StepMove1.xrefo" "$(AS_CPU_PATH)/HGWeber/H_FB_2StepMove.xrefo" "$(AS_CPU_PATH)/HGWeber/H_FB_ToggleTB.xrefo" "$(AS_CPU_PATH)/HGWeber/H_FB_Flash.xrefo" "$(AS_CPU_PATH)/HGWeber/H_FB_WatchSensor.xrefo" "$(AS_CPU_PATH)/HGWeber/H_FB_RelativeChangeLimitReal.xrefo" "$(AS_CPU_PATH)/HGWeber/H_FB_RelativeChangeLimitReal1.xrefo" "$(AS_CPU_PATH)/HGWeber/H_FC_Modulus.xrefo" -o "$(AS_CPU_PATH)/HGWeber.xref"

$(AS_CPU_PATH)/HGWeber/HGW_2StatePB.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_2StatePB.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_2StatePB.st" -o "$(AS_CPU_PATH)/HGWeber/HGW_2StatePB.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_2StatePB.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_3StatePB.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_3StatePB.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_3StatePB.st" -o "$(AS_CPU_PATH)/HGWeber/HGW_3StatePB.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_3StatePB.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_4StatePB.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_4StatePB.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_4StatePB.st" -o "$(AS_CPU_PATH)/HGWeber/HGW_4StatePB.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_4StatePB.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_2StateIND.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_2StateIND.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_2StateIND.st" -o "$(AS_CPU_PATH)/HGWeber/HGW_2StateIND.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_2StateIND.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_2StateIND1.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_2StateIND1.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_2StateIND1.st" -o "$(AS_CPU_PATH)/HGWeber/HGW_2StateIND1.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_2StateIND1.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_3StateIND.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_3StateIND.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_3StateIND.st" -o "$(AS_CPU_PATH)/HGWeber/HGW_3StateIND.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_3StateIND.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_4StateIND.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_4StateIND.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_4StateIND.st" -o "$(AS_CPU_PATH)/HGWeber/HGW_4StateIND.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_4StateIND.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_Toggle.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_Toggle.ld \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_Toggle.ld" -o "$(AS_CPU_PATH)/HGWeber/HGW_Toggle.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_Toggle.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_2StepMove.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_2StepMove.ld \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_2StepMove.ld" -o "$(AS_CPU_PATH)/HGWeber/HGW_2StepMove.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_2StepMove.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_3StateIND1.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_3StateIND1.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_3StateIND1.st" -o "$(AS_CPU_PATH)/HGWeber/HGW_3StateIND1.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_3StateIND1.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_ScaleReal.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_ScaleReal.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_ScaleReal.st" -o "$(AS_CPU_PATH)/HGWeber/HGW_ScaleReal.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_ScaleReal.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_ChangeReal.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_ChangeReal.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_ChangeReal.st" -o "$(AS_CPU_PATH)/HGWeber/HGW_ChangeReal.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_ChangeReal.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_RelativeChangeReal.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_RelativeChangeReal.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_RelativeChangeReal.st" -o "$(AS_CPU_PATH)/HGWeber/HGW_RelativeChangeReal.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_RelativeChangeReal.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_Average.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_Average.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_Average.st" -o "$(AS_CPU_PATH)/HGWeber/HGW_Average.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_Average.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_RegCorrectABS.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_RegCorrectABS.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_RegCorrectABS.st" -o "$(AS_CPU_PATH)/HGWeber/HGW_RegCorrectABS.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_RegCorrectABS.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_KeyRepeat.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_KeyRepeat.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_KeyRepeat.st" -o "$(AS_CPU_PATH)/HGWeber/HGW_KeyRepeat.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_KeyRepeat.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/H_FC_Modulus_V0.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FC_Modulus_V0.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FC_Modulus_V0.st" -o "$(AS_CPU_PATH)/HGWeber/H_FC_Modulus_V0.o"  -O "$(AS_CPU_PATH)/HGWeber/H_FC_Modulus_V0.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/HGW_2StepMove1.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_2StepMove1.ld \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGW_2StepMove1.ld" -o "$(AS_CPU_PATH)/HGWeber/HGW_2StepMove1.o"  -O "$(AS_CPU_PATH)/HGWeber/HGW_2StepMove1.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/H_FB_2StepMove.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FB_2StepMove.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FB_2StepMove.st" -o "$(AS_CPU_PATH)/HGWeber/H_FB_2StepMove.o"  -O "$(AS_CPU_PATH)/HGWeber/H_FB_2StepMove.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/H_FB_ToggleTB.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FB_ToggleTB.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FB_ToggleTB.st" -o "$(AS_CPU_PATH)/HGWeber/H_FB_ToggleTB.o"  -O "$(AS_CPU_PATH)/HGWeber/H_FB_ToggleTB.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/H_FB_Flash.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FB_Flash.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FB_Flash.st" -o "$(AS_CPU_PATH)/HGWeber/H_FB_Flash.o"  -O "$(AS_CPU_PATH)/HGWeber/H_FB_Flash.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/H_FB_WatchSensor.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FB_WatchSensor.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FB_WatchSensor.st" -o "$(AS_CPU_PATH)/HGWeber/H_FB_WatchSensor.o"  -O "$(AS_CPU_PATH)/HGWeber/H_FB_WatchSensor.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/H_FB_RelativeChangeLimitReal.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FB_RelativeChangeLimitReal.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FB_RelativeChangeLimitReal.st" -o "$(AS_CPU_PATH)/HGWeber/H_FB_RelativeChangeLimitReal.o"  -O "$(AS_CPU_PATH)/HGWeber/H_FB_RelativeChangeLimitReal.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/H_FB_RelativeChangeLimitReal1.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FB_RelativeChangeLimitReal1.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FB_RelativeChangeLimitReal1.st" -o "$(AS_CPU_PATH)/HGWeber/H_FB_RelativeChangeLimitReal1.o"  -O "$(AS_CPU_PATH)/HGWeber/H_FB_RelativeChangeLimitReal1.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/HGWeber/H_FC_Modulus.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FC_Modulus.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/HGWeber.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/HGWeber/H_FC_Modulus.st" -o "$(AS_CPU_PATH)/HGWeber/H_FC_Modulus.o"  -O "$(AS_CPU_PATH)/HGWeber/H_FC_Modulus.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

