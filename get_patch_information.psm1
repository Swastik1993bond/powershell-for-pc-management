# Function to get the last successful patch installation date
function Get-LastSuccessfulPatchInstallationDate {
    $lastSuccessfulInstall = Get-HotFix | Where-Object {$_.Description -eq 'Update'} | sort -Descending

    if ($lastSuccessfulInstall) {
        #$lastSuccessfulInstall.InstalledOn
	echo $lastSuccessfulInstall
    } else {
        "No successful patch installations found."
    }
}

# Function to get details of failed patches
function Get-FailedPatches {
    $failedPatches = Get-WindowsUpdateLog | Where-Object { $_.EventID -eq 20 }

    if ($failedPatches) {
        $failedPatches | Select-Object -Property TimeGenerated, Message
    } else {
        "No failed patches found."
    }
}


Export-ModuleMember -Function Get-LastSuccessfulPatchInstallationDate, Get-FailedPatches
