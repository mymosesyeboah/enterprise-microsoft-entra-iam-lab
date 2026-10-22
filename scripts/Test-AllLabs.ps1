
$repoRoot = Split-Path -Parent $PSScriptRoot
$validator = Join-Path $PSScriptRoot "Test-LabEvidence.ps1"

Set-Location $repoRoot

$labFolders = @(
    Get-ChildItem -Path $repoRoot -Directory |
    Where-Object { $_.Name -match '^\d{2}-' } |
    Sort-Object Name
)

$failedLabs = 0

foreach ($lab in $labFolders) {
    Write-Host "`n============================"
    Write-Host "Validating $($lab.Name)"
    Write-Host "============================"

    & $validator -LabFolder $lab.FullName

    if ($LASTEXITCODE -ne 0) {
        $failedLabs++
    }
}

Write-Host "`nValidation summary"
Write-Host "Labs checked: $($labFolders.Count)"
Write-Host "Labs failed: $failedLabs"

if ($labFolders.Count -eq 0 -or $failedLabs -gt 0) {
    exit 1
}

exit 0
