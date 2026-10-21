# Lab 01 — Identity Foundation and Least-Privilege Group Membership

## Business context
Contoso Financial Services, a fictional financial institution, uses Microsoft Entra ID to manage workforce identities across IT, Finance, HR, Sales, and Security. Departmental security groups provide an organizational basis for later application and resource assignments.

## Security objective
Establish identifiable workforce accounts and consistent departmental group membership, then detect and remediate a deliberately introduced cross-department access error.

## Environment
- Identity platform: Microsoft Entra ID
- Workforce scope: Ten fictional departmental employee accounts, plus an existing administrator identity shown in the user inventory
- Five assigned security groups: `SG-IT-USERS`, `SG-FINANCE-USERS`, `SG-HR-USERS`, `SG-SALES-USERS`, and `SG-SECURITY-USERS`

## Implementation
1. Provisioned fictional departmental users with organizational attributes such as Department, Company, and Job Title.
2. Created the five assigned security groups to reflect department-based access boundaries.
3. Verified Finance baseline membership: **Ama Boateng** and **Kwame Asare**.
4. Simulated inappropriate membership by adding **Sarah Osei** (HR) to `SG-FINANCE-USERS`.
5. Identified Sarah's membership as inconsistent with her department and removed it.
6. Verified Finance group membership returned to **Ama Boateng** and **Kwame Asare**.

## Finding: unnecessary Finance group membership
**Expected:** Only approved Finance users should belong to `SG-FINANCE-USERS`.

**Observed:** HR employee Sarah Osei temporarily appeared alongside Ama and Kwame.

**Risk:** Resources that trust the Finance group for authorization could unintentionally grant access to an employee without a Finance business need.

**Remediation:** Removed Sarah from the Finance group.

**Verification:** Compared the three-member before-remediation view with the restored two-member membership list.

**Scope of claim:** This exercise verifies **Entra group membership remediation**. No actual finance resource permission or data access test was performed in this module.

## Evidence sequence
| # | Screenshot | What it demonstrates |
|---|---|---|
| 01 | `01-users-inventory.png` | Fictional employee identities in the tenant inventory |
| 02 | `02-user-business-attributes.png` | Ama's Finance department, job title, and company attributes |
| 03 | `03-department-security-groups.png` | Five assigned departmental security groups |
| 04 | `04-finance-membership-baseline.png` | Intended two-person Finance group membership |
| 05 | `05-finance-membership-finding.png` | Deliberately introduced HR membership in Finance group |
| 06 | `06-finance-membership-remediated.png` | Removal of inappropriate membership and restored baseline |

**Publishing status:** Screenshots are being sanitized and staged separately; the evidence table documents the intended images without claiming they are already hosted here.

## Outcome
Demonstrated a repeatable identity foundation and a practical least-privilege control cycle: **baseline → access anomaly → investigation → remediation → verification**.

## Interview takeaway
> I provisioned fictional departmental identities in Entra ID, organized assigned security groups, simulated an inappropriate HR-to-Finance group assignment, then removed it and verified the expected membership state. I documented the authorization risk without misrepresenting group membership as proven access to a production finance resource.
