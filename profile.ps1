################################################################################
# PowerShell Profile
################################################################################

# Functions for Organization

function Update-Scoop {
    try {
        Write-Host -ForegroundColor:Yellow "[INFO] Attempting to update scoop apps ..."
        scoop update --all
    }
    catch {
        Write-Warning "Scoop updates failed: $_"
    }
}

function Update-PowerShell7 {
    if ($PSVersionTable.PSVersion.Major -eq 7) {
        try {
            Write-Host -ForegroundColor:Yellow "[INFO] Attempting to update PowerShell 7 ..."
            winget upgrade --id Microsoft.Powershell --source winget
        }
        catch {
            Write-Warning "PowerShell 7 update failed: $_"
        }
    }
}

function Initialize-Prompt {
    try {
        Write-Host -ForegroundColor:Yellow "[INFO] Attempting to init prompt ..."
        oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
        
        # Virtual environments created with venv add the active environment's name to the prompt automatically
        # See: https://ohmyposh.dev/docs/faq#python-venv-prompt-changes-on-activating-virtual-environment
        $env:VIRTUAL_ENV_DISABLE_PROMPT = 1
    }
    catch {
        Write-Warning "Oh-My-Posh initialization failed: $_"
    }
}

# Execute functions and other commands

Update-Scoop
Update-PowerShell7  # Call PowerShell 7 update *before* setting location
Initialize-Prompt
Write-Host -ForegroundColor:Cyan " Time for fun! (╯°□°)╯︵ ┻━┻ "


################################################################################
# Paths
################################################################################

# Add paths as needed

################################################################################
# Aliases
################################################################################

function tf {
    terraform.exe $args
}