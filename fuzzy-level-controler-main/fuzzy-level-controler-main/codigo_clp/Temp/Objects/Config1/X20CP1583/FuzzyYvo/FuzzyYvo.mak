UnmarkedObjectFolder := C:/projects/ProjetoPadraoSegunda/Logical/FuzzyYvo
MarkedObjectFolder := C:/projects/ProjetoPadraoSegunda/Logical/FuzzyYvo

$(AS_CPU_PATH)/FuzzyYvo.br: \
	$(AS_PROJECT_CPU_PATH)/Cpu.per \
	$(AS_CPU_PATH)/FuzzyYvo/FuzzyYvo.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/FuzzyYvo/FuzzyYvo.ox" -o "$(AS_CPU_PATH)/FuzzyYvo.br" -v V1.00.0 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B G4.09 -extConstants -d "runtime: V* - V*,asieccon: V* - V*" -r Cyclic4 -p 2 -s "FuzzyYvo" -L "AsIecCon: V*, AsTime: V*, brsystem: V*, LoopConR: V4.10.0, Operator: V*, Runtime: V*, standard: V*, sys_lib: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/FuzzyYvo/FuzzyYvo.ox: \
	$(AS_CPU_PATH)/FuzzyYvo/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/FuzzyYvo/a.out" -o "$(AS_CPU_PATH)/FuzzyYvo/FuzzyYvo.ox" -T SG4 -r Cyclic4   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/FuzzyYvo/a.out: \
	$(AS_CPU_PATH)/FuzzyYvo/FuzzyYvoCyclic.st.o \
	$(AS_CPU_PATH)/FuzzyYvo/FuzzyYvoInit.st.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link "$(AS_CPU_PATH)/FuzzyYvo/FuzzyYvoCyclic.st.o" "$(AS_CPU_PATH)/FuzzyYvo/FuzzyYvoInit.st.o"  -o "$(AS_CPU_PATH)/FuzzyYvo/a.out"  -G V4.1.2  -T SG4  -M IA32  "-Wl,$(AS_PROJECT_PATH)/Logical/Libraries/LoopConR/SG4/libLoopConR.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libstandard.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libbrsystem.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libsys_lib.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libAsIecCon.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libAsTime.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libRuntime.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libOperator.a" -specs=I386specs -Wl,-q,-T,bur_elf_i386.x -nostdlib -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/FuzzyYvo/FuzzyYvoCyclic.st.o: \
	$(AS_PROJECT_PATH)/Logical/FuzzyYvo/FuzzyYvoCyclic.st \
	FORCE 
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/FuzzyYvo/FuzzyYvoCyclic.st" -o "$(AS_CPU_PATH)/FuzzyYvo/FuzzyYvoCyclic.st.o"  -O "$(AS_CPU_PATH)//FuzzyYvo/FuzzyYvoCyclic.st.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/FuzzyYvo/FuzzyYvoInit.st.o: \
	$(AS_PROJECT_PATH)/Logical/FuzzyYvo/FuzzyYvoInit.st \
	FORCE 
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/FuzzyYvo/FuzzyYvoInit.st" -o "$(AS_CPU_PATH)/FuzzyYvo/FuzzyYvoInit.st.o"  -O "$(AS_CPU_PATH)//FuzzyYvo/FuzzyYvoInit.st.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 



FORCE: