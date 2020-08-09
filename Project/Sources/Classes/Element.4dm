Class constructor
	C_OBJECT:C1216($1)
	C_TEXT:C284($key)
	For each ($key; $1)
		This:C1470[$key]:=$1[$key]
	End for each 
	
Function generateEventCode
	C_TEXT:C284($0)
	$0:="$eventCode:=Form event code\n"
	If (This:C1470.events#Null:C1517)
		$0:=$0+"Case of\n"
		
		C_TEXT:C284($event; $event4DCode)
		For each ($event; This:C1470.events)
			$event4DCode:=uncamelCase($event)
			Case of 
				: ($event4DCode="On Click")
					$event4DCode:="On Clicked"
				: ($event4DCode="On Double Click")
					$event4DCode:="On Double Clicked"
			End case 
			
			$0:=$0+" : ($eventCode="+$event4DCode+")\n\n"
		End for each 
		$0:=$0+" Else\n\n"
		$0:=$0+"End case"
	End if 
	