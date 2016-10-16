; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Local $x = 25, $y = 45
	$grpRoyalAbilitiesCSV = GUICtrlCreateGroup(GetTranslated(634,1, "Hero Abilities"), $x - 20, $y - 20, 420, 60)
		GUICtrlCreateIcon($pIconLib, $eIcnKingAbility, $x-10, $y, 24, 24)
		GUICtrlCreateIcon($pIconLib, $eIcnQueenAbility, $x+ 15, $y, 24, 24)
		GUICtrlCreateIcon($pIconLib, $eIcnWardenAbility, $x+ 40, $y, 24, 24)

	$x += 70
	$y -= 4
		$radAutoAbilities = GUICtrlCreateRadio(GetTranslated(634,2, "Auto activate (red zone)"), $x, $y-4 , 160, -1)
		$txtTip = GetTranslated(634,3, "Activate the Ability when the Hero becomes weak.") & @CRLF & GetTranslated(634,4, "Heroes are checked and activated individually.")
		_GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetState(-1, $GUI_CHECKED)
	$y += 15
		$radManAbilities = GUICtrlCreateRadio(GetTranslated(634,5, "Timed after") & ":", $x , $y , -1, -1)
			$txtTip = GetTranslated(634,6, "Activate the Ability on a timer.") & @CRLF & GetTranslated(634,7, "All Heroes are activated at the same time.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_UNCHECKED)

		$txtManAbilities = GUICtrlCreateInput("9", $x + 80, $y+3, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(634,8, "Set the time in seconds for Timed Activation of Hero Abilities.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 2)
		$lblRoyalAbilitiesSec = GUICtrlCreateLabel(GetTranslated(603,6, "sec."), $x + 115, $y + 4, -1, -1)
	$y += 40
		$chkUseWardenAbility = GUICtrlCreateCheckbox(GetTranslated(634,9, "Timed activation of Warden Ability after") & ":", $x, $y, -1, -1)
			$txtTip = GetTranslated(634,10, "Use the ability of the Grand Warden on a timer.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_UNCHECKED+$GUI_DISABLE+$GUI_HIDE)
			GUICtrlSetColor (-1,$COLOR_ERROR)
		$txtWardenAbility = GUICtrlCreateInput("25", $x + 260, $y, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(634,11, "Set the time in seconds for Timed Activation of Grand Warden Ability.")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE+$GUI_HIDE)
			GUICtrlSetLimit(-1, 2)
			GUICtrlSetColor (-1,$COLOR_ERROR)
		$lblWardenAbilitiesSec = GUICtrlCreateLabel(GetTranslated(603,6, -1), $x + 293, $y, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE+$GUI_HIDE)
			GUICtrlSetColor (-1,$COLOR_ERROR)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 25, $y = 110
Global $chkattackHours0, $chkattackHours1, $chkattackHours2, $chkattackHours3, $chkattackHours4, $chkattackHours5
Global $chkattackHours6, $chkattackHours7, $chkattackHours8, $chkattackHours9, $chkattackHours10, $chkattackHours11
Global $chkattackHours12, $chkattackHours13, $chkattackHours14, $chkattackHours15, $chkattackHours16, $chkattackHours17
Global $chkattackHours18, $chkattackHours19, $chkattackHours20, $chkattackHours21, $chkattackHours22, $chkattackHours23
Global $lbattackHours1, $lbattackHours2, $lbattackHours3, $lbattackHours4, $lbattackHours5, $lbattackHours6
Global $lbattackHours7, $lbattackHours8, $lbattackHours9, $lbattackHours10, $lbattackHours11, $lbattackHours12
Global $lbattackHoursED, $lbattackHoursPM, $lbattackHoursAM, $chkattackHoursE1, $chkattackHoursE2
Global $chkAttackWeekdays1, $chkAttackWeekdays2, $chkAttackWeekdays3, $chkAttackWeekdays4, $chkAttackWeekdays5, $chkAttackWeekdays6, $chkAttackWeekdays0
Global $chkAttackPlannerEnable, $ichkAttackPlannerEnable, $chkAttackPlannerCloseCoC, $ichkAttackPlannerCloseCoC, $chkAttackPlannerCloseAll, $ichkAttackPlannerCloseAll
Global $chkAttackPlannerRandom, $ichkAttackPlannerRandom, $cmbAttackPlannerRandom, $icmbAttackPlannerRandom, $chkAttackPlannerDayLimit, $ichkAttackPlannerDayLimit
Global $cmbAttackPlannerDayMin, $icmbAttackPlannerDayMin, $cmbAttackPlannerDayMax, $icmbAttackPlannerDayMax

	$grpAttHSched = GUICtrlCreateGroup(GetTranslated(634,20, "Attack Schedule"), $x - 20, $y - 20, 420, 130)
	$x -= 5
		$chkAttackPlannerEnable = GUICtrlCreateCheckbox(GetTranslated(634,21, "Enable Schedule"), $x, $y-5, -1, -1)
			$txtTip = GetTranslated(634,22, "This option will allow you to schedule attack times") & @CRLF & _
					GetTranslated(634,23, "Bot continues to run and will attack only when schedule allows")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkAttackPlannerEnable")
		$chkAttackPlannerCloseCoC = GUICtrlCreateCheckbox(GetTranslated(634,24, "Close CoC"), $x, $y+14, -1, -1)
			$txtTip = GetTranslated(634,25, "This option will close CoC app when not scheduled to Search & Attack!") & @CRLF & _
					GetTranslated(634,26, "Bot Continues to run and will restart when schedule allows")
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "chkAttackPlannerCloseCoC")
		$chkAttackPlannerCloseAll = GUICtrlCreateCheckbox(GetTranslated(634,27, "Close emulator"), $x, $y+33, -1, -1)
			$txtTip = GetTranslated(634,28, "This option will close emulator when not scheduled to Search & Attack!") & @CRLF & _
					GetTranslated(634,26, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "chkAttackPlannerCloseAll")
		$chkAttackPlannerRandom = GUICtrlCreateCheckbox(GetTranslated(634,29, "Random Disable"), $x, $y+52, -1, -1)
			$txtTip = GetTranslated(634,30, "This option will randomly stop attacking") & @CRLF & _
					GetTranslated(634,26, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "chkAttackPlannerRandom")
		$cmbAttackPlannerRandom = GUICtrlCreateCombo("",  $x + 110 , $y+50, 37, 16, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			_GUICtrlSetTip(-1, GetTranslated(634,31, "Select number of hours to stop attacking"))
			GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20", "4")
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "cmbAttackPlannerRandom")
		$lbAttackPlannerRandom = GUICtrlCreateLabel(GetTranslated(603,37, "hrs"), $x+148, $y+54, -1,-1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$chkAttackPlannerDayLimit = GUICtrlCreateCheckbox(GetTranslated(634,35, "Daily Limit"), $x, $y+77, -1, -1)
			$txtTip = GetTranslated(634,36, "Will randomly stop attacking when exceed random number of attacks between range selected") & @CRLF & _
					GetTranslated(634,26, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "chkAttackPlannerDayLimit")
		$cmbAttackPlannerDayMin = GUICtrlCreateInput("12",  $x+79 , $y+77, 37, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			_GUICtrlSetTip(-1, GetTranslated(634,37, "Enter minimum number of attacks allowed per day"))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetOnEvent(-1, "cmbAttackPlannerDayMin")
		$lbAttackPlannerDayLimit = GUICtrlCreateLabel(GetTranslated(634,39,"to"), $x+121, $y+80, -1,-1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$cmbAttackPlannerDayMax = GUICtrlCreateInput("15",  $x+136 , $y+77, 37, 18,  BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			_GUICtrlSetTip(-1, GetTranslated(634,38, "Enter maximum number of attacks allowed per day"))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetOnEvent(-1, "cmbAttackPlannerDayMax")

	$x += 198
	$y -= 5
		$lbAttackWeekdays0 = GUICtrlCreateLabel(GetTranslated(603,36, "Day") & ":", $x, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslated(603,31, "Only during these day of week"))
		$lbAttackWeekdays1 = GUICtrlCreateLabel(GetTranslated(603,16, "Su"), $x + 30, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslated(603,17, "Sunday"))
		$lbAttackWeekdays2 = GUICtrlCreateLabel(GetTranslated(603,18, "Mo"), $x + 46, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslated(603,19, "Monday"))
		$lbAttackWeekdays3 = GUICtrlCreateLabel(GetTranslated(603,20, "Tu"), $x + 63, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslated(603,21, "Tuesday"))
		$lbAttackWeekdays4 = GUICtrlCreateLabel(GetTranslated(603,22, "We"), $x + 79, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslated(603,23, "Wednesday"))
		$lbAttackWeekdays5 = GUICtrlCreateLabel(GetTranslated(603,24, "Th"), $x + 99, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslated(603,25, "Thursday"))
		$lbAttackWeekdays6 = GUICtrlCreateLabel(GetTranslated(603,26, "Fr"), $x + 117, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslated(603,27, "Friday"))
		$lbAttackWeekdays7 = GUICtrlCreateLabel(GetTranslated(603,28, "Sa"), $x + 133, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslated(603,29, "Saturday"))
		$lbAttackWeekdaysE = GUICtrlCreateLabel("X", $x + 155, $y+1, -1, 15)
			_GUICtrlSetTip(-1, GetTranslated(603,2, -1))
	$y += 13
		$chkAttackWeekdays0 = GUICtrlCreateCheckbox("", $x + 30, $y, 16, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslated(603,31, -1))
		$chkAttackWeekdays1 = GUICtrlCreateCheckbox("", $x + 47, $y, 16, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslated(603,31, -1))
		$chkAttackWeekdays2 = GUICtrlCreateCheckbox("", $x + 64, $y, 16, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslated(603,31, -1))
		$chkAttackWeekdays3 = GUICtrlCreateCheckbox("", $x + 81, $y, 16, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslated(603,31, -1))
		$chkAttackWeekdays4 = GUICtrlCreateCheckbox("", $x + 99, $y, 16, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslated(603,31, -1))
		$chkAttackWeekdays5 = GUICtrlCreateCheckbox("", $x + 117, $y, 16, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslated(603,31, -1))
		$chkAttackWeekdays6 = GUICtrlCreateCheckbox("", $x + 133, $y, 16, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslated(603,31, -1))
		$chkattackWeekDaysE = GUICtrlCreateCheckbox("", $x + 151, $y, 15, 15, BitOR($BS_PUSHLIKE, $BS_ICON))
			GUICtrlSetImage(-1, $pIconLib, $eIcnGoldStar, 0)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			$txtTip = GetTranslated(603,2, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkattackWeekDaysE")
	$x -= 25
	$y += 17
		$lbattackHours0 = GUICtrlCreateLabel(GetTranslated(603,15,"Hour") & ":", $x , $y, -1, 15)
			$txtTip = GetTranslated(603,30, "Only during these hours of each day")
			_GUICtrlSetTip(-1, $txtTip)
		$lbattackHours1 = GUICtrlCreateLabel(" 0", $x + 30, $y, 13, 15)
			_GUICtrlSetTip(-1, $txtTip)
		$lbattackHours2 = GUICtrlCreateLabel(" 1", $x + 45, $y, 13, 15)
			_GUICtrlSetTip(-1, $txtTip)
		$lbattackHours3 = GUICtrlCreateLabel(" 2", $x + 60, $y, 13, 15)
			_GUICtrlSetTip(-1, $txtTip)
		$lbattackHours4 = GUICtrlCreateLabel(" 3", $x + 75, $y, 13, 15)
			_GUICtrlSetTip(-1, $txtTip)
		$lbattackHours5 = GUICtrlCreateLabel(" 4", $x + 90, $y, 13, 15)
			_GUICtrlSetTip(-1, $txtTip)
		$lbattackHours6 = GUICtrlCreateLabel(" 5", $x + 105, $y, 13, 15)
			_GUICtrlSetTip(-1, $txtTip)
		$lbattackHours7 = GUICtrlCreateLabel(" 6", $x + 120, $y, 13, 15)
			_GUICtrlSetTip(-1, $txtTip)
		$lbattackHours8 = GUICtrlCreateLabel(" 7", $x + 135, $y, 13, 15)
			_GUICtrlSetTip(-1, $txtTip)
		$lbattackHours9 = GUICtrlCreateLabel(" 8", $x + 150, $y, 13, 15)
			_GUICtrlSetTip(-1, $txtTip)
		$lbattackHours10 = GUICtrlCreateLabel(" 9", $x + 165, $y, 13, 15)
			_GUICtrlSetTip(-1, $txtTip)
		$lbattackHours11 = GUICtrlCreateLabel("10", $x + 180, $y, 13, 15)
			_GUICtrlSetTip(-1, $txtTip)
		$lbattackHours12 = GUICtrlCreateLabel("11", $x + 195, $y, 13, 15)
			_GUICtrlSetTip(-1, $txtTip)
		$lbattackHoursED = GUICtrlCreateLabel("X", $x + 214, $y+1, 11, 11)
			_GUICtrlSetTip(-1, $txtTip)
	$y += 15
		$chkattackHours0 = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours1 = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours2 = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours3 = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours4 = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours5 = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours6 = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours7 = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours8 = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours9 = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours10 = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours11 = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
		GUICtrlSetState(-1, $GUI_CHECKED)
		GUICtrlSetState(-1, $GUI_DISABLE)
		$chkattackHoursE1 = GUICtrlCreateCheckbox("", $x + 211, $y+1, 13, 13, BitOR($BS_PUSHLIKE, $BS_ICON))
		GUICtrlSetImage(-1, $pIconLib, $eIcnGoldStar, 0)
		GUICtrlSetState(-1, $GUI_UNCHECKED)
		GUICtrlSetState(-1, $GUI_DISABLE)
		$txtTip = GetTranslated(603,2, "This button will clear or set the entire row of boxes")
		_GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "chkattackHoursE1")
		$lbattackHoursAM = GUICtrlCreateLabel(GetTranslated(603,3, "AM"), $x + 10, $y)
	$y += 15
		$txtTip = GetTranslated(603,30, -1)
		$chkattackHours12 = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours13 = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours14 = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours15 = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours16 = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours17 = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours18 = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours19 = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours20 = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours21 = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours22 = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHours23 = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkattackHoursE2 = GUICtrlCreateCheckbox("", $x + 211, $y+1, 13, 13, BitOR($BS_PUSHLIKE, $BS_ICON))
			GUICtrlSetImage(-1, $pIconLib, $eIcnGoldStar, 0)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			$txtTip = GetTranslated(603,2, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkattackHoursE2")
		$lbattackHoursPM = GUICtrlCreateLabel(GetTranslated(603,4, "PM"), $x + 10, $y)

	GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 25, $y = 245
	$grpClanCastleBal = GUICtrlCreateGroup(GetTranslated(634,12, "ClanCastle"), $x - 20, $y - 20, 420, 100)
		GUICtrlCreateIcon($pIconLib, $eIcnCC, $x -10 , $y + 4, 24, 24)
	$y -= 4
		$chkDropCCHoursEnable = GUICtrlCreateCheckbox(GetTranslated(634,40,"Enable CC Drop Schedule" ), $x +20, $y+2, -1, -1)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			_GUICtrlSetTip(-1, GetTranslated(634,41, "Use schedule to define when dropping CC is allowed, \r\n CC is always dropped when schedule is not enabled"))
			GUICtrlSetOnEvent(-1, "chkDropCCHoursEnable")
	$y += 22
		$chkUseCCBalanced = GUICtrlCreateCheckbox(GetTranslated(634,13,"Balance Donate/Receive" ), $x +20, $y+2, -1, -1)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			_GUICtrlSetTip(-1, GetTranslated(634,14, "Drop your Clan Castle only if your donated/received ratio is greater than D/R ratio below."))
			GUICtrlSetOnEvent(-1, "chkBalanceDR")
	$y += 28
		$cmbCCDonated = GUICtrlCreateCombo("",  $x + 40 , $y, 30, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			_GUICtrlSetTip(-1, GetTranslated(634,15, "Donated ratio"))
			GUICtrlSetData(-1, "1|2|3|4|5", "1")
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "cmbBalanceDR")
		$lblDRRatio = GUICtrlCreateLabel("/", $x + 73, $y + 5, -1, -1)
			$txtTip = GetTranslated(634,16, "Wanted donated / received ratio") & @CRLF & GetTranslated(634,17, "1/1 means donated = received, 1/2 means donated = half the received etc.")
			_GUICtrlSetTip(-1, $txtTip)
		$cmbCCReceived = GUICtrlCreateCombo("", $x +80, $y, 30, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			_GUICtrlSetTip(-1, GetTranslated(634,18, "Received ratio"))
			GUICtrlSetData(-1, "1|2|3|4|5", "1")
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "cmbBalanceDR")
 	$x += 188
	$y = 245
		$lblDropCCHours = GUICtrlCreateLabel(GetTranslated(603,30, -1), $x+8, $y)
	$y += 14
	$x -= 21
		$txtTip = GetTranslated(603,30, -1)
		$lbDropCCHours1 = GUICtrlCreateLabel(" 0", $x + 30, $y, 13, 15)
		$lbDropCCHours2 = GUICtrlCreateLabel(" 1", $x + 45, $y, 13, 15)
		$lbDropCCHours3 = GUICtrlCreateLabel(" 2", $x + 60, $y, 13, 15)
		$lbDropCCHours4 = GUICtrlCreateLabel(" 3", $x + 75, $y, 13, 15)
		$lbDropCCHours5 = GUICtrlCreateLabel(" 4", $x + 90, $y, 13, 15)
		$lbDropCCHours6 = GUICtrlCreateLabel(" 5", $x + 105, $y, 13, 15)
		$lbDropCCHours7 = GUICtrlCreateLabel(" 6", $x + 120, $y, 13, 15)
		$lbDropCCHours8 = GUICtrlCreateLabel(" 7", $x + 135, $y, 13, 15)
		$lbDropCCHours9 = GUICtrlCreateLabel(" 8", $x + 150, $y, 13, 15)
		$lbDropCCHours10 = GUICtrlCreateLabel(" 9", $x + 165, $y, 13, 15)
		$lbDropCCHours11 = GUICtrlCreateLabel("10", $x + 180, $y, 13, 15)
		$lbDropCCHours12 = GUICtrlCreateLabel("11", $x + 195, $y, 13, 15)
		$lbDropCCHoursED = GUICtrlCreateLabel("X", $x + 213, $y+2, 11, 11)
	$y += 15
		$chkDropCCHours0 = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours1 = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours2 = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours3 = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours4 = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours5 = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours6 = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours7 = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours8 = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours9 = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours10 = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours11 = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHoursE1 = GUICtrlCreateCheckbox("", $x + 211, $y+1, 13, 13, BitOR($BS_PUSHLIKE, $BS_ICON))
			GUICtrlSetImage(-1, $pIconLib, $eIcnGoldStar, 0)
			GUICtrlSetState(-1, $GUI_UNCHECKED )
		$txtTip = GetTranslated(603,2, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkDropCCHoursE1")
		$lbDropCCHoursAM = GUICtrlCreateLabel(GetTranslated(603,3, -1), $x + 10, $y)
	$y += 15
		$txtTip = GetTranslated(603,30, -1)
		$chkDropCCHours12 = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours13 = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours14 = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours15 = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours16 = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours17 = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours18 = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours19 = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours20 = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours21 = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours22 = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHours23 = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $txtTip)
		$chkDropCCHoursE2 = GUICtrlCreateCheckbox("", $x + 211, $y+1, 13, 13, BitOR($BS_PUSHLIKE, $BS_ICON))
			GUICtrlSetImage(-1, $pIconLib, $eIcnGoldStar, 0)
			GUICtrlSetState(-1, $GUI_UNCHECKED )
			$txtTip = GetTranslated(603,2, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkDropCCHoursE2")
		$lbDropCCHoursPM = GUICtrlCreateLabel(GetTranslated(603,4, -1), $x + 10, $y)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

