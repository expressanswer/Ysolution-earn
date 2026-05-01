#!/usr/bin/env bash
# PI//OS — System Audit
# Esegui: bash scripts/audit.sh

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

SCORE=0; TOTAL=0

check() {
  TOTAL=$((TOTAL+1))
  if eval "$2" > /dev/null 2>&1; then
    echo -e "  ${GREEN}✓${NC} $1"
    SCORE=$((SCORE+1))
  else
    echo -e "  ${RED}✗${NC} $1"
    MISSING+=("$1")
  fi
}

warn_check() {
  TOTAL=$((TOTAL+1))
  if eval "$2" > /dev/null 2>&1; then
    echo -e "  ${GREEN}✓${NC} $1"
    SCORE=$((SCORE+1))
  else
    echo -e "  ${YELLOW}!${NC} $1 (obiettivo)"
  fi
}

MISSING=()

echo -e "\n${BOLD}${CYAN}━━━ PI//OS SYSTEM AUDIT — $(date '+%d/%m/%Y %H:%M') ━━━${NC}\n"

# MODULE 1
echo -e "${BOLD}[MODULE 1] Digital Products${NC}"
check "landing-page.html esiste"        "[ -f module-1-digital/landing-page.html ]"
check "notion-template-spec.md esiste"  "[ -f module-1-digital/notion-template-spec.md ] || [ -f module-1-digital/notion-dev-template.md ]"
check "URL Gumroad configurato"         "grep -q 'gumroad.com' module-1-digital/landing-page.html 2>/dev/null && ! grep -q 'YOUR-PRODUCT-LINK' module-1-digital/landing-page.html 2>/dev/null"

echo ""

# MODULE 2
echo -e "${BOLD}[MODULE 2] OSS + GitHub Sponsors${NC}"
check "README.md esiste"                "[ -f module-2-oss/README.md ]"
check "FUNDING.yml configurato"         "[ -f module-2-oss/.github/FUNDING.yml ]"
check "CI workflow esiste"              "[ -f module-2-oss/.github/workflows/ci.yml ]"
check "package.json esiste"             "[ -f module-2-oss/package.json ]"
check "src/index.js esiste"             "[ -f module-2-oss/src/index.js ]"
check "Placeholder sostituiti"          "! grep -r 'expressanswer' module-2-oss/ 2>/dev/null | grep -v '.bak'"

echo ""

# MODULE 3
echo -e "${BOLD}[MODULE 3] Affiliate SEO${NC}"
check "hugo.toml configurato"           "[ -f module-3-affiliate/hugo.toml ]"
check "netlify.toml configurato"        "[ -f module-3-affiliate/netlify.toml ]"
ARTICLES=$(find module-3-affiliate/content/posts -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
warn_check "≥1 articolo pubblicato"     "[ $ARTICLES -ge 1 ]"
warn_check "≥5 articoli (obiettivo)"    "[ $ARTICLES -ge 5 ]"
warn_check "≥20 articoli (mese 2)"      "[ $ARTICLES -ge 20 ]"

echo ""

# CLAUDE CODE
echo -e "${BOLD}[CLAUDE CODE]${NC}"
check "CLAUDE.md presente"              "[ -f CLAUDE.md ]"
check ".claude/settings.json presente"  "[ -f .claude/settings.json ]"
SKILLS=$(find .claude/skills -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
check "Skills configurate (≥3)"         "[ $SKILLS -ge 3 ]"

echo ""

# SCRIPTS
echo -e "${BOLD}[SCRIPTS]${NC}"
check "status.sh presente"              "[ -f scripts/status.sh ]"
check "new-article.sh presente"         "[ -f scripts/new-article.sh ]"
check "audit.sh presente"               "[ -f scripts/audit.sh ]"

echo ""

# RISULTATO
PCT=$(( SCORE * 100 / TOTAL ))
echo -e "${BOLD}━━━ RISULTATO ━━━${NC}"
echo -e "  Score: ${BOLD}$SCORE/$TOTAL${NC} — Completamento: ${BOLD}$PCT%${NC}"
echo -e "  Articoli SEO pubblicati: ${BOLD}$ARTICLES${NC}"
echo -e "  Skills Claude Code: ${BOLD}$SKILLS${NC}"
echo ""

if [ ${#MISSING[@]} -gt 0 ]; then
  echo -e "${BOLD}COSA MANCA:${NC}"
  for item in "${MISSING[@]}"; do
    echo -e "  ${RED}→${NC} $item"
  done
  echo ""
fi

echo -e "${BOLD}PROSSIME 3 AZIONI PRIORITARIE:${NC}"
if ! [ -f "module-1-digital/landing-page.html" ]; then
  echo -e "  ${CYAN}1.${NC} Crea landing-page.html e pubblica su Gumroad"
elif ! [ -f "module-2-oss/.github/FUNDING.yml" ]; then
  echo -e "  ${CYAN}1.${NC} Configura FUNDING.yml e attiva GitHub Sponsors"
elif [ "$ARTICLES" -lt 5 ]; then
  echo -e "  ${CYAN}1.${NC} bash scripts/new-article.sh — scrivi almeno 5 articoli"
else
  echo -e "  ${CYAN}1.${NC} Distribuisci: pubblica su ProductHunt + Reddit"
fi
if [ "$ARTICLES" -lt 10 ]; then
  echo -e "  ${CYAN}2.${NC} Scrivi $((10 - ARTICLES)) articoli SEO (target: 10 totali)"
else
  echo -e "  ${CYAN}2.${NC} Ottimizza articoli con più traffico (Search Console)"
fi
echo -e "  ${CYAN}3.${NC} bash scripts/weekly-review.sh — review settimanale"
echo ""
