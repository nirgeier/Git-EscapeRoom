#!/bin/bash
# Room 07 setup - git log: hunting through 250 commits
# Password hidden in commit message "password: logmaster" (~commit 157)
# The commit also creates a file named "password" containing the password.

git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"

# ── helper: bump a counter file and commit ──────────────────────────────────
commit() {
    local msg="$1"
    local file="${2:-counter.txt}"
    echo "$msg" >> "$file"
    git add "$file" 2>/dev/null
    git commit -m "$msg" 2>/dev/null
}

# ── initial project skeleton (commit 1) ─────────────────────────────────────
cat >README.md <<'EOF'
# Project Omega
Enterprise-grade backend service.
EOF
cat >app.py <<'EOF'
"""Application entry point."""
def main():
    print("Starting app...")

if __name__ == "__main__":
    main()
EOF
cat >config.yml <<'EOF'
host: localhost
port: 8080
debug: false
EOF
cat >.gitignore <<'EOF'
__pycache__/
*.pyc
.env
*.log
EOF
git add . && git commit -m "chore: initial project scaffold" 2>/dev/null

# ── bulk commits 2-60: feature work ─────────────────────────────────────────
MESSAGES_A=(
    "feat: add user authentication module"
    "feat: implement JWT token validation"
    "fix: correct token expiry calculation"
    "feat: add password reset endpoint"
    "test: add unit tests for auth module"
    "docs: document authentication flow"
    "refactor: extract token helpers to utils"
    "fix: handle null user in login handler"
    "feat: add rate limiting to login endpoint"
    "chore: update dependencies to latest"
    "feat: implement email verification"
    "fix: resolve race condition in session store"
    "test: add integration tests for login"
    "feat: add OAuth2 Google provider"
    "feat: add OAuth2 GitHub provider"
    "fix: correct redirect URI encoding"
    "refactor: consolidate OAuth handlers"
    "docs: add API reference for /auth"
    "feat: add refresh token rotation"
    "fix: prevent token reuse after rotation"
    "test: mock external OAuth responses"
    "chore: add pre-commit hooks"
    "feat: add audit log for auth events"
    "fix: sanitize username input"
    "style: run linter on auth package"
    "feat: add MFA support (TOTP)"
    "fix: correct TOTP window tolerance"
    "test: add MFA unit tests"
    "docs: update README with MFA setup"
    "refactor: move config to environment vars"
    "feat: add health check endpoint"
    "fix: health check ignores DB timeout"
    "feat: add metrics endpoint (Prometheus)"
    "chore: configure CI pipeline"
    "fix: CI fails on Python 3.11 syntax"
    "feat: add database connection pooling"
    "fix: pool exhaustion under load"
    "test: load test connection pool"
    "refactor: lazy-load database module"
    "docs: add deployment guide"
    "feat: add Redis cache layer"
    "fix: cache invalidation on user update"
    "test: cache integration tests"
    "feat: add request tracing (OpenTelemetry)"
    "fix: trace context lost across async calls"
    "chore: pin OpenTelemetry to v1.22"
    "feat: add structured JSON logging"
    "fix: log level not respected in workers"
    "refactor: replace print with logger"
    "docs: add observability runbook"
    "feat: add graceful shutdown handler"
    "fix: shutdown doesn't drain in-flight requests"
    "test: shutdown integration test"
    "feat: add API versioning (/v1, /v2)"
    "fix: v1 deprecation header missing"
    "chore: remove deprecated v0 endpoints"
    "docs: API versioning policy"
    "refactor: split routes into blueprints"
    "fix: blueprint registration order matters"
    "feat: add CORS configuration"
)

for msg in "${MESSAGES_A[@]}"; do
    commit "$msg"
done

# ── bulk commits 61-100: database and migration work ────────────────────────
MESSAGES_B=(
    "feat: add Alembic migration framework"
    "feat: create users table migration"
    "feat: create sessions table migration"
    "feat: create audit_log table migration"
    "fix: migration fails on existing schema"
    "feat: add index on users.email"
    "fix: index creation missing IF NOT EXISTS"
    "chore: seed development database"
    "test: run migrations in CI"
    "docs: database schema diagram"
    "feat: add soft-delete to users table"
    "fix: soft-delete leaks into queries"
    "refactor: add BaseModel with timestamps"
    "feat: add full-text search index"
    "fix: FTS tokenizer config for non-ASCII"
    "test: search relevance scoring tests"
    "feat: add jsonb settings column"
    "fix: jsonb query performance regression"
    "chore: vacuum and analyze after migration"
    "docs: write DB maintenance runbook"
    "feat: partition audit_log by month"
    "fix: partition pruning not triggered"
    "test: verify partition key constraints"
    "refactor: move raw SQL to ORM queries"
    "fix: N+1 query in user list endpoint"
    "feat: add query result pagination"
    "fix: off-by-one in page boundary calc"
    "test: pagination edge cases"
    "docs: pagination API documentation"
    "feat: add read replica support"
    "fix: replica lag causes stale reads"
    "test: failover to replica on primary down"
    "chore: rotate DB credentials"
    "feat: add connection retry with backoff"
    "fix: backoff jitter overflow on int32"
    "refactor: extract DB config to dataclass"
    "feat: add DB query timeout"
    "fix: timeout not propagated to nested calls"
    "test: timeout fires on slow query"
    "docs: DB connection troubleshooting"
)

for msg in "${MESSAGES_B[@]}"; do
    commit "$msg" "db_notes.txt"
done

# ── bulk commits 101-156: infra and devops ──────────────────────────────────
MESSAGES_C=(
    "chore: add Dockerfile"
    "fix: Dockerfile uses wrong base image"
    "feat: add docker-compose for local dev"
    "fix: compose volume mount path incorrect"
    "chore: add .dockerignore"
    "feat: add Kubernetes deployment manifest"
    "feat: add Kubernetes service manifest"
    "feat: add Kubernetes ingress manifest"
    "fix: ingress TLS secret name wrong"
    "feat: add Helm chart scaffold"
    "feat: add Helm values for staging"
    "feat: add Helm values for production"
    "fix: Helm template quote escaping"
    "chore: add chart version bump script"
    "feat: add GitHub Actions CI workflow"
    "feat: add GitHub Actions CD workflow"
    "fix: CD workflow missing AWS credentials"
    "feat: add Dependabot config"
    "chore: configure branch protection rules"
    "feat: add CodeQL security scanning"
    "fix: CodeQL false positive in crypto util"
    "feat: add SAST with Semgrep"
    "chore: tune Semgrep rule severity"
    "feat: add container image scanning"
    "fix: critical CVE in base image - bump"
    "chore: automate base image updates"
    "feat: add infrastructure as code (Terraform)"
    "feat: Terraform VPC module"
    "feat: Terraform RDS module"
    "feat: Terraform ElastiCache module"
    "fix: Terraform state lock timeout"
    "chore: remote state backend (S3 + DynamoDB)"
    "feat: add staging environment"
    "fix: staging DB not seeded on first boot"
    "feat: add canary deployment strategy"
    "fix: canary traffic split off by 5%"
    "docs: runbook for canary rollback"
    "feat: add feature flags service"
    "fix: feature flag default not respected"
    "test: feature flag integration test"
    "feat: add secrets manager integration"
    "fix: secrets rotation breaks live pods"
    "chore: rolling restart after secret rotation"
    "feat: add PagerDuty alert routing"
    "fix: alert deduplication key collision"
    "docs: on-call escalation policy"
    "feat: add SLO dashboard (Grafana)"
    "fix: SLO burn rate alert threshold"
    "chore: archive old dashboards"
    "docs: SLO definitions and targets"
    "feat: add chaos engineering tests"
    "fix: chaos test tears down prod DB"
    "chore: isolate chaos tests to staging"
    "feat: add load balancer health checks"
    "fix: health check interval too aggressive"
    "refactor: consolidate infra module outputs"
)

for msg in "${MESSAGES_C[@]}"; do
    commit "$msg" "infra_log.txt"
done

# ── THE PASSWORD COMMIT (commit ~157) ───────────────────────────────────────
echo "logmaster" >password
git add password
git commit -m "password: logmaster" 2>/dev/null

# ── bulk commits 158-250: cleanup and release work ──────────────────────────
MESSAGES_D=(
    "chore: bump version to 1.0.0-rc1"
    "fix: version string not injected at build"
    "feat: add CHANGELOG.md"
    "docs: add CONTRIBUTING guide"
    "docs: add CODE_OF_CONDUCT"
    "chore: add LICENSE (Apache-2.0)"
    "feat: add release automation script"
    "fix: release script missing git tag push"
    "chore: tag v1.0.0-rc1"
    "fix: rc1 regression in login flow"
    "chore: bump version to 1.0.0-rc2"
    "test: full regression suite on rc2"
    "fix: flaky test in session expiry suite"
    "chore: tag v1.0.0-rc2"
    "feat: add dark mode support"
    "fix: dark mode flicker on initial load"
    "test: visual regression test for dark mode"
    "refactor: CSS variables for theme tokens"
    "feat: add internationalisation (i18n)"
    "fix: RTL layout broken in Safari"
    "test: i18n string coverage check"
    "chore: extract translation strings"
    "feat: add Spanish translation"
    "feat: add French translation"
    "feat: add German translation"
    "fix: German date format locale mismatch"
    "chore: sync translation files with Crowdin"
    "feat: add accessibility audit (axe-core)"
    "fix: missing aria-label on icon buttons"
    "fix: focus trap broken in modal"
    "test: automated a11y tests in CI"
    "docs: accessibility statement"
    "feat: add keyboard shortcut system"
    "fix: shortcuts conflict with browser defaults"
    "docs: keyboard shortcuts reference"
    "feat: add print stylesheet"
    "fix: print stylesheet clips table columns"
    "chore: generate PDF export from print CSS"
    "feat: add export to CSV"
    "fix: CSV export missing UTF-8 BOM for Excel"
    "test: CSV round-trip integrity test"
    "feat: add export to JSON"
    "feat: add import from CSV"
    "fix: import rejects valid ISO 8601 dates"
    "test: import fuzz testing"
    "feat: add data retention policy enforcement"
    "fix: retention job skips last partition"
    "chore: schedule retention job via cron"
    "docs: data retention policy documentation"
    "feat: add GDPR data export (right to access)"
    "feat: add GDPR data deletion (right to erasure)"
    "fix: erasure leaves orphan records in audit_log"
    "test: GDPR erasure integration test"
    "docs: GDPR compliance checklist"
    "feat: add cookie consent banner"
    "fix: consent banner re-shows after accept"
    "chore: legal review sign-off commit"
    "feat: add privacy policy page"
    "feat: add terms of service page"
    "chore: final pre-release QA sign-off"
    "fix: last-minute typo in error message"
    "chore: update CHANGELOG for v1.0.0"
    "chore: bump version to 1.0.0"
    "chore: tag v1.0.0"
    "feat: add post-release monitoring alert"
    "chore: archive feature branch cleanup"
    "docs: update README with v1.0.0 badges"
    "feat: start v1.1.0 development cycle"
    "chore: create v1.1.0 milestone"
    "feat: add webhook support"
    "fix: webhook signature verification fails"
    "test: webhook replay attack prevention test"
    "feat: add webhook retry with exponential backoff"
    "fix: retry storm on permanent webhook failure"
    "chore: add dead-letter queue for failed webhooks"
    "docs: webhook integration guide"
    "feat: add GraphQL API alongside REST"
    "fix: GraphQL N+1 resolved with DataLoader"
    "test: GraphQL schema snapshot tests"
    "feat: add GraphQL subscriptions (WebSocket)"
    "fix: subscription connection leak on client disconnect"
    "chore: update API docs to include GraphQL"
    "feat: add SDK for Python clients"
    "feat: add SDK for Node.js clients"
    "fix: Python SDK missing async support"
    "test: SDK contract tests"
    "docs: SDK quickstart guides"
    "chore: publish SDKs to PyPI and npm"
    "feat: add developer portal"
    "fix: developer portal 404 on deep links"
    "chore: redirect legacy docs URLs"
)

for msg in "${MESSAGES_D[@]}"; do
    commit "$msg" "release_log.txt"
done

echo "Room 07: Setup complete — $(git rev-list --count HEAD) commits created"
