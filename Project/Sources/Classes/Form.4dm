Class extends Element

Class constructor
	C_VARIANT:C1683($1)
	
	C_OBJECT:C1216($file)
	If (Count parameters:C259>0)
		Case of 
			: (Value type:C1509($1)=Is text:K8:3)  // suppose form name
				$file:=Folder:C1567(fk database folder:K87:14; *).folder("Project/Sources/Forms").folder($1).file("form.4DForm")
			: (Value type:C1509($1)#Is object:K8:27)
				// error init
			: (OB Instance of:C1731($1; 4D:C1709.File))
				$file:=$1
			: (OB Instance of:C1731($1; 4D:C1709.Folder))
				$file:=$1.file("form.4DForm")
			Else 
				// error init
		End case 
	Else 
		If (Length:C16(Current form name:C1298)>0)
			$file:=Folder:C1567(fk database folder:K87:14; *).folder("Project/Sources/Forms").folder(Current form name:C1298).file("form.4DForm")
		Else 
			// error init
		End if 
	End if 
	
	If ($file#Null:C1517)
		If ($file.exists)
			Super:C1705(JSON Parse:C1218($file.getText()))
			This:C1470.file:=$file
			This:C1470["pages"]:=This:C1470["pages"].map("mapClass"; cs:C1710.Page; This:C1470)
		Else 
			Super:C1705(New object:C1471())  // error init
		End if 
	Else 
		Super:C1705(New object:C1471())  // error init
	End if 
	
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
	C_OBJECT:C1216($0)
	$0:=This:C1470.file.parent.folder("ObjectMethods")