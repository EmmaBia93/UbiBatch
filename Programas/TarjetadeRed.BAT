@echo off

:menu
cls 
echo.
echo  		------------===========================-----------
echo   		'                                                '
echo   		'        1) FIJAR TARJETA DE RED                 '
echo            	'                                                '
echo   		'	 2) DESMARCAR TARJETA DE RED             '
echo           	'                                                '
echo   		'	 3) VOLVER AL MENU PRINCIPAL             '
echo   		'                                                '
echo   		------------===========================-----------
echo.

set /p aux="Ingrese la opcion correspondiendente: "

if %aux%==1 call :fijar
if %aux%==2 call :fuera
if %aux%==3 call ( C:\Nueva\Programas\CiudadInternet.bat
exit /b 0
)
if %aux% gtr 2 ( 
echo Ingreso una opcion no valida, presione ENTER para continuar
pause>NUL 
call :menu)


:fijar
netsh interface ip set address "Ether0" static 192.168.1.153 255.255.255.0
echo SE HA FIJADO LA TARJETA CORRECTAMENTE, PRESIONE ENTER VOLVER AL MENU PRINCIPAL
pause>NUL
goto :menu

:fuera
netsh interface ip set address "Ether0" dhcp

echo SE HA DESMARCADO LA TARJETA CORRECTAMENTE, PRESIONE ENTER VOLVER AL MENU PRINCIPAL
pause>NUL
goto :menu
