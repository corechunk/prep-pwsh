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