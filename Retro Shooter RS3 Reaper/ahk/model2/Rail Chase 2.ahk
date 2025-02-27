#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir \RetroBat-TriggerHappy\emulators\m2emulator\  ; Ensures a consistent starting directory.
#SingleInstance force

Run, \RetroBat-TriggerHappy\tools\DemulShooter\DemulShooter.exe -target=model2 -rom=rchase2
Run, emulator_multicpu.exe rchase2

Escape::
	WinClose, ahk_exe emulator_multicpu.exe
	sleep, 1000
    Process,Close,Demulshooter.exe
    Run,taskkill /im "Demulshooter.exe" /F
    ExitApp
return
