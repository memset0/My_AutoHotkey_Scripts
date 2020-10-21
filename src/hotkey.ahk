; Ctrl + Q => 关闭当前应用窗口
^q:: {
  KeyWait("Control")
  Send("{Alt down}{F4}{Alt up}")
}

; [Explorer] Ctrl + Alt + C  => 复制当前文件拓展名
#HotIf ActiveWinProcessPath() == "C:\Windows\explorer.exe"
^!c:: {
  Send("^c")
  Sleep(233)

  dir := A_Clipboard ; A_Clipboard 中存储剪贴板中用文本表示的内容
  A_Clipboard := dir
}

; [Typora] Ctrl + Alt + D => 日期
#HotIf ActiveWinProcessPath() == "C:\Program Files\Typora\Typora.exe"
^!d:: {
  time := A_YYYY . "-" . A_MM . "-" . A_DD . " " . A_Hour . ":" . A_Min . ":" . A_Sec
  Send(time)
}
