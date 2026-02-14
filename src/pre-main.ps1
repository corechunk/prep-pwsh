if ($FuncName) {
    switch ($FuncName)
	{
        'manager-software' {
			manager-software
		}
        'math-menu' {
			math-menu
		}
        'use-winget' {
			use-winget $FuncArgs[0] $FuncArgs[1]
		}
        default {
			Write-Error "Unknown function: $FuncName"
		}
    }

    # Exit the script to prevent the GUI from loading.
    exit
}

# i want xamls to be here