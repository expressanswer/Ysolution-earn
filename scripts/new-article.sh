#!/usr/bin/env bash
# PI//OS — New SEO Article Generator
# Uso: bash scripts/new-article.sh [argomento opzionale]

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

echo -e "${BOLD}${CYAN}[PI//OS] Generatore Articolo SEO${NC}\n"

# Argomento da CLI o interattivo
if [ -n "$1" ]; then
  TOPIC="$1"
else
  echo -e "${CYAN}Argomento articolo (es: 'migliori VPS per sviluppatori'):${NC}"
  read -r TOPIC
fi

if [ -z "$TOPIC" ]; then
  echo -e "${RED}Errore: argomento vuoto.${NC}"; exit 1
fi

# Genera slug dal titolo
SLUG=$(echo "$TOPIC" | tr '[:upper:]' '[:lower:]' | \
       iconv -f utf-8 -t ascii//TRANSLIT 2>/dev/null || echo "$TOPIC" | tr '[:upper:]' '[:lower:]')
SLUG=$(echo "$SLUG" | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$//')
DATE=$(date '+%Y-%m-%d')
YEAR=$(date '+%Y')

OUTFILE="module-3-affiliate/content/posts/${DATE}-${SLUG}.md"
mkdir -p module-3-affiliate/content/posts

echo -e "\n${YELLOW}Creando: $OUTFILE${NC}\n"

# Rileva categoria automaticamente
CATEGORY="dev-tools"
echo "$TOPIC" | grep -qi "vpn\|sicurezza\|privacy\|security" && CATEGORY="vpn"
echo "$TOPIC" | grep -qi "hosting\|server\|vps\|cloud" && CATEGORY="hosting"
echo "$TOPIC" | grep -qi "saas\|tool\|software\|app" && CATEGORY="saas"
echo "$TOPIC" | grep -qi "produttiv\|workflow\|automat" && CATEGORY="productivity"

cat > "$OUTFILE" << ARTICLE
---
title: "Migliori $(echo "$TOPIC" | sed 's/migliori //i;s/best //i') nel ${YEAR}: Guida Completa"
description: "Confronto aggiornato dei migliori $(echo "$TOPIC" | sed 's/migliori //i') per sviluppatori: prezzi, funzionalità e quale scegliere."
date: ${DATE}
lastmod: ${DATE}
categories: ["${CATEGORY}"]
tags: ["$(echo "$SLUG" | sed 's/-/", "/g')"]
author: "Ysolution.earn"
draft: false
---

> **Sintesi rapida**: [inserisci qui la raccomandazione principale — es. "Per sviluppatori, la scelta migliore è X per Y motivo."]

---

## Perché uno sviluppatore ha bisogno di ${TOPIC}?

[Intro: spiega il problema specifico che questo tipo di prodotto/servizio risolve per un dev. 150-200 parole. Menziona casi d'uso reali: SSH, CI/CD, remote work, ecc.]

---

## Confronto rapido — I migliori ${YEAR}

| Prodotto | Prezzo/mese | Velocità | Caratteristica chiave | Rating |
|----------|------------|---------|----------------------|--------|
| **Prodotto A** | €X | ★★★★★ | Feature principale | 9.5/10 |
| **Prodotto B** | €X | ★★★★☆ | Feature principale | 9.0/10 |
| **Prodotto C** | €X | ★★★★☆ | Feature principale | 8.5/10 |
| **Prodotto D** | €X | ★★★☆☆ | Feature principale | 8.0/10 |
| **Prodotto E** | €X | ★★★☆☆ | Feature principale | 7.5/10 |

---

## Recensioni dettagliate

### 1. Prodotto A — Migliore in assoluto

**[→ Prova Prodotto A con 30 giorni di garanzia](/go/prodotto-a)**

[Descrizione approfondita 400-500 parole. Cosa lo rende il migliore per developer. Features specifiche per dev. Setup su Linux/Mac. Integrazione con workflow tipico dev.]

**Pro:**
- Feature 1
- Feature 2
- Feature 3

**Contro:**
- Limitazione 1
- Limitazione 2

**Prezzo:** da €X/mese (piano annuale)

---

### 2. Prodotto B — Migliore per privacy

**[→ Prova Prodotto B](/go/prodotto-b)**

[Descrizione 400-500 parole...]

**Pro:**
- Feature 1
- Feature 2

**Contro:**
- Limitazione 1

**Prezzo:** €X/mese

---

### 3. Prodotto C — Migliore piano gratuito

**[→ Prova Prodotto C gratis](/go/prodotto-c)**

[Descrizione 400-500 parole...]

---

## Come scegliere

**Scegli Prodotto A se:**
- Hai bisogno di [caso d'uso specifico]
- Usi [workflow tipico]

**Scegli Prodotto B se:**
- La privacy è prioritaria
- Vuoi [feature specifica]

**Scegli Prodotto C se:**
- Vuoi iniziare gratis
- Hai budget limitato

---

## Setup pratico (Linux/Mac)

\`\`\`bash
# Installazione Prodotto A
curl -fsSL https://example.com/install.sh | bash

# Configurazione base
prodotto-a configure --option valore

# Verifica funzionamento
prodotto-a status
\`\`\`

---

## Conclusione

Per sviluppatori, **Prodotto A** è la scelta più completa per [motivo principale]. Se [condizione alternativa], **Prodotto B** non ha eguali.

**[→ Attiva Prodotto A con garanzia 30 giorni](/go/prodotto-a)**

---

*Aggiornato: ${DATE}. Prezzi soggetti a variazioni. Utilizziamo link affiliati — ci supporti senza costi aggiuntivi per te.*

---

## FAQ

### [Domanda frequente 1 su "$TOPIC"?]
[Risposta concisa 2-3 frasi]

### [Domanda frequente 2 su "$TOPIC"?]
[Risposta concisa]

### [Domanda frequente 3 su "$TOPIC"?]
[Risposta concisa]
ARTICLE

echo -e "${GREEN}✓ Articolo creato: $OUTFILE${NC}"
echo -e "${CYAN}Word count template: $(wc -w < "$OUTFILE") parole${NC}"
echo ""
echo -e "${BOLD}Prossimi passi:${NC}"
echo -e "  1. Apri il file e personalizza i [placeholder] con dati reali"
echo -e "  2. Sostituisci i link /go/prodotto-X con i tuoi link affiliati"
echo -e "  3. Committa: git add . && git commit -m 'feat: articolo ${SLUG}'"
echo -e "  4. Deploy su Netlify (push automatico se configurato)"
echo ""
TOTAL=$(find module-3-affiliate/content/posts -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
echo -e "  Articoli totali: ${BOLD}$TOTAL${NC}"
