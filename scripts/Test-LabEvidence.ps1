param(
    [Parameter(Mandatory)]
    [string]$LabFolder
)

$readme = Join-Path $LabFolder "README.md"
$evidence = Join-Path $LabFolder "evidence"
$hasErrors = $false

Write-Host "Checking lab: $LabFolder"

if (Test-Path $readme -PathType Leaf) {
    Write-Host "[PASS] README exists"
} else {
    Write-Host "[FAIL] README missing"
    $hasErrors = $true
}

if (Test-Path $evidence -PathType Container) {
    $images = @(
        Get-ChildItem -Path $evidence -File -Recurse |
        Where-Object { $_.Extension -in '.png', '.jpg', '.jpeg' }
    )

    Write-Host "Images found: $($images.Count)"

    if ($images.Count -gt 0) {
        Write-Host "[PASS] Evidence screenshots found"
    } else {
        Write-Host "[FAIL] Evidence folder is empty"
        $hasErrors = $true
    }
} else {
    Write-Host "[FAIL] Evidence folder missing"
    $hasErrors = $true
}

if ($hasErrors) {
    exit 1
}

exit 0
