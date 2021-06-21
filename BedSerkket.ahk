#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
if !FileExist("Servers") {
FileCreateDir, Servers
}
SetWorkingDir Servers
; It's pronounced "Circut" not "sEErket"
RunWait cmd.exe /c "dir /B /A:D>List.txt"
FileRead, List, List.txt
FileDelete, List.txt
InputBox, UserInput, Server, Please enter the name of a server you want to run `n Some available servers are: `n %List% `n You can also make a new one by typing its name, , 640, 480
if ErrorLevel
ExitApp 0
else
if !FileExist(%UserInput%) {
MsgBox, 0, Serkket Servers, Server will build files, press ok to continue
FileCreateDir, %UserInput%
}
SetWorkingDir %UserInput%
if !FileExist("bedrock_server.exe") {
UrlDownloadToFile, https://github.com/Epicgamernate/SerkketBedrock/releases/download/SDv1/Uzip.bat, Uzip.bat
UrlDownloadToFile, https://minecraft.azureedge.net/bin-win/bedrock-server-1.17.1.01.zip, Bedrock.zip
RunWait cmd.exe /c "call Uzip.bat Bedrock.zip"
}
if !FileExist("Tunnel.exe") {
UrlDownloadToFile, https://playit.gg/downloads/playit-win_64-0.4.3-rc2.exe, Tunnel.exe
}
if !FileExist("Run.bat") {
FileAppend,
(
@echo off
color 0A
title %UserInput% Server - ALPHA 5
cls
echo Starting %UserInput% Server...
start Tunnel.exe
bedrock_server.exe
color 04
echo Server stopped
pause>nul
taskkill /f /im Tunnel.exe
exit /B
), Run.Bat
}
Run, Run.Bat
