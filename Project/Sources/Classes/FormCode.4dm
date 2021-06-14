Class constructor
	
Function onInvoke($editor : Object)->$result : Object
	
	var $form : Object
	$form:=formParser().parse($editor.editor.form)
	
	var $objectName : Text
	$objectName:="This"
	
	var $classStore : Text
	$classStore:="cs"
	
	var $code : Text
	$code:=""
	
	
	var $object : Object
	
	If (This:C1470.hasSelectedOneObject($editor))
		$object:=This:C1470.getSelectedObject($editor)
		$code:=$code+This:C1470.code($object; $objectName; $classStore)+"\n"
	Else 
		For each ($object; $form.objects())
			$code:=$code+This:C1470.code($object; $objectName; $classStore)+"\n"
		End for each 
	End if 
	
	SET TEXT TO PASTEBOARD:C523($code)
	
Function code($object : Object; $objectName : Text; $classStore : Text)->$code : Text
	$code:=$objectName+"[\""+$object.name+"\"]:="+$classStore+"."+$object.type+".new(\""+$object.name+"\")"
	
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