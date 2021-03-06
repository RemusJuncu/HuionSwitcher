; Author:         Remus Juncu | http://remusjuncu.com/
; HuionSwitcher by Remus Juncu | http://remusjuncu.com/
; ! alt | ^ ctrl | + shift | # win

#NoEnv
#SingleInstance force
#Persistent

SetBatchLines, 1ms
SendMode Input

Menu, tray, NoStandard
; Menu, Tray, Icon, disabled.ico, , 1
Menu, tray, add, Huion7.0, ToggleHotKey ; enable disable the hotkeys
Menu, tray, add ; Creates a separator line.
Menu, tray, add, Open Pref, HuiPref ; Open Huion Preferences
Menu, tray, add, Shortcuts, shortcuts ; Creates a new menu item.
Menu, tray, add ; Creates a separator line.
Menu, tray, add, Website, website ; Creates a new menu item.
Menu, tray, add, About, about ; Creates a new menu item.
Menu, tray, add ; Creates a separator line.
Menu, tray, Default, Website
Menu, tray, Check, Huion7.0
Menu, tray, add, Exit, doExit

DetectHiddenWindows, on
IfWinNotExist, Pen Tablet ahk_class #32770
{
   TrayTip, HuionSwitcher, Press Tilda a few times... Made by Remus Juncu - http://remusjuncu.com/, 3, 1
}
Else
{
   TrayTip, HuionSwitcher, Made by Remus Juncu - http://remusjuncu.com/, 1, 1

   IfWinExist, Pen Tablet ahk_class #32770
   {
      ;~ ControlGet, OutputVar, Tab, , SysTabControl321, Pen Tablet ahk_class #32770
      SendMessage, 0x1330, 1,, SysTabControl321, Pen Tablet ahk_class #32770  ; 0x1330 is TCM_SETCURFOCUS.

      WinHide, Pen Tablet ahk_class #32770
   }
}
Return

; Toogle the shortcuts !
ToggleHotKey:
   menu, tray, ToggleCheck, %A_ThisMenuItem%
   Suspend
   ; ^!s::Suspend  ; Assign the toggle-suspend function to a hotkey.
Return

; Open Huion Pref
HuiPref:
   run, %A_WinDir%\System32\TabCfg.exe
Return

; Show Shortcuts
shortcuts:
   MsgBox , 0, HuionSwitcher, Tilda = Switch Monitor`n`nCtrl + Tilda = Show Huion Preferences`n`nShift + Tilda = Hide Huion Preferences`n`n`nMade by Remus Juncu`nhttp://remusjuncu.com/,
Return

; Open Website
website:
   Run,% "http://remusjuncu.com/"
Return

; Display About
about:
   TrayTip, HuionSwitcher, Made by Remus Juncu - http://remusjuncu.com/, 3, 1
Return

; Exit !
doExit:
   IfWinExist, Pen Tablet ahk_class #32770
   {
      WinShow, Pen Tablet ahk_class #32770
   }
ExitApp

; Tilda - Switch monitor.
`::
   DetectHiddenWindows, on
   IfWinExist, Pen Tablet ahk_class #32770
   {
      ;~ ControlGet, OutputVar, Tab, , SysTabControl321, Pen Tablet ahk_class #32770
      SendMessage, 0x1330, 1,, SysTabControl321, Pen Tablet ahk_class #32770  ; 0x1330 is TCM_SETCURFOCUS.

      ControlGet, OutputVar, Choice, , ComboBox1, Pen Tablet ahk_class #32770

      if ( OutputVar =  "Monitor 1" ) {
         Control, Choose, 4, ComboBox1, Pen Tablet ahk_class #32770
      } else {
         Control, Choose, 3, ComboBox1, Pen Tablet ahk_class #32770
      }

      ControlClick, Button4, Pen Tablet ahk_class #32770
   }
   Else
   {
      IfWinExist, Pen Tablet ahk_class #32770
      {
         ;~ ControlGet, OutputVar, Tab, , SysTabControl321, Pen Tablet ahk_class #32770
         SendMessage, 0x1330, 1,, SysTabControl321, Pen Tablet ahk_class #32770  ; 0x1330 is TCM_SETCURFOCUS.
      
         WinHide, Pen Tablet ahk_class #32770
      }
      Else
      {
         run, %A_WinDir%\System32\TabCfg.exe

         ;~ WinWait, Pen Tablet ahk_class #32770,,1
         IfWinExist, Pen Tablet ahk_class #32770
         {
            WinHide, Pen Tablet ahk_class #32770
         }
      }
   }
Return

; Ctrl + Tilade = SHOW Huion
^`::
   WinShow, Pen Tablet ahk_class #32770
   IfWinNotActive, Pen Tablet ahk_class #32770, , WinActivate, Pen Tablet ahk_class #32770,
Return

; Shift + Tilda - HIDE Huion
+`::
   IfWinExist, Pen Tablet ahk_class #32770
   {
      ;~ ControlGet, OutputVar, Tab, , SysTabControl321, Pen Tablet ahk_class #32770
      SendMessage, 0x1330, 1,, SysTabControl321, Pen Tablet ahk_class #32770  ; 0x1330 is TCM_SETCURFOCUS.
      
      WinHide, Pen Tablet ahk_class #32770
   }
Return