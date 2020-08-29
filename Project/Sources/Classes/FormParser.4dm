
/* parse the current form (must be in form context) */
Function current
	C_OBJECT:C1216($0)
	$0:=cs:C1710.Form.new(Current form name:C1298)
	
/* parse one form */
Function parse
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=cs:C1710.Form.new($1)
	
/* return all parsed forms */
Function parseAll
	C_COLLECTION:C1488($0)
	$0:=New collection:C1472()
	
	C_OBJECT:C1216($formFolder; $folder)
	$folder:=Folder:C1567(fk database folder:K87:14; *).folder("Project/Sources/Forms")
	For each ($formFolder; $folder.folders())
		If ($formFolder.file("form.4DForm").exists)
			$0.push(cs:C1710.Form.new($formFolder))
		End if 
	End for each 
	
/* get cs of this component */
Function cs
	C_OBJECT:C1216($0)
	$0:=cs:C1710
	
/* create an object without parsing */
Function object
	C_OBJECT:C1216($0)
	C_TEXT:C284($1)
	C_TEXT:C284($2)
	If (Count parameters:C259>1)
		If (mapObjects[$2]#Null:C1517)
			$0:=mapObjects[$2].new(New object:C1471("type"; $2); Null:C1517)  // + pass page? or page instead of form
			$0.name:=$1
		Else 
			$0:=cs:C1710.Object.new(New object:C1471(); $1)
		End if 
	Else 
		$0:=cs:C1710.Object.new(New object:C1471(); $1)
	End if 
	
Function button
	$0:=This:C1470.object($1; "button")
	
Function input
	$0:=This:C1470.object($1; "input")
	
Function text
	$0:=This:C1470.object($1; "text")
	
Function progress
	$0:=This:C1470.object($1; "progress")
	
Function checkbox
	$0:=This:C1470.object($1; "checkbox")
	
Function splitter
	$0:=This:C1470.object($1; "splitter")
	
Function combo
	$0:=This:C1470.object($1; "combo")
	
Function buttonGrid
	$0:=This:C1470.object($1; "buttonGrid")
	
Function radio
	$0:=This:C1470.object($1; "radio")
	