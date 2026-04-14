UnmarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/BagMachine_Section/ExitPull/Axis6/A6_Par
MarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/BagMachine_Section/ExitPull/Axis6/A6_Par

$(AS_CPU_PATH)/A6_Par.br: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/ExitPull/Axis6/A6_Par/A6_Par.apt
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/ExitPull/Axis6/A6_Par/A6_Par.apt" -o "$(AS_CPU_PATH)/A6_Par.br" -T SG4  -v V1.00.0 -s BagMachine_Section.ExitPull.Axis6.A6_Par -L "Acp10_MC: V2.24.0, Acp10man: V2.24.0, Acp10par: V2.24.0, NcGlobal: V0.60.3" -warmRestart -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

