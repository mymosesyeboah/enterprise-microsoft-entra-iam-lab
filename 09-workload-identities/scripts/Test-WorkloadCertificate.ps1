param(
    [int]$WarningThreshold = 30
)

$applicationName = "Contoso-IAM-Automation"
$certificateSubject = "CN=Contoso-IAM-Automation-Lab"

$certificate = Get-ChildItem Cert:\CurrentUser\My |
    Where-Object { $_.Subject -eq $certificateSubject } |
    Sort-Object NotAfter -Descending |
    Select-Object -First 1

if (-not $certificate) {
    Write-Error "Certificate not found: $certificateSubject"
    exit 1
}

$daysRemaining = [math]::Floor(($certificate.NotAfter - (Get-Date)).TotalDays)

if ($daysRemaining -le 0) {
    $status = "EXPIRED"
} elseif ($daysRemaining -le $WarningThreshold) {
    $status = "WARNING: Renewal approaching"
} else {
    $status = "HEALTHY"
}

[PSCustomObject]@{
    Application = $applicationName
    Certificate = $certificate.Subject
    ExpiresOn = $certificate.NotAfter
    DaysRemaining = $daysRemaining
    WarningThreshold = $WarningThreshold
    Status = $status
}
