; #FUNCTION# ====================================================================================================================
; Name ..........: FindPos
; Description ...:
; Syntax ........: FindPos()
; Parameters ....:
; Return values .: None
; Author ........: Your Name
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func FindPos()
	getBSPos()
	AndroidToFront() ; Activate Android Window
	Local $wasDown = AndroidShieldForceDown(True, True)
	While 1
		If _IsPressed("01") Or _IsPressed("02") Then
			Local $Pos = MouseGetPos()
			; adjust Android Control Position
			$Pos[0] -= $BSpos[0]
			$Pos[1] -= $BSpos[1]
			; adjust village offset
			$Pos[0] -= $VILLAGE_OFFSET_X
			$Pos[1] -= $VILLAGE_OFFSET_Y
			; wait till released
			While _IsPressed("01") Or _IsPressed("02")
				Sleep(10)
			WEnd
			AndroidShieldForceDown($wasDown, True)
			Return $Pos
		EndIf
		Sleep(10)
	WEnd
EndFunc   ;==>FindPos
