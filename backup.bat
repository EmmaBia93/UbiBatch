@echo off
set aux=0
set flag=0
netsh interface ip set address "Ether0" static 192.168.1.153 255.255.255.0
echo SE HA FIJADO LA TARJETA CORRECTAMENTE
timeout /t 10 /nobreak
call :pruebaping

if %aux%==1(ECHo Entro
cls

echo y | pscp -scp -pw ubnt C:\Nueva\back.cfg ubnt@192.168.1.20:/tmp/system.cfg

if %errorlevel% NEQ 0 ( echo.
call C:\Nueva\backup.bat
exit /b)
timeout /t 10 /nobreak
cls
start putty -ssh 192.168.1.20 22 -l ubnt -pw ubnt -m C:\Nueva\Command.txt
)

timeout /t 15 /nobreak
call :pruebaping 
cls
if %aux%==1 ( echo SE HARA EL COMPLIANCE

timeout /t 20 /nobreak

start putty -ssh 192.168.1.20 23 -l ubnt -pw 628819872 -m C:\Nueva\Compliance.txt

timeout /t 10 /nobreak

start putty -ssh 192.168.1.20 23 -l ubnt -pw 628819872 -m C:\Nueva\Command.txt

timeout /t 15 /nobreak
cls
call :pruebaping 

if %aux%==1(echo Se ha hecho el backup correctamente, Se abrira la pagina para que configure la antena

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