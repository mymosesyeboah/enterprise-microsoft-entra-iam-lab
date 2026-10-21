# Lab 01 — Identity Foundation and Security Groups

## Business problem
Contoso Financial Services needs a manageable identity structure for IT, Finance, HR, Sales, and Security. Incorrect departmental group membership can create excess access.

## Objective
Create representative cloud identities with business attributes, organize them into security groups, and detect and remediate inappropriate membership.

## Implementation
1. Created ten fictional employee accounts across five departments, including Department and Job Title attributes.
2. Created assigned security groups:
   - `SG-IT-USERS`
   - `SG-FINANCE-USERS`
   - `SG-HR-USERS`
   - `SG-SALES-USERS`
   - `SG-SECURITY-USERS`
3. Populated the departmental groups with the intended employees.
4. Simulated an access-control error by adding HR user Sarah Osei to `SG-FINANCE-USERS`.

## Finding and remediation
**Finding:** Sarah's membership in the Finance group was inconsistent with her HR role and introduced potential excessive authorization wherever that group was assigned access.

**Remediation:** Removed Sarah from `SG-FINANCE-USERS` and rechecked the group's membership.

## Verification
Compared membership before and after the change. The unwanted cross-department membership was removed. This is a **group-membership authorization** test; it does not independently prove access to a live finance application or dataset.

## Security outcome
Established a repeatable departmental grouping model and demonstrated identification and correction of an inappropriate group assignment.

## Key IAM concepts
Identity attributes · Security groups · Least privilege · Group-based authorization · Access validation · Audit-ready evidence

## Evidence
Screenshots of user records, department groups, inappropriate membership, and remediation will be added **only after sanitization**. No raw screenshot is included in this initial publication.
