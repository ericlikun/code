Set Shell = CreateObject("WScript.Shell")
DesktopPath = Shell.SepcialFolders("Desktop")
Set link = Shell.CreateShortcut(DesktopPath & "\MASM32 Editor.lnk")
link.Description = "MASM32 Editor"
link.TargetPath = "C:\masm32\qeditor.exe"
link.WindowStyle = 2
link.WorkingDirectory = "C:\masm32"
link.Save