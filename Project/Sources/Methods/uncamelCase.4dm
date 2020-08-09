//%attributes = {}

C_TEXT:C284($0; $1)
$0:=""
C_LONGINT:C283($l; $i; $code)

$l:=Length:C16($1)

Case of 
	: ($l=0)
		$0:=""
	: ($l=1)
		$0:=Uppercase:C13($1)
		
	Else 
		$0:=Uppercase:C13($1[[1]])
		
		For ($i; 2; $l; 1)
			$code:=Character code:C91($1[[$i]])
			If (($code<91) & ($code>64))
				$0:=$0+" "
			End if 
			$0:=$0+$1[[$i]]
			
		End for 
End case 
