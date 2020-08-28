# Form Object

[![language][code-shield]][code-url]
[![language-top][code-top]][code-url]
![code-size][code-size]
[![release][release-shield]][release-url]
[![license][license-shield]][license-url]
[![discord][discord-shield]][discord-url]

Parse form JSON 4DForm files, to create classes, provide functions and why not generate some codes.

## Getting the current form object as instance of `Form` object


```4d
formParser:=formParser() // do only one time to get the parser
```

Then in form context

```4d
$form:=formParser.current()
```

## Parsing a form ie. getting an instance of `Form`

### by passing the form name

```4d
$form:=formParser.parse("MyFormName") // return your form object
```

### by passing the `4DForm` file

```4d
$formsFolder:=Folder(fk database folder).folder("Project/Sources/Forms")
$formFile:=$formsFolder.folder("FormButton").file("form.4DForm")

$form:=formParser.parse($formFile)
```

## Parsing all forms

```4d
$forms:=formParser.parseAll() // collection of Form
```

## Examples of usage

### getting an object by its name

```4d
$myButton:=$form.pages[1].objects["Button0"]
```

#### and manipulate it with functions

There is a log of getter and setters for [`Object`](Project/Sources/Classes/Object.4dm)

```4d
$myButton.setVisible(False)
$myButton.setEnabled(False)
// or $myButton.apply(New object("visible"; False; "enabled"; False))
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

## Other components

[<img src="https://mesopelagique.github.io/quatred.png" alt="mesopelagique"/>](https://mesopelagique.github.io/)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[code-shield]: https://img.shields.io/static/v1?label=language&message=4d&color=blue
[code-top]: https://img.shields.io/github/languages/top/mesopelagique/FormObject.svg
[code-size]: https://img.shields.io/github/languages/code-size/mesopelagique/FormObject.svg
[code-url]: https://developer.4d.com/
[release-shield]: https://img.shields.io/github/v/release/mesopelagique/FormObject
[release-url]: https://github.com/mesopelagique/FormObject/releases/latest
[license-shield]: https://img.shields.io/github/license/mesopelagique/FormObject
[license-url]: LICENSE.md
[discord-shield]: https://img.shields.io/badge/chat-discord-7289DA?logo=discord&style=flat
[discord-url]: https://discord.gg/dVTqZHr
