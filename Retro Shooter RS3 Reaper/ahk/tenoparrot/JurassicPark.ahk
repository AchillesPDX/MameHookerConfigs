#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

Run, \RetroBat-TriggerHappy\tools\DemulShooter\DemulShooter.exe -target=rawthrill -rom=jp
Run, \RetroBat-TriggerHappy\emulators\teknoparrot\TeknoParrotUi.exe "--profile=JurassicPark.xml"

Escape::
    Process,Close,TeknoParrotUi.exe
    Run,taskkill /im "TeknoParrotUi.exe" /F
	sleep, 1000
    Process,Close,DemulShooter.exe
    Run,taskkill /im "DemulShooter.exe" /F
    ExitApp
return