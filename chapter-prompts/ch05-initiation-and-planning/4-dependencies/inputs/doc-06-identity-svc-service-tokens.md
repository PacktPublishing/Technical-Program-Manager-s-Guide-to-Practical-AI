# Doc 6 — identity-svc: Service Tokens

**Team:** Risk & Identity · **Author:** Ravi Iyer · **Date:** October 2025 · **Status:** Live

## 1. Summary

identity-svc issues the service tokens that internal services use to call each other. This
document replaces the 2024 token design after the Q3 2025 security review.

## 2. Token lifetime

Service tokens are valid for 15 minutes. There is no refresh token for batch clients: a client
that needs longer must re-authenticate with its workload credential before the token expires.
Tokens older than 15 minutes are rejected.

## 3. Rollout

Enforced for all internal callers from 1 December 2025. Calls with long-lived tokens fail
after that date.

## 4. Dependencies

identity-svc stores workload credentials in the secrets manager. If the secrets manager is
unavailable, no new tokens are issued and callers fail when their current token expires.
