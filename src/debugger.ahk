F8:: {
  return
}

; (F8) + Ctrl + R => 重启脚本
#HotIf GetKeyState("F8")
^r:: {
  if pid := ProcessExist("AutoHotkeyU32.exe") {
    ProcessClose(pid)
  }
  if pid := ProcessExist("AutoHotkeyU64.exe") {
    ProcessClose(pid)
  }

  Run("index.ahk")
}

; (F8) + Ctrl + W => Window 对象调试信息
#HotIf GetKeyState("F8")
^w:: {
  id := WinExist("A")

  if id {
    response := "[AHK DEBUGGER]`n"
    response .= "id: " . id . "`n"
    response .= "title: " . winGetTitle(id) . "`n"
    response .= "class: " . winGetClass(id) . "`n"
    response .= "process_path: " . winGetProcessPath(id) . "`n"
    MsgBox(response)
  } else {
    MsgBox("无法找到 Window ID")
  }
}