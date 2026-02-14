<#
```
	./compile clean
	./compile build
	or
	./compile rebuild
```
#>

param(  # clearn, build, rebuild
	[string]$opt
)

$output = "script.ps1"
$files = @(	
	"src/base/param.ps1",
	"src/base/base.ps1",
	"src/base/pkgs.ps1",
	"src/module1.ps1",
	"src/pre-main.ps1"
) # xaml UI(in xaml folder) and Event handler files(in core folder) are auto proccessed and compiled

$global:progress = 1

function update-progress {
	param(
		[string]$text
	)

	Write-Host "$global:progress) Progress: $text"
	$global:progress++

}

function write-xaml { # from 1 file obj
	param(
		[object]$xmlFile,
		[string]$outputFile
	)
		
	<# from main.xaml file make variable: 
	xaml_mainUI = @"
	with all the content inside with line escapes
	"@ #>		
		
	$opening = "[xml]`$xaml_$($xmlFile.BaseName) = @`"`n"
	$content = "$(Get-Content $xmlFile.FullName )"
	$ending  = "`n`"@"

	"${opening}${content}${ending}" | Add-Content $outputFile
}
	
function write-xamls {
	param(
		[object[]]$files,
		[string]$outputFile
	)
	foreach($file in $files){
		"adding : $file file"
		if ($file -and $file.Exists){
			write-xaml $file $outputFile
		}
	}
}

function touch-file ([String]$file) {
	if (-Not(Test-Path $file)) {
		New-Item $file -Force
	}
}

function clean-proj {
	if (Test-Path $output) {
		Remove-Item $output -Force
	}	
}

function build-proj {
	update-progress "Creating Empty 'script.ps1'"
	touch-file $output

	update-progress "Adding Parameters"
	"`n# ------- File : $files[0] ------- `n" | Set-Content $output
	Get-Content $files[0] | Add-Content $output
	$files = $files | Select-Object -Skip 1

	update-progress "Adding WPF Module"
	"Add-Type -AssemblyName PresentationFramework
	Add-Type -AssemblyName PresentationCore
	Add-Type -AssemblyName WindowsBase" | Add-Content $output 
	
	update-progress "Adding all function"
	foreach ($file in $files) {
		"`n# ------- File : $file ------- `n" | Add-Content $output
		Get-Content $file | Add-Content $output
		
	}
	
	update-progress "Adding xaml files"
	$xamlFiles = Get-ChildItem -Path ./src/xaml -Filter *.xaml -Recurse
	write-xamls $xamlFiles $output

	update-progress "Adding Event Handlers"
	$eventFiles = Get-ChildItem -Path ./src/core -Filter *.ps1 -Recurse
	foreach ($eventFile in $eventFiles){
		"adding : $eventFile file"
		Get-Content $eventFile | Add-Content $output
	}


	update-progress "(Main) Adding initial Entry-Point(UI)"
	"`n# ------- File : src/main.ps1 ------- `n" | Add-Content $output
	Get-Content "src/main.ps1" | Add-Content $output
	"`n# -------------- `n" | Add-Content $output

}

function rebuild-proj {
	clean-proj
	build-proj
}



if($opt -eq "clean"){		# options
	clean-proj
}elseif ($opt -eq "build"){
	build-proj
}elseif ($opt -eq "rebuild"){
	rebuild-proj
}