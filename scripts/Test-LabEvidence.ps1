
param(
    [Parameter(Mandatory)]
    [string]$LabFolder
)

$readme = Join-Path $LabFolder "README.md"
$evidence = Join-Path $LabFolder "evidence"
$hasErrors = $false

Write-Host "Checking lab: $LabFolder"

if (-not (Test-Path $readme -PathType Leaf)) {
    Write-Host "[FAIL] README missing"
    $hasErrors = $true
}
else {
    Write-Host "[PASS] README exists"
}

if (-not (Test-Path $evidence -PathType Container)) {
    Write-Host "[FAIL] Evidence folder missing"
    $hasErrors = $true
}
else {
    $images = @(
        Get-ChildItem -Path $evidence -File -Recurse |
        Where-Object {
            $_.Extension -in '.png', '.jpg', '.jpeg'
        }
    )

    Write-Host "Images found: $($images.Count)"

    if ($images.Count -eq 0) {
        Write-Host "[FAIL] No screenshots found"
        $hasErrors = $true
    }
    else {
        Write-Host "[PASS] Evidence screenshots found"
    }
}

if (Test-Path $readme -PathType Leaf) {
    $content = Get-Content $readme -Raw

    $pattern = '!\[[^\]]*\]\((evidence/[^)]+)\)'
    $references = [regex]::Matches($content, $pattern)

    Write-Host "README image references: $($references.Count)"

    if ($references.Count -eq 0) {
        Write-Host "[FAIL] No Markdown image references found"
        $hasErrors = $true
    }

    foreach ($reference in $references) {
        $relativePath = $reference.Groups[1].Value
        $imagePath = Join-Path $LabFolder $relativePath

        if (Test-Path $imagePath -PathType Leaf) {
            Write-Host "[PASS] $relativePath"
        }
        else {
            Write-Host "[FAIL] Missing image: $relativePath"
            $hasErrors = $true
        }
    }
}

if ($hasErrors) {
    Write-Host "`nValidation FAILED"
    exit 1
}

Write-Host "`nValidation PASSED"
exit 0
