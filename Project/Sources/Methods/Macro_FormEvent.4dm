//%attributes = {"invisible":true,"shared":true}
#DECLARE($methodPath : Text)

var $formFile : Object
$formFile:=Get4DFormFile($methodPath)

If ($formFile#Null:C1517)
	
	var $parser : Object
	$parser:=formParser
	var $form : Object
	$form:=$parser.parse($formFile)
	
	var $objectName : Text
	$objectName:=Split string:C1554(Substring:C12($methodPath; Length:C16("[projectForm]")+2); "/")[1]
	
	var $code : Text
	
	Case of 
		: ($objectName="{formMethod}")
			$code:=$form.generateEventCode()
		Else 
			var $object : Object
			$object:=$form.objectOfName($objectName)
			If ($object=Null:C1517)
				ALERT:C41("Cannot find "+$objectName+", maybe close or save the form")
			Else 
				$code:=$object.generateEventCode()
			End if 
	End case 
	
	SET MACRO PARAMETER:C998(Highlighted method text:K5:18; $code)
	
End if 