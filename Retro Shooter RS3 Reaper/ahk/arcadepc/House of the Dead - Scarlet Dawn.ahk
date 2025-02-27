#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir .\House of the Dead - Scarlet Dawn\App\Hodzero\WindowsNoEditor\AMDaemon\  ; Ensures a consistent starting directory.
#SingleInstance force
DetectHiddenWindows, On

Run, amdaemon.exe
sleep, 2000
Run, \RetroBat-TriggerHappy\tools\DemulShooter\DemulShooterX64.exe -target=alls -rom=hodsd
WinWait, Hodzero
WinWaitClose, Hodzero
ExitApp
Escape::
    Process,Close,Hodzero-Win64-Shipping.exe
    Run,taskkill /im "Hodzero-Win64-Shipping.exe" /F,, Hide
	sleep, 1000
    Process,Close,amdaemon.exe
    Run,taskkill /im "amdaemon.exe" /F,, Hide
	ExitApp
return