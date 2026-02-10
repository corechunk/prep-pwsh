Add-Type -AssemblyName PresentationFramework

# XAML for the window
$XAML = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="WinUtils Main Menu" Height="350" Width="400">
    <Grid Margin="10">
        <StackPanel>
            <TextBlock Text="Select an Option:" FontSize="16" Margin="0,0,0,10"/>
            <Button Name="Btn1" Content="1. Essential Software" Margin="0,5"/>
            <Button Name="Btn2" Content="2. Install Desktop Environment" Margin="0,5"/>
            <Button Name="Btn3" Content="3. Enable Firewall" Margin="0,5"/>
            <Button Name="Btn4" Content="4. Auto-CPUFreq Setup" Margin="0,5"/>
            <Button Name="BtnX" Content="Exit" Margin="0,20,0,0"/>
        </StackPanel>
    </Grid>
</Window>
"@

# Load XAML
$reader = (New-Object System.Xml.XmlNodeReader ([xml]$XAML))
$Window = [Windows.Markup.XamlReader]::Load($reader)

# Event Handlers
$Window.FindName("Btn1").Add_Click({
		[System.Windows.MessageBox]::Show("Essential Software menu clicked!")
	})

$Window.FindName("Btn2").Add_Click({
		[System.Windows.MessageBox]::Show("Desktop Environment menu clicked!")
	})

$Window.FindName("Btn3").Add_Click({
		[System.Windows.MessageBox]::Show("Firewall menu clicked!")
	})

$Window.FindName("Btn4").Add_Click({
		[System.Windows.MessageBox]::Show("Auto-CPUFreq menu clicked!")
	})

$Window.FindName("BtnX").Add_Click({
		$Window.Close()
	})

# Show Window
$Window.ShowDialog() | out-null
