# FormParser

Parse form JSON 4DForm files, to create classes, provide functions and why not generate some codes.

## Parsing a form

### by passing the form name

```4d
$form:=$parser.parse("MyFormName) // return your form object
```

### by passing the `4DForm` file

```4d
$formsFolder:=Folder(fk database folder).folder("Project/Sources/Forms")
$formFile:=$formsFolder.folder("FormButton").file("form.4DForm")

$form:=$parser.parse($formFile)
```

## Parsing all forms

```4d
$forms:=$parser.parseAll()
```

## Examples of usage

### get an object by its name

```4d
$myButton0:=$form.pages[1].objects["Button0"]
```

#### and manipulate it with functions

There is a log of getter and setters for [`Object`](Project/Sources/Classes/Object.4dm)
```4d
$myButton0.setVisible(False)
$myButton0.setEnabled(False)
// or $myButton0.apply(New object("visible"; False; "enabled"; False))
```

### generate event code

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

### generate code with class wrapper

If you make an object or class wrapper for 4d methods and its graphic element such as https://github.com/vdelachaux/classes, you can generate default code for form or object methods. according to our need.

🚧 ...
