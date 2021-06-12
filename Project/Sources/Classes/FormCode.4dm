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
		$code:=$code+$objectName+"[\""+$object.id+"\"]:="+$classStore+"."+$object.object.type+".new(\""+$object.id+"\")"+"\r\n"
	Else 
		For each ($object; $form.objects())
			$code:=$code+$objectName+"[\""+$object.name+"\"]:="+$classStore+"."+$object.type+".new(\""+$object.name+"\")"+"\r\n"
		End for each 
	End if 
	
	SET TEXT TO PASTEBOARD:C523($code)
	
	/// copyed from https://github.com/mesopelagique/Example-FormMacro-CopyPasteStyle/blob/master/Project/Sources/Classes/FormMacro.4dm :
	
Function getSelectedObject($editor : Object)->$selected : Object
	ASSERT:C1129($editor.editor.currentSelection.length=1)
	$selected:=New object:C1471("id"; $editor.editor.currentSelection[0])
	$selected.object:=$editor.editor.currentPage.objects[$selected.id]
	
	// Has selected one objet only
Function hasSelectedOneObject($editor : Object)->$has : Boolean
	$has:=$editor.editor.currentSelection.length=1