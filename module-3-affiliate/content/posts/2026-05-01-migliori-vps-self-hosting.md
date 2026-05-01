---
title: "Migliori VPS per Self-Hosting nel 2026: Guida per Developer"
description: "Confronto VPS economici per self-hosting: Coolify, Plausible, Gitea, n8n. Hostinger, Vultr, Hetzner e DigitalOcean a confronto."
date: 2026-05-01
lastmod: 2026-05-01
categories: ["hosting"]
tags: ["vps", "self-hosting", "hosting", "docker", "coolify", "hetzner", "vultr"]
author: "Ysolution.earn"
draft: false
---

> **Sintesi rapida**: Per self-hosting economico europeo, **Hetzner** è imbattibile (4 vCPU, 8GB RAM a €5.29/mese). Per chi vuole anche pannello e supporto, **Hostinger VPS** è la scelta migliore a parità di budget.

---

## Il boom del self-hosting

Nel 2026, sempre più developer scelgono di gestire i propri servizi invece di pagare SaaS multipli:

- **Plausible** invece di Google Analytics → privacy + dati tuoi
- **Gitea/Forgejo** invece di GitHub Pro → repository privati illimitati
- **n8n** invece di Zapier → automation senza limiti di operazioni
- **Coolify** invece di Heroku/Render → deploy da git senza costi per container
- **Vaultwarden** invece di Bitwarden Premium → vault cifrato a €0

Il problema è scegliere il VPS giusto. Troppa RAM sprecata = spreco di denaro. Troppo poca = OOM killer che ti ammazza i container alle 3 di notte.

---

## Quanto RAM serve davvero?

| Stack | RAM minima | RAM consigliata |
|-------|-----------|----------------|
| Sito Hugo + Caddy | 512MB | 1GB |
| WordPress + MySQL | 1GB | 2GB |
| Plausible Analytics | 2GB | 4GB |
| Gitea | 512MB | 1GB |
| n8n | 1GB | 2GB |
| Coolify (orchestrator) | 2GB | 4GB |
| Coolify + 3-4 app | 4GB | 8GB |
| Vaultwarden | 256MB | 512MB |

Se vuoi self-hostare Coolify con 4-5 servizi, punta a **8GB RAM** come minimo confortevole.

---

## Confronto provider 2026

| Provider | Piano | Prezzo/m | vCPU | RAM | Storage | Location |
|----------|-------|----------|------|-----|---------|----------|
| **Hetzner** | CX22 | €3.79 | 2 | 4GB | 40GB NVMe | DE/FI |
| **Hetzner** | CX32 | €5.29 | 4 | 8GB | 80GB NVMe | DE/FI |
| **Hostinger** | VPS 1 | €4.99 | 2 | 8GB | 100GB NVMe | EU/US/Asia |
| **Vultr** | Regular | $6 | 1 | 1GB | 25GB SSD | 32 location |
| **Vultr** | Regular | $12 | 2 | 2GB | 55GB SSD | 32 location |
| **DigitalOcean** | Basic | $6 | 1 | 1GB | 25GB SSD | 15 location |
| **Linode/Akamai** | Nanode | $5 | 1 | 1GB | 25GB SSD | 12 location |

**Hetzner domina sul prezzo in Europa.** Il CX32 a €5.29 con 4 vCPU e 8GB RAM non ha rivali nel mercato europeo.

---

## Hetzner — Il migliore per Europa

Hetzner è un provider tedesco con datacenter in Germania e Finlandia. I prezzi sono bassi perché non hanno l'overhead di un ecosystem cloud completo (no managed DB, no object storage nativo, no Kubernetes gestito).

```bash
# Setup Coolify su Hetzner CX32 in 5 minuti
ssh root@IP_HETZNER

# Installa Coolify (installer ufficiale)
curl -fsSL https://cdn.coollabs.io/coolify/install.sh | bash

# Accedi al pannello su porta 8000
# http://IP_HETZNER:8000
```

Con Coolify installato puoi deployare direttamente da GitHub/GitLab con un'interfaccia simile a Heroku, ma sul tuo server.

**Pro:**
- Prezzo imbattibile in Europa
- SSD NVMe su tutti i piani
- IP incluso nel prezzo
- API per provisioning automatico

**Contro:**
- Pochi datacenter (solo Europa)
- Nessun pannello web incluso
- Supporto solo via ticket

---

## Hostinger VPS — Il migliore con pannello

**[→ Crea il tuo VPS Hostinger](/go/hostinger)**

Se preferisci avere un pannello hPanel per gestire il server senza SSH, Hostinger VPS è la scelta migliore. Con €4.99/mese ottieni:
- 2 vCPU, **8GB RAM** (Hetzner a stesso prezzo: 4GB)
- 100GB NVMe
- hPanel con OS selector, snapshot, firewall UI
- Supporto live chat 24/7

La differenza chiave rispetto a Hetzner: più RAM, pannello incluso, supporto umano. Meno vantaggioso per datacenter EU-solo (Hetzner è più vicino se sei in Germania).

---

## Vultr — Il migliore per location globale

**[→ Deploy su Vultr](/go/vultr)**

Con 32 location in tutto il mondo (Tokyo, São Paulo, Mumbai, Sydney...), Vultr è la scelta se i tuoi utenti sono distribuiti globalmente o se hai bisogno di un VPS vicino a una specifica area geografica.

Il piano High Frequency (AMD EPYC, NVMe) offre le performance migliori per workload CPU-intensivi.

```bash
# API Vultr per provisioning automatico
curl -X POST "https://api.vultr.com/v2/instances" \
  -H "Authorization: Bearer $VULTR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "region": "fra",
    "plan": "vc2-1c-1gb",
    "os_id": 1743,
    "label": "self-hosting-prod"
  }'
```

---

## Setup self-hosting completo

Ecco uno stack completo per un developer che vuole self-hostare 4-5 servizi su un VPS da 8GB RAM:

```yaml
# docker-compose.yml stack completo
services:
  caddy:
    image: caddy:alpine
    ports: ["80:80", "443:443"]
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - caddy_data:/data

  plausible:
    image: plausible/analytics:latest
    environment:
      BASE_URL: https://analytics.tuodominio.com
      SECRET_KEY_BASE: ${PLAUSIBLE_SECRET}
    depends_on: [plausible_db, plausible_events_db]

  gitea:
    image: gitea/gitea:latest
    volumes:
      - gitea_data:/data
    ports: ["3000:3000", "2222:22"]

  vaultwarden:
    image: vaultwarden/server:latest
    volumes:
      - vw_data:/data
    environment:
      DOMAIN: https://vault.tuodominio.com

  n8n:
    image: n8nio/n8n:latest
    environment:
      N8N_BASIC_AUTH_ACTIVE: "true"
      N8N_BASIC_AUTH_USER: ${N8N_USER}
      N8N_BASIC_AUTH_PASSWORD: ${N8N_PASS}
    volumes:
      - n8n_data:/home/node/.n8n

volumes:
  caddy_data:
  gitea_data:
  vw_data:
  n8n_data:
```

Questo stack consuma ~4GB RAM a riposo. Su un VPS da 8GB hai 4GB di margine per i picchi.

**Caddyfile per HTTPS automatico:**

```
analytics.tuodominio.com {
  reverse_proxy plausible:8000
}

git.tuodominio.com {
  reverse_proxy gitea:3000
}

vault.tuodominio.com {
  reverse_proxy vaultwarden:80
}

automation.tuodominio.com {
  reverse_proxy n8n:5678
}
```

---

## Quanto risparmio rispetto ai SaaS?

| Servizio SaaS | Costo/mese | Self-hosted | Risparmio/anno |
|---------------|-----------|-------------|---------------|
| Plausible Business | $19 | €0* | €228 |
| GitHub Pro | $4 | €0* | €48 |
| Zapier Starter | $19.99 | €0* | €240 |
| Bitwarden Premium | €3 | €0* | €36 |
| **Totale SaaS** | **$46/m** | **€5.29/m** | **€490/anno** |

*costo incluso nel VPS da €5.29/mese

---

## Come scegliere

**Scegli Hetzner se:**
- Sei in Europa e vuoi il prezzo più basso assoluto
- Sei a tuo agio con la CLI e non hai bisogno di pannello
- Non ti serve supporto umano

**Scegli Hostinger se:**
- Vuoi un pannello web per gestire il server
- Preferisci supporto live chat
- Hai bisogno di più RAM allo stesso prezzo di Hetzner

**Scegli Vultr se:**
- I tuoi utenti sono fuori Europa
- Hai bisogno di location specifiche (Asia, Oceania, Americas)

---

## Conclusione

Per self-hosting economico in Europa, **Hetzner CX32** a €5.29/mese è la scelta tecnica ottimale. Se vuoi pannello e supporto, **Hostinger VPS** offre più RAM di qualsiasi competitor a parità di prezzo.

**[→ Inizia con Hostinger VPS](/go/hostinger)**

---

*Aggiornato: 01/05/2026. Prezzi verificati. Link affiliati presenti.*

## FAQ

### Posso self-hostare tutto su un piano da €4-5/mese?
Sì, con 8GB RAM (Hostinger o Hetzner CX32) riesci a gestire 4-5 servizi leggeri comodamente.

### Come gestisco i backup?
Con rclone + cron puoi fare backup automatici su Backblaze B2 o Cloudflare R2 (entrambi con piano free generoso). Hostinger include snapshot manuali nel pannello.

### Coolify è sicuro per la produzione?
Sì, ma è un single point of failure — se il VPS va giù, tutte le app vanno giù. Per produzione seria valuta 2 VPS con Hetzner Load Balancer (€5.39/mese).
