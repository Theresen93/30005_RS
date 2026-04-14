UnmarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/Error_Eng
MarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/Error_Eng

$(AS_CPU_PATH)/Error_Eng.br: \
	$(AS_PROJECT_PATH)/Logical/Error_Eng/Error_Eng.ett
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/Error_Eng/Error_Eng.ett" -o "$(AS_CPU_PATH)/Error_Eng.br" -T SG4  -v V1.00.0 -s Error_Eng -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, NcGlobal: V3.18.2" -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

