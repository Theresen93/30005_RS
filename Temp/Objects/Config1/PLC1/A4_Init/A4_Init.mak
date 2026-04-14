UnmarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/BagMachine_Section/Tearing/Axis4/A4_Init
MarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/BagMachine_Section/Tearing/Axis4/A4_Init

$(AS_CPU_PATH)/A4_Init.br: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Tearing/Axis4/A4_Init/A4_Init.ax
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Tearing/Axis4/A4_Init/A4_Init.ax" -o "$(AS_CPU_PATH)/A4_Init.br" -T SG4  -v V1.00.0 -s BagMachine_Section.Tearing.Axis4.A4_Init -L "Acp10_MC: V2.24.0, Acp10man: V2.24.0, Acp10par: V2.24.0, NcGlobal: V0.60.3" -warmRestart -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

