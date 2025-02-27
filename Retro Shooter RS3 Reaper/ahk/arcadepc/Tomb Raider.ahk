#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir .\Tomb Raider  ; Ensures a consistent starting directory.
#SingleInstance force
DetectHiddenWindows, On


Run, \RetroBat-TriggerHappy\tools\DemulShooter\DemulShooterX64.exe -target=aagames -rom=tra -nocrosshair
; Path to the program you want to run
programPath := "Game.exe"

; Create a fullscreen black GUI window
Gui, BlackBackground:New
Gui, BlackBackground:Color, Black
Gui, BlackBackground:+AlwaysOnTop -Caption +ToolWindow +E0x20  ; Make it non-interactive
Gui, BlackBackground:Show, % "x0 y0 w" A_ScreenWidth " h" A_ScreenHeight

; Run the program
Run, %programPath%, , , PID
sleep, 5000 ; wait for the game to un-freeze before continuing
; Wait for the program to launch and get its window
WinWait, ahk_pid %PID%

; Get the window handle
WinGet, hwnd, ID, ahk_pid %PID%

; Screen dimensions
screenWidth := A_ScreenWidth
screenHeight := A_ScreenHeight

; Calculate 16:9 window size based on screen height
windowHeight := screenHeight
windowWidth := screenWidth

; Center the window on the screen
xPos := (screenWidth - windowWidth) / 2
yPos := 0  ; Top-aligned (no vertical offset)

; Remove borders and title bar
WinSet, Style, -0xC40000, ahk_id %hwnd%

; Resize and position the window
WinMove, ahk_id %hwnd%, , xPos, yPos, windowWidth, windowHeight

; Ensure the program stays always on top
WinSet, AlwaysOnTop, On, ahk_id %hwnd%

; Capture the mouse cursor within the program's window
DllCall("ClipCursor", "UInt", 0)  ; Reset any existing cursor clipping
VarSetCapacity(rect, 16)
NumPut(xPos, rect, 0, "Int")                      ; Left
NumPut(yPos, rect, 4, "Int")                      ; Top
NumPut(xPos + windowWidth, rect, 8, "Int")        ; Right
NumPut(yPos + windowHeight, rect, 12, "Int")      ; Bottom
DllCall("ClipCursor", "UInt", &rect)

; Monitor for when the program exits
WinWaitClose, ahk_pid %PID%

; Release the mouse cursor and clean up
DllCall("ClipCursor", "UInt", 0)  ; Free the cursor
Gui, BlackBackground:Destroy
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
F2::o              ;Operator Menu (at title screen)

$esc::
	Process,Close,Game.exe
	Run,taskkill /im "Game.exe" /F,, Hide
    ExitApp
return

;~ Controls:
;~ Tomb Raider
;~ Mouse Buttons	Left	Middle	Right
;~ Action			Trigger	  /		Reload
;~ Misc. Notes:
;~ Use -nocrosshair option in DemulShooterX64 command line to remove crosshairs
;~ Gun calibration can be done in the service menu if your aim is off.
;~ Hit O for the service menu. Numpad1 and Numpad3 to move in the menu and Numpad2 to select.
;~ Credits Keys are C, V, B, N for P1...P4
;~ Start Keys are Numpad1, Numpad3, Numpad7, Numpad9 for P1...P4
;~ Quit with ESC
;~ T shows a timer since start of game
;~ E shows all players health info
;~ A is Infinite Ammo Cheat
;~ S skips all cutscenes
;~ G is God Mode
;~ X disables vibration in game

;~ If you hold left mouse for 5+ seconds and then click right mouse while still holding left then a menu pops up with options.