SET PATH=C:\Keil_v5\ARM\ARMCC\Bin;C:\Python27\;C:\Python27\Scripts;C:\windows\system32;C:\windows;C:\windows\System32\Wbem;C:\windows\System32\WindowsPowerShell\v1.0\;C:\windows\System32\OpenSSH\;C:\Program Files\Git\cmd;C:\Program Files\VSCodium\bin;C:\Program Files (x86)\IVI Foundation\VISA\WinNT\Bin\;C:\Program Files\IVI Foundation\VISA\Win64\Bin\;C:\Program Files (x86)\IVI Foundation\VISA\WinNT\Bin;C:\Program Files\Thorlabs\Scientific Imaging\DCx Camera Support\Develop\Lib;C:\Users\aaa\Documents\PyAPT-master\APTDLLPack\DLL\x86;C:\Users\aaa\AppData\Local\Microsoft\WindowsApps;;C:\altera\13.0sp1\modelsim_ase\win32aloem
SET CPU_TYPE=TM4C1294NCPDT
SET CPU_VENDOR=Texas Instruments
SET UV2_TARGET=TM4C129 Flash
SET CPU_CLOCK=0x07270E00
"C:\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\flash\exemplotiva.__i"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\flash\rtx_conf_cm.__i"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmAsm" --Via ".\flash\startup_tm4c129._ia"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\flash\system_tm4c129.__i"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmLink" --Via ".\Flash\base_project.lnp"
