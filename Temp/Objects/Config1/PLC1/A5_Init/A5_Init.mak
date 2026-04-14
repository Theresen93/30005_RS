UnmarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/BagMachine_Section/EntryPull/Axis5/A5_Init
MarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/BagMachine_Section/EntryPull/Axis5/A5_Init

$(AS_CPU_PATH)/A5_Init.br: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/EntryPull/Axis5/A5_Init/A5_Init.ax
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/EntryPull/Axis5/A5_Init/A5_Init.ax" -o "$(AS_CPU_PATH)/A5_Init.br" -T SG4  -v V1.00.0 -s BagMachine_Section.EntryPull.Axis5.A5_Init -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, NcGlobal: V3.18.2" -warmRestart -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

