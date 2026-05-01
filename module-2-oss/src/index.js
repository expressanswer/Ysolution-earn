#!/usr/bin/env node
'use strict';

const fs = require('fs');
const path = require('path');

const VERSION = '0.1.0';
const POSTS_DIR = path.join(process.cwd(), 'module-3-affiliate', 'content', 'posts');
const NETLIFY_TOML = path.join(process.cwd(), 'module-3-affiliate', 'netlify.toml');

const args = process.argv.slice(2);
const cmd = args[0];

if (!cmd || cmd === '--help' || cmd === '-h') {
  console.log(`pi-cli v${VERSION} — Passive Income site manager

Usage: pi <command> [options]

Commands:
  status             Article count + redirect summary
  check-links        Validate /go/* redirects vs netlify.toml
  audit-frontmatter  List posts with missing SEO fields
  new-article <slug> Scaffold a new post
  --version          Print version
  --help             Show this help
`);
  process.exit(0);
}

if (cmd === '--version' || cmd === '-v') {
  console.log(VERSION);
  process.exit(0);
}

function getPosts() {
  if (!fs.existsSync(POSTS_DIR)) return [];
  return fs.readdirSync(POSTS_DIR).filter(f => f.endsWith('.md'));
}

function parseFrontmatter(content) {
  const match = content.match(/^---\n([\s\S]*?)\n---/);
  if (!match) return {};
  const fm = {};
  for (const line of match[1].split('\n')) {
    const [key, ...rest] = line.split(':');
    if (key && rest.length) fm[key.trim()] = rest.join(':').trim();
  }
  return fm;
}

function getRedirects() {
  if (!fs.existsSync(NETLIFY_TOML)) return new Set();
  const content = fs.readFileSync(NETLIFY_TOML, 'utf8');
  const redirects = new Set();
  for (const m of content.matchAll(/from\s*=\s*"(\/go\/[^"]+)"/g)) {
    redirects.add(m[1]);
  }
  return redirects;
}

if (cmd === 'status') {
  const posts = getPosts();
  const redirects = getRedirects();
  console.log('\n[PI//OS] Site status');
  console.log(`  Articles : ${posts.length}`);
  console.log(`  Redirects: ${redirects.size} configured`);
  const goal = posts.length < 5 ? 5 : posts.length < 20 ? 20 : null;
  if (goal) console.log(`  Goal     : ${goal} articles — ${goal - posts.length} remaining`);
  else console.log('  Goal     : mese 2 target reached!');
  console.log('');
  process.exit(0);
}

if (cmd === 'check-links') {
  const posts = getPosts();
  const redirects = getRedirects();
  const broken = [];
  for (const file of posts) {
    const content = fs.readFileSync(path.join(POSTS_DIR, file), 'utf8');
    for (const m of content.matchAll(/\(\/go\/([^)]+)\)/g)) {
      const link = `/go/${m[1]}`;
      if (!redirects.has(link)) broken.push({ file, link });
    }
  }
  if (broken.length === 0) {
    console.log('All /go/* links are configured in netlify.toml');
  } else {
    console.log(`Found ${broken.length} unconfigured redirect(s):`);
    for (const { file, link } of broken) console.log(`  ${link}  ←  ${file}`);
  }
  process.exit(broken.length > 0 ? 1 : 0);
}

if (cmd === 'audit-frontmatter') {
  const posts = getPosts();
  const required = ['title', 'description', 'date'];
  const issues = [];
  for (const file of posts) {
    const content = fs.readFileSync(path.join(POSTS_DIR, file), 'utf8');
    const fm = parseFrontmatter(content);
    const missing = required.filter(k => !fm[k]);
    if (missing.length) issues.push({ file, missing });
  }
  if (issues.length === 0) {
    console.log(`All ${posts.length} posts have complete frontmatter`);
  } else {
    console.log(`${issues.length} post(s) with missing fields:`);
    for (const { file, missing } of issues) console.log(`  ${file}: missing ${missing.join(', ')}`);
  }
  process.exit(issues.length > 0 ? 1 : 0);
}

if (cmd === 'new-article') {
  const slug = args[1];
  if (!slug) { console.error('Usage: pi new-article <slug>'); process.exit(1); }
  const date = new Date().toISOString().split('T')[0];
  const outfile = path.join(POSTS_DIR, `${date}-${slug}.md`);
  if (fs.existsSync(outfile)) { console.error(`Already exists: ${outfile}`); process.exit(1); }
  fs.mkdirSync(POSTS_DIR, { recursive: true });
  fs.writeFileSync(outfile, `---
title: "${slug.replace(/-/g, ' ')}"
description: ""
date: ${date}
lastmod: ${date}
categories: ["dev-tools"]
tags: []
author: "Ysolution.earn"
draft: false
---

## Introduzione

[Scrivi qui il contenuto dell'articolo]
`);
  console.log(`Created: ${outfile}`);
  process.exit(0);
}

console.error(`Unknown command: ${cmd}. Run 'pi --help' for usage.`);
process.exit(1);
