---
name: oss-release
description: Gestisce il workflow di release per pi-cli (module-2-oss). Aggiorna versione, genera changelog, prepara tag git e verifica che non ci siano placeholder.
type: skill
---

# Skill: OSS Release Manager

## Uso
Quando l'utente vuole fare una release di pi-cli, segui questo workflow.

## File da aggiornare per ogni release
1. `module-2-oss/package.json` → `version` field
2. `module-2-oss/src/index.js` → `const VERSION`
3. `module-2-oss/README.md` → badge CI + changelog section

## Checklist pre-release
- [ ] Nessun `expressanswer` o placeholder nei file (`grep -r 'YOUR-' module-2-oss/`)
- [ ] `npm test` passa (esegui: `node module-2-oss/src/index.js --version`)
- [ ] CI workflow valido (yaml lint)
- [ ] FUNDING.yml con sponsor handle reale
- [ ] README con link GitHub reale

## Semantic versioning
- `0.x.y` → alpha/beta, breaking changes accettati
- `1.0.0` → prima release stabile
- Patch (`x.x.1`): bug fix
- Minor (`x.1.0`): nuova feature retrocompatibile
- Major (`1.0.0`): breaking change

## Comandi release
```bash
# Verifica placeholder
grep -r 'YOUR-' module-2-oss/ --include="*.json" --include="*.yml" --include="*.js"

# Test
node module-2-oss/src/index.js --version
node module-2-oss/src/index.js --help

# Checkpoint git
git add module-2-oss/
git commit -m "release: pi-cli v0.X.Y"
```

## GitHub Sponsors setup
URL: https://github.com/sponsors/expressanswer
FUNDING.yml già configurato in `module-2-oss/.github/FUNDING.yml`
