---
name: generate-template
description: Genera la specifica completa di un nuovo prodotto digitale (template Notion, Figma kit, prompt pack, ebook) da vendere su Gumroad. Usa quando l'utente vuole creare un nuovo prodotto da vendere.
allowed-tools: Read, Edit, Bash(echo *), Bash(date)
---

# Skill: Genera Nuovo Prodotto Digitale

## Workflow

### 1. Raccogli informazioni
Se non già fornite, chiedi:
- Tipo prodotto: Notion template / Figma kit / Prompt pack / Excel template / Ebook
- Nicchia target: developer / designer / freelancer / marketer / studente
- Problema che risolve (in una frase)

### 2. Genera specifica completa in `module-1-digital/`

Crea file `[slug-prodotto]-spec.md` con:

```markdown
# [Nome Prodotto] — Specifica Completa

## Overview
- Tipo: [tipo]
- Target: [audience]
- Problema risolto: [problema]
- Prezzo consigliato: €[X]
- Piattaforma: Gumroad / Lemon Squeezy

## Struttura prodotto
[dettaglio completo di ogni sezione/database/pagina]

## Formule e automazioni chiave
[tutte le formule Notion / logiche Excel]

## Screenshot da fare per il listing
[lista screenshot necessari per la cover e preview]

## Copy Gumroad
### Titolo (max 60 char)
[titolo ottimizzato]

### Descrizione breve (max 120 char)
[per social share]

### Descrizione completa
[copy completo con emoji, bullet points, CTA]

### Tags Gumroad
[5-8 tag rilevanti]

## Piano di lancio
### Giorno 1 — Launch day
- [ ] ProductHunt: titolo + tagline + descrizione
- [ ] Reddit r/[subreddit]: titolo + corpo post
- [ ] Twitter/X: thread 5 tweet
- [ ] Notion template gallery: submission

### Settimana 1
- [ ] DEV.to articolo correlato
- [ ] Reddit r/[seconda nicchia]
- [ ] Indiehackers post
```

### 3. Aggiorna gumroad-description.txt
Aggiungi o sostituisci con la descrizione del nuovo prodotto.

### 4. Output finale
- Percorso file spec creato
- Prezzo consigliato con motivazione
- Prima azione da fare oggi
