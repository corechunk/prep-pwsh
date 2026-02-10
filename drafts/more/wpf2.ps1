Add-Type -AssemblyName PresentationFramework

# XAML for window
$XAML = @"
<Window xmlns='http://schemas.microsoft.com/winfx/2006/xaml/presentation'
        Title='WinUtils Menu Stack' Height='300' Width='300'>
    <Grid Name='MainGrid' Margin='10'>
        <StackPanel Name='MenuPanel'/>
    </Grid>
</Window>
"@

$reader = (New-Object System.Xml.XmlNodeReader ([xml]$XAML))
$Window = [Windows.Markup.XamlReader]::Load($reader)

$MenuPanel = $Window.FindName("MenuPanel")

# --- Helper to populate a menu ---
function Show-Menu {
	param($Items)
	$MenuPanel.Children.Clear()
	foreach ($item in $Items) {
		$btn = New-Object System.Windows.Controls.Button
		$btn.Content = $item.Text
		$btn.Margin = [System.Windows.Thickness]::new(0, 5, 0, 0)
		$btn.Add_Click($item.Action)
		$MenuPanel.Children.Add($btn)
	}
}

# --- Define menus ---
$MainMenu = @(
	@{ Text = "1. Essential Software"; Action = { Show-Menu $SubMenu } },
	@{ Text = "2. Install DE"; Action = { Show-Menu $SubMenu } },
	@{ Text = "3. Enable Firewall"; Action = { Show-Menu $SubMenu } },
	@{ Text = "4. Auto-CPUFreq"; Action = { Show-Menu $SubMenu } },
	@{ Text = "5. Dotfiles"; Action = { Show-Menu $SubMenu } },
	@{ Text = "x. Exit"; Action = { $Window.Close() } }
)

$SubMenu = @(
	@{ Text = "1. Sub Option A"; Action = { [System.Windows.MessageBox]::Show("Sub Option A clicked") } },
	@{ Text = "2. Sub Option B"; Action = { [System.Windows.MessageBox]::Show("Sub Option B clicked") } },
	@{ Text = "3. Sub Option C"; Action = { [System.Windows.MessageBox]::Show("Sub Option C clicked") } },
	@{ Text = "x. Back"; Action = { Show-Menu $MainMenu } }
)

# Show main menu
Show-Menu $MainMenu

# Show window
$Window.ShowDialog() | Out-Null
