;record a click and send with shiftRight
CoordMode, Mouse, Screen ;get mouse coord relative to screen
;this is needed (at the top!) for the #IfWinActive to work
SetTitleMatchMode 2

^Space::
MouseGetPos, xpos2, ypos2
MouseMove, %xpos%, %ypos%, 0
Click
MouseMove, %xpos2%, %ypos2%, 0
return

+^LButton::
MouseGetPos, xpos, ypos
return


^`::Run, C:\Windows\System32\DisplaySwitch.exe /extend ; activate secondary
return

;apply formatting in edtScripts for diary

#IfWinActive, EdtScripts
F5::
Send {Alt}ta
Sleep 400
Send {Tab}{Tab}{Tab}{Tab}{Space}{Tab}{Tab}{Tab}{Tab}{Space}{Tab}
return

;todo, make a regex that just applies the formatting itself (maybe have to find a way to calculate width?)
;apply formatting in edtScripts for site
F1:: 
;first apply diary formatting

;bring up formatter
Send {Alt}ta
Sleep 400
;apply formatting and select text
Send {Tab}{Tab}{Tab}{Tab}{Space}{Tab}{Tab}{Tab}{Tab}{Space}{Tab}{Tab}{Tab}


;Empty the Clipboard.
    Clipboard =
;Copy the select text to the Clipboard.
    SendInput, ^c
;Wait for the Clipboard to fill.
    ClipWait

;Perform the RegEx find and replace operation,
;where "ABC" is the whole-word we want to replace.
    haystack := Clipboard
    needle := "<c>(.*?)<p><c>"
    replacement := "<c>$1 "
    result := RegExReplace(haystack, needle, replacement)

;Empty the Clipboard
    Clipboard =
;Copy the result to the Clipboard.
    Clipboard := result
;Wait for the Clipboard to fill.
    ClipWait

;-- Optional: --
;Send (paste) the contents of the new Clipboard.
    SendInput, %Clipboard%

;Done!
    return

#IfWinActive

;N++ shortcuts globally
^+up::
SendInput {Home}+{End}^x{BS}{Home}^v{Enter}{Up}
return

^+Down::
SendInput {Home}+{End}^x{BS}{Down}{End}{Enter}^v
return

^d::
SendInput {End}+{Home}^c{End}{Enter}^v
return

^!d::
Run, C:\
Sleep 400
Send {Tab}{Tab}{Space}
SendInput {Raw}Computer\Pocket_PC\\\Program Files\invivo\data
Send {Enter}
return



;Visio zoom 100%
!z::
Send {Alt}vz1
