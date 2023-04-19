@echo off

rem Asegúrese de reemplazar "Adaptador de red" con el nombre correcto de su adaptador de red en la línea 17. 
rem Puede verificar el nombre de su adaptador de red en el Panel de control, en "Red e Internet".

echo Reparando problemas de conexión a Internet
echo.

echo Reiniciando el servicio de Adaptador de red
net stop wuauserv
net start wuauserv

echo Reiniciando el servicio de TCP/IP
netsh int ip reset
netsh winsock reset

echo Reiniciando el servicio DHCP
net stop dhcp
net start dhcp

echo Deshabilitando y habilitando la conexión de red
netsh interface set interface MOVISTAR_PLUS_E940 admin=disable
netsh interface set interface MOVISTAR_PLUS_E940 admin=enable

echo Verificando la conexión a Internet
ping -n 4 google.com

echo.
echo Reparación terminada
pause