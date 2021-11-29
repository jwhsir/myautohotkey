#SingleInstance force
; See https://wyagd001.github.io/zh-cn/docs/commands/_SingleInstance.htm
; force 跳过对话框并自动替换旧实例

if not A_IsAdmin
Run *RunAs "%A_ScriptFullPath%"
; 以管理员身份运行

^F12::
Sleep 100
SendMessage, 0x112, 0xF170, 2,, Program Manager
BlockInput, On
return
    #UseHook
    LWin & F12::
    BlockInput, Off ;取消禁用输入
    Send {LCtrl}{RCtrl} ;同时按下两边Ctrl
    return

#IfWinActive ahk_class AcrobatSDIWindow
^c:: 
    clipboard := ""    
    Send ^c            
    ClipWait 0.2          
    
    ;中文
    clipboard := StrReplace(clipboard, "`r`n", "")   
    clipboard := StrReplace(clipboard, " ", "")    
      

    ;英文
    ;clipboard := StrReplace(clipboard, "`r`n", " ")   
    ;clipboard := StrReplace(clipboard, "- ", "")      

    Clipwait 0.2
return

#IfWinActive ahk_class AcrobatSDIWindow
!c::  
        
    ;中文
    clipboard := StrReplace(clipboard, "`r`n", "")   
    clipboard := StrReplace(clipboard, " ", "")        

    ;英文
    ;clipboard := StrReplace(clipboard, "`r`n", " ")   
    ;clipboard := StrReplace(clipboard, "- ", "")      

    Clipwait 0.2
return

;---FoxitReader---
#IfWinActive ahk_class classFoxitReader
^c::
    
    clipboard := ""   
    Send ^c           
    ClipWait          
    
    ;中文
    clipboard := StrReplace(clipboard, "`r`n", "")   
    clipboard := StrReplace(clipboard, " ", "")  

    ;英文
    ;clipboard := StrReplace(clipboard, "`r`n", " ")   
    ;clipboard := StrReplace(clipboard, "- ", "")      

    Clipwait
return

;---OneNote---
;Alt+K 实现选中字符变为楷体
#IfWinActive ahk_class Framework::CFrame
!k:: 
    Send !2
    Send 楷体
    send {enter}
    send {escape}
 return

 ;Alt+T 实现全文字符变为Timew New Roman
#IfWinActive ahk_class Framework::CFrame
!t:: 
    Send ^a
    Send ^a ; 两次Ctrl+A
    Send !2
    Send Times New Roman
    send {enter}
    send {escape}
 return

;Alt+J 调整行间距 0 2 11 
#IfWinActive ahk_class Framework::CFrame
!j:: 
    Send ^a
    Send ^a ; 两次Ctrl+A
    Send !9
    Send {tab}
    Send 2
    Send {tab}
    Send {11}
    send {enter}
 return

 ;-----------------------------------------------------------------

^+v::   ;work with clipboard: paste clipboard content as plain text
    ClipboardOld := ClipboardAll  ;save original clipboard contents
    Clipboard = %Clipboard%  ;store plain text from clipboard to clipboard
    Send ^v  ;send the Ctrl+V command
    Sleep, 250  ;give some time to finish paste (before restoring clipboard)
    Clipboard := ClipboardOld  ;restore the original clipboard contents
    ClipboardOld =  ;clear temporary variable (potentially contains large data)
    Return

^!v::   ;work with clipboard: paste clipboard content as plain text
    ClipboardOld := ClipboardAll  ;save original clipboard contents
    Clipboard = %Clipboard%  ;store plain text from clipboard to clipboard
    Send ^v  ;send the Ctrl+V command
    Sleep, 250  ;give some time to finish paste (before restoring clipboard)
    Clipboard := ClipboardOld  ;restore the original clipboard contents
    ClipboardOld =  ;clear temporary variable (potentially contains large data)
    Return
