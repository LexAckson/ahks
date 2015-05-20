;run a script that minimized the active window when it is named "Windows Mobile Device Center"
;for some reason this does not work in another script.  perhaps it has to be on top.  for now keeping seperate works
#Persistent
SetTimer, CloseWinSync, 250
return

CloseWinSync:
IfWinExist, Windows Mobile Device Center
{
	Run, C:\
	WinClose
	Sleep 400
	Send {Tab}{Tab}{Space}
	SendInput {Raw}Computer\T-Mobile T-Mobile_LEO\\\Program Files\invivo\data
	Send {Enter}
}
return







