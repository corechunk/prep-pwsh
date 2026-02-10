if ($FuncName) {
    # Task Mode: This block executes when the script is re-invoked with a function name.

    # Parse FuncArgs if it was passed as a JSON string
    $parsedFuncArgs = @{}
    if ($FuncArgs -and ($FuncArgs | ConvertFrom-Json -ErrorAction SilentlyContinue)) {
        $parsedFuncArgs = $FuncArgs | ConvertFrom-Json
    }

    $result = switch ($FuncName) {
        'manager-software' { manager-software }
        'math-menu' { math-menu }
        'use-winget' { use-winget @parsedFuncArgs }
        default { Write-Error "Unknown function: $FuncName" }
    }

    # Save the result to the specified results file, if provided.
    if ($output) {
        try {
            $result | Export-CliXml -Path $output
        } catch {
            Write-Error "Failed to save results to $output. Error: $_"
        }
    }

    # Exit the script to prevent the GUI from loading.
    exit
}