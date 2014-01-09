;record a click and send with shiftRight
CoordMode, Mouse, Screen ;get mouse coord relative to screen

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
F1:: 
SetTitleMatchMode, 2
#IfWinActive, EdtScripts
Send {Alt}ta
Sleep 400
Send {Tab}{Tab}{Tab}{Tab}{Space}{Tab}{Tab}{Tab}{Tab}{Space}{Tab}
#ifWinActive
return



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
