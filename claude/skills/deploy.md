# /deploy — Pre-deployment Audit

Before deploying anything, audit the codebase for these issues in order. List all findings before making any changes.

## Checklist

1. **Hardcoded URLs** — search for `localhost`, `127.0.0.1`, `0.0.0.0`, and any hardcoded domain names. Replace with environment variables.
2. **Secrets in code** — search for API keys, passwords, or tokens not loaded from `.env`. Flag immediately.
3. **Environment variables** — verify all required env vars are documented and present in `.env.example` or equivalent.
4. **Static asset base paths** — check that frontend build paths (e.g. Vite `base`) are correct for the deployment target, not localhost.
5. **Shell scripts** — scan for unicode characters, unescaped quotes, or bash-isms that could break in CI or container environments.
6. **Docker / container config** — check port bindings, volume mounts, and that the app listens on `0.0.0.0` not `localhost`.
7. **Database connectivity** — confirm connection strings use env vars and are correct for the target environment (not pointing at a local DB).

## After audit

Show the full findings list. Wait for approval before making any changes.
