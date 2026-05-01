---
name: audit-system
description: Esegui un audit completo del sistema PI//OS. Controlla lo stato di tutti e 3 i moduli, conta articoli, verifica file critici, identifica cosa manca e le prossime 3 azioni prioritarie. Usa quando l'utente chiede "check", "audit", "stato sistema", "cosa manca".
allowed-tools: Read, Bash(find * -type f), Bash(wc -l *), Bash(cat *), Bash(ls *), Bash(date), Bash(git status), Bash(git log *)
---

# Skill: Audit Sistema PI//OS

## Workflow completo

### 1. Conta e verifica file
```bash
find module-3-affiliate/content/posts -name "*.md" | wc -l
find module-1-digital -type f
find module-2-oss -type f
```

### 2. Controlla checklist moduli

**Module 1 — Digital Products**
- [ ] `module-1-digital/landing-page.html` esiste?
- [ ] `module-1-digital/notion-template-spec.md` esiste?
- [ ] `module-1-digital/gumroad-description.txt` esiste?
- [ ] URL Gumroad reale configurato (no placeholder YOUR-PRODUCT-LINK)?

**Module 2 — OSS**
- [ ] `module-2-oss/README.md` esiste?
- [ ] `module-2-oss/.github/FUNDING.yml` esiste?
- [ ] `module-2-oss/.github/workflows/ci.yml` esiste?
- [ ] `module-2-oss/src/index.js` esiste?
- [ ] `module-2-oss/package.json` esiste?
- [ ] Placeholder expressanswer sostituito?

**Module 3 — Affiliate SEO**
- [ ] `module-3-affiliate/hugo.toml` esiste?
- [ ] `module-3-affiliate/netlify.toml` esiste?
- [ ] Almeno 5 articoli in `content/posts/`?
- [ ] Almeno 10 articoli? (obiettivo mese 1)
- [ ] Almeno 20 articoli? (obiettivo mese 2)

**Scripts**
- [ ] `scripts/status.sh` esiste?
- [ ] `scripts/new-article.sh` esiste?
- [ ] `scripts/audit.sh` esiste?

### 3. Calcola score
- Ogni check verde = +1 punto
- Score totale / totale check × 100 = % completamento

### 4. Output audit

Presenta risultati in questo formato:

```
━━━ PI//OS AUDIT REPORT ━━━
Data: [data corrente]

MODULE 1 — Digital Products    [X/3 ✓]
MODULE 2 — OSS + Sponsor       [X/5 ✓]  
MODULE 3 — Affiliate SEO       [X/4 ✓]
Scripts operativi              [X/3 ✓]

Articoli pubblicati: X
Completamento sistema: XX%

━━━ COSA MANCA ━━━
[lista concisa dei gap]

━━━ PROSSIME 3 AZIONI ━━━
1. [azione più urgente]
2. [seconda priorità]
3. [terza priorità]
```
