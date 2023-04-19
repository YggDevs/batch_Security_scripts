@echo off
COLOR 0E
mode con cols=50 lines=20
TITLE Bienvenid@ %USERNAME% 
MODE con:cols=80 lines=40

:inicio
SET var=0
cls
echo ------------------------------------------------------------------------------
echo  %DATE% ^| %TIME%
echo ------------------------------------------------------------------------------
echo  1    Caracteristicas de tu PC 
echo  2    Solucionar problemas de conexion
echo  3    Borrar,Cookies,historial,Password
echo  4    Cerrar los programas que no responden  
echo  5    comprueba rendimiento PC 
echo  6    Salir
echo ------------------------------------------------------------------------------
echo.

SET /p var= ^> Seleccione una opcion [1-6]:

if "%var%"=="0" goto inicio
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto op3
if "%var%"=="4" goto op4
if "%var%"=="5" goto op5
if "%var%"=="6" goto salir

::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. El numero "%var%" no es una opcion valida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio

:op1
    echo.
    echo. Se ha creado un archivo en el escritorio con los resultados
    echo.
        
    WMIC /Output:CARACTERISTICAS_PC.txt OS get /all /format:LIST
	
    echo.
	pause
    goto:inicio

:op2
    echo.
    echo. Reiniciando parametros de red
    echo.
	ipconfig /release
	ipconfig /renew
	arp -d *
	nbtstat -R
	nbtstat -RR
	ipconfig /flushdns
	ipconfig /registerdns
    NETSH WINSOCK RESET
	NETSH INTERFACE IPV4 RESET
    echo.
    pause
    goto:inicio

:op3
    echo.
    echo. Has elegido la opcion No. 3
    echo.
        ::Borra 
    START RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2
	START ipconfig /flushdns
    echo.
	echo.Cookies borradas
	START RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1
	echo.
	echo.Historial borrado
	START RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 32
	echo.
	echo.Contraseñas borradas
	START RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
	echo.
	echo.Borrando procesos
	START RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351
	echo.
	echo.Procesos borrados
    pause
    goto:inicio
  
:op4
    echo.
    echo. Has elegido la opcion No. 4
    echo.
        taskkill.exe /f /fi "status eq Not Responding"
    echo.
    pause
    goto:inicio

:op5
    echo.
    echo. Has elegido la opcion No. 5
    echo.
		perfmon.exe /res
    echo.
    pause
    goto:inicio

:salir
    @cls&exit 