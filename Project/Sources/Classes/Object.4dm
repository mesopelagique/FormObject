Class extends Element

Class constructor
	C_OBJECT:C1216($1; $2)
	Super:C1705($1)
	This:C1470.form:=$2
	
Function defaultFile
	C_OBJECT:C1216($0)
	$0:=This:C1470.form.objectMethodsFolder().file(This:C1470.id+".4dm")
	
Function file
	C_OBJECT:C1216($0)
	If ($0.method#Null:C1517)
		$0:=This:C1470.form.file.parent.file($0.method)
	Else 
		$0:=This:C1470.defaultFile()
	End if 
	
Function setMethodCode
	C_TEXT:C284($1)
	This:C1470.file().setText($1)
	
Function getMethodCode
	C_TEXT:C284($0)
	C_OBJECT:C1216($f)
	$f:=This:C1470.file()
	If ($f.exists)
		$0:=$f.getText()
	Else 
		$0:=""
	End if 