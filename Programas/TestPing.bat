@echo off
setlocal
:menu
cls
echo.
echo   ------------===========================-----------
echo   '                                                '
echo   '        1) PING EQUIPO ANTENA                   '
echo   '                                                '
echo   '        2) PING EQUIPO FURUKAWA                 '
echo   '                                                '
echo   '        3) PING EQUIPO UBIQUITI                 '
echo   '                                                '
echo   '        4) PING IP RANDOM                       '
echo   '                                                '
echo   '   ------------===========================-----------'
echo.
set /p aux="INGRESE OPCION PARA HACER PING [1-4]: "

if "%aux%"=="1" (
    cls
    ping -t 192.168.1.20
    pause
    goto :menu
)

if "%aux%"=="2" (
    cls
    ping -t 192.168.100.1
    pause
    goto :menu
)

if "%aux%"=="3" (
    cls
    ping -t 192.168.88.1
    pause
    goto :menu
)


if "%aux%"=="4" (
    set /p ip="INGRESE IP: "
    cls
    ping %ip% -t
    pause
    goto :menu
)


echo INGRESO UNA OPCION NO VALIDA, PRESIONE ENTER PARA REINGRESAR UNA OPCION
pause >nul
goto :menu



 