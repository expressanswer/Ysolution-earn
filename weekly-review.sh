#!/usr/bin/env bash
# PI//OS — Weekly Review
# Esegui ogni lunedì: bash scripts/weekly-review.sh

CYAN='\033[0;36m'; BOLD='\033[1m'; GREEN='\033[0;32m'
YELLOW='\033[1;33m'; NC='\033[0m'

DATE=$(date '+%d/%m/%Y')
ARTICLES=$(find module-3-affiliate/content/posts -name "*.md" 2>/dev/null | wc -l | tr -d ' ')

echo -e "\n${BOLD}${CYAN}━━━ PI//OS WEEKLY REVIEW — $DATE ━━━${NC}\n"

ask() {
  echo -en "${CYAN}$1${NC} "
  read -r VAL
  echo "$VAL"
}

echo -e "${BOLD}METRICHE SETTIMANA${NC}"
GUMROAD_SALES=$(ask "Vendite Gumroad questa settimana:")
GUMROAD_REV=$(ask "Revenue Gumroad questa settimana (€):")
GH_STARS=$(ask "Nuove GitHub Stars:")
GH_SPONSORS=$(ask "Nuovi GitHub Sponsors:")
AFF_CLICKS=$(ask "Click affiliati stimati:")

echo ""
echo -e "${BOLD}CHECKLIST CONTENUTO${NC}"
items=(
  "Almeno 2 nuovi articoli SEO scritti"
  "Articoli esistenti aggiornati"
  "Newsletter inviata"
  "Post su Reddit/Twitter per distribuzione"
)
for item in "${items[@]}"; do
  echo -en "  [ ] ${item}? (y/n): "
  read -r ans
  [ "$ans" = "y" ] && echo -e "    ${GREEN}✓ fatto${NC}" || echo -e "    ${YELLOW}→ da fare${NC}"
done

echo ""
echo -e "${BOLD}CHECKLIST OSS${NC}"
oss_items=(
  "Almeno 1 commit sulla repo OSS"
  "Issues/commenti risposti"
  "README aggiornato se necessario"
)
for item in "${oss_items[@]}"; do
  echo -en "  [ ] ${item}? (y/n): "
  read -r ans
  [ "$ans" = "y" ] && echo -e "    ${GREEN}✓ fatto${NC}" || echo -e "    ${YELLOW}→ da fare${NC}"
done

echo ""
echo -e "${BOLD}CHECKLIST SISTEMI${NC}"
sys_items=(
  "Google Search Console controllato"
  "Link affiliati tutti funzionanti"
  "Nuovi programmi su Impact.com controllati"
)
for item in "${sys_items[@]}"; do
  echo -en "  [ ] ${item}? (y/n): "
  read -r ans
  [ "$ans" = "y" ] && echo -e "    ${GREEN}✓ fatto${NC}" || echo -e "    ${YELLOW}→ da fare${NC}"
done

# Salva note
NOTE_FILE=".claude/weekly-notes.md"
mkdir -p .claude
cat >> "$NOTE_FILE" << NOTE

## Review $DATE
- Vendite Gumroad: $GUMROAD_SALES (€$GUMROAD_REV)
- GitHub Stars: +$GH_STARS | Sponsors: +$GH_SPONSORS
- Click affiliati: $AFF_CLICKS
- Articoli totali: $ARTICLES
NOTE

echo ""
echo -e "${BOLD}PIANO SETTIMANA PROSSIMA${NC}"
echo -e "  ${CYAN}1.${NC} bash scripts/new-article.sh — prossimo articolo SEO"
echo -e "  ${CYAN}2.${NC} Distribuisci template su Reddit + ProductHunt"
echo -e "  ${CYAN}3.${NC} 1 miglioramento alla repo OSS (issue fix o nuova feature)"
echo ""
echo -e "${GREEN}✓ Review salvata in $NOTE_FILE${NC}\n"
