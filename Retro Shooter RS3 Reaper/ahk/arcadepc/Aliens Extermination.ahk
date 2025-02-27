#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir .\Aliens Extermination\DATA  ; Ensures a consistent starting directory.
#SingleInstance force
DetectHiddenWindows, On

Run, aliens dehasped.exe
sleep, 2000
Run, \RetroBat-TriggerHappy\tools\DemulShooter\DemulShooter.exe -target=globalvr -rom=aliens
sleep, 2000
SetNumLockState, On
WinWait, GLUT
WinWaitClose, GLUT
ExitApp
6::LShift
5::LCtrl
Up::9
Down::0
Enter::6
F2::5
Escape::
    Process,Close,aliens dehasped.exe
    Run,taskkill /im "aliens dehasped.exe" /F,, Hide
	ExitApp
return