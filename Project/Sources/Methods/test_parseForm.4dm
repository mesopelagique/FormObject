//%attributes = {}
$parser:=formParser

$formsFolder:=Folder:C1567(fk database folder:K87:14).folder("Project/Sources/Forms")

$formFile:=$formsFolder.folder("FormButton").file("form.4DForm")
$form:=$parser.parse($formFile)
ASSERT:C1129($form#Null:C1517)
ASSERT:C1129($form.pages.length=2)

ASSERT:C1129(Length:C16($form.generateEventCode())>0)

$form.setMethodCode($form.generateEventCode())

$element:=$form.pages[1].objects["Button"]
$element.setMethodCode($element.generateEventCode())

ASSERT:C1129(OB Instance of:C1731($form.pages[1].objects["Button"]; cs:C1710.Button))
ASSERT:C1129(OB Instance of:C1731($form.pages[1].objects["Button1"]; cs:C1710.Button))

$formFile:=$formsFolder.folder("FormInput").file("form.4DForm")
$form:=$parser.parse($formFile)
ASSERT:C1129($form#Null:C1517)
ASSERT:C1129($form.pages.length=2)

ASSERT:C1129(OB Instance of:C1731($form.pages[1].objects["Input"]; cs:C1710.Input))

$formFile:=$formsFolder.folder("FormTest").file("form.4DForm")
$form:=$parser.parse($formFile)
ASSERT:C1129($form#Null:C1517)
ASSERT:C1129($form.pages.length=2)

ASSERT:C1129(OB Keys:C1719($form.pages[1].objects).length>0)