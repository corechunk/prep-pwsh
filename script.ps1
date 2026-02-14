
# ------- File : src/base/param.ps1 src/base/base.ps1 src/base/pkgs.ps1 src/module1.ps1 src/pre-main.ps1[0] ------- 

param(
    [string]$FuncName,
    [string]$output,
    [string[]]$FuncArgs # Changed to string to receive JSON
)

Add-Type -AssemblyName PresentationFramework
	Add-Type -AssemblyName PresentationCore
	Add-Type -AssemblyName WindowsBase

# ------- File : src/base/base.ps1 ------- 

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

# ------- File : src/base/pkgs.ps1 ------- 


$browsers = @(
	"Mozilla.Firefox",
	"TorProject.TorBrowser",
	"Microsoft.Edge",
	"Google.Chrome",
	"Brave.Brave"
)

$dev_tools = @(
	"Git.Git",
	"Kitware.CMake",
	"GnuWin32.Make",
	"Ninja-build.Ninja"
)

# ------- File : src/module1.ps1 ------- 

function sum (){
	[int]$opr1 = Read-Host "Input First val"
	[int]$opr2 = Read-Host "Input Second val"
	"Sum of $opr1 & $opr2 : $($opr1+$opr2)"
}

function math-menu {
	while($true){
		"----------------------"
		"1. sum"
		"2. matrix (x)"
		"3. "
		"x. Exit"
		"----------------------"
		
		$cho = Read-Host "Choose an option"

		#clear
		if($cho -eq "1"){
			sum
		}elseif($cho -eq "2"){
			"opt2"
		}elseif($cho -eq "3"){
			"opt3"
		}elseif($cho -eq "x"){
			"optX"
			break
		}else{
			"elselee"
		}
	}
}

function manager-software {
    Write-Host "manager-software function called (placeholder)"
    # Future implementation for software management
}

# ------- File : src/pre-main.ps1 ------- 

if ($FuncName) {
    switch ($FuncName)
	{
        'manager-software' {
			manager-software
		}
        'math-menu' {
			math-menu
		}
        'use-winget' {
			use-winget $FuncArgs[0] $FuncArgs[1]
		}
        default {
			Write-Error "Unknown function: $FuncName"
		}
    }

    # Exit the script to prevent the GUI from loading.
    exit
}

# i want xamls to be here
[xml]$xaml_main = @"
<Grid xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" x:Name="MainMenu"> 	<Grid> 		<Grid.RowDefinitions> 			<RowDefinition Height="*"/> 			<RowDefinition Height="*"/>   			<RowDefinition Height="*"/> 			<RowDefinition Height="*"/> 			<RowDefinition Height="*"/> 			<RowDefinition Height="*"/> 		</Grid.RowDefinitions> 		 		<Grid.ColumnDefinitions> 			<ColumnDefinition Width="80"/> 			<ColumnDefinition Width="*"/> 			<ColumnDefinition Width="80"/> 		</Grid.ColumnDefinitions> 		<Button x:Name="btnPkgMngr" Grid.Row="1" Grid.Column="1" Content="manager-software" Margin="10" /> 		<Button x:Name="btnMath" Grid.Row="2" Grid.Column="1" Content="mathematical stuff" Margin="10" /> 		<Button x:Name="btnTemp" Grid.Row="3" Grid.Column="1" Content="TEMP : install firefox" Margin="10" /> 	</Grid> </Grid>
"@
[xml]$xaml_mathMenu = @"
<!-- MATH MENU --> <Grid  xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" x:Name="mathMenu"> 	<Grid.RowDefinitions> 		<RowDefinition Height="*"/> 		<RowDefinition Height="*"/>   		<RowDefinition Height="*"/> 		<RowDefinition Height="*"/> 		<RowDefinition Height="*"/> 		<RowDefinition Height="*"/> 		<RowDefinition Height="*"/> 		<RowDefinition Height="*"/> 	</Grid.RowDefinitions> 	 	<Grid.ColumnDefinitions> 		<ColumnDefinition Width="80"/> 		<ColumnDefinition Width="*"/> 		<ColumnDefinition Width="80"/> 	</Grid.ColumnDefinitions> 	 	<Button x:Name="btnSum" Grid.Row="1" Grid.Column="1" Content="1. sum" Margin="10"/> 	<Button x:Name="btnMatrix" Grid.Row="2" Grid.Column="1" Content="2. matrix (x)" Margin="10"/> 	<Button x:Name="btnBack" Grid.Row="3" Grid.Column="1" Content="x. Back" Margin="15"/> </Grid>
"@
[xml]$xaml_pkgManager = @"

"@
[xml]$xaml_window = @"
<Window      xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"     xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" 	Width="800" Height="600" 	MinWidth="800" MinHeight="600"     Title="WinUtils">  	<ContentControl x:Name="canvas"/> </Window>
"@
function Init-Main {
	param($partialUI)
	
	$partialUI.FindName("btnPkgMngr").Add_Click({
		Write-Host "Package Manager will be added soon"
	})
	
	$partialUI.FindName("btnMath").Add_Click({
		#Load-Page $xaml_mathMenu
			Load-Page $xaml_mathMenu ${function:Init-MathMenu}
	})
	
	$partialUI.FindName("btnTemp").Add_Click({
		Write-Host "Installing Firefox ..."
		use-winget Firefox.Firefox install
	})
}
function Init-MathMenu {
	param($partialUI)
	
	$partialUI.FindName("btnSum").Add_Click({
		Write-Host "this section might be added soon"
	})
	$partialUI.FindName("btnMatrix").Add_Click({
		Write-Host "Matrix Section will be added soon"
	})
	$partialUI.FindName("btnBack").Add_Click({
		Load-Page $xaml_main ${function:Init-Main}
	})
}
#function Init-MathMenu {
#	param($partialUI)
#	
#	#$partialUI.FindName("btnSum").Add_Click({
#	#		Write-Host "this section might be added soon"
#	#	})
#	
#}

# ------- File : src/main.ps1 ------- 

# Global Variables
$global:pkgManager = "winget" # default

# Load xaml UI
$xamlObj = (New-Object System.Xml.XmlNodeReader $xaml_window)
$window = [Windows.Markup.XamlReader]::Load($xamlObj)
 
#$MainMenu = $window.FindName("MainMenu")
#$MathMenu = $window.FindName("MathMenu")
#$Pages = @($MainMenu, $MathMenu)
function Switch-Page($PageName) { # depricated
    
	# Hide all pages
	foreach ($p in $Pages) {
		$p.Visibility = "Collapsed"
	}

	# Show requested page
	$window.FindName($PageName).Visibility = "Visible"
}

function Load-Page { # depricated
	param( [xml]$var )

	$xamlObj = New-Object System.Xml.XmlNodeReader $var
	$pageUI = [Windows.Markup.XamlReader]::Load($xamlObj)
	$window.FindName("canvas").Content = $pageUI
} # Load-Page $xaml_main

function Load-Page {
	param(
		[xml]$xaml,
        [scriptblock]$funcBody
	)

	# injecting new UI xaml tree at "canvas"
	$xamlObj = New-Object System.Xml.XmlNodeReader $xaml
	$pageUI = [Windows.Markup.XamlReader]::Load($xamlObj)
	$window.FindName("canvas").Content = $pageUI

	# initializing that new tree with event handlers
	& $funcBody $pageUI

}; Load-Page $xaml_main ${function:Init-Main}

$window.ShowDialog() | Out-Null

# -------------- 

