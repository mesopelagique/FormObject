Class extends Element

Class constructor
	C_OBJECT:C1216($1; $2)
	Super:C1705($1)
	This:C1470.form:=$2
	
	If (This:C1470["objects"]#Null:C1517)
		C_TEXT:C284($key)
		C_OBJECT:C1216($object)
		For each ($key; This:C1470["objects"])
			$object:=This:C1470["objects"][$key]
			If (mapObjects[$object.type]#Null:C1517)
				This:C1470["objects"][$key]:=mapObjects[$object.type].new($object; $2)  // + pass page? or page instead of form
				This:C1470["objects"][$key].name:=$key
			End if 
		End for each 
	End if 