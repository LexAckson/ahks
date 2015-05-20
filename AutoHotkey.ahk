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

;open up diary data folder
^!d Up::
Run, C:\
Sleep 400
Send {Tab}{Tab}{Space}
SendInput {Raw}Computer\T-Mobile T-Mobile_LEO\\\Program Files\invivo\data
Send {Enter}
return


;apply formatting in edtScripts for diary

#IfWinActive, EdtScripts
F5::
Send {Alt}ta
Sleep 400
;clear and apply
Send {Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Space}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Space}{Tab}{Tab}{Tab}{Tab}{Tab}
; std Send {Tab}{Tab}{Tab}{Tab}{Space}{Tab}{Tab}{Tab}{Tab}{Space}{Tab}
return
#IfWinActive

;apply formatting in edtScripts for site
#IfWinActive, EdtScripts
F1:: 
;first apply diary formatting

;bring up formatter
Send {Alt}ta
Sleep 400
;apply formatting and select text, still using the edtscripts formatter because it calculates based on character width
Send {Tab}{Tab}{Tab}{Tab}{Space}{Tab}{Tab}{Tab}{Tab}{Space}{Tab}{Tab}{Tab}


;Empty the Clipboard.
    Clipboard =
;Copy the select text to the Clipboard.
    SendInput, ^c

findReplaceClipboard("<c>(.*?)<p><c>", "<c>$1 ")
findReplaceClipboard("(<\w>)\s?", "$1")

;-- Optional: --
;Send (paste) the contents of the new Clipboard.
    SendInput, %Clipboard%

;Done!
return

;apply formatting in edtScripts for site (left)
#IfWinActive, EdtScripts
!F1:: 
;first apply diary formatting

;Empty the Clipboard.
    Clipboard =
;Copy the select text to the Clipboard.
    SendInput, ^c

;remove double spaces
findReplaceClipboard("\s\s", " ")
;remove trailing spaces
findReplaceClipboard("\s+$", "")
;put in line breaks
findReplaceClipboard("(.{60,75})\s", "$1<p>")

;-- Optional: --
;Send (paste) the contents of the new Clipboard.
    SendInput, ^v

;Done!
return

#IfWinActive

#IfWinActive, EdtScripts
;N++ shortcuts edtScripts
^+Down::
SendInput {Home}+{End}^x{End}{Enter}^v
return
#IfWinActive

;goofy attempt to make these work in all but notepad++
#IfWinActive, Notepad++
~^+up::
return

~^+Down::
return

~^d::
return

#IfWinActive

;N++ shortcuts everything else
^+up::
SendInput {Home}+{End}^x{Up}{Left}{Enter}^v
return

^+Down::
SendInput {Home}+{End}^x{Backspace}{Right}{End}{Enter}^v
return


^d::
SendInput {End}+{Home}^c{End}{Enter}^v
return


#IfWinActive, Visio
;Visio zoom 100%
!z::
Send {Alt}vz1
return
#IfWinActive

;sites all sites scroller
#IfWinActive, Chrome
~^LButton Up::
KeyWait Control
Send {PgDn 19}
return
#IfWinActive


;temp syncid setter
#IfWinActive, Chrome
^. Up::
Send {Tab}{Tab}10{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Space}{Tab}
return
#IfWinActive

;sites info copier
#IfWinActive, Chrome
^k Up::
SetKeyDelay, 40, 40

clipboard = 
Send !{Tab}{Home}{Down}^c
Send !{Tab}

;cut spaces from sitenum
findReplaceClipboard("^\s*(.*?)\s*$", "$1")

Send ^v
clipboard =
Send !{Tab}{Tab}^c
;cut spaces from first name
findReplaceClipboard("^\W*(\w).*$", "$1")

Send !{Tab}{Tab}^v
clipboard =
Send {Space}
Send !{Tab}{Tab}
Send ^c!{Tab}
;cut spaces from last name
findReplaceClipboard("^\s*(.*?)\s*$", "$1")

Send ^v
clipboard =
Send {Tab}{Tab}!{Tab}
Send {Tab}^c
Send !{Tab}
Send ^v
clipboard =
Send !{Tab}
Send {Tab}^c
Send !{Tab}
Send {Tab}^v
clipboard =
Send !{Tab}
Send {Tab}^c
Send !{Tab}
Send {Tab}^v
clipboard =
Send !{Tab}
Send {Tab}^c
Send !{Tab}
Send {Tab}^v
clipboard = 
Send !{Tab}
Send {Tab}{Tab}{Tab}^c
Send !{Tab}
;rem tab to account for no state/prov
Send {Tab}{Tab}^v
SetKeyDelay
return
#IfWinActive

;;Expert supply item macro, no non-eng manual present
;^!j::
;Send 00{Tab}{Tab}{Tab}
;Send {Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send {Tab}{Tab}{Tab}
;;x2 device serial decal
;Send {Tab}{Tab}2{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send {Tab}{Tab}{Tab}
;Send {Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send {Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send {Tab}{Tab}{Tab}
;Send {Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}1{Tab}100
;return
;
;;Expert supply item macro, non-eng manual present
;^!h::
;Send 00{Tab}{Tab}{Tab}
;Send {Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;;manuals here, will have to set manually lol
;Send {Tab}{Tab}{Tab}
;Send {Tab}{Tab}{Tab}
;Send {Tab}{Tab}{Tab}
;;x2 device serial decal
;Send {Tab}{Tab}2{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send {Tab}{Tab}{Tab}
;Send {Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send {Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send {Tab}{Tab}{Tab}
;Send {Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}{Tab}
;Send 100{Tab}{Tab}1{Tab}100
;;might also have to set SIM if phone adaptor is present
;return

findReplaceClipboard(needle, replacement){
;Wait for the Clipboard to fill.
    ClipWait

;Perform the RegEx find and replace operation,
    haystack := Clipboard
    result := RegExReplace(haystack, needle, replacement)

;Empty the Clipboard
    Clipboard =
;Copy the result to the Clipboard.
    Clipboard := result
;Wait for the Clipboard to fill.
    ClipWait
}
