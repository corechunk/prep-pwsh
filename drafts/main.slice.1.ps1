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
#		}elseif($cho -eq "3"){
#			math-menu
#		}elseif($cho -eq "x"){
#			break
#		}else{
#			"elselee"
#		}
#	}
#};main

# 1. Load the WPF Framework#Add-Type -AssemblyName PresentationFramework

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
    	<Grid x:Name="MainMenu">
			<Grid>
				<Grid.RowDefinitions>
					<RowDefinition Height="*"/>
					<RowDefinition Height="*"/>  
					<RowDefinition Height="*"/>
					<RowDefinition Height="*"/>
					<RowDefinition Height="*"/>
					<RowDefinition Height="*"/>
				</Grid.RowDefinitions>
				
				<Grid.ColumnDefinitions>
					<ColumnDefinition Width="80"/>
					<ColumnDefinition Width="*"/>
					<ColumnDefinition Width="80"/>
				</Grid.ColumnDefinitions>

				<Button x:Name="btnManSoft" Grid.Row="1" Grid.Column="1" Content="manager-software" Margin="10" />
				<Button x:Name="btnMath" Grid.Row="2" Grid.Column="1" Content="mathematical stuff" Margin="10" />
				<Button x:Name="btnTemp" Grid.Row="3" Grid.Column="1" Content="TEMP : install firefox" Margin="10" />
			</Grid>
		</Grid>
			
		<!-- MATH MENU -->
		<Grid x:Name="MathMenu" Visibility="Collapsed">
			<Grid.RowDefinitions>
				<RowDefinition Height="*"/>
				<RowDefinition Height="*"/>  
				<RowDefinition Height="*"/>
				<RowDefinition Height="*"/>
				<RowDefinition Height="*"/>
				<RowDefinition Height="*"/>
				<RowDefinition Height="*"/>
				<RowDefinition Height="*"/>
			</Grid.RowDefinitions>
			
			<Grid.ColumnDefinitions>
				<ColumnDefinition Width="80"/>
				<ColumnDefinition Width="*"/>
				<ColumnDefinition Width="80"/>
			</Grid.ColumnDefinitions>
			
			<Button x:Name="btnSum" Grid.Row="1" Grid.Column="1" Content="1. sum" Margin="10"/>
			<Button x:Name="btnMatrix" Grid.Row="2" Grid.Column="1" Content="2. matrix (x)" Margin="10"/>
			<Button x:Name="btnBack" Grid.Row="3" Grid.Column="1" Content="x. Back" Margin="15"/>
		</Grid>
	</Grid>
</Window>
"@


$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

$MainMenu = $window.FindName("MainMenu")
$MathMenu = $window.FindName("MathMenu")
$Pages = @($MainMenu, $MathMenu)
function Switch-Page($PageName) {
    
	# Hide all pages
	foreach ($p in $Pages) {
		$p.Visibility = "Collapsed"
	}

	# Show requested page
	$window.FindName($PageName).Visibility = "Visible"
}



$window.FindName("btnManSoft").Add_Click({
		Write-Host "btnManSoft"
	})

$window.FindName("btnMath").Add_Click({
		Switch-Page "MathMenu"
	})

$window.FindName("btnTemp").Add_Click({
		Write-Host "btnTemp"
	})

$window.FindName("btnSum").Add_Click({
		Write-Host "btnSum"
	})
$window.FindName("btnMatrix").Add_Click({
		Write-Host "btnMatrix"
	})
$window.FindName("btnBack").Add_Click({
		Switch-Page "MainMenu"
	})

$window.ShowDialog() | Out-Null
