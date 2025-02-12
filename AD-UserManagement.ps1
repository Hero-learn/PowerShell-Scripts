# Active Directory User Management Script

# Import the Active Directory module  
Import-Module ActiveDirectory

# Function to create a new user
function Create-NewUser {
    param (
        [string]$Username,
        [string]$FirstName,
        [string]$LastName,
        [string]$Password
    )

    $FullName = "$FirstName $LastName"
    New-ADUser -SamAccountName $Username `
               -UserPrincipalName "$Username@domain.com" `
               -Name $FullName `
               -GivenName $FirstName `
               -Surname $LastName `
               -DisplayName $FullName `
               -PasswordNeverExpires $true `
               -AccountPassword (ConvertTo-SecureString -AsPlainText $Password -Force) `
               -Enabled $true `
               -PassThru

    Write-Host "New user $FullName created successfully."
}

# Function to reset user password
function Reset-UserPassword {
    param (
        [string]$Username,
        [string]$NewPassword
    )

    Set-ADAccountPassword -Identity $Username `
                          -NewPassword (ConvertTo-SecureString -AsPlainText $NewPassword -Force) `
                          -Reset

    Write-Host "Password for $Username has been reset."
}

# Function to enable a user account
function Enable-UserAccount {
    param (
        [string]$Username
    )

    Enable-ADAccount -Identity $Username
    Write-Host "User account $Username has been enabled."
}

# Function to disable a user account
function Disable-UserAccount {
    param (
        [string]$Username
    )

    Disable-ADAccount -Identity $Username
    Write-Host "User account $Username has been disabled."
}

# Function to add a user to a group
function Add-UserToGroup {
    param (
        [string]$Username,
        [string]$GroupName
    )

    Add-ADGroupMember -Identity $GroupName -Members $Username
    Write-Host "User $Username added to group $GroupName."
}

# Function to generate a user account status report
function Generate-UserReport {
    $users = Get-ADUser -Filter * -Property SamAccountName, DisplayName, Enabled, LastLogonDate

    $users | Select-Object SamAccountName, DisplayName, Enabled, LastLogonDate | Export-Csv -Path "C:\UserReport.csv" -NoTypeInformation
    Write-Host "User account report generated and saved to C:\UserReport.csv"
}
 
