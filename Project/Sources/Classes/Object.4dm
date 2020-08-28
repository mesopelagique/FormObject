Class extends Element

Class constructor
	C_OBJECT:C1216($1; $2)
	Super:C1705($1)
	This:C1470.form:=$2
	
Function defaultFile
	C_OBJECT:C1216($0)
	$0:=This:C1470.form.objectMethodsFolder().file(This:C1470.name+".4dm")
	
Function file
	C_OBJECT:C1216($0)
	If ($0.method#Null:C1517)
		$0:=This:C1470.form.file.parent.file($0.method)
	Else 
		$0:=This:C1470.defaultFile()
	End if 
	
Function setMethodCode
	C_TEXT:C284($1)
	This:C1470.file().setText($1)
	
Function getMethodCode
	C_TEXT:C284($0)
	C_OBJECT:C1216($f)
	$f:=This:C1470.file()
	If ($f.exists)
		$0:=$f.getText()
	Else 
		$0:=""
	End if 
	
	// MARK:- visible
	
Function isVisible
	C_BOOLEAN:C305($0)
	$0:=OBJECT Get visible:C1075(*; This:C1470.name)
	
Function hide
	OBJECT SET VISIBLE:C603(*; This:C1470.name; False:C215)
	
Function show
	OBJECT SET VISIBLE:C603(*; This:C1470.name; True:C214)
	
Function setVisible
	C_BOOLEAN:C305($1)
	OBJECT SET VISIBLE:C603(*; This:C1470.name; $1)
	
	// MARK:- enabled
	
Function isEnabled
	C_BOOLEAN:C305($0)
	$0:=OBJECT Get enabled:C1079(*; This:C1470.name)
	
Function enable
	OBJECT SET ENABLED:C1123(*; This:C1470.name; True:C214)
	
Function disable
	OBJECT SET ENABLED:C1123(*; This:C1470.name; False:C215)
	
Function setEnabled
	C_BOOLEAN:C305($1)
	OBJECT SET ENABLED:C1123(*; This:C1470.name; $1)
	
	// MARK:- title
Function getTitle
	C_TEXT:C284($0)
	$0:=OBJECT Get title:C1068(*; This:C1470.name)
	
Function setTitle
	C_TEXT:C284($1)
	OBJECT SET TITLE:C194(*; This:C1470.name; $1)
	
	// MARK:- Format
Function getFormat
	C_TEXT:C284($0)
	$0:=OBJECT Get format:C894(*; This:C1470.name)
	
Function setFormat
	C_TEXT:C284($1)
	OBJECT SET FORMAT:C236(*; This:C1470.name; $1)
	
	// MARK:- Font
Function getFont
	C_TEXT:C284($0)
	$0:=OBJECT Get font:C1069(*; This:C1470.name)
	
Function setFont
	C_TEXT:C284($1)
	OBJECT SET FONT:C164(*; This:C1470.name; $1)
	
	// MARK:- FontSize
Function getFontSize
	C_LONGINT:C283($0)
	$0:=OBJECT Get font size:C1070(*; This:C1470.name)
	
Function setFontSize
	C_LONGINT:C283($1)
	OBJECT SET FONT SIZE:C165(*; This:C1470.name; $1)
	
	// MARK:- FontStyle
Function getFontStyle
	C_LONGINT:C283($0)
	$0:=OBJECT Get font style:C1071(*; This:C1470.name)
	
Function setFontStyle
	C_LONGINT:C283($1)
	OBJECT SET FONT STYLE:C166(*; This:C1470.name; $1)
	
	// MARK:- HelpTip
Function getHelpTip
	C_TEXT:C284($0)
	$0:=OBJECT Get help tip:C1182(*; This:C1470.name)
	
Function setHelpTip
	C_TEXT:C284($1)
	OBJECT SET HELP TIP:C1181(*; This:C1470.name; $1)
	
	// MARK:- HorizontalAlignment
Function getHorizontalAlignment
	C_LONGINT:C283($0)
	$0:=OBJECT Get horizontal alignment:C707(*; This:C1470.name)
	
Function setHorizontalAlignment
	C_LONGINT:C283($1)
	OBJECT SET HORIZONTAL ALIGNMENT:C706(*; This:C1470.name; $1)
	
	// MARK:- VerticalAlignment
Function getVerticalAlignment
	C_LONGINT:C283($0)
	$0:=OBJECT Get vertical alignment:C1188(*; This:C1470.name)
	
Function setVerticalAlignment
	C_LONGINT:C283($1)
	OBJECT SET VERTICAL ALIGNMENT:C1187(*; This:C1470.name; $1)
	
	//MARK:-TextOrientation
Function getTextOrientation
	C_LONGINT:C283($0)
	$0:=OBJECT Get text orientation:C1283(*; This:C1470.name)
	
Function setTextOrientation
	C_LONGINT:C283($1)
	OBJECT SET TEXT ORIENTATION:C1284(*; This:C1470.name; $1)
	
	// MARK:- keyboard layout
Function getKeyboardLayout
	C_TEXT:C284($0)
	$0:=OBJECT Get keyboard layout:C1180(*; This:C1470.name)
	
Function setKeyboardLayout
	C_TEXT:C284($1)
	OBJECT SET KEYBOARD LAYOUT:C1179(*; This:C1470.name; $1)
	
	// MARK:- Action
Function getAction
	C_TEXT:C284($0)
	$0:=OBJECT Get action:C1457(*; This:C1470.name)
	
Function setAction
	C_TEXT:C284($1)
	OBJECT SET ACTION:C1259(*; This:C1470.name; $1)
	
	//MARK:-BorderStyle
Function getBorderStyle
	C_LONGINT:C283($0)
	$0:=OBJECT Get border style:C1263(*; This:C1470.name)
	
Function setBorderStyle
	C_LONGINT:C283($1)
	OBJECT SET BORDER STYLE:C1262(*; This:C1470.name; $1)
	
	//MARK:-CornerRadius
Function getCornerRadius
	C_LONGINT:C283($0)
	$0:=OBJECT Get corner radius:C1324(*; This:C1470.name)
	
Function setCornerRadius
	C_LONGINT:C283($1)
	OBJECT SET CORNER RADIUS:C1323(*; This:C1470.name; $1)
	
	//MARK:-IndicatorType
Function getIndicatorType
	C_LONGINT:C283($0)
	$0:=OBJECT Get indicator type:C1247(*; This:C1470.name)
	
Function setIndicatorType
	C_LONGINT:C283($1)
	OBJECT SET INDICATOR TYPE:C1246(*; This:C1470.name; $1)
	
	// MARK:- PlaceHolder
Function getPlaceholder
	C_TEXT:C284($0)
	$0:=OBJECT Get placeholder:C1296(*; This:C1470.name)
	
Function setPlaceholder
	C_TEXT:C284($1)
	OBJECT SET PLACEHOLDER:C1295(*; This:C1470.name; $1)
	
	// MARK:- StyleSheet
Function getStyleSheet
	C_TEXT:C284($0)
	$0:=OBJECT Get style sheet:C1258(*; This:C1470.name)
	
Function setStyleSheet
	C_TEXT:C284($1)
	OBJECT SET STYLE SHEET:C1257(*; This:C1470.name; $1)
	
	// MARK:- Colors
Function getColors
	C_COLLECTION:C1488($0)
	C_TEXT:C284($f; $b; $a)  //text
	OBJECT GET RGB COLORS:C1074(*; This:C1470.name; $f; $b; $a)
	$0:=New collection:C1472($f; $b; $a)
	
Function setColors
	C_VARIANT:C1683($1; $2; $3)  //text or int
	Case of 
		: (Count parameters:C259>2)
			OBJECT SET RGB COLORS:C628(*; This:C1470.name; $1; $2; $3)
		: (Count parameters:C259>1)
			OBJECT SET RGB COLORS:C628(*; This:C1470.name; $1; $2)
		Else 
			OBJECT SET RGB COLORS:C628(*; This:C1470.name; $1)
	End case 
	
	// MARK:- Enterable
	
Function isEnterable
	C_BOOLEAN:C305($0)
	$0:=OBJECT Get enterable:C1067(*; This:C1470.name)
	
Function setEnterable
	C_BOOLEAN:C305($1)
	OBJECT SET ENTERABLE:C238(*; This:C1470.name; $1)
	
	// MARK:- Pointer
Function getPointer
	C_POINTER:C301($0)
	$0:=OBJECT Get pointer:C1124(Object named:K67:5; This:C1470.name)
	
	// MARK:- Value
	
Function getValue
	C_VARIANT:C1683($0)
	$0:=(This:C1470.getPointer())->
	
Function setValue
	C_VARIANT:C1683($1)
	(This:C1470.getPointer())->:=$1
	
Function clearValue
	CLEAR VARIABLE:C89((This:C1470.getPointer())->)
	
Function getMinimumValue
	C_VARIANT:C1683($0)
	OBJECT GET MINIMUM VALUE:C1243(*; This:C1470.name; $0)
	
Function getMaxnimumValue
	C_VARIANT:C1683($0)
	OBJECT GET MAXIMUM VALUE:C1245(*; This:C1470.name; $0)
	
Function setMinimumValue
	C_VARIANT:C1683($1)
	OBJECT SET MINIMUM VALUE:C1242(*; This:C1470.name; $1)
	
Function setMaximumValue
	C_VARIANT:C1683($1)
	OBJECT SET MAXIMUM VALUE:C1244(*; This:C1470.name; $1)
	
	
	// MARK:- Coordinate
	
Function getCoordinates
	C_OBJECT:C1216($0)
	C_LONGINT:C283($left; $top; $right; $bottom)
	OBJECT GET COORDINATES:C663(*; This:C1470.name; $left; $top; $right; $bottom)
	$0:=New object:C1471("left"; $left; "top"; $top; "right"; $right; "bottom"; $bottom)
	
Function setCoordinates
	C_OBJECT:C1216($1)
	If ($1.right#Null:C1517)
		OBJECT SET COORDINATES:C1248(*; This:C1470.name; $1.left; $1.top; $1.right; $1.bottom)
	Else 
		OBJECT SET COORDINATES:C1248(*; This:C1470.name; $1.left; $1.top)
	End if 
	
Function getBestSize
	C_OBJECT:C1216($0)
	C_LONGINT:C283($1)  // max width
	C_LONGINT:C283($width; $height)
	
	If (Count parameters:C259>0)
		OBJECT GET BEST SIZE:C717(*; This:C1470.name; $width; $height; $1)
	Else 
		OBJECT GET BEST SIZE:C717(*; This:C1470.name; $width; $height)
	End if 
	$0:=New object:C1471("width"; $width; "height"; $height)
	
	// MARK:- ResizingOptions
	
Function getResizingOptions
	C_OBJECT:C1216($0)
	C_LONGINT:C283($horizontal; $vertical)
	
	OBJECT GET RESIZING OPTIONS:C1176(*; This:C1470.name; $horizontal; $vertical)
	
	$0:=New object:C1471("horizontal"; $horizontal; "vertical"; $vertical)
	
Function setResizingOptions
	C_OBJECT:C1216($1)
	OBJECT SET RESIZING OPTIONS:C1175(*; This:C1470.name; $1.horizontal; $1.vertical)
	
	// MARK:- ScrollPosition
	
Function getScrollPosition
	C_OBJECT:C1216($0)
	C_LONGINT:C283($vertical; $horizontal)
	OBJECT GET SCROLL POSITION:C1114(*; This:C1470.name; $vertical; $horizontal)
	$0:=New object:C1471("vertical"; $vertical; "horizontal"; $horizontal)
	
Function setScrollPosition
	C_OBJECT:C1216($1)
	OBJECT SET SCROLL POSITION:C906(*; This:C1470.name; $1.vertical; $1.horizontal; *)
	
Function apply
	C_OBJECT:C1216($1)
	C_TEXT:C284($key)
	For each ($key; $1)
		This:C1470["set"+Uppercase:C13($key[[1]])+Substring:C12($key; 2)].call(This:C1470; $1[$key])
	End for each 
	