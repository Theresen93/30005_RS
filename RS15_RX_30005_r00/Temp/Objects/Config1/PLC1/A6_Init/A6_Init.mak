UnmarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/BagMachine_Section/ExitPull/Axis6/A6_Init
MarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/BagMachine_Section/ExitPull/Axis6/A6_Init

$(AS_CPU_PATH)/A6_Init.br: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/ExitPull/Axis6/A6_Init/A6_Init.ax
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/ExitPull/Axis6/A6_Init/A6_Init.ax" -o "$(AS_CPU_PATH)/A6_Init.br" -T SG4  -v V1.00.0 -s BagMachine_Section.ExitPull.Axis6.A6_Init -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, NcGlobal: V3.18.2" -warmRestart -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

