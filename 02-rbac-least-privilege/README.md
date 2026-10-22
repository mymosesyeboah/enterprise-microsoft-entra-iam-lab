# Lab 02: Administrative RBAC and Least-Privilege Validation

## Business scenario

Contoso Financial Services needs an IT support administrator who can perform routine user-assistance operations without having tenant-wide control. Assigning Global Administrator solely for password support exceeds the role's business requirement and increases the impact of credential compromise.

## Security objectives

- Separate day-to-day and privileged administrative identities.
- Identify excessive directory privileges.
- Replace broad standing privileges with a task-appropriate built-in administrative role.
- Validate an allowed helpdesk operation and a restricted privileged operation.
- Record what the lab evidence actually proves.

## Identity and environment

- **Standard identity:** Daniel Mensah
- **Privileged identity:** Daniel Mensah - Admin
- **Identity platform:** Microsoft Entra ID
- **Business task:** Support a routine user password reset
- **Initial role:** Global Administrator (active; permanent)
- **Remediated role:** Helpdesk Administrator (active; permanent during this lab)

A separate administrative identity limits mixing of routine work and privileged activity. It does **not** alone make the role just-in-time or eliminate credential theft risk.

## Implementation and security finding

### 1. Separated standard and administrative accounts

The tenant contained Daniel's everyday user identity and a dedicated administrator identity. This made it possible to distinguish routine user actions from privileged operations.

### 2. Simulated excessive standing privilege

The privileged identity was assigned **Global Administrator**, active and permanent. This was intentionally overprivileged for the intended helpdesk task.

**Finding:** Global Administrator grants far broader directory administration authority than routine password support requires.

### 3. Remediated the role assignment

Removed Global Administrator from Daniel's admin identity and assigned **Helpdesk Administrator**.

**Design rationale:** Select a built-in role based on the required task rather than convenience or maximum access. Helpdesk Administrator itself has a defined and potentially broad scope, so real deployments should validate target-account scope, administrator hierarchy, and any appropriate administrative-unit restrictions.

### 4. Positive authorization validation

As the delegated administrator, the password-reset operation for **David Tetteh**, a nonprivileged lab user, was available. The recorded result shows a successful reset.

**Important:** The evidence deliberately removes the displayed temporary password. No password or recovery code belongs in the repository.

### 5. Negative authorization validation

In the Global Administrator assignments view, **Add assignments** was disabled for the delegated account.

**Interpretation:** The interface did not allow that delegated account to add a Global Administrator assignment. This is a UI-level negative authorization test, not an API-based exhaustive proof of every privileged action being denied.

## Evidence

### 1. Dedicated standard and admin identities

The ordinary user and dedicated administrative identity are distinct accounts.

![Dedicated standard and admin identities](evidence/01-standard-and-admin-identities.png)

### 2. Initial excessive privilege

The administrative identity held a permanently active Global Administrator role, exceeding its helpdesk requirement.

![Initial excessive privilege](evidence/02-excessive-global-administrator.png)

### 3. Least-privilege role remediation

The Global Administrator assignment was replaced by a Helpdesk Administrator assignment.

![Least-privilege role remediation](evidence/03-helpdesk-administrator-remediation.png)

### 4. Positive authorization: password-reset option

The delegated administrator could initiate a password reset for a nonprivileged test user.

![Positive authorization: password-reset option](evidence/04-password-reset-capability.png)

### 5. Password-reset result

The UI confirmed the password reset succeeded. The temporary password is deliberately not shown.

![Password-reset result](evidence/05-password-reset-success.png)

### 6. Negative authorization: role management

The Add assignments control for Global Administrator was disabled for the delegated account; this is UI-level evidence, not an exhaustive permissions test.

![Negative authorization: role management](evidence/06-global-admin-assignment-denied.png)

## Result

| Test | Expected | Observed |
| --- | --- | --- |
| Admin identity separation | Dedicated privileged identity available | Confirmed |
| Least-privilege remediation | Remove Global Administrator and retain task-appropriate helpdesk ability | Confirmed |
| Helpdesk password reset | Allowed for a supported standard user | Confirmed |
| Global Administrator role assignment | Not available to Helpdesk Administrator | Disabled assignment control observed |

## Scope and limitations

- The Helpdesk Administrator assignment remained **active and permanent** during Lab 2. It was subsequently converted to eligible, time-bound activation in **Lab 6: Privileged Identity Management**. We do not present PIM as part of this lab.
- Password-reset capabilities vary with the administrator's role and the target user's privileges.
- The password reset test did not assess helpdesk permissions for privileged administrator accounts or hybrid identities.
- The negative test documents the visible portal restriction; it does not establish that all privilege escalation paths were tested.
- Evidence uses a fictional enterprise tenant and sanitized captures.

## Security outcome

This exercise shows the least-privilege workflow **business task → excessive role identification → role remediation → permitted action test → restricted action test**. It demonstrates why IAM role selection must be justified and verified, rather than inferred from an administrator's job title.
