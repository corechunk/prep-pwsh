#function main {
#	clear
#	while($true){
#		"----------------------"
#		"1. manager-software"
#		"2. ga"
#		"3. mathematical stuff"
#		"x. Exit"
#		"----------------------"
#		
#		$cho = Read-Host "Choose an option"
#		clear
#		if($cho -eq "1"){
#			manager-software
#		}elseif($cho -eq "2"){
#			"opt2"
#		}elseif($cho -eq "x"){
#			math-menu
#			break
#		}else{
#			"elselee"
#		}
#	}
#};main

# 1. Load the WPF Framework
Add-Type -AssemblyName PresentationFramework

# 2. Define the XAML (The Design)
# Note: The 'x:Name' attribute is crucial. It lets PowerShell find the element later.
[xml]$xaml = @"
<Window 
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
	Width="800" Height="600"
	MinWidth="800" MinHeight="600"
    Title="My First Tool">
    
    <Grid>
		<Grid.RowDefinitions>
			<RowDefinition Height="*"/> <RowDefinition Height="*"/>  
			<RowDefinition Height="*"/> <RowDefinition Height="*"/>
			<RowDefinition Height="*"/> <RowDefinition Height="*"/>
			<RowDefinition Height="*"/> <RowDefinition Height="*"/> 
		</Grid.RowDefinitions>
		
		<Grid.ColumnDefinitions>
			<ColumnDefinition Width="80"/>
			<ColumnDefinition Width="*"/>
			<ColumnDefinition Width="80"/>
		</Grid.ColumnDefinitions>

		<Button x:Name="MyButton1" Grid.Row="1" Grid.Column="1" Content="manager-software" Margin="5" />
		<Button x:Name="MyButton2" Grid.Row="2" Grid.Column="1" Content="mathematical stuff" Margin="5" />
		<Button x:Name="MyButton3" Grid.Row="3" Grid.Column="1" Content="TEMP : install firefox" Margin="5" />
	</Grid>
</Window>
"@


$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

$window.FindName("MyButton1").Add_Click({
    $resultsFile = Join-Path $env:TEMP ([System.Guid]::NewGuid().ToString() + ".xml")

    # Construct the command to re-invoke the script in Task Mode
    $command = "& { $(irm ""$ScriptURL"") } -FuncName 'manager-software' -output '$resultsFile' "
    
    # Launch the new PowerShell process
    Start-Process pwsh.exe -ArgumentList "-NoExit", "-Command", $command -Wait

    # Read results from the temporary file
    if (Test-Path $resultsFile) {
        $taskResult = Import-CliXml -Path $resultsFile
        # TODO: Implement logic to update GUI based on $taskResult
        Write-Host "manager-software task completed. Result: $($taskResult | Out-String)"
        Remove-Item $resultsFile -Force
    } else {
        Write-Warning "No results file found for manager-software task."
    }
})
$window.FindName("MyButton2").Add_Click({
    $resultsFile = Join-Path $env:TEMP ([System.Guid]::NewGuid().ToString() + ".xml")

    # Construct the command to re-invoke the script in Task Mode
    $command = "& { $(irm ""$ScriptURL"") } -FuncName 'math-menu' -output '$resultsFile' "
    
    # Launch the new PowerShell process
    Start-Process pwsh.exe -ArgumentList "-NoExit", "-Command", $command -Wait

    # Read results from the temporary file
    if (Test-Path $resultsFile) {
        $taskResult = Import-CliXml -Path $resultsFile
        # TODO: Implement logic to update GUI based on $taskResult
        Write-Host "math-menu task completed. Result: $($taskResult | Out-String)"
        Remove-Item $resultsFile -Force
    } else {
        Write-Warning "No results file found for math-menu task."
    }
})
$window.FindName("MyButton3").Add_Click({
    $resultsFile = Join-Path $env:TEMP ([System.Guid]::NewGuid().ToString() + ".xml")

    # Arguments for use-winget
    $funcArgs = @{
        pkgID = "Mozilla.Firefox"
        opt = "install"
    }

    # Construct the command to re-invoke the script in Task Mode
    $command = "& { $(irm ""$ScriptURL"") } -FuncName 'use-winget' -output '$resultsFile' -FuncArgs $($funcArgs | ConvertTo-Json -Compress) "
    
    # Launch the new PowerShell process
    Start-Process pwsh.exe -ArgumentList "-NoExit", "-Command", $command -Wait

    # Read results from the temporary file
    if (Test-Path $resultsFile) {
        $taskResult = Import-CliXml -Path $resultsFile
        # TODO: Implement logic to update GUI based on $taskResult
        Write-Host "use-winget task completed. Result: $($taskResult | Out-String)"
        Remove-Item $resultsFile -Force
    } else {
        Write-Warning "No results file found for use-winget task."
    }
})
$ScriptURL
$window.ShowDialog() | Out-Null