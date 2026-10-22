param(
    [string]$OutputPath = (Join-Path $HOME 'Documents\Disabled-Users-Report.csv')
)

# Requires Microsoft.Graph.Users and a delegated connection with User.Read.All.
# Authenticate interactively first: Connect-MgGraph -Scopes 'User.Read.All'
$context = Get-MgContext
if (-not $context -or $context.AuthType -ne 'Delegated') {
    throw 'Connect to Microsoft Graph using delegated authentication before running this report.'
}

$users = Get-MgUser -All -Property Id,DisplayName,UserPrincipalName,AccountEnabled -ErrorAction Stop
$disabledUsers = @($users | Where-Object { $_.AccountEnabled -eq $false } |
    Select-Object DisplayName,UserPrincipalName,AccountEnabled)

$disabledUsers | Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8
Write-Host "Exported $($disabledUsers.Count) disabled account(s) to $OutputPath"
Import-Csv -Path $OutputPath | Format-Table -AutoSize
