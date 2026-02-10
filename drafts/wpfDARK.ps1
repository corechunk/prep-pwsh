Add-Type -AssemblyName PresentationFramework

# Create main window
$XAML = @"
<Window xmlns='http://schemas.microsoft.com/winfx/2006/xaml/presentation'
        Title='WinUtils Menu Stack' Height='250' Width='300'
        Background='#222222' Foreground='White'>
    <Grid Name='MainGrid' Margin='10'>
        <StackPanel Name='MenuPanel'/>
    </Grid>
</Window>
"@

$reader = (New-Object System.Xml.XmlNodeReader ([xml]$XAML))
$Window = [Windows.Markup.XamlReader]::Load($reader)
$MenuPanel = $Window.FindName("MenuPanel")

# Helper function for menu
function Show-Menu {
	param($Items)
	$MenuPanel.Children.Clear()
	foreach ($item in $Items) {
		$btn = New-Object System.Windows.Controls.Button
		$btn.Content = $item.Text
		$btn.Margin = [System.Windows.Thickness]::new(0, 5, 0, 0)
		$btn.Background = [System.Windows.Media.Brushes]::DimGray
		$btn.Foreground = [System.Windows.Media.Brushes]::White
		$btn.Add_Click($item.Action)
		$MenuPanel.Children.Add($btn)
	}
}

# Submenu (stacked)
$SubMenu = @(
	@{ Text = "1. Sub Option A"; Action = { Show-Menu $MainMenu } },
	@{ Text = "2. Sub Option B"; Action = { Show-Menu $MainMenu } },
	@{ Text = "x. Back"; Action = { Show-Menu $MainMenu } }
)

# Main menu
$MainMenu = @(
	@{ Text = "1. Essential Software"; Action = { Show-Menu $SubMenu } },
	@{ Text = "2. Install DE"; Action = { Show-Menu $SubMenu } },
	@{ Text = "3. Enable Firewall"; Action = { Show-Menu $SubMenu } },
	@{ Text = "4. Auto-CPUFreq"; Action = { Show-Menu $SubMenu } },
	@{ Text = "5. Dotfiles"; Action = { Show-Menu $SubMenu } },
	@{ Text = "x. Exit"; Action = { $Window.Close() } }
)

Show-Menu $MainMenu

# --- Optional: popup near cursor ---
$Window.MouseMove.Add({
		param($render, $e)
		$cursorPos = [System.Windows.Forms.Cursor]::Position
		# You can use cursorPos.X / cursorPos.Y to position a popup
	})

$Window.ShowDialog() | Out-Null
