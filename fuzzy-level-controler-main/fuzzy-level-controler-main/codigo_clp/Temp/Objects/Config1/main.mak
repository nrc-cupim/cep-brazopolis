SHELL = cmd.exe
CYGWIN=nontsec
export PATH := C:\Program Files (x86)\Common Files\Oracle\Java\javapath;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\Program Files\Microsoft VS Code\bin;C:\Program Files (x86)\Leucotron Telecom\Contactboard\lib;C:\Program Files\dotnet\;C:\Users\miguel.abdala\AppData\Local\Microsoft\WindowsApps;C:\Users\miguel.abdala\AppData\Local\Programs\Git\cmd;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\miguel.abdala\AppData\Local\Microsoft\WindowsApps;C:\Users\miguel.abdala\AppData\Local\Programs\Git\cmd;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode
export AS_BUILD_MODE := BuildAndTransfer
export AS_VERSION := 4.1.14.40 SP
export AS_COMPANY_NAME :=  
export AS_USER_NAME := miguel.abdala
export AS_PATH := C:/BrAutomation/AS41
export AS_BIN_PATH := C:/BrAutomation/AS41/Bin-en
export AS_PROJECT_PATH := C:/Users/miguel.abdala/Downloads/fuzzy-level-controler-main/fuzzy-level-controler-main/codigo_clp
export AS_PROJECT_NAME := ProjetoPadraoSegunda
export AS_SYSTEM_PATH := C:/BrAutomation/AS/System
export AS_VC_PATH := C:/BrAutomation/AS41/AS/VC
export AS_TEMP_PATH := C:/Users/miguel.abdala/Downloads/fuzzy-level-controler-main/fuzzy-level-controler-main/codigo_clp/Temp
export AS_CONFIGURATION := Config1
export AS_BINARIES_PATH := C:/Users/miguel.abdala/Downloads/fuzzy-level-controler-main/fuzzy-level-controler-main/codigo_clp/Binaries
export AS_GNU_INST_PATH := C:/BrAutomation/AS41/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH := $(AS_GNU_INST_PATH)/bin
export AS_GNU_INST_PATH_SUB_MAKE := C:/BrAutomation/AS41/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH_SUB_MAKE := $(AS_GNU_INST_PATH_SUB_MAKE)/bin
export AS_INSTALL_PATH := C:/BrAutomation/AS41
export WIN32_AS_PATH := C:\\BrAutomation\\AS41
export WIN32_AS_BIN_PATH := C:\\BrAutomation\\AS41\\Bin-en
export WIN32_AS_PROJECT_PATH := C:\\Users\\miguel.abdala\\Downloads\\fuzzy-level-controler-main\\fuzzy-level-controler-main\\codigo_clp
export WIN32_AS_SYSTEM_PATH := C:\\BrAutomation\\AS\\System
export WIN32_AS_VC_PATH := C:\\BrAutomation\\AS41\\AS\\VC
export WIN32_AS_TEMP_PATH := C:\\Users\\miguel.abdala\\Downloads\\fuzzy-level-controler-main\\fuzzy-level-controler-main\\codigo_clp\\Temp
export WIN32_AS_BINARIES_PATH := C:\\Users\\miguel.abdala\\Downloads\\fuzzy-level-controler-main\\fuzzy-level-controler-main\\codigo_clp\\Binaries
export WIN32_AS_GNU_INST_PATH := C:\\BrAutomation\\AS41\\AS\\GnuInst\\V4.1.2
export WIN32_AS_GNU_BIN_PATH := $(WIN32_AS_GNU_INST_PATH)\\bin
export WIN32_AS_INSTALL_PATH := C:\\BrAutomation\\AS41

.suffixes:

ProjectMakeFile:

	@"$(AS_BIN_PATH)/BR.AS.AnalyseProject.exe" "$(AS_PROJECT_PATH)/ProjetoPadraoSegunda.apj" -t "$(AS_TEMP_PATH)" -c "$(AS_CONFIGURATION)" -o "$(AS_BINARIES_PATH)"   -sfas -buildMode "BuildAndTransfer" 

	@$(AS_GNU_BIN_PATH)/mingw32-make.exe -r -f 'C:/Users/miguel.abdala/Downloads/fuzzy-level-controler-main/fuzzy-level-controler-main/codigo_clp/Temp/Objects/$(AS_CONFIGURATION)/X20CP1583/#cpu.mak' -k 

