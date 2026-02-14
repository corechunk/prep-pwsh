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