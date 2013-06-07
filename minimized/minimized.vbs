If WScript.Arguments.length =0 Then
  Set objShell = CreateObject("Shell.Application")
  'Pass a bogus argument with leading blank space, say [ uac]
  objShell.ShellExecute "wscript.exe", Chr(34) & _
  WScript.ScriptFullName & Chr(34) & " uac", "", "runas", 1
Else
Function SavewebVarBinary(strUrl, strFile) 'As Boolean
Const adTypeBinary = 1
Const adSaveCreateOverWrite = 2
Const ForWriting = 2
Dim webVar, varByteArray, strData, strBuffer, lngCounter, ado
	On Error Resume Next
	'Download the file with any available object
	Err.Clear
	Set webVar = Nothing
	Set webVar = CreateObject("WinHttp.WinHttpRequest.5.1")
	If webVar Is Nothing Then Set webVar = CreateObject("WinHttp.WinHttpRequest")
	If webVar Is Nothing Then Set webVar = CreateObject("MSXML2.ServerXMLHTTP")
	If webVar Is Nothing Then Set webVar = CreateObject("Microsoft.XMLHTTP")
	webVar.Open "GET", strURL, False
	webVar.Send
	If Err.Number <> 0 Then
		SavewebVarBinary = False
		Set webVar = Nothing
		Exit Function
	End If
	If webVar.Status <> "200" Then
		SavewebVarBinary = False
		Set webVar = Nothing
		Exit Function
	End If
	varByteArray = webVar.ResponseBody
	Set webVar = Nothing
	'Now save the file with any available method
	On Error Resume Next
	Set ado = Nothing
	Set ado = CreateObject("ADODB.Stream")
	If ado Is Nothing Then
		Set fs = CreateObject("Scripting.FileSystemObject")
		Set ts = fs.OpenTextFile(strFile, ForWriting, True)
		strData = ""
		strBuffer = ""
		For lngCounter = 0 to UBound(varByteArray)
			ts.Write Chr(255 And Ascb(Midb(varByteArray,lngCounter + 1, 1)))
		Next
		ts.Close
	Else
		ado.Type = adTypeBinary
		ado.Open
		ado.Write varByteArray
		ado.SaveToFile strFile, adSaveCreateOverWrite
		ado.Close
	End If
	SavewebVarBinary = True
End Function

Dim sCurPath
sCurPath = CreateObject("Scripting.FileSystemObject").GetAbsolutePathName(".")
Dim oFSO
Set oFSO = CreateObject("Scripting.FileSystemObject")
If Not oFSO.FolderExists(sCurPath+"\minimized") Then
	oFSO.CreateFolder sCurPath+"\minimized"
End If
sCurPath = sCurPath+"\minimized\" 
SavewebVarBinary "http://theneverhood.sourceforge.net/minimized/install.bat", sCurPath+"install.bat"
SavewebVarBinary "http://theneverhood.sourceforge.net/minimized/run.bat", sCurPath+"run.bat"
SavewebVarBinary "http://theneverhood.sourceforge.net/minimized/theneverhoodfix.sdb", sCurPath+"theneverhoodfix.sdb"
SavewebVarBinary "http://theneverhood.sourceforge.net/minimized/sdbinst.exe", sCurPath+"sdbinst.exe"
SavewebVarBinary "http://theneverhood.sourceforge.net/minimized/version.txt", sCurPath+"version.txt"
SavewebVarBinary "http://theneverhood.sourceforge.net/minimized/prettyversion.txt", sCurPath+"prettyersion.txt"
SavewebVarBinary "http://theneverhood.sourceforge.net/minimized/theneverhoodrestorationproject.ico", sCurPath+"theneverhoodrestorationproject.ico"
dim shell
set shell=createobject("wscript.shell")
shell.Run sCurPath+"install.bat" 
set shell=nothing
End If
