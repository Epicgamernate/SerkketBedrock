#NoEnv
; #Warn
#SingleInstance Force
SendMode Input
SetWorkingDir %A_ScriptDir%
; JANITOR (Used for autoupdate)
; Use for ur own programs at will
; Start
FileDelete, %A_ScriptDir%\BedrockSerkket.exe ; Delete old version of software
Progdwnld: ; Label, in case of download fail
UrlDownloadToFile, https://github.com/Epicgamernate/SerkketBedrock/releases/latest/download/BedrockSerkket.exe, BedrockSerkket.exe ; Download new version of software
; Check if download failed, if it did, redownload
if !FileExist("BedrockSerkket.exe") { 
Goto, Progdwnld
}
; End of check
Run, BedrockSerkket.exe ; Open new version of program
ExitApp, 0 ; Exit
