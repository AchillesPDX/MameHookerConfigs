#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

Run, R:\RetroBat-TriggerHappy\roms\pc\Typing of the Dead Overkill (CPY)\HOTD_NG.exe
sleep, 2000
Run, \RetroBat-TriggerHappy\tools\DemulShooter\DemulShooter.exe -target=windows -rom=hodo

; Remap controls
MButton::RButton    ; Replace Mouse Middle and Mouse right button with...
RButton::MButton	; ... each other to reload as usual with right click, and use grenades with middle click.

WheelUp::Up			; remap Mouse wheel up to Up keyboard
WheelDown::Down		; remap Mouse wheel down to Down keyboard


SetTimer,CheckProcess,1000 ; Check every second in case we exit the game using the in-game exit option instead of Escape

CheckProcess:
    Process,Exist,HOTD_NG.exe
    If !ErrorLevel ; If the process is not running
    {
        ; Close DemulShooter.exe if it's running
        Process,Close,DemulShooter.exe
        Run,taskkill /im "DemulShooter.exe" /F        
        ; Exit the script
        ExitApp
    }
    return

Escape::
    Process,Close,HOTD_NG.exe
    Run,taskkill /im "HOTD_NG.exe" /F
	sleep, 1000
    Process,Close,DemulShooter.exe
    Run,taskkill /im "DemulShooter.exe" /F
    ExitApp
return