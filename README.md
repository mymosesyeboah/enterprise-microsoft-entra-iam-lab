# Enterprise Microsoft Entra ID IAM Lab

**Environment:** Contoso Financial Services (fictional enterprise) · **Focus:** Identity and Access Management (IAM) · **Project status:** In progress

## Overview

The **Enterprise Microsoft Entra ID IAM Lab** is a hands-on cybersecurity portfolio project exploring how an organization can manage identities, enforce least privilege, protect authentication, govern access, and verify security controls across the identity lifecycle.

Built around a fictional financial-services organization, the project connects business requirements to practical IAM decisions. Each lab documents a security problem, the configuration or investigation performed, the evidence collected, and the observed result.

The work spans workforce identities, role-based administration, multi-factor authentication, Conditional Access, joiner-mover-leaver processes, privileged access, access reviews, and external collaboration. Additional modules will extend the environment into enterprise applications, workload identities, monitoring, and automation.

## Business scenario

Contoso Financial Services includes **IT, Finance, HR, Sales, and Security** departments. Its IAM program must help ensure that:

- Users receive access appropriate to their responsibilities.
- Administrative privileges are minimized and activated only when needed.
- Authentication and access policies reduce the risk of unauthorized sign-ins.
- Changes in employment or role trigger appropriate access changes.
- Internal and external identities are governed separately.
- Access decisions and remediation actions can be verified and audited.

## Lab progress

The following modules have published case studies and supporting screenshots.

| Lab | Focus | Demonstrated outcome |
| --- | --- | --- |
| [01: Identity Foundation](01-identity-foundation/README.md) | Users and groups | Created departmental identities and security groups; identified and corrected inappropriate Finance group membership. |
| [02: RBAC and Least Privilege](02-rbac-least-privilege/README.md) | Administrative roles | Replaced excessive Global Administrator access with Helpdesk Administrator and tested intended and restricted actions. |
| [03: Authentication and MFA](03-authentication-mfa/README.md) | Authentication methods | Inspected authentication policy, Authenticator registration, sign-in evidence, and Temporary Access Pass use. |
| [04: Conditional Access](04-conditional-access/README.md) | Context-aware access | Evaluated MFA policies, tested location-based blocking, and examined emergency-access exclusions and sign-in results. |
| [05: Joiner-Mover-Leaver](05-joiner-mover-leaver/README.md) | Identity lifecycle | Created a Finance identity, investigated access accumulation during a Sales transfer, and validated leaver controls and blocked sign-in. |
| [06: Privileged Identity Management](06-pim/README.md) | Just-in-time administration | Changed a standing Helpdesk Administrator assignment to PIM eligibility, tested activation and deactivation, and reviewed audit evidence. |
| [07: Identity Governance](07-identity-governance/README.md) | Access Reviews | Conducted a Finance group review, recorded approval and denial decisions, and verified member removal and audit activity. |
| [08: External Identities](08-external-identities/README.md) | B2B collaboration | Examined guest invitation controls, verified invitation redemption, and placed an external auditor in a dedicated guest group. |

### Work in progress

| Planned module | Focus | Current boundary |
| --- | --- | --- |
| 09: Enterprise Applications | Application assignment and federated sign-on | Application configuration and SAML settings have been explored; end-to-end SSO against a functioning service provider has **not** been demonstrated. |
| 10: Workload Identities | Service principals and application permissions | Case study not yet published. |
| 11: Monitoring and Investigation | Sign-in analysis, auditing, and identity investigations | Case study not yet published. |
| 12: Automation | PowerShell and Microsoft Graph IAM operations | Entra-focused automation case study not yet published. |

## How the labs are documented

Each case study follows a consistent structure: **Overview → Objectives → Scenario → Technologies Used → Implementation Steps with Screenshots → Key Findings → Outcome**.

Screenshots are placed alongside the steps they support so readers can compare the stated action with the visible configuration, test, or audit result. Evidence is interpreted according to what it proves: for example, group membership is not automatically evidence of successful application access, and a report-only policy result is not an enforced access decision.

## Security principles demonstrated

- **Least privilege:** Assign permissions based on the actual task, not convenience.
- **Group-based access:** Use purpose-specific groups to make entitlements easier to manage.
- **Just-in-time privilege:** Replace standing administrative access with eligible, time-bound activation where appropriate.
- **Strong authentication:** Distinguish permitted authentication methods, user registration, and actual sign-in requirements.
- **Conditional Access:** Evaluate access using policy scope, conditions, exclusions, and sign-in evidence.
- **Lifecycle management:** Address access changes for joiners, movers, and leavers.
- **Access governance:** Periodically re-evaluate whether access should continue.
- **Auditability:** Correlate configuration changes, positive and negative tests, and audit records.

## Tools and technologies

Microsoft Entra ID, Microsoft Authenticator, Conditional Access, Privileged Identity Management (PIM), Microsoft Entra Access Reviews, B2B Collaboration, Enterprise Applications, PowerShell, Git, GitHub, and Visual Studio Code.

Available features and enforcement options depend on tenant configuration and licensing.

## Repository validation

PowerShell validation scripts under [`scripts/`](scripts/) check individual lab folders and validate evidence references across the published labs.

```powershell
# Run from the repository root
.\scripts\Test-LabEvidence.ps1 -LabFolder "08-external-identities"
.\scripts\Test-AllLabs.ps1
```

These checks confirm documentation and evidence-file consistency; they do **not** independently verify live Microsoft Entra security settings.

## Scope and evidence boundaries

This is an independently built simulation using a fictional organization, not a production financial-services environment.

- Screenshot evidence supports the specific configuration and results described in each case study.
- B2B guest redemption and group membership do not, on their own, prove authorization to a deployed application.
- The Finance Audit Portal exercise does not yet establish a working business application or successful end-to-end SAML federation.
- Authentication secrets, recovery codes, tokens, and credentials must not be committed to the repository.

## Related project

[Enterprise Active Directory IAM Lab](https://github.com/mymosesyeboah/enterprise-active-directory-iam-lab): complementary on-premises directory and access-management work.
