#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir .\Drakons Realm Keepers  ; Ensures a consistent starting directory.
#SingleInstance force
DetectHiddenWindows, On

Run, Game.exe
sleep, 2000
Run, \RetroBat-TriggerHappy\tools\DemulShooter\DemulShooterX64.exe -target=aagames -rom=drk
sleep, 2000
WinWait, 09038_Adrenaline_Skyride_Turret
WinWaitClose, 09038_Adrenaline_Skyride_Turret
ExitApp
6::2
5::1
F2::o
Escape::
    Process,Close,Game.exe
    Run,taskkill /im "Game.exe" /F,, Hide
	ExitApp
return