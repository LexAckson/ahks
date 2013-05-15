^`::Run, C:\Windows\System32\DisplaySwitch.exe /extend ; activate secondary
return

;apply formatting in edtScripts for diary
F1:: 
SetTitleMatchMode, 2
#IfWinActive, EdtScripts
Send {Alt}ta
Sleep 400
Send {Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Space}{Tab}{Tab}{Space}{Tab}
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







