#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

Run, \RetroBat-TriggerHappy\tools\DemulShooter\DemulShooter.exe -target=es4 -rom=pblankx -nocrosshair
Run, .\PointBlankX\PBX100-2-NA-MPR0-A63.exe

Escape::
    Process,Close,PBX100-2-NA-MPR0-A63.exe
    Run,taskkill /im "PBX100-2-NA-MPR0-A63.exe" /F
	sleep, 1000
    Process,Close,DemulShooter.exe
    Run,taskkill /im "DemulShooter.exe" /F
    ExitApp
return