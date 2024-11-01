;; 用于自动化输入 wifi 密码，需修改 [YOUR_PASSWORD]

; 设置输入法
IME_SET(setSts, WinTitle="")
{
    ifEqual WinTitle,,  SetEnv,WinTitle,A
    WinGet,hWnd,ID,%WinTitle%
    DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)

    ;Message : WM_IME_CONTROL  wParam:IMC_SETOPENSTATUS
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, 0x006,setSts,,ahk_id %DefaultIMEWnd%
    DetectHiddenWindows,%DetectSave%
    Return ErrorLevel
}

CoordMode, Mouse, Screen

;点[操作中心]
MouseClick, left, 1879, 1064
Sleep, 500

;点[网络]
MouseClick, left, 1680, 780
Sleep, 1000

;滚动到[隐藏的网络]
Loop 100
    Click WheelDown
Sleep, 1000

;点[隐藏的网络]
MouseClick, left, 1730, 900
Sleep, 500

;点[连接]
MouseClick, left, 1840, 880
Sleep, 500

;点[输入框]
MouseClick, left, 1740, 840
;MouseClick, left, 1700, 800
Sleep, 500

;切换英文输入法
IME_SET(0)
Sleep, 500

;输入[SSID]
Send os
Sleep, 100

;点[下一步]
MouseClick, left, 1688, 888
Sleep, 1000

;输入[密码]
Send [YOUR_PASSWORD]
Sleep, 500

;点[下一步]
MouseClick, left, 1688, 888
Sleep, 500

;点[是]
MouseClick, left, 1688, 888
Sleep, 500


