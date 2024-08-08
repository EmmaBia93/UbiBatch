@ECHO OFF
set aux=0
:start
cls
SET choice=
SET /p choice=ESTA OPCION ES PARA ATENAS NO FORMATEADAS, DESEA CONTINUAR? [Y/N]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='N' GOTO no
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO no
ECHO La opcion "%choice%" no es valida, presione enter para ingresar nuevamente a respuesta
ECHO.
pause>NUL

GOTO start

:no
cls
echo PRESIONE ENTER PARA VOLVER AL MENU PRINCIPAL
PAUSE>NUL
call C:\Nueva\Programas\CiudadInternet.bat
exit /b 0

:yes
ECHO SE CARGARA EL BACKUP...
call :pruebaping

if %aux%==1 ( echo CARGANDO BACKUP...
pscp -scp -P 23 -pw 628819872 C:\Nueva\back.cfg ubnt@192.168.1.20:/tmp/system.cfg
if %ERRORLEVEL% NEQ 0 ( echo.
call C:\Nueva\PRUE.bat
exit /b)
timeout /t 10 /nobreak
cls

start putty -ssh 192.168.1.20 23 -l ubnt -pw 628819872 -m C:\Nueva\Compliance.txt
timeout /t 15 /nobreak
start putty -ssh 192.168.1.20 23 -l ubnt -pw 628819872 -m C:\Nueva\Command.txt
timeout /t 10 /nobreak
call :pruebaping
if %aux%==1 (echo BACKUP CARGADO...
ECHO PRESIONE ENTER PARA VOLVER AL MENU PRINCIPAL
PAUSE>NUL
call C:\Nueva\Programas\CiudadInternet.bat )

)

pause>NUL



:pruebaping
set /a aux=0
ping -n 1 192.168.1.20 | find "TTL" >nul
if %errorlevel% NEQ 0 (
set /a flag+=1
echo ESPERANDO CONEXION CON ANTENA
timeout /t 30 /nobreak
goto :pruebaping
) else ( echo HAY PING

set /a flag=0
set /a aux=1
)