<#

source this file like ->  . .\compile   or  . .\compile.ps1

then use functions like
```
touch-file note.txt
build-proj
```
#>

param(
	[string]$opt
)

function touch-file ([String]$file) {
	if (-Not(Test-Path $file)) {
		New-Item $file -Force
	}
}


$files = @(	
	"src/base/param.ps1",
	"src/base/base.ps1",
	"src/base/pkgs.ps1",
	"src/module1.ps1",
	"src/pre-main.ps1",
	"src/main.ps1"
)
$output = "script.ps1"


function clean-proj {
	if (Test-Path $output) {
		Remove-Item $output -Force
	}	
}

function build-proj {
	touch-file $output

	"`n# ------- File : $files[0] ------- `n" | Add-Content $output
	Get-Content $files[0] | Add-Content $output
	$files = $files | Select-Object -Skip 1 # reduce value from index 0

	#"
	#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
	#" | Add-Content $output

	foreach ($file in $files) {
		"`n# ------- File : $file ------- `n" | Add-Content $output
		Get-Content $file | Add-Content $output
	}
	"`n# -------------- `n" | Add-Content $output
}

function rebuild-proj {
	clean-proj
	build-proj
}

if($opt -eq "clean"){
	clean-proj
}elseif ($opt -eq "build"){
	build-proj
}elseif ($opt -eq "rebuild"){
	rebuild-proj
}