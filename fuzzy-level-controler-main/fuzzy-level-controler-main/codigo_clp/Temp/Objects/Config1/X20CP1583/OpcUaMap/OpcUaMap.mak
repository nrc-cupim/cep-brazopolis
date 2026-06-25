$(AS_CPU_PATH)/OpcUaMap.br: \
	FORCE
	@"$(AS_BIN_PATH)/BR.OPC.UA.Builder.exe"  "$(AS_PROJECT_CPU_PATH)/OpcUaMap.uad" -o "$(AS_CPU_PATH)/OpcUaMap.br" -B G4.09 -c Config1 -P "$(AS_PROJECT_PATH)"

FORCE: