$ScriptURL = "https://raw.githubusercontent.com/corechunk/prep-pwsh/main/script.ps1"


function use-winget {
	param (
		[string]$pkgID,
		[string]$opt
	)

	if($opt -eq "install"){
		winget install --id $pkgID
	}elseif($opt -eq "upgrade"){
		winget upgrade --id $pkgID
	}elseif($opt -eq "uninstall"){
		winget uninstall --id $pkgID
	}
}

function use-choco {
	param(
		[string]$pkgID,
		[string]$opt
	)

	if($opt -eq "install"){
	}elseif($opt -eq "upgrade"){
	}elseif($opt -eq "uninstall"){
	}
}

# use-winget Mozilla.Firefox install