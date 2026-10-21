# Enterprise Microsoft Entra ID IAM Lab

**Status:** In progress · **Environment:** Fictional Contoso Financial Services tenant · **Focus:** Identity and Access Management (IAM)

## Overview
The Enterprise Microsoft Entra ID IAM Lab is a hands-on cybersecurity project designed to simulate identity and access management operations within Contoso Financial Services, a fictional enterprise environment.

The project demonstrates the design, implementation, testing, and validation of enterprise IAM security controls using Microsoft Entra ID.

It covers identity lifecycle management, Role-Based Access Control (RBAC), Multi-Factor Authentication (MFA), Conditional Access, Privileged Identity Management (PIM), Identity Governance, External Identities, and Enterprise Application Access Management.

Each implementation focuses on addressing realistic IAM security challenges through least-privilege access, identity lifecycle controls, privileged access protection, access reviews, and security validation.

## Business scenario
Contoso Financial Services has IT, Finance, HR, Sales, and Security departments. IAM controls must ensure employees receive appropriate access, privileged actions are limited and auditable, access changes with employment status, and external partners are separated from the workforce.

## Implemented lab work
| Module | Demonstrated work | Evidence status |
| --- | --- | --- |
| 01 — Identity foundation | Created fictional departmental identities and security groups; identified and corrected inappropriate Finance group membership | Narrative documented; screenshots pending redaction |
| 02 — RBAC and least privilege | Tested overprivileged Global Administrator assignment; remediated to Helpdesk Administrator; performed positive and negative authorization checks | Narrative documented; screenshots pending redaction |
| 03 — Authentication and MFA | Examined tenant method policy and user registration; tested Microsoft Authenticator; inspected unsuccessful and successful sign-in records; tested Temporary Access Pass use | Narrative documented; screenshots pending redaction |
| 04 — Conditional Access | Validated Finance-pilot and all-users MFA policies, report-only evaluation, enforced location blocking, emergency-access exclusion, and restored access | [Case study published](04-conditional-access/README.md); evidence upload pending |
| 05 — Joiner, mover, leaver | Simulated changes to group membership and validated disabled-account sign-in failure | Narrative documented; screenshots pending redaction |
| 06 — Privileged Identity Management | Replaced a standing Helpdesk Administrator role with eligible assignment; configured MFA, justification, and limited activation; verified activation and deactivation audit events | Narrative documented; screenshots pending redaction |
| 07 — Identity governance | Performed a Finance group access review, recorded approval/denial decisions, and verified group membership remediation and audit activity | Narrative documented; screenshots pending redaction |
| 08 — External identities | Configured guest collaboration settings; invited and redeemed an external guest; separated guest access into a dedicated external-auditor group | Narrative documented; screenshots pending redaction |
| 09 — Enterprise applications | Created a non-gallery enterprise application, required assignment, and assigned a Finance group and external guest; inspected SAML configuration | **SSO not completed or verified** |

## Security design principles
- **Least privilege:** Choose the minimum necessary directory role and application assignment.
- **Group-based access:** Prefer departmental or purpose-specific security groups over broad ad-hoc permissions.
- **Just-in-time elevation:** Reduce permanent privilege with PIM where supported.
- **Defense in depth:** Apply identity proofing, MFA, Conditional Access, and authorization controls in their respective layers.
- **Verification:** Include successful and unsuccessful tests, audit trails, and before/after remediation evidence.
- **Separation of identities:** Keep external auditors separate from internal employee access groups.

## Technical environment
Microsoft Entra ID; Microsoft Authenticator; Conditional Access; Privileged Identity Management (PIM); Access Reviews; B2B collaboration; Enterprise Applications. Exact availability depends on tenant licensing.

## Lab documentation
- [01 — Identity foundation](01-identity-foundation/README.md)
- [02 — RBAC and least privilege](02-rbac-least-privilege/README.md)
- [03 — Authentication and MFA](03-authentication-mfa/README.md)
- [04 — Conditional Access](04-conditional-access/README.md)
- Additional lab write-ups and **sanitized** evidence will be published incrementally.

## Current limitations
- **Finance Audit Portal** is an Entra enterprise application identity and assignment configuration, **not a deployed business web application**.
- SAML configuration was examined, but no valid service-provider Entity ID / ACS URL was integrated; **end-to-end SSO is untested**.
- Application assignments prove configured eligibility, not successful application sign-in or authorization inside a live application.
- Screenshots and exports have not yet been published pending review for personal addresses, tenant identifiers, credentials, tokens, and recovery information.

## Evidence policy
Publish only sanitized lab screenshots. Never commit passwords, Temporary Access Pass values, tokens, client secrets, unredacted personal email addresses, tenant IDs, subscription IDs, or sensitive support/billing information. Preserve enough of each image to prove the security decision and observed result.

## Related work
[Enterprise Active Directory IAM Lab](https://github.com/mymosesyeboah/enterprise-active-directory-iam-lab)

## Next steps
Add sanitized evidence and detailed write-ups; complete real SAML SSO against a test service provider; expand into workload identities, monitoring, and automation.
