# pi-cli

> CLI tool for affiliate Hugo sites — validate links, audit frontmatter, count articles.

[![CI](https://github.com/expressanswer/pi-cli/actions/workflows/ci.yml/badge.svg)](https://github.com/expressanswer/pi-cli/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![GitHub Sponsors](https://img.shields.io/badge/Sponsor-%E2%9D%A4-pink)](https://github.com/sponsors/expressanswer)

## Why

Managing an affiliate Hugo site means:
- Keeping redirect links (`/go/*`) pointing to live pages
- Ensuring every post has complete frontmatter (title, description, date)
- Tracking article count toward monthly content goals

`pi-cli` automates all three in one command.

## Install

```bash
npm install -g pi-cli
```

Or run without installing:

```bash
npx pi-cli status
```

## Usage

```bash
pi status              # article count + redirect health summary
pi check-links         # validate all /go/* redirects in markdown files
pi audit-frontmatter   # list posts with missing SEO fields
pi new-article <slug>  # scaffold a new post with complete frontmatter
pi --version           # print version
pi --help              # show all commands
```

## Example output

```
$ pi status
[PI//OS] Site status
  Articles : 12
  Redirects: 8 (7 OK, 1 broken → /go/semrush)
  Missing FM: 0 posts
  Goal      : 20 articles (mese 2) — 8 remaining
```

## Redirect validation

`pi check-links` reads all `.md` files under `content/posts/`, extracts every `/go/*` link, and checks the corresponding redirect rule in `netlify.toml`. Reports broken chains without making any HTTP requests.

## Contributing

1. Fork the repo
2. `npm install` (no deps yet — built on Node stdlib)
3. Edit `src/index.js`
4. Open a PR

All contributions welcome. If `pi-cli` saves you time, consider [sponsoring on GitHub](https://github.com/sponsors/expressanswer) or [buying a coffee on Ko-fi](https://ko-fi.com/expressanswer).

## License

MIT © Ysolution.earn
