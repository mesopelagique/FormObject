Class extends Element

Class constructor
	C_OBJECT:C1216($1)  // File
	Super:C1705(JSON Parse:C1218($1.getText()))
	
	This:C1470.file:=$1
	
	This:C1470["pages"]:=This:C1470["pages"].map("mapClass"; cs:C1710.Page; This:C1470)
	
Function setMethodCode
	C_TEXT:C284($1)
	This:C1470.file.parent.file("method.4dm").setText($1)
	
Function getMethodCode
	C_TEXT:C284($0)
	C_OBJECT:C1216($f)
	$f:=This:C1470.file.parent.file("method.4dm")
	If ($f.exists)
		$0:=$f.getText()
	Else 
		$0:=""
	End if 
	
Function objectMethodsFolder
	$0:=This:C1470.file.parent.folder("ObjectMethods")