Class constructor($conf : Object)
	This:C1470.type:=$conf.type
	This:C1470.macros:="tets"
	
Function onInvoke($editor : Object)->$result : Object
	
	var $form : Object
	$form:=formParser().parse($editor.editor.form)
	
	var $cssFile : 4D:C1709.File
	$cssFile:=Folder:C1567(fk database folder:K87:14; *).file("Project/Sources/styleSheets.css")
	var $currentCss : Text
	$currentCss:=""
	var $elems : Collection
	$elems:=New collection:C1472()
	If ($cssFile.exists)
		$currentCss:=$cssFile.getText("UTF-8"; Document with LF:K24:22)
		
		// very simple way to parse css and get elem to avoid duplicate
		// XXX maybe use some regex instead
		var $line : Text
		For each ($line; Split string:C1554($currentCss; "\n"))
			var $pos : Integer
			$pos:=Position:C15("{"; $line)
			If ($pos>0)
				$line:=Substring:C12($line; 1; $pos-1)
				While (($line[[Length:C16($line)]]=" "))
					$line:=Substring:C12($line; 1; Length:C16($line)-1)
				End while 
				
				$elems.push($line)
			End if 
		End for each 
	End if 
	
	
	var $css : Text
	$css:=""
	
	var $object : Object
	
	If (This:C1470.hasSelectedOneObject($editor))
		$object:=This:C1470.getSelectedObject($editor)
		$css:=$css+This:C1470.css($object; $elems)+"\n"
	Else 
		For each ($object; $form.objects())
			$css:=$css+This:C1470.css($object; $elems)+"\n"
		End for each 
	End if 
	
	
	$currentCss:=$currentCss+"\n"+$css
	
	$cssFile.setText($currentCss; "UTF-8"; Document with LF:K24:22)
	
	If (Shift down:C543)
		SHOW ON DISK:C922($cssFile.platformPath)
	End if 
	
Function css($object : Object; $elems : Collection)->$css : Text
	
	If ((This:C1470.type="") | (This:C1470.type="name"))
		$css:=This:C1470.elem("#"+$object.name; $elems)
	End if 
	
	If ((This:C1470.type="") | (This:C1470.type="class"))
		If (Length:C16(String:C10($object.class))>0)
			$css:=$css+"\n"+This:C1470.elem("."+$object.class; $elems)
		End if 
	End if 
	
Function elem($elem : Text; $elems : Collection)->$css : Text
	If ($elems.indexOf($elem)>=0)
		// ignore
	Else 
		$css:=$elem+" {"+"\n"
		$css:=$css+"    /* generated */"+"\n"
		$css:=$css+"}"+"\n"
		$elems.push($elem)
	End if 
	
	/// copyed from https://github.com/mesopelagique/Example-FormMacro-CopyPasteStyle/blob/master/Project/Sources/Classes/FormMacro.4dm :
	
Function getSelectedObject($editor : Object)->$selected : Object
	ASSERT:C1129($editor.editor.currentSelection.length=1)
	var $name : Text
	$name:=$editor.editor.currentSelection[0]
	$selected:=$editor.editor.currentPage.objects[$name]
	$selected.name:=$name
	
	// Has selected one objet only
Function hasSelectedOneObject($editor : Object)->$has : Boolean
	$has:=$editor.editor.currentSelection.length=1