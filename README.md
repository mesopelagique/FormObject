# FormParser

Par form JSON 4DForm file, to create classes and why not generate some code

## Usage

```4d
$formsFolder:=Folder(fk database folder).folder("Project/Sources/Forms")
$formFile:=$formsFolder.folder("FormButton").file("form.4DForm")

$form:=$parser.parse($formFile)
```

## Example: generate event code

Using this code, the form method code will be replaced by a `Case of` on all available events

```4d
$form.setMethodCode($form.generateEventCode())
```

example of result

```4d
$eventCode:=Form event code
Case of 
	: ($eventCode=On Load)
		
	: ($eventCode=On Page Change)
		
	: ($eventCode=On Validate)

	Else 
		
End case 

```
