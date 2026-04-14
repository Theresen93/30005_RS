UnmarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/BagMachine_Section/Tearing/Axis4/A4_Par
MarkedObjectFolder := C:/Job_Files/Holweg/RX_Systems_RS15/RS15_RX_30005_r0_072215/Logical/BagMachine_Section/Tearing/Axis4/A4_Par

$(AS_CPU_PATH)/A4_Par.br: \
	$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Tearing/Axis4/A4_Par/A4_Par.apt
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe"   "$(AS_PROJECT_PATH)/Logical/BagMachine_Section/Tearing/Axis4/A4_Par/A4_Par.apt" -o "$(AS_CPU_PATH)/A4_Par.br" -T SG4  -v V1.00.0 -s BagMachine_Section.Tearing.Axis4.A4_Par -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, NcGlobal: V3.18.2" -warmRestart -P "$(AS_PROJECT_PATH)/" -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

