---
name: seo-article
description: Genera articoli SEO completi per il sito affiliate module-3-affiliate. Include frontmatter Hugo, link affiliati con redirect /go/, tabelle di confronto e FAQ.
type: skill
---

# Skill: SEO Article Generator

## Uso
Quando l'utente chiede di scrivere un articolo SEO, genera un file Markdown completo in `module-3-affiliate/content/posts/YYYY-MM-DD-slug.md`.

## Frontmatter obbligatorio
```yaml
---
title: "Titolo con keyword principale + anno"
description: "Meta description 150-160 char con keyword"
date: YYYY-MM-DD
lastmod: YYYY-MM-DD
categories: ["vpn"|"hosting"|"saas"|"dev-tools"|"productivity"]
tags: ["tag1", "tag2"]
author: "Ysolution.earn"
draft: false
---
```

## Struttura articolo
1. **TL;DR box** in grassetto (chi non vince e perché, 1 riga)
2. **Intro problema** (150-200 parole, casi d'uso developer specifici)
3. **Tabella confronto** (5 prodotti max, colonne: prezzo, feature chiave, rating)
4. **Recensioni dettagliate** (ogni sezione: link affiliato `/go/prodotto`, pro/contro, prezzo, snippet CLI se applicabile)
5. **Come scegliere** (3 scenari condizionali)
6. **Conclusione** + CTA principale
7. **FAQ** (3 domande con risposta 2-3 frasi)

## Link affiliati disponibili
- `/go/nordvpn` — VPN
- `/go/hostinger` — Hosting/VPS
- `/go/digitalocean` — Cloud/VPS
- `/go/semrush` — SEO tool
- `/go/notion` — Produttività
- `/go/bitwarden` — Security
- `/go/vultr` — Cloud
- `/go/1password` — Password manager

## Note
- Keyword density: 1-2% della keyword principale, naturale
- Snippet CLI in bash quando il prodotto ha un'interfaccia da terminale
- Footer standard: `*Aggiornato: DATE. Link affiliati — ci supporti senza costi aggiuntivi.*`
