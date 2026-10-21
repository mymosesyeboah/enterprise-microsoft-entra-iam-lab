# Lab 04 — Conditional Access Policy Design, Validation, and Recovery

## Business scenario

Contoso Financial Services needs consistent multifactor authentication without locking out emergency administrators. It must also be able to test conditional location restrictions, evaluate their impact before enforcement, diagnose unexpected denial, and restore authorized access after a test.

## Security objectives

- Scope a pilot Conditional Access policy through a dedicated group.
- Validate policies in **report-only** mode before enforcement.
- Extend MFA coverage to users while excluding a designated emergency-access account.
- Verify enforced MFA through sign-in logs.
- Simulate a country-based access restriction, inspect its effects, and reverse the test without leaving the blocking policy active.

## Implementation

### Phase 1 — Targeted Finance pilot

Created `SG-CA-FINANCE-PILOT` and included Ama Boateng. Configured `CA001-Finance-Require-MFA` to require MFA for the pilot group across all resources, initially in **report-only** mode. Checked the sign-in evaluation result.

**Important distinction:** Report-only results describe what a policy would have done; they do not establish enforcement of the report-only policy.

### Phase 2 — Broader MFA baseline and break-glass consideration

Prepared `CA002-All-Users-Require-MFA` for all users and all resources, with a specific exclusion for `Contoso Emergency Access`. Confirmed the emergency account held a Global Administrator role. Evaluated CA001 and CA002 together in report-only mode.

The environment originally used Security Defaults. The tenant-properties evidence later shows Security Defaults unavailable because Conditional Access policies were in use. The screenshot records the resulting state; it does not by itself establish the order or completeness of every administrative change.

After enabling CA002, the selected sign-in's Conditional Access details show **Success** for the MFA policy. This is proof of that policy's successful evaluation on the displayed sign-in, not proof that every user and application was tested.

### Phase 3 — Controlled location-based denial

Defined `NL-Test-Blocked-Location` using Ghana as a country-based IP geolocation condition. Evaluated `CA003-Finance-Block-Test-Location` with a **Block** grant control in report-only mode; the selected record reported **Report-only: Failure**, indicating the test policy would deny the sign-in if enabled.

With CA003 enforced, Ama's sign-in showed a user-facing access denial; the selected Conditional Access tab showed **Failure** for CA003. Because the same view also shows CA002 Failure, this lab does **not** infer that a failed MFA grant was independently the reason for denial. Multiple CA policies can evaluate the same sign-in.

### Phase 4 — Remediation and restored access

Disabled the test location-block policy. A later sign-in showed `CA003` **Disabled** and `CA002` **Success**. Verified the final CA002 MFA baseline remained **On**, with the emergency-access exclusion visible.

## Evidence

The following images are referenced using their intended `evidence/` paths. Upload of the images is a separate publishing step.

### 01 — Finance pilot group

An assigned pilot security group scoped the initial CA001 test to Ama Boateng.

![Finance pilot group](evidence/22-ca-finance-pilot-group.png)

### 02 — CA001 report-only policy

CA001 targets the Finance pilot group, all resources, and MFA, initially evaluated without enforcement.

![CA001 report-only policy](evidence/23-ca-finance-mfa-report-only.png)

### 03 — CA001 report-only result

Sign-in telemetry records Report-only: Success. This is a policy-evaluation outcome, not proof that the report-only policy enforced MFA.

![CA001 report-only result](evidence/24-ca-report-only-evaluation.png)

### 04 — Emergency access role

A dedicated emergency-access account has a permanent Global Administrator assignment. This screenshot does not demonstrate the account's authentication methods or monitoring.

![Emergency access role](evidence/25-emergency-access-account.png)

### 05 — Emergency account exclusion

The all-users CA002 policy excludes the emergency-access account to mitigate lockout risk.

![Emergency account exclusion](evidence/26-ca-emergency-access-exclusion.png)

### 06 — CA002 report-only configuration

An all-users Require MFA policy was staged in report-only mode with selected identity exclusions.

![CA002 report-only configuration](evidence/27-ca002-all-users-mfa-report-only.png)

### 07 — Overlapping policy evaluation

Ama's sign-in was assessed against both CA001 and CA002 in report-only mode.

![Overlapping policy evaluation](evidence/28-layered-ca-policy-evaluation.png)

### 08 — Security Defaults transition

The tenant properties page indicates Conditional Access policies are being used and Security Defaults is not enabled.

![Security Defaults transition](evidence/29-security-defaults-disabled-ca-active.png)

### 09 — Enforced MFA succeeds

The sign-in Conditional Access tab records Success for CA002 after the policy was enabled.

![Enforced MFA succeeds](evidence/30-ca002-mfa-enforced-successfully.png)

### 10 — Test named location

A country-based named location called NL-Test-Blocked-Location was configured for Ghana. The preview shows the named-location definition; it does not on its own prove policy enforcement.

![Test named location](evidence/31-blocked-named-location.png)

### 11 — CA003 dry-run failure

The report-only log shows CA003's Block control would have denied the evaluated sign-in, while the MFA policy passed.

![CA003 dry-run failure](evidence/32-ca003-location-block-report-only.png)

### 12 — User-visible denial

A sign-in was authenticated but access to the requested resource was denied because access criteria were not met.

![User-visible denial](evidence/33-ca003-user-access-blocked.png)

### 13 — Enforced CA failure

The Conditional Access tab records Failure for the block policy and the MFA policy in the selected sign-in. The location-control failure is consistent with the observed access denial.

![Enforced CA failure](evidence/34-ca003-block-enforced-signin-log.png)

### 14 — Access restored

A subsequent log shows CA002 succeeding while CA003 is Disabled, confirming recovery after the test blocking policy was turned off.

![Access restored](evidence/35-ca-access-restored-after-remediation.png)

### 15 — Final MFA policy state

CA002 is On, targets all users and all resources, and excludes the emergency-access account. The selected grant control requires MFA.

![Final MFA policy state](evidence/36-final-ca002-mfa-baseline.png)

## Validation summary

| Test | Observed result | Interpretation |
| --- | --- | --- |
| Finance MFA pilot | Report-only: Success | Pilot policy evaluated; it was not yet enforced |
| All-users MFA rollout | CA002 Success in selected sign-in | Enforced MFA control succeeded for the sampled sign-in |
| Country block preview | CA003 Report-only: Failure | Test block would deny the evaluated access |
| Country block enabled | User denied and CA003 Failure | Location-based test restriction blocked access |
| Policy disabled | CA003 Disabled; CA002 Success | Test restriction no longer applied and access recovered |

## Security decisions and limitations

- An emergency-access exclusion reduces lockout risk but is **not**, by itself, proof of secure break-glass operations. Dedicated monitoring, strong credential controls, test cadence, and access governance are separate requirements.
- Country-based IP geolocation is approximate; it is not reliable proof of physical location and can be affected by VPNs, proxies, and IP-location data.
- The block-by-country control was a **temporary test**, not a production recommendation to block an entire country.
- Conditional Access outcomes are evaluated per sign-in, and report-only results must not be presented as live enforcement.
- The images record test results in a fictional enterprise lab; they are not evidence of real customer deployment or production certification.

## Outcome

Demonstrated the Conditional Access validation cycle: **scope → report-only evaluation → enforce → inspect access decisions → remediate → verify restored access**, while preserving an MFA baseline and documenting emergency-access design considerations.
