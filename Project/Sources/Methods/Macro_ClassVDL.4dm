//%attributes = {"invisible":true,"shared":true}
#DECLARE($methodPath : Text; $objectName : Text; $classStore : Text)

If (Count parameters:C259>1)
	If (Length:C16($objectName)=0)
		$objectName:="This"
	End if 
End if 
If (Count parameters:C259>2)
	If (Length:C16($classStore)=0)
		$classStore:="cs"
	End if 
End if 

var $formFile : Object
$formFile:=Get4DFormFile($methodPath)

If ($formFile#Null:C1517)
	
	var $parser : Object
	$parser:=formParser
	var $form : Object
	$form:=$parser.parse($formFile)
	
	var $code : Text
	
	$code:=""
	var $object : Object
	var $type : Text
	For each ($object; $form.objects())
		$code:=$code+$objectName+"[\""+$object.name+"\"]:="+$classStore+"."+$object.type+".new(\""+$object.name+"\")"+"\r\n"
	End for each 
	
	SET TEXT TO PASTEBOARD:C523($code)
	
End if 