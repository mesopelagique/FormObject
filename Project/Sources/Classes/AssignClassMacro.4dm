

Class constructor($conf : Object)
	
Function onInvoke($editor : Object)->$result : Object
	If ($editor.editor.currentSelection.length=0)
		ALERT:C41("No element selected")
	Else 
		
		var $regex : Text
		$regex:="\\.(-?[_a-zA-Z]+[_a-zA-Z0-9-]*)\\s*\\{"
		
		var $cssFile : 4D:C1709.File
		$cssFile:=Folder:C1567(fk database folder:K87:14; *).file("Project/Sources/styleSheets.css")
		
		var $classNames : Collection
		$classNames:=New collection:C1472()
		var $className : Text
		If ($cssFile.exists)
			var $css : Text
			$css:=$cssFile.getText("UTF-8"; Document with LF:K24:22)
			
			var $cssLine : Text
			For each ($cssLine; Split string:C1554($css; "\n"))
				ARRAY LONGINT:C221($pos_found_array; 0)
				ARRAY LONGINT:C221($length_found_array; 0)
				var $vfound : Boolean
				$vfound:=Match regex:C1019($regex; $cssLine; 1; $pos_found_array; $length_found_array)
				
				If ($vfound)
					$className:=Substring:C12($cssLine; $pos_found_array{1}; $length_found_array{1})
					$classNames.push($className)
				End if 
			End for each 
			
			If ($classNames.length=0)
				
				ALERT:C41("No class found in css")
				
			End if 
			
		Else 
			ALERT:C41("No Css file found.")
			
		End if 
		
		If ($classNames.length#0)
			
			var $menu : Variant
			$menu:=Create menu:C408()
			
			For each ($className; $classNames)
				APPEND MENU ITEM:C411($menu; $className)
				SET MENU ITEM PARAMETER:C1004($menu; -1; $className)
			End for each 
			var $choice : Text
			$choice:=Dynamic pop up menu:C1006($menu)
			
			If (Length:C16($choice)>0)
				
				// apply to selection
				var $name : Text
				For each ($name; $editor.editor.currentSelection)
					$editor.editor.currentPage.objects[$name].class:=$choice
				End for each 
				
				
				// Notify to 4D the modification
				$result:=New object:C1471("currentPage"; $editor.editor.currentPage)
				
			End if 
		End if 
		RELEASE MENU:C978($menu)
		
		
	End if 