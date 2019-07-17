SET PATH=C:\Keil_v5\ARM\ARMCC\Bin;C:\Program Files (x86)\Common Files\Oracle\Java\javapath;C:\ProgramData\Oracle\Java\javapath;C:\Program Files (x86)\Razer Chroma SDK\bin;C:\Program Files\Razer Chroma SDK\bin;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files (x86)\Common Files\Autodesk Shared\;C:\Program Files\MiKTeX 2.9\miktex\bin\x64\;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;"C:\Program Files (x86)\CodeBlocks\MinGW\allegro5\bin";C:\Program Files (x86)\Skype\Phone\;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\Toshiba\Bluetooth Toshiba Stack\sys\;C:\Program Files (x86)\Toshiba\Bluetooth Toshiba Stack\sys\x64\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files\Git\cmd;C:\Users\Lucca\AppData\Local\Microsoft\WindowsApps;C:\Users\Lucca\AppData\Local\atom\bin;C:\Users\Lucca\AppData\Local\Microsoft\WindowsApps;C:\Program Files\CMake\bin;
SET ARMCC5_ASMOPT=--diag_suppress=9931
SET ARMCC5_CCOPT=--diag_suppress=9931
SET ARMCC5_LINKOPT=--diag_suppress=9931
SET CPU_TYPE=TM4C1294NCPDT
SET CPU_VENDOR=Texas Instruments
SET UV2_TARGET=TM4C129 Flash
SET CPU_CLOCK=0x07270E00
"C:\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\flash\controle.__i"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\flash\rtx_conf_cm.__i"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmAsm" --Via ".\flash\startup_tm4c129._ia"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmCC" --Via ".\flash\system_tm4c129.__i"
"C:\Keil_v5\ARM\ARMCC\Bin\ArmLink" --Via ".\Flash\base_project.lnp"
