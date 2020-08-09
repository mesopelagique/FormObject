//%attributes = {}
C_COLLECTION:C1488($0)
$0:=New collection:C1472()

C_OBJECT:C1216($formFolder; $folder)
$folder:=Folder:C1567(fk database folder:K87:14; *).folder("Project/Sources/Forms")
For each ($formFolder; $folder.folders())
	If ($formFolder.file("form.4DForm").exists)
		$0.push(cs:C1710.Form.new($formFolder))
	End if 
End for each 
