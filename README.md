# FormParser

Parse form JSON 4DForm file, to create classes and why not generate some code

## Usage

### Parsing a form

#### by assing the form name

```4d
$form:=$parser.parse("MyFormName)
```

#### by passing the `4DForm` file
```4d
$formsFolder:=Folder(fk database folder).folder("Project/Sources/Forms")
$formFile:=$formsFolder.folder("FormButton").file("form.4DForm")

$form:=$parser.parse($formFile)
```

### Examples

#### generate event code

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

#### generate code with class wrapper

If you make an object or class wrapper for 4d methods and its graphic element such as https://github.com/vdelachaux/classes, you can generate default code for form or object methods. according to our need.

🚧 ...
