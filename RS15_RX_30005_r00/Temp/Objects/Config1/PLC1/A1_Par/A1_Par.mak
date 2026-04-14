UnmarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/BagMachine_Section/Perf/Axis1/A1_Par
MarkedObjectFolder := B:/Holweg/RX_Systems_RS15_30005/AS_3090/Rev_1/RS15_RX_30005_r1/Logical/BagMachine_Section/Perf/Axis1/A1_Par

$(AS_CPU_PATH)/A1_Par.br: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Perf/Axis1/A1_Par/A1_Par.apt
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Perf/Axis1/A1_Par/A1_Par.apt" -o "$(AS_CPU_PATH)/A1_Par.br" -T SG4  -v V1.00.0 -s BagMachine_Section.Perf.Axis1.A1_Par -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, NcGlobal: V3.18.2" -warmRestart -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

