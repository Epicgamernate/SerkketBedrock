@echo off
call :unzip %~f1
exit
:unzip
powershell -command "Expand-Archive -Force '%1' '%~dp0'"