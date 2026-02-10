Add-Type -AssemblyName PresentationFramework


[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
Title="Hello" Height="150" Width="300">
	<Grid>
		<Button Content="Click Me" />
	</Grid>
</Window>
"@


$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)
$window.ShowDialog()