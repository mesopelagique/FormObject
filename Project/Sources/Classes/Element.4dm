Class constructor
	C_OBJECT:C1216($1)
	C_TEXT:C284($key)
	For each ($key; $1)
		This:C1470[$key]:=$1[$key]
	End for each 
	This:C1470.lineDelimiter:="\r\n"
	
Function generateEventCode
	C_TEXT:C284($0)
	$0:="var $eventCode: Integer"+This:C1470.lineDelimiter
	$0:=$0+"$eventCode:=Form event code"+This:C1470.lineDelimiter
	If (This:C1470.events#Null:C1517)
		$0:=$0+"Case of"+This:C1470.lineDelimiter
		
		C_TEXT:C284($event; $event4DCode)
		For each ($event; This:C1470.events)
			$event4DCode:=uncamelCase($event)
			Case of 
				: ($event4DCode="On Click")
					$event4DCode:="On Clicked"
				: ($event4DCode="On Double Click")
					$event4DCode:="On Double Clicked"
				: ($event4DCode="On Menu Select")
					$event4DCode:="On Menu Selected"
				: ($event4DCode="On Plugin Area")
					$event4DCode:="On Plug in Area"
			End case 
			
			$0:=$0+" : ($eventCode="+$event4DCode+")"+This:C1470.lineDelimiter+This:C1470.lineDelimiter
		End for each 
		$0:=$0+" Else"+This:C1470.lineDelimiter+This:C1470.lineDelimiter
		$0:=$0+"End case"
	End if 
	