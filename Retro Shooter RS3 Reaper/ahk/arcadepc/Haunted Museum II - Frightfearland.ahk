#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

Run, \RetroBat-TriggerHappy\tools\NoMousy\nomousy.exe /hide
Run, \RetroBat-TriggerHappy\tools\DemulShooter\DemulShooter.exe -target=globalvr -rom=fearland
;Run, \RetroBat-TriggerHappy\emulators\teknoparrot\TeknoParrotUi.exe "--profile=HauntedMuseumII.xml"
;Run, ".\Haunted Museum II\game.exe"
; Path to the program you want to run
programPath := ".\Haunted Museum II\game.exe"

; Create a fullscreen black GUI window
Gui, BlackBackground:New
Gui, BlackBackground:Color, Black
Gui, BlackBackground:+AlwaysOnTop -Caption +ToolWindow +E0x20  ; Make it non-interactive
Gui, BlackBackground:Show, % "x0 y0 w" A_ScreenWidth " h" A_ScreenHeight

; Run the program
Run, %programPath%, , , PID

; Wait for the program to launch and get its window
WinWait, ahk_pid %PID%

; Get the window handle
WinGet, hwnd, ID, ahk_pid %PID%

; Screen dimensions
screenWidth := A_ScreenWidth
screenHeight := A_ScreenHeight

; Calculate 4:3 window size based on screen height
windowHeight := screenHeight
windowWidth := Round(windowHeight * 4 / 3)

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



5::s	;Insert Coin
F2::esc	;Test Mode

$esc::
	Run, \RetroBat-TriggerHappy\tools\NoMousy\nomousy.exe
	Process,Close,game.exe
	Run,taskkill /im "game.exe" /F
    Process,Close,TeknoParrotUi.exe
    Run,taskkill /im "TeknoParrotUI.exe" /F
	sleep, 1000
    Process,Close,DemulShooter.exe
    Run,taskkill /im "DemulShooter.exe" /F
    ExitApp
return