//%attributes = {"invisible":true}


ASSERT:C1129(uncamelCase("")="")
ASSERT:C1129(uncamelCase("a")="A")
ASSERT:C1129(uncamelCase("A")="A")
ASSERT:C1129(uncamelCase("onChange")="On Change")
ASSERT:C1129(uncamelCase("onDoubleClicked")="On Double Clicked")