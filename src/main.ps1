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