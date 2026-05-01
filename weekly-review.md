---
name: weekly-review
description: Esegui la review settimanale del sistema PI//OS. Guida l'utente attraverso tutte le verifiche settimanali, aggiorna i tracker, suggerisce il prossimo contenuto da creare. Usa ogni lunedì o quando l'utente chiede "weekly review", "review settimana", "check settimanale".
allowed-tools: Read, Edit, Bash(date), Bash(find * -type f), Bash(cat *), Bash(git log *)
---

# Skill: Weekly Review PI//OS

## Workflow

### 1. Apri con intestazione
```
━━━ WEEKLY REVIEW — [data lunedì corrente] ━━━
```

### 2. Verifica metriche (chiedi all'utente se non disponibili)

**Gumroad (Module 1)**
- Vendite questa settimana: __
- Revenue questa settimana: €__
- Vendite totali: __
- Prodotti attivi: __

**GitHub (Module 2)**
- Stars guadagnate: __
- Nuovi sponsor: __
- Issues aperte: __
- Commit questa settimana: __ (verifica con `git log --since="7 days ago" --oneline | wc -l`)

**Affiliate / SEO (Module 3)**
- Nuovi articoli pubblicati: __
- Click affiliati stimati: __
- Articoli totali: __ (conta da `find module-3-affiliate/content/posts -name "*.md" | wc -l`)

### 3. Checklist azioni settimanali

Guida l'utente attraverso ogni punto:

**Contenuto**
- [ ] Almeno 2 nuovi articoli SEO scritti?
- [ ] Articoli esistenti aggiornati con dati recenti?
- [ ] Newsletter inviata agli iscritti?

**OSS**
- [ ] Almeno 1 commit sulla repo OSS?
- [ ] Issues/commenti risposti?
- [ ] README aggiornato se necessario?

**Digital Products**
- [ ] Prezzi ottimizzati? (se 0 vendite → abbassa o cambia copy)
- [ ] Nuova distribuzione (Reddit, Twitter)?
- [ ] Testimonial raccolte?

**Sistemi**
- [ ] Google Search Console controllato?
- [ ] Nuovi programmi affiliazione su Impact.com?
- [ ] Link affiliati funzionanti?

### 4. Pianifica settimana prossima

Suggerisci:
1. Il prossimo articolo SEO da scrivere (basato su gap di contenuto)
2. Una azione di distribuzione per il template
3. Un miglioramento alla repo OSS

### 5. Salva nota
Crea/aggiorna `.claude/weekly-notes.md` con un riassunto della review.
