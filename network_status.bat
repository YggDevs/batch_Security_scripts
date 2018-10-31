@echo off

rem NetworkStatus
rem by Yeray [ YGGDEV ]
rem 31.10.18 


:inicio
SET var=0
cls
color 2
echo ------------------------------------------------------------------------------
echo "  _   _      _                      _     _____ _        _             ";
echo " | \ | |    | |                    | |   / ____| |      | |            ";
echo " |  \| | ___| |___      _____  _ __| | _| (___ | |_ __ _| |_ _   _ ___ ";
echo " | . \` |/ _ \ __\ \ /\ / / _ \| '__| |/ /\___ \| __/ _\` | __| | | / __|";
echo " | |\  |  __/ |_ \ V  V / (_) | |  |   < ____) | || (_| | |_| |_| \__ \";
echo " |_| \_|\___|\__| \_/\_/ \___/|_|  |_|\_\_____/ \__\__,_|\__|\__,_|___/";
echo "                                                                       ";
echo "                                                                       ";                                                                       
echo ------------------------------------------------------------------------------
echo  1    Puertos Biertos  
echo  2    Aplicaciones Conectadas a sitio remoto  
echo  3    Ver PID de las conexiones
echo  4    Killer(Matar proceso por PID)
echo  5    Aplicaciones ejecutándose en el equipo
echo  6    Reparar archivos del sistema corruptos
echo  7    Crear regla para Abrir puertos
echo  8    Crear regla para Cerrar puertos
echo  9    Borrar regala

echo  10    Salir
echo ------------------------------------------------------------------------------
echo.

SET /p var= ^> Seleccione una opcion [1-10]:

if "%var%"=="0" goto inicio
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto op3
if "%var%"=="4" goto op4
if "%var%"=="5" goto op5
if "%var%"=="6" goto op6
if "%var%"=="7" goto op7
if "%var%"=="8" goto op8
if "%var%"=="9" goto op9
if "%var%"=="10" goto salir

::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. El numero "%var%" no es una opcion valida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio

:op1
    echo.
    echo. Has elegido la opcion No. 1
    echo.
        NETSTAT -ANO|FINDSTR /C:LISTENING
         color 2
    echo.
    pause
    goto:inicio

:op2
    echo.
    echo. Has elegido la opcion No. 2
    echo.
        NETSTAT -BO 10
         color 2
    echo.
    pause
    goto:inicio

:op3
    echo.
    echo. Has elegido la opcion No. 3
    echo.
        netstat -oan
         color 2
    echo.
    pause
    goto:inicio
  
:op4
    echo.
    echo. Has elegido la opcion No. 4
    echo.
       SET/P ID=Escribe el PID del proceso a detener y oprime ENTER
TASKKILL /F /PID %ID%
        color 2
    echo.
    pause
    goto:inicio


:op5
    echo.
    echo. Has elegido la opcion No. 5 
    TASKLIST /V /FI "STATUS eq running"

        color 2
    echo.
    pause
    goto:inicio
 

:op6
    echo.
    echo. Has elegido la opcion No. 6 
 	SFC /SCANNOW 

        color 2
    echo.
    pause
    goto:inicio

:op7
    echo.
    echo. Has elegido la opcion No. 7 
 
 
echo ----------------------------------------------------------------------
echo Introduce un nombre para abrir el puero 
echo ---------------------------------------------------------------------  
set /p name=

echo ----------------------------------------------------------------------
echo Introduce el puerto que quieres abrir
echo ----------------------------------------------------------------------
set /p port=

echo El nombre de la regla a a ser : [  %name%   ]  y el puerto que se va a abrir es :[  %port%  ] ?
set /p answer=  Teclea s= si  n= no   
IF [%answer%] == [s]  netsh advfirewall firewall add rule name=%name% dir=in action=allow protocol=TCP localport=%port% 
IF [%answer%] == [n] goto:inicio 

       color 2
    echo.
    pause
    goto:inicio

:op8
    echo.
    echo. Has elegido la opcion No. 7 

cls  
echo ----------------------------------------------------------------------  
echo Introduce un nombre para cerrar el puero 
echo ----------------------------------------------------------------------  
set /p name=

echo ----------------------------------------------------------------------
echo Introduce el puerto que quieres cerrar
echo ---------------------------------------------------------------------- 
set /p port=

echo El nombre de la regla a a ser : [  %name%   ]  y el puerto que se va a cerrar es :[  %port%  ]
set /p answer=  Teclea s= SI  n= NO?  
IF [%answer%] == [s]  netsh advfirewall firewall add rule dir=in action=block protocol=TCP localport=%port% name=%name%
IF [%answer%] == [n] goto:inicio  


       color 2
    echo.
    pause
    goto:inicio



:op9
    echo.
    echo. Has elegido la opcion No. 7 

cls  
echo ----------------------------------------------------------------------  
echo Introduce un nombre regla a borrar
echo ----------------------------------------------------------------------  
set /p name=

echo ----------------------------------------------------------------------
echo Introduce el puerto que quieres cerrar
echo ---------------------------------------------------------------------- 
set /p port=

echo El nombre de la regla que se va a borar : [  %name%   ]  y el puerto que se va a cerrar es :[  %port%  ]
set /p answer=  Teclea s= SI  n= NO?  
IF [%answer%] == [s] netsh advfirewall firewall  delete rule name=%name% dir=in action=allow protocol=TCP localport=%port% 
IF [%answer%] == [n] goto:inicio  


       color 2
    echo.
    pause
    goto:inicio





:salir
    @cls&exit 






