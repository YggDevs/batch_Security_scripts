echo off

rem NetworkStatus
rem by Yeray [ YGGDEV ]
rem 31.10.18 


:init
cls
echo " __          ___  __ _        _  __          ";
echo " \ \        / (_)/ _(_)      | |/ /          ";
echo "  \ \  /\  / / _| |_ _ ______| ' / ___ _   _ ";
echo "   \ \/  \/ / | |  _| |______|  < / _ \ | | |";
echo "    \  /\  /  | | | | |      | . \  __/ |_| |";
echo "     \/  \/   |_|_| |_|      |_|\_\___|\__, |";
echo "                                        __/ |";
echo "                                       |___/ "; 
color A
netsh wlan show profile
echo -------------------- 
echo Introduce nombre red 
   
set /p namep=

netsh wlan show profile name=%namep% key=clear 

echo pulsa F para salir o C para continuar
set /p salir=
IF [%salir%] == [f] goto:salir
IF [%salir%] == [c] goto:init 


:salir
    @cls&exit 