@echo off
:menu
cls
echo 1) PARA ABRIR PAGINA DE ANTENA FORMATEADA
echo 2) PARA ABRIR PAGINA DE ANTENA NO FORMATEADA
set /p aux="Ingrese opcion [1-2] : "
if %aux%== 1 (start chrome.exe http://192.168.1.20)
if %aux%== 2 (start chrome.exe http://192.168.1.20:83)
if %aux% gtr 2 goto :menu

echo PRESIONE ENTER PARA SALIR 
pause>NUL 
exit /b