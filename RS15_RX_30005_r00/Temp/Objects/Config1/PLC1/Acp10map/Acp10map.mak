$(AS_CPU_PATH)/Acp10map.br: \
	$(AS_PROJECT_PATH)/physical/$(AS_CONFIGURATION)/$(AS_PLC)/motion/acp10map.ncm 
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe" "$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Motion/Acp10map.ncm"  -v V1.00.0 -L "Acp10_MC: V3.18.2, Acp10man: V3.18.2, Acp10par: V3.18.2, NcGlobal: V3.18.2" -P "$(AS_PROJECT_PATH)/" -o "$(AS_CPU_PATH)/Acp10map.br" -T SG4  -s PLC1.Motion -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

-include $(AS_CPU_PATH)/Force.mak 
