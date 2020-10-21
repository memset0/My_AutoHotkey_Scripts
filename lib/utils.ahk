; 强制激活应用
;   如果应用已经被打开，则将被激活
;   如果应用没有被打开，则将被打开并激活
ExeActivate(dir) {
  if winExist("ahk_exe " . dir) {
    winActivate("ahk_exe " . dir)
  } else {
    run(dir)
  }
}

; 当前激活窗口相关 API
ActiveWinId() {
  return WinExist("A")
}
ActiveWinTitle() {
  return WinGetTitle(ActiveWinId())
}
ActiveWinClass() {
  return WinGetClass(ActiveWinId())
}
ActiveWinProcessPath() {
  return WinGetProcessPath(ActiveWinId())
}