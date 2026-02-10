Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the main form
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "WinUtils Main Menu"
$Form.Size = New-Object System.Drawing.Size(400, 300)
$Form.StartPosition = "CenterScreen"

# Create a label
$Label = New-Object System.Windows.Forms.Label
$Label.Text = "Select an Option:"
$Label.Location = New-Object System.Drawing.Point(20, 20)
$Label.Size = New-Object System.Drawing.Size(200, 30)
$Form.Controls.Add($Label)

# Button 1
$Btn1 = New-Object System.Windows.Forms.Button
$Btn1.Text = "1. Essential Software"
$Btn1.Location = New-Object System.Drawing.Point(20, 60)
$Btn1.Size = New-Object System.Drawing.Size(200, 30)
$Btn1.Add_Click({
		[System.Windows.Forms.MessageBox]::Show("Essential Software menu clicked!")
	})
$Form.Controls.Add($Btn1)

# Button 2
$Btn2 = New-Object System.Windows.Forms.Button
$Btn2.Text = "2. Install Desktop Environment"
$Btn2.Location = New-Object System.Drawing.Point(20, 100)
$Btn2.Size = New-Object System.Drawing.Size(200, 30)
$Btn2.Add_Click({
		[System.Windows.Forms.MessageBox]::Show("Desktop Environment menu clicked!")
	})
$Form.Controls.Add($Btn2)

# Button 3
$Btn3 = New-Object System.Windows.Forms.Button
$Btn3.Text = "3. Enable Firewall"
$Btn3.Location = New-Object System.Drawing.Point(20, 140)
$Btn3.Size = New-Object System.Drawing.Size(200, 30)
$Btn3.Add_Click({
		[System.Windows.Forms.MessageBox]::Show("Firewall menu clicked!")
	})
$Form.Controls.Add($Btn3)

# Button 4
$Btn4 = New-Object System.Windows.Forms.Button
$Btn4.Text = "4. Auto-CPUFreq Setup"
$Btn4.Location = New-Object System.Drawing.Point(20, 180)
$Btn4.Size = New-Object System.Drawing.Size(200, 30)
$Btn4.Add_Click({
		[System.Windows.Forms.MessageBox]::Show("Auto-CPUFreq menu clicked!")
	})
$Form.Controls.Add($Btn4)

# Exit button
$BtnExit = New-Object System.Windows.Forms.Button
$BtnExit.Text = "Exit"
$BtnExit.Location = New-Object System.Drawing.Point(20, 220)
$BtnExit.Size = New-Object System.Drawing.Size(200, 30)
$BtnExit.Add_Click({ $Form.Close() })
$Form.Controls.Add($BtnExit)

# Show the form
[void]$Form.ShowDialog()
