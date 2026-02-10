Add-Type -AssemblyName PresentationFramework

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="Main Menu" Height="300" Width="300"
        WindowStartupLocation="CenterScreen">
    <Grid Margin="10">
        <StackPanel>
            <TextBlock Text="----------------------" />
            <Button Name="Btn1" Content="1. manager-software" Margin="0,5"/>
            <Button Name="Btn2" Content="2. ga" Margin="0,5"/>
            <Button Name="Btn3" Content="3. mathematical stuff" Margin="0,5"/>
            <Button Name="BtnExit" Content="x. Exit" Margin="0,15"/>
            <TextBlock Text="----------------------" />
        </StackPanel>
    </Grid>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# ---- Button bindings (THIS is the "while loop replacement") ----

$window.FindName("Btn1").Add_Click({
    [System.Windows.MessageBox]::Show("manager-software")
})

$window.FindName("Btn2").Add_Click({
    [System.Windows.MessageBox]::Show("ga")
})

$window.FindName("Btn3").Add_Click({
    [System.Windows.MessageBox]::Show("math-menu")
})

$window.FindName("BtnExit").Add_Click({
    $window.Close()
})

$window.ShowDialog() | Out-Null
