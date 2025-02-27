#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

Run, \RetroBat-TriggerHappy\tools\NoMousy\nomousy.exe /hide
Run, \RetroBat-TriggerHappy\roms\pc\The House Of The Dead Remake\The House of the Dead Remake.exe
sleep, 2000
Run, \RetroBat-TriggerHappy\tools\DemulShooter\DemulShooterX64.exe -target=windows -rom=hotdra

Escape::
    Run, \RetroBat-TriggerHappy\tools\NoMousy\nomousy.exe
    Process,Close,The House of the Dead Remake.exe
    Run,taskkill /im "The House of the Dead Remake.exe" /F
	sleep, 1000
    Process,Close,DemulShooterX64.exe
    Run,taskkill /im "DemulShooterX64.exe" /F
    ExitApp
return