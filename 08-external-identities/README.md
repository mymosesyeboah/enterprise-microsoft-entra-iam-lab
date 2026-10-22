# Lab 08 — External Identities and B2B Guest Collaboration

## Scenario

Contoso Financial Services (fictional lab organization) needs to onboard an external finance auditor without creating an internal employee identity or providing broad departmental access. The exercise focuses on B2B collaboration controls, invitation redemption, and narrowly scoped group membership.

## Objectives

- Inspect external collaboration restrictions and invitation settings.
- Examine a more restrictive guest-invitation option.
- Create an external guest identity and observe the invitation lifecycle.
- Verify acceptance of the invitation.
- Place the guest in a dedicated external-auditor security group instead of the internal Finance group.

## Implementation and evidence

| Evidence | Observation |
| --- | --- |
| [01 — Collaboration baseline](evidence/01-external-collaboration-baseline.png) | Guest directory access was limited; baseline invitation option was broadly permissive. |
| [02 — Invitation setting selected](evidence/02-guest-invitation-setting-selected.png) | The portal shows the narrower option allowing members and selected administrator roles to invite guests. **The screenshot alone does not verify that this selection was saved.** |
| [03 — Pending redemption](evidence/03-external-guest-pending-redemption.png) | Emily Johnson appears as a **Guest** with invitation state **Pending acceptance**, no group assignments, and an enabled account. |
| [04 — Invitation accepted](evidence/04-external-guest-invitation-accepted.png) | The guest's B2B invitation state changes to **Accepted**. |
| [05 — External auditor group](evidence/05-external-auditor-security-group-membership.png) | The guest appears as the one direct member of `SG-FINANCE-EXTERNAL-AUDITORS`. |

## Security design

The external auditor was granted membership in a dedicated external-auditor group rather than the internal `SG-FINANCE-USERS` group. This supports least-privilege design and separates third-party identities from ordinary finance employees.

Guest **invitation**, **redemption**, **group membership**, and **resource authorization** are different lifecycle stages. An accepted invitation proves successful redemption, not entitlement to a particular application. Group membership is an authorization building block, but does not itself establish that a resource was configured to trust the group.

## Validation outcomes

**Observed:** Guest identity created, invitation pending, invitation accepted, and membership in the external-auditor security group.

**Not demonstrated by these screenshots:** a saved policy change confirmation, successful sign-in to an actual finance application, resource-level positive/negative authorization testing, automated guest provisioning, or guest access expiration and removal.

## Evidence handling

The screenshots were supplied from a self-directed lab. A personal external email address has been obscured in the shared screenshots; no password, temporary access pass, token, or invitation redemption URL is included. The duplicated image supplied under a separate invitation-configuration filename was intentionally excluded.

## Further improvements

A future extension could document an actual application assignment to this group, a successful guest access test, a non-member denial, cross-tenant restrictions, and review/removal of guest access. These steps should only be marked complete when verified.

## Screenshot Evidence

### 01 — External Collaboration Baseline
![External Collaboration Baseline](evidence/01-external-collaboration-baseline.png)

### 02 — Guest Invitation Settings
![Guest Invitation Settings](evidence/02-guest-invitation-setting-selected.png)

### 03 — Guest Pending Redemption
![Guest Pending Redemption](evidence/03-external-guest-pending-redemption.png)

### 04 — Guest Invitation Accepted
![Guest Invitation Accepted](evidence/04-external-guest-invitation-accepted.png)

### 05 — External Auditor Group Membership
![External Auditor Group Membership](evidence/05-external-auditor-security-group-membership.png)

