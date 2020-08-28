//%attributes = {}

C_OBJECT:C1216($parser; $formsFolder; $form; $formFile)
$parser:=formParser

$formsFolder:=Folder:C1567(fk database folder:K87:14).folder("Project/Sources/Forms")

// init with file
$formFile:=$formsFolder.folder("FormButton").file("form.4DForm")
$form:=$parser.parse($formFile)
ASSERT:C1129($form#Null:C1517)
ASSERT:C1129($form.pages.length=2)

ASSERT:C1129(OB Instance of:C1731($form.pages[1].objects["Button0"]; cs:C1710.Button))
ASSERT:C1129(OB Instance of:C1731($form.pages[1].objects["Button1"]; cs:C1710.Button))

ASSERT:C1129(Not:C34($form.pages[1].objects["Button0"].isVisible()))  // tu, not form visible
//$form.pages[1].objects["Button0"].apply(New object("visible";True))

/// test some code generation
ASSERT:C1129(Length:C16($form.generateEventCode())>0)
$form.setMethodCode($form.generateEventCode())

C_OBJECT:C1216($element)
$element:=$form.pages[1].objects["Button0"]
$element.setMethodCode($element.generateEventCode())


// test init with name
$form:=$parser.parse("FormInput")
ASSERT:C1129($form#Null:C1517)
ASSERT:C1129($form.pages.length=2)

ASSERT:C1129(OB Instance of:C1731($form.pages[1].objects["Input"]; cs:C1710.Input))

// test init with folder
$formFile:=$formsFolder.folder("FormTest")
$form:=$parser.parse($formFile)
ASSERT:C1129($form#Null:C1517)
ASSERT:C1129($form.pages.length=2)

ASSERT:C1129(OB Keys:C1719($form.pages[1].objects).length>0)


// get all form
C_COLLECTION:C1488($forms)
$forms:=$parser.parseAll()
ASSERT:C1129($forms.length=3)

