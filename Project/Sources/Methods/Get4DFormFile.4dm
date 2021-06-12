//%attributes = {"invisible":true,"preemptive":"capable"}
#DECLARE($methodPath)->$formFile : Object

If (Position:C15("[projectForm]"; $methodPath)=1)
	
	var $formsFolder : Object
	$formsFolder:=Folder:C1567(fk database folder:K87:14; *).folder("Project/Sources/Forms")
	
	$methodPath:=Substring:C12($methodPath; Length:C16("[projectForm]")+2)
	
	var $split : Collection
	$split:=Split string:C1554($methodPath; "/")
	Case of 
		: ($split.length#0)
			$formFile:=$formsFolder.folder($split[0]).file("form.4DForm")
	End case 
	
End if 