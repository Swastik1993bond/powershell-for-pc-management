# LocalUserModule.psm1

function Get-LocalUsers {
    $users = Get-LocalUser
    $lastUpdated = Get-Date
    $result = @{
        LastUpdated = $lastUpdated
        Users = $users
    }
    return $result
}

function Get-LocalUserPermissions {
    $users = Get-LocalUser
    $permissions = @()

    foreach ($user in $users) {
        $userPermissions = Get-LocalGroupMember -Group $user.Name | Select-Object -ExpandProperty Name
        $permissions += @{
            UserName = $user.Name
            Permissions = $userPermissions
        }
    }

    return $permissions
}
