---
name: generate-article
description: Genera un articolo SEO completo per il sito affiliate tech. Usa quando l'utente vuole un nuovo post, articolo o contenuto per il blog. Chiedi l'argomento se non specificato.
allowed-tools: Read, Edit, Bash(echo *), Bash(date), Bash(cat *)
---

# Skill: Genera Articolo SEO Affiliate

## Workflow

1. **Analizza l'argomento ricevuto**
   - Estrai keyword principale (es. "migliori VPN sviluppatori")
   - Identifica keyword secondarie correlate
   - Determina intent: informational / commercial / transactional
   - Categoria Hugo: hosting | vpn | dev-tools | saas | security | productivity

2. **Genera il file** in `module-3-affiliate/content/posts/SLUG.md`

## Frontmatter obbligatorio
```yaml
---
title: "[Keyword] — Guida Completa [Anno]"
description: "[120-155 char con keyword + beneficio]"
date: YYYY-MM-DD
lastmod: YYYY-MM-DD
categories: ["categoria"]
tags: ["tag1", "tag2", "tag3"]
author: "Ysolution.earn"
draft: false
---
```

## Struttura articolo (non deviare)
1. **Box riassunto** (> corsivo, max 2 righe: risposta diretta)
2. **Intro** — problema → soluzione (150-200 parole)
3. **Tabella comparativa** dei top 5 prodotti con link `/go/slug`
4. **Recensioni dettagliate** — una per prodotto (400-600 parole ciascuna)
   - Link affiliato all'inizio di ogni sezione: `**[→ Prova X](go/x)**`
   - Pro / Contro / Prezzo / Caso d'uso
5. **Come scegliere** — guida decisionale per tipologia utente
6. **Setup pratico** — codice bash/config dove rilevante
7. **Conclusione** con raccomandazione chiara + CTA
8. **FAQ** — 3-5 domande (ottimizzate per "people also ask")

## Regole SEO
- Keyword principale nel title, primo paragrafo, almeno 2 H2
- Link interni: almeno 2 link ad altri articoli esistenti
- Lunghezza target: 1.800-2.500 parole
- Footer disclaimer: `*Usiamo link affiliati — ci supporti senza costi aggiuntivi.*`

## Dopo aver generato
- Conferma il percorso file creato
- Mostra word count stimato
- Suggerisci 2 articoli correlati da scrivere dopo
