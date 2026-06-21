#!/usr/bin/env bash
# =============================================================================
# MoneySmartPro - Privacy Policy GitHub Pages Deployment
# =============================================================================
# Usage:
#   chmod +x deploy.sh
#   ./deploy.sh <github-username>
#
# This script will:
#   1. Initialize a git repo in the privacy-policy/ directory
#   2. Commit all files (index.html, CNAME)
#   3. Print instructions to create a GitHub repo and enable Pages
# =============================================================================

set -euo pipefail

# --- Config ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_NAME="moneysmartpro-privacy"

# --- Validate ---
if [ $# -eq 0 ]; then
  echo "❌  Usage: ./deploy.sh <github-username>"
  echo "    Example: ./deploy.sh octocat"
  exit 1
fi

GITHUB_USER="$1"

echo ""
echo "================================================"
echo "  MoneySmartPro Privacy Policy - GitHub Pages"
echo "================================================"
echo ""
echo "  📁 Policy directory: $SCRIPT_DIR"
echo "  👤 GitHub user:      $GITHUB_USER"
echo "  📦 Repo name:        $REPO_NAME"
echo ""

# --- Step 1: Initialize git repo ---
echo "━━━ Step 1: Initialize local git repo ━━━"
cd "$SCRIPT_DIR"

if [ -d ".git" ]; then
  echo "  ⚠️  .git already exists, removing..."
  rm -rf .git
fi

git init
git checkout -b main 2>/dev/null || git checkout -b main

# --- Step 2: Add all files ---
echo ""
echo "━━━ Step 2: Stage and commit files ━━━"
git add index.html CNAME
git commit -m "📄 Add MoneySmartPro privacy policy

- Clean single-page HTML privacy policy (Chinese)
- Dark mode friendly, mobile responsive
- No external dependencies
- Publication date: 2026-06-21"

echo ""
echo "  ✅ Local commit created successfully."

# --- Step 3: Print remote setup instructions ---
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Step 3: Create GitHub repo (manual steps)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  👉 Open this URL in your browser:"
echo "     https://github.com/new"
echo ""
echo "  Repository settings:"
echo "    • Owner:              $GITHUB_USER"
echo "    • Repository name:    $REPO_NAME"
echo "    • Description:        MoneySmartPro Privacy Policy (GitHub Pages)"
echo "    • Visibility:         🌐 Public (required for free GitHub Pages)"
echo "    • Initialize repo:    ❌ UNCHECK all boxes (no README, no .gitignore)"
echo ""
echo "  After creating the repo, run these commands:"
echo ""
echo "    cd $SCRIPT_DIR"
echo "    git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git"
echo "    git push -u origin main"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Step 4: Enable GitHub Pages (manual steps)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  👉 Open your repo settings:"
echo "     https://github.com/$GITHUB_USER/$REPO_NAME/settings/pages"
echo ""
echo "  Pages settings:"
echo "    • Source:             Deploy from a branch"
echo "    • Branch:             main"
echo "    • Folder:             / (root)"
echo "    • Click:              💾 Save"
echo ""
echo "  After a few minutes, your page will be live at:"
echo "    🔗 https://$GITHUB_USER.github.io/$REPO_NAME/"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Step 5: Custom domain (optional)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  The CNAME file is pre-configured with: privacy.moneysmartpro.app"
echo "  To use a custom domain:"
echo ""
echo "    1️⃣  In your DNS provider, add a CNAME record:"
echo "       privacy.moneysmartpro.app → $GITHUB_USER.github.io"
echo ""
echo "    2️⃣  In repo Settings > Pages > Custom domain:"
echo "       Enter: privacy.moneysmartpro.app"
echo "       Click: Save"
echo ""
echo "    3️⃣  Check 'Enforce HTTPS' after DNS propagates (may take ~24h)"
echo ""
echo "  To skip custom domain, simply remove the CNAME file before pushing."
echo ""
echo "================================================"
echo "  ✅ Local setup complete. Follow Steps 3-5 above."
echo "================================================"
echo ""
