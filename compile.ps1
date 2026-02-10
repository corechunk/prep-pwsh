<#

source this file like ->  . .\compile   or  . .\compile.ps1

then use functions like
```
touch-file note.txt
build-proj
```
#>

function touch-file ([String]$file) {
	if (-Not(Test-Path $file)) {
		New-Item $file -Force
	}
}


$files = @(	
	"src/module1.ps1",
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

	"Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser" | Add-Content $output

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