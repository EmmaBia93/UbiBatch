@echo off
title Ciudad Internet Fibra
color 9
mode 130,50

:menu
cls
echo +-----------------------------------------------------+
echo ^|                     MENU                           ^|
echo +-----------------------------------------------------+
echo ^| 1) Cargar Backup y Compliance                       ^|
echo ^| 2) Ping                                              ^|
echo ^| 3) Fijar/Desmarcar Tarjeta de red                   ^|
echo ^| 4) Abrir Pagina                                      ^|
echo ^| 5) Backup Antena Andando                             ^|
echo ^| 6) Solo Compliance                                  ^|
echo +-----------------------------------------------------+

echo.
set /p op="INGRESE UNA OPCION [1-6]: "

if "%op%"=="1" (
    call C:\Nueva\Programas\backup.bat
    goto :menu
)

if "%op%"=="2" (
    call C:\Nueva\Programas\TestPing.bat
    goto :menu
)

if "%op%"=="3" (
    call C:\Nueva\Programas\TarjetadeRed.bat
    goto :menu
)

if "%op%"=="4" (
    start chrome.exe http://192.168.1.20:83
    goto :menu
)

if "%op%"=="5" (
    call C:\Nueva\Programas\PRUE.bat
    goto :menu
)

if "%op%"=="6" (
    call C:\Nueva\Programas\complicated.bat
    goto :menu
)

echo INGRESO UNA RESPUESTA NO VALIDA, PRESIONE ENTER PARA VOLVER A INGRESAR UN VALOR
pause >nul
goto :menu
