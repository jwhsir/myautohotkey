#SingleInstance force
; See https://wyagd001.github.io/zh-cn/docs/commands/_SingleInstance.htm
; force �����Ի����Զ��滻��ʵ��

if not A_IsAdmin
Run *RunAs "%A_ScriptFullPath%"
; �Թ���Ա�������

^F12::
Sleep 100
SendMessage, 0x112, 0xF170, 2,, Program Manager
BlockInput, On
return
    #UseHook
    LWin & F12::
    BlockInput, Off ;ȡ����������
    Send {LCtrl}{RCtrl} ;ͬʱ��������Ctrl
    return

#IfWinActive ahk_class AcrobatSDIWindow
^c:: 
    clipboard := ""    
    Send ^c            
    ClipWait 0.2          
    
    ;����
    clipboard := StrReplace(clipboard, "`r`n", "")   
    clipboard := StrReplace(clipboard, " ", "")    
      

    ;Ӣ��
    ;clipboard := StrReplace(clipboard, "`r`n", " ")   
    ;clipboard := StrReplace(clipboard, "- ", "")      

    Clipwait 0.2
return

#IfWinActive ahk_class AcrobatSDIWindow
!c::  
        
    ;����
    clipboard := StrReplace(clipboard, "`r`n", "")   
    clipboard := StrReplace(clipboard, " ", "")        

    ;Ӣ��
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
    
    ;����
    clipboard := StrReplace(clipboard, "`r`n", "")   
    clipboard := StrReplace(clipboard, " ", "")  

    ;Ӣ��
    ;clipboard := StrReplace(clipboard, "`r`n", " ")   
    ;clipboard := StrReplace(clipboard, "- ", "")      

    Clipwait
return

;---OneNote---
;Alt+K ʵ��ѡ���ַ���Ϊ����
#IfWinActive ahk_class Framework::CFrame
!k:: 
    Send !2
    Send ����
    send {enter}
    send {escape}
 return

 ;Alt+T ʵ��ȫ���ַ���ΪTimew New Roman
#IfWinActive ahk_class Framework::CFrame
!t:: 
    Send ^a
    Send ^a ; ����Ctrl+A
    Send !2
    Send Times New Roman
    send {enter}
    send {escape}
 return

;Alt+J �����м�� 0 2 11 
#IfWinActive ahk_class Framework::CFrame
!j:: 
    Send ^a
    Send ^a ; ����Ctrl+A
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
