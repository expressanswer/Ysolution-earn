# Notion Dev OS — Specifiche Template

## Panoramica prodotto
Template Notion per sviluppatori freelance e indie hacker. Prezzo: €9 (una tantum).
URL Gumroad: https://expressanswer.gumroad.com/l/notion-dev-os

## Struttura del workspace

### 1. Sprint Board (database principale)
- Proprietà: Nome, Stato (Backlog/Sprint/In corso/Review/Done), Priorità (P0-P3), Progetto, Cliente, Stima ore, Ore reali, Deadline, Tag tecnici
- View: Kanban per stato, Tabella per progetto, Calendario per deadline, Galleria sprint corrente
- Filtro default: Sprint corrente, non archiviati

### 2. Knowledge Base
- Proprietà: Titolo, Categoria (snippet/architettura/devops/tools/altro), Linguaggio, Tag, Data aggiornamento, Progetto collegato
- View: Galleria per categoria, Tabella ricercabile
- Template pagina: snippet + spiegazione + link riferimento

### 3. CRM Clienti
- Proprietà: Nome cliente, Stato (prospect/attivo/pausato/chiuso), Tariffa/h, Canale acquisizione, Contratto (file), Note, Progetto collegato
- Relazione bidirezionale con Sprint Board e Time Tracker
- View: Board per stato, Tabella con revenue totale

### 4. Time Tracker
- Proprietà: Data, Progetto, Cliente, Ore, Tipo (sviluppo/meeting/review/admin), Fatturabile (checkbox), Note
- Formula: calcolo automatico totale ore fatturabili per cliente/mese
- View: Calendario, Tabella per cliente con somma ore

### 5. README Hub
- Template strutturato: titolo, badge, descrizione, installazione, uso, contributing, licenza
- Varianti: CLI tool, libreria npm, API REST, SaaS app
- Link rapidi a shields.io per badge

### 6. Weekly Review
- Template con sezioni: Settimana in numeri (ore, task completati, revenue), Successi, Ostacoli, Obiettivi prossima settimana, Riflessione
- Linked view su Sprint Board per task completati nella settimana

## Checklist pre-pubblicazione
- [ ] Duplica workspace e testa onboarding da zero (< 5 min)
- [ ] Rimuovi tutti i dati di esempio tranne 2-3 record dimostrativi
- [ ] Verifica tutti i link tra database funzionino
- [ ] Crea GIF demo per la landing page (Loom gratuito)
- [ ] Scrivi 3 email di onboarding per Brevo (giorno 0, 3, 7)
- [ ] Imposta prezzo Gumroad a €9 con "pay what you want" min €9
- [ ] Testa acquisto con account secondario

## Upsell futuri
- **Pro** (€24): aggiunge modulo OKR trimestrale + dashboard revenue + template email clienti
- **Agency** (€49): multi-team, gestione subappaltatori, SLA tracker
