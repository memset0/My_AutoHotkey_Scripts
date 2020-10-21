#SingleInstance Force
setWorkingDir(A_ScriptDir)

; utils.ahk 常用工具类库
#Include lib\utils.ahk
; container.ahk 容器（Array 等）相关类库
#Include lib\container.ahk
; process.ahk 进程相关工具类库
#Include lib\process.ahk

; hotkey.ahk 热键映射
#Include src\hotkey.ahk
; launch.ahk 启动应用程序
#Include src\launch.ahk
; debugger.ahk 调试用脚本
#Include src\debugger.ahk
