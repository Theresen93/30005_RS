UnmarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/Error_Eng
MarkedObjectFolder := C:/Job_Files/Holweg/CompleteBackup_RS15_RX_30005_r0_130220/Logical/Error_Eng

$(AS_CPU_PATH)/Error_Eng.br: \
	$(AS_PROJECT_PATH)/Logical/Error_Eng/Error_Eng.ett
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/Error_Eng/Error_Eng.ett" -o "$(AS_CPU_PATH)/Error_Eng.br" -T SG4  -v V1.00.0 -s Error_Eng -L "Acp10_MC: V2.24.0, Acp10man: V2.24.0, Acp10par: V2.24.0, NcGlobal: V0.60.3" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

