@echo off 
set flag
set aux
set /p aux=RECUERDE QUE ESTE BACKUP ES SOLO PARA ANTENAS ANDANDO (NO FORMATEADAS)!!!! QUIERE CONTINUAR? (S/N): 

if /I "%aux%"=="s" if /I "%aux%"=="S" (
cls
call :pruebaping
if %aux%==1( 
echo SE CARGARA EL BACKUP....
pscp -scp   -P 23 -pw 628819872 C:\Nueva\back.cfg ubnt@192.168.1.20:/tmp/system.cfg
if %errorlevel% NEQ 0 ( echo.
call C:\Nueva\Back.bat
exit /b)
timeout /t 10 /nobreak
cls
start putty -ssh 192.168.1.20 23 -l ubnt -pw 628819872 -m C:\Nueva\Command.txt
)

)
timeout /t 15 /nobreak
call :pruebaping 
cls
if %aux%==1 ( echo SE HARA EL COMPLIANCE

timeout /t 20 /nobreak

start putty -ssh 192.168.1.20 23 -l ubnt -pw 628819872 -m C:\Nueva\Compliance.txt

timeout /t 15 /nobreak
cls
call :pruebaping 

if %aux%==1( echo Se ha hecho el backup correctamente
echo.
echo PRESIONE ENTER PARA FINALIZAR EL PROGRAMA Y ABRIR LA PAGINA
pause>NUL
call C:\Nueva\Programas\CiudadInternet.bat
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