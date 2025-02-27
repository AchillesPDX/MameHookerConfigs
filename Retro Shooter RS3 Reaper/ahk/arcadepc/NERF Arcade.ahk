#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
DetectHiddenWindows, On

Run, .\NERF Arcade\Nerf.exe
sleep, 2000
Run, \RetroBat-TriggerHappy\tools\DemulShooter\DemulShooterX64.exe -target=rawthrill -rom=nerfa

Escape::
    Process,Close,Nerf.exe
    Run,taskkill /im "Nerf.exe" /F,, Hide
	sleep, 1000
    Process,Close,DemulShooterX64.exe
    Run,taskkill /im "DemulShooterX64.exe" /F,, Hide
	ExitApp
return