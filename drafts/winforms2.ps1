Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$Form = New-Object System.Windows.Forms.Form
$Form.Text = "WinUtils Menu Stack"
$Form.Size = New-Object System.Drawing.Size(300, 300)
$Form.StartPosition = "CenterScreen"

$Panel = New-Object System.Windows.Forms.Panel
$Panel.Size = New-Object System.Drawing.Size(280, 250)
$Panel.Location = New-Object System.Drawing.Point(10, 10)
$Form.Controls.Add($Panel)

function Show-Menu($Items) {
	$Panel.Controls.Clear()
	$y = 0
	foreach ($item in $Items) {
		$btn = New-Object System.Windows.Forms.Button
		$btn.Text = $item.Text
		$btn.Size = New-Object System.Drawing.Size(250, 30)
		$btn.Location = New-Object System.Drawing.Point(10, $y)
		$y += 40
		$btn.Add_Click($item.Action)
		$Panel.Controls.Add($btn)
	}
}

# --- Menus ---
$MainMenu = @(
	@{ Text = "1. Essential Software"; Action = { Show-Menu $SubMenu } },
	@{ Text = "2. Install DE"; Action = { Show-Menu $SubMenu } },
	@{ Text = "3. Enable Firewall"; Action = { Show-Menu $SubMenu } },
	@{ Text = "4. Auto-CPUFreq"; Action = { Show-Menu $SubMenu } },
	@{ Text = "5. Dotfiles"; Action = { Show-Menu $SubMenu } },
	@{ Text = "x. Exit"; Action = { $Form.Close() } }
)

$SubMenu = @(
	@{ Text = "1. Sub Option A"; Action = { [System.Windows.Forms.MessageBox]::Show("Sub Option A clicked") } },
	@{ Text = "2. Sub Option B"; Action = { [System.Windows.Forms.MessageBox]::Show("Sub Option B clicked") } },
	@{ Text = "3. Sub Option C"; Action = { [System.Windows.Forms.MessageBox]::Show("Sub Option C clicked") } },
	@{ Text = "x. Back"; Action = { Show-Menu $MainMenu } }
)

# Show main menu
Show-Menu $MainMenu

$Form.ShowDialog()
