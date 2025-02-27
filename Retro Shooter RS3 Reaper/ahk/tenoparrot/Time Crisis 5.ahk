#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

Run, "\RetroBat-TriggerHappy\roms\teknoparrot\Time Crisis 5\DemulShooter_v10.4.4\DemulShooterX64.exe" -target=es3 -rom=tc5
;Run, "\RetroBat-TriggerHappy\roms\pc\Time Crisis 5\TC5\Binaries\Win64\TimeCrisisGame-Win64-Shipping.exe" -Language=JPN -playside=1 -resx=1920 -resy=1080
;Run, "\RetroBat-TriggerHappy\roms\pc\Time Crisis 5\RSLauncher.exe"
Run, \RetroBat-TriggerHappy\emulators\teknoparrot\TeknoParrotUi.exe "--profile=TC5.xml"
;MButton::t
;RButton::o
;1::y
;5::<+t


Escape::
    Process,Close,TimeCrisisGame-Win64-Shipping.exe
    Run,taskkill /im "TimeCrisisGame-Win64-Shipping.exe" /F
	sleep, 1000
    Process,Close,RSLauncher.exe
    Run,taskkill /im "RSLauncher.exe" /F
	sleep, 1000    
	Process,Close,DemulShooterX64.exe
    Run,taskkill /im "DemulShooterX64.exe" /F
    ExitApp
return