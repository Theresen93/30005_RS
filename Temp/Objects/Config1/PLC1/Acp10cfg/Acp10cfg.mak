$(AS_CPU_PATH)/Acp10cfg.br: \
	$(AS_PROJECT_PATH)/physical/$(AS_CONFIGURATION)/$(AS_PLC)/motion/acp10cfg.ncc \
	$(AS_PROJECT_PATH)/physical/$(AS_CONFIGURATION)/$(AS_PLC)/motion/acp10cfg.ncc \
	$(AS_PROJECT_PATH)/physical/$(AS_CONFIGURATION)/$(AS_PLC)/motion/acp10cfg.apc \
	$(AS_PROJECT_PATH)/physical/$(AS_CONFIGURATION)/$(AS_PLC)/motion/acp10map.ncm
	@"$(AS_BIN_PATH)/BR.MC.Builder.exe" "$(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)/$(AS_PLC)/Motion/Acp10cfg.ncc"  -a "$(AS_ACTIVE_CONFIG_PATH)/Motion/acp10cfg.apc" -m "$(AS_ACTIVE_CONFIG_PATH)/Motion/Acp10map.ncm" -L "Acp10_MC: V2.24.0, Acp10man: V2.24.0, Acp10par: V2.24.0, NcGlobal: V0.60.3" -P "$(AS_PROJECT_PATH)/" -o "$(AS_CPU_PATH)/Acp10cfg.br" -T SG4  -s PLC1.Motion -secret "$(AS_PROJECT_PATH)_br.mc.builder.exe"

-include $(AS_CPU_PATH)/Force.mak 
