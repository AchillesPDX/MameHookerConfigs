#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
DetectHiddenWindows, On

Run, .\Rabbids Hollywood\Game.exe
sleep, 2000
Run, \RetroBat-TriggerHappy\tools\DemulShooter\DemulShooterX64.exe -target=aagames -rom=rha
WinWait, RabbidsShooter
WinWaitClose, RabbidsShooter
ExitApp

1::Numpad1         ;P1 Start Game
2::Numpad3         ;P2 Start Game
3::Numpad7         ;P3 Start Game
4::Numpad9         ;P4 Start Game
5::c               ;Add Coins/Credit P1
6::v               ;Add Coins/Credit P2
7::b               ;Add Coins/Credit P3
8::n               ;Add Coins/Credit P4
Space::p           ;Pause Game
f2::o              ;Operator Menu
Enter::Numpad2     ;Operator Enter
up::Numpad1        ;Operator Up
down::Numpad3      ;Operator Down
Escape::
    Process,Close,Game.exe
    Run,taskkill /im "Game.exe" /F,, Hide
	sleep, 1000
    Process,Close,DemulShooterX64.exe
    Run,taskkill /im "DemulShooterX64.exe" /F,, Hide
	ExitApp
return