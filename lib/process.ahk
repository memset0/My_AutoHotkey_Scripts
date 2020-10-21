ProcessList() {
  buffer_size := 4096

  ScriptPID := ProcessExist()
  h := DllCall("OpenProcess", "UInt", 0x0400, "Int", false, "UInt", ScriptPID, "Ptr")
  DllCall("Advapi32.dll\OpenProcessToken", "Ptr", h, "UInt", 32, "PtrP", t := 0)
  DllCall("Advapi32.dll\LookupPrivilegeValue", "Ptr", 0, "Str", "SeDebugPrivilege", "Int64P", luid := 0)
  ti := BufferAlloc(16, 0)
  NumPut( "UInt", 1, "Int64", luid, "UInt", 2, ti)
  r := DllCall("Advapi32.dll\AdjustTokenPrivileges", "Ptr", t, "Int", false, "Ptr", ti, "UInt", 0, "Ptr", 0, "Ptr", 0)
  DllCall("CloseHandle", "Ptr", t) 
  DllCall("CloseHandle", "Ptr", h) 

  hModule := DllCall("LoadLibrary", "Str", "Psapi.dll")
  a := BufferAlloc(buffer_size)
	process_list := Array()
  DllCall("Psapi.dll\EnumProcesses", "Ptr", a, "UInt", buffer_size, "UIntP", r)
  Loop r // 4   {
    id := NumGet(a, A_Index * 4, "UInt")
    h := DllCall("OpenProcess", "UInt", 0x0010 | 0x0400, "Int", false, "UInt", id, "Ptr")
    if !h {
      continue
    }
    n := BufferAlloc(buffer_size, 0) 
    e := DllCall("Psapi.dll\GetModuleBaseName", "Ptr", h, "Ptr", 0, "Ptr", n, "UInt", buffer_size // 2)
    if !e { 
      e := DllCall("Psapi.dll\GetProcessImageFileName", "Ptr", h, "Ptr", n, "UInt", buffer_size // 2)
    }
    SplitPath StrGet(n), n
    DllCall("CloseHandle", "Ptr", h) 
    if n && e {
			process_list.Push(n)
    }
  }
  DllCall("FreeLibrary", "Ptr", hModule)
	return process_list
}