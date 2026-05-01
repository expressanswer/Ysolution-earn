#!/usr/bin/env bash
# PI//OS — Status Dashboard
# Esegui: bash scripts/status.sh

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; BOLD='\033[1m'; BLUE='\033[0;34m'; NC='\033[0m'

clear
echo -e "${BOLD}${CYAN}"
echo "  ██████╗ ██╗    ██╗ ██████╗ ███████╗"
echo "  ██╔══██╗██║    ██║██╔═══██╗██╔════╝"
echo "  ██████╔╝██║    ██║██║   ██║███████╗"
echo "  ██╔═══╝ ██║    ██║██║   ██║╚════██║"
echo "  ██║     ╚██████╔╝╚██████╔╝███████║"
echo "  ╚═╝      ╚═════╝  ╚═════╝ ╚══════╝"
echo -e "  Passive Income OS — Status Dashboard${NC}"
echo ""
echo -e "${BOLD}━━━ SYSTEM STATUS — $(date '+%d/%m/%Y %H:%M') ━━━${NC}"
echo ""

# MODULE 1
echo -e "${BOLD}${BLUE}[MODULE 1] Digital Products${NC}"
M1_FILES=$(find module-1-digital -type f 2>/dev/null | wc -l | tr -d ' ')
GUMROAD_OK=$(grep -l "gumroad.com" module-1-digital/landing-page.html 2>/dev/null | wc -l | tr -d ' ')
if [ "$M1_FILES" -ge 2 ]; then
  echo -e "  ${GREEN}✓${NC} File presenti: $M1_FILES"
else
  echo -e "  ${RED}✗${NC} File mancanti (trovati: $M1_FILES)"
fi
if [ -f "module-1-digital/landing-page.html" ]; then
  echo -e "  ${GREEN}✓${NC} Landing page: pronta"
else
  echo -e "  ${YELLOW}!${NC} Landing page: mancante"
fi

echo ""

# MODULE 2
echo -e "${BOLD}${BLUE}[MODULE 2] OSS + GitHub Sponsors${NC}"
if [ -f "module-2-oss/README.md" ]; then
  echo -e "  ${GREEN}✓${NC} README.md: presente"
else
  echo -e "  ${RED}✗${NC} README.md: mancante"
fi
if [ -f "module-2-oss/.github/FUNDING.yml" ]; then
  echo -e "  ${GREEN}✓${NC} FUNDING.yml: configurato"
else
  echo -e "  ${YELLOW}!${NC} FUNDING.yml: mancante"
fi
if [ -f "module-2-oss/.github/workflows/ci.yml" ]; then
  echo -e "  ${GREEN}✓${NC} CI/CD: configurato"
else
  echo -e "  ${YELLOW}!${NC} CI/CD: mancante"
fi

echo ""

# MODULE 3
echo -e "${BOLD}${BLUE}[MODULE 3] Affiliate SEO${NC}"
ARTICLES=$(find module-3-affiliate/content/posts -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
echo -e "  Articoli pubblicati: ${BOLD}$ARTICLES${NC}"
if [ "$ARTICLES" -eq 0 ]; then
  echo -e "  ${RED}✗${NC} Nessun articolo — inizia subito!"
elif [ "$ARTICLES" -lt 5 ]; then
  echo -e "  ${YELLOW}!${NC} Obiettivo: 5 articoli (mese 1)"
elif [ "$ARTICLES" -lt 20 ]; then
  echo -e "  ${YELLOW}!${NC} Obiettivo: 20 articoli (mese 2)"
else
  echo -e "  ${GREEN}✓${NC} Buona base di contenuto"
fi
if [ -f "module-3-affiliate/hugo.toml" ]; then
  echo -e "  ${GREEN}✓${NC} Hugo: configurato"
else
  echo -e "  ${RED}✗${NC} Hugo: non configurato"
fi
if [ -f "module-3-affiliate/netlify.toml" ]; then
  echo -e "  ${GREEN}✓${NC} Netlify: configurato"
else
  echo -e "  ${RED}✗${NC} Netlify: non configurato"
fi

echo ""

# SKILLS
echo -e "${BOLD}${BLUE}[CLAUDE CODE SKILLS]${NC}"
SKILLS=$(find .claude/skills -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
echo -e "  Skills disponibili: ${BOLD}$SKILLS${NC}"
find .claude/skills -name "*.md" 2>/dev/null | while read f; do
  name=$(basename "$f" .md)
  echo -e "  ${GREEN}✓${NC} $name"
done

echo ""

# GIT STATUS
echo -e "${BOLD}${BLUE}[GIT]${NC}"
if git rev-parse --git-dir > /dev/null 2>&1; then
  COMMITS=$(git rev-list --count HEAD 2>/dev/null || echo "0")
  BRANCH=$(git branch --show-current 2>/dev/null || echo "main")
  echo -e "  Branch: ${BOLD}$BRANCH${NC} | Commit: ${BOLD}$COMMITS${NC}"
  CHANGED=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
  if [ "$CHANGED" -gt 0 ]; then
    echo -e "  ${YELLOW}!${NC} $CHANGED file non committati"
  else
    echo -e "  ${GREEN}✓${NC} Working tree pulito"
  fi
else
  echo -e "  ${YELLOW}!${NC} Git non inizializzato — esegui: git init && git add . && git commit -m 'init'"
fi

echo ""
echo -e "${BOLD}━━━ PROSSIMI PASSI ━━━${NC}"
if [ "$ARTICLES" -eq 0 ]; then
  echo -e "  ${CYAN}1.${NC} bash scripts/new-article.sh  — scrivi il primo articolo SEO"
fi
if [ ! -f "module-1-digital/landing-page.html" ]; then
  echo -e "  ${CYAN}→${NC} Crea landing page per Gumroad"
fi
if [ ! -f "module-2-oss/.github/FUNDING.yml" ]; then
  echo -e "  ${CYAN}→${NC} Configura GitHub Sponsors (FUNDING.yml)"
fi
echo -e "  ${CYAN}→${NC} Esegui audit: bash scripts/audit.sh"
echo ""
