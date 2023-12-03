# Prompt the user for input
$newUsername = Read-Host "Enter the new username"
$newPassword = Read-Host "Enter the password for the new user" -AsSecureString
$newFullName = Read-Host "Enter the full name for the new user"
$newDescription = Read-Host "Enter a description for the new user"

# Create a new local user account
New-LocalUser -Name $newUsername -Password $newPassword -FullName $newFullName -Description $newDescription
