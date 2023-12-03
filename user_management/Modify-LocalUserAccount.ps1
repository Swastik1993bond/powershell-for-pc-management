# Modify-LocalUserAccount.ps1

$existingUsername = Read-Host "Enter the new username"
$newPassword = Read-Host "Enter the new password for the user" -AsSecureString
#$newFullName = Read-Host "Enter the full name for the new user"
#$newDescription = Read-Host "Enter a description for the new user"

# Get the existing local user account
$existingUser = Get-LocalUser -Name $existingUsername

if ($existingUser) {
    # Modify the existing local user account
    Set-LocalUser -Name $existingUsername -FullName $newFullName -Description $newDescription
    Write-Host "User account '$existingUsername' modified successfully."
} else {
    Write-Host "User account '$existingUsername' not found."
}
