#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

;Run, \RetroBat-TriggerHappy\tools\mamehooker5.1\mamehook.exe
;sleep, 2000
;Run, \RetroBat-TriggerHappy\tools\DemulShooter\DemulShooter.exe -target=ringwide -rom=og -noinput
Run, \RetroBat-TriggerHappy\emulators\teknoparrot\TeknoParrotUi.exe "--profile=OG.xml"

Escape::
    Process,Close,TeknoParrotUi.exe
    Run,taskkill /im "TeknoParrotUi.exe" /F
	sleep, 1000
;    Process,Close,DemulShooter.exe
;    Run,taskkill /im "DemulShooter.exe" /F
    sleep, 1000
;	Process,Close,mamehook.exe
;    Run,taskkill /im "mamehook.exe" /F	
    ExitApp
return