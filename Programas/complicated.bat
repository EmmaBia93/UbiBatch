@echo off
CLS
SET aux=0
:START
SET choice=
SET /p choice=SI LA ANTENA ESTA FORMATEADA UTILICE EL METODO "Cargar Backup y Compliance", DESEA CONTINUAR? [Y/N]: 
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

cls 
call :pruebaping 

if %aux%==1 ( echo SE HARA EL COMPLIANCE

timeout /t 20 /nobreak

start putty -ssh 192.168.1.20 23 -l ubnt -pw 628819872 -m C:\Nueva\Compliance.txt

timeout /t 10 /nobreak

start putty -ssh 192.168.1.20 23 -l ubnt -pw 628819872 -m C:\Nueva\Command.txt

timeout /t 15 /nobreak
cls
call :pruebaping 

if %aux%==1(echo Se ha hecho el compliance correctamente, Se abrira la pagina para que configure la antena

timeout /t 10 /nobreak
call :pruebaping

start chrome.exe http://192.168.1.20:83
echo PRESIONE ENTER PARA SALIR 
pause>NUL 
C:\Nueva\Programas\CiudadInternet.bat
exit /b 0


)

)


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