# Dev AI Prompt Pack — Specifica Completa

## Overview
- **Nome:** Dev AI Prompt Pack — 100+ Prompts for Developers
- **Prezzo:** €7 (entry point basso → alto volume)
- **URL Gumroad:** expressive05.gumroad.com/l/dev-ai-prompts
- **Upsell:** chi compra Notion Dev OS → offri questo a €5 (-30%)
- **Cross-sell:** chi compra questo → offri Notion Dev OS a €7 (-22%)

---

## I 100 Prompt (pronti da usare)

### SEZIONE 1 — Code Review & Debugging (20 prompt)

1. "Review this code for security vulnerabilities and explain each issue: [CODE]"
2. "Explain this error message and provide 3 different solutions ranked by simplicity: [ERROR]"
3. "Refactor this function to be more readable, efficient and testable: [CODE]"
4. "Write comprehensive unit tests for this function covering happy path, edge cases and errors: [CODE]"
5. "Find potential performance bottlenecks in this code and suggest optimizations: [CODE]"
6. "Convert this callback-based code to async/await with proper error handling: [CODE]"
7. "Review this SQL query for performance issues and suggest indexes: [QUERY]"
8. "Identify code smells in this class and suggest how to fix them: [CODE]"
9. "What could cause this intermittent bug? List 5 hypotheses ranked by likelihood: [DESCRIPTION]"
10. "Add TypeScript types to this JavaScript code: [CODE]"
11. "Convert this class-based React component to functional with hooks: [CODE]"
12. "Write a code review comment for this PR that is constructive and specific: [CODE]"
13. "Explain what this regex does and rewrite it to be more readable: [REGEX]"
14. "Find all the places where this code could throw an unhandled exception: [CODE]"
15. "Suggest variable and function names that better express intent: [CODE]"
16. "Convert this imperative code to functional style: [CODE]"
17. "What design pattern would best solve this problem? Give an example: [PROBLEM]"
18. "Review this API response structure and suggest improvements: [JSON]"
19. "Identify race conditions in this async code: [CODE]"
20. "Rewrite this code following SOLID principles: [CODE]"

### SEZIONE 2 — Architecture & Design (15 prompt)

21. "Design a scalable database schema for [DESCRIPTION]. Include indexes and explain tradeoffs."
22. "What are the tradeoffs between [ARCH A] and [ARCH B] for [USE CASE]? Give a recommendation."
23. "Create a REST API design for [SERVICE] following OpenAPI best practices."
24. "How would you handle [SCALE CHALLENGE] at 10x current load? Give 3 approaches."
25. "Design a caching strategy for [SYSTEM]. What to cache, where, TTL."
26. "What microservices would you split this monolith into and why: [DESCRIPTION]"
27. "Design an authentication system for [APP TYPE] with security best practices."
28. "How would you implement real-time features in [SYSTEM]? Compare WebSockets vs SSE vs polling."
29. "Design a job queue system for [USE CASE] with retry logic and dead letter queue."
30. "What are the failure modes of this architecture and how to handle them: [DESCRIPTION]"
31. "Design a multi-tenant database strategy for a SaaS app about [DESCRIPTION]"
32. "How would you implement rate limiting for this API? Give the algorithm and code."
33. "Design a file upload system for [USE CASE] with progress tracking and resumable uploads."
34. "What observability strategy (logging, metrics, tracing) would you implement for [SYSTEM]?"
35. "Design a feature flag system for [CODEBASE SIZE/TYPE]."

### SEZIONE 3 — Documentation & README (15 prompt)

36. "Write a professional README.md for this CLI tool with badges, install, usage, examples: [DESC]"
37. "Generate JSDoc/TSDoc comments for these functions: [CODE]"
38. "Write a CONTRIBUTING.md for an open source project: [PROJECT DESC]"
39. "Create an OpenAPI 3.0 spec for these endpoints: [ENDPOINTS]"
40. "Write a CHANGELOG entry for this release: [CHANGES LIST]"
41. "Generate a comprehensive .env.example file with comments: [APP DESCRIPTION]"
42. "Write the 'Getting Started' section of docs for [TOOL]: clear, with copy-paste commands."
43. "Create a decision log entry for this architectural choice: [DECISION AND CONTEXT]"
44. "Write error messages for these error codes that are helpful for developers: [ERRORS]"
45. "Generate a Postman collection description for this API: [ENDPOINTS]"
46. "Write release notes for this version targeted at non-technical users: [CHANGES]"
47. "Create a runbook for this incident type: [INCIDENT DESCRIPTION]"
48. "Write a technical spec document for this feature: [FEATURE DESCRIPTION]"
49. "Generate inline code comments that explain WHY not WHAT: [CODE]"
50. "Write a migration guide from v[X] to v[Y]: [BREAKING CHANGES]"

### SEZIONE 4 — DevOps & CI/CD (15 prompt)

51. "Write a GitHub Actions workflow for [STACK]: lint, test, build, deploy to [PLATFORM]."
52. "Create a production-optimized Dockerfile for a [STACK] app."
53. "Write a docker-compose.yml for [SERVICES] with proper networking and volumes."
54. "Create a Netlify/Vercel config for [FRAMEWORK] with redirects and headers."
55. "Write a bash deployment script for [STACK] with rollback capability."
56. "Create a Kubernetes deployment YAML for [APP] with health checks and resource limits."
57. "Write a terraform module for [INFRASTRUCTURE] on [CLOUD PROVIDER]."
58. "Create a pre-commit hook that checks [WHAT] before allowing commits."
59. "Write a GitHub Actions workflow that auto-creates releases from conventional commits."
60. "Create a monitoring alert rule for [METRIC] that pages on [CONDITION]."
61. "Write a database migration script that is safe to run in production: [MIGRATION]"
62. "Create a backup script for [DATABASE TYPE] with retention policy."
63. "Write a load testing script for [ENDPOINT] using k6."
64. "Create a security scanning workflow that fails the build on [SEVERITY] vulnerabilities."
65. "Write a secrets rotation script for [SECRET TYPE] with zero downtime."

### SEZIONE 5 — Client & Freelance Communication (15 prompt)

66. "Write a professional project proposal for: [PROJECT DESCRIPTION]. Include timeline and pricing."
67. "Create an invoice follow-up email that is polite but firm (invoice [X] days overdue)."
68. "Write a scope of work document for: [PROJECT]. Include what's excluded."
69. "Draft a project status update email: on track/delayed/blocked. Include next steps."
70. "Write a difficult conversation message to a client about: [SITUATION]."
71. "Create a client onboarding email sequence (3 emails): welcome, kickoff, week 1 check-in."
72. "Write a contract clause for: [SITUATION] (late payments, scope creep, IP ownership)."
73. "Draft a project retrospective report for the client: [PROJECT SUMMARY]."
74. "Write a polite but firm message declining additional work outside scope."
75. "Create a pricing justification email for a rate increase: [CONTEXT]."
76. "Write a case study for this project for my portfolio: [PROJECT DETAILS]."
77. "Draft a LinkedIn recommendation request to a client after successful project."
78. "Write a project kickoff meeting agenda for [PROJECT TYPE]."
79. "Create a weekly standup email template for async remote clients."
80. "Write a post-mortem report for a client after an incident: [WHAT HAPPENED]."

### SEZIONE 6 — Learning & Research (10 prompt)

81. "Explain [CONCEPT] assuming I know [LANGUAGE/FRAMEWORK] but not [TOPIC]."
82. "What are the 5 most important things to know about [TECHNOLOGY] before starting?"
83. "Compare [TECH A] vs [TECH B] for [USE CASE] with a real production example."
84. "What would a senior engineer review in my [X] months of experience look like?"
85. "Create a 30-day learning plan for [SKILL] assuming [CURRENT LEVEL]."
86. "What questions should I ask in a technical interview for [ROLE]?"
87. "Explain the tradeoffs I accepted by choosing [TECHNOLOGY] for [USE CASE]."
88. "What are common pitfalls when scaling [TECHNOLOGY] beyond [THRESHOLD]?"
89. "Create flashcard Q&A pairs for these concepts: [CONCEPTS LIST]."
90. "What would you add to my knowledge to go from [LEVEL A] to [LEVEL B] as a [ROLE]?"

### SEZIONE 7 — Meta Prompts (10 prompt)

91. "Improve this prompt to get more specific, actionable output: [PROMPT]"
92. "Create a prompt template for [TASK] that works consistently across sessions."
93. "Turn this vague request into a precise prompt: [VAGUE REQUEST]"
94. "Generate 5 variations of this prompt for different edge cases: [PROMPT]"
95. "What context am I missing from this prompt that would improve the output: [PROMPT]"
96. "Create a system prompt for an AI assistant specialized in [DOMAIN]."
97. "Turn this conversation into a reusable prompt template: [CONVERSATION]"
98. "What follow-up prompts should I ask after getting this response: [RESPONSE]"
99. "Critique this prompt and rewrite it to be 50% shorter with the same output quality: [PROMPT]"
100. "Create a prompt chaining sequence for this multi-step task: [TASK]"

---

## Formato di consegna

### PDF (60 pagine)
- Copertina + intro (2p)
- 1 prompt per pagina con: prompt, esempio di output, variazioni, quando usarlo
- Indice per categoria

### Notion Database
- Proprietà: Titolo, Categoria, Tag, Ultimo uso, Rating (1-5), Note personali
- View: per categoria, per rating, usati di recente
- Link duplicabile: da generare dopo aver creato il DB

---

## Copy Gumroad pronto

**Titolo:** Dev AI Prompt Pack — 100+ Prompts for Developers

**Descrizione:**
Stop writing prompts from scratch every time.

100+ battle-tested prompts for developers using ChatGPT, Claude, Cursor, or GitHub Copilot.

✅ Code Review & Debugging (20 prompts)
✅ Architecture & System Design (15 prompts)
✅ Documentation & README (15 prompts)
✅ DevOps & CI/CD (15 prompts)
✅ Client & Freelance Communication (15 prompts)
✅ Learning & Research (10 prompts)
✅ Meta Prompts — prompts about prompts (10 prompts)

Comes as PDF + Notion database you can duplicate and customize.

One-time purchase. Instant delivery. All future updates free.

**Tags:** AI, ChatGPT, Claude, Notion, Developer Tools, Prompts, Productivity

---

## Piano lancio

**Giorno 1:**
- Crea DB Notion con i 100 prompt
- Condividi pubblicamente → ottieni link duplicabile
- Carica PDF su Gumroad con descrizione sopra
- Imposta upsell: dopo acquisto → mostra Notion Dev OS a €7

**Distribuzione:**
- r/ChatGPT: "I compiled 100+ AI prompts every developer should have saved"
- r/ClaudeAI: stesso post
- r/SideProject: cross-post con entrambi i prodotti
- Twitter thread: "100+ AI prompts for developers — here are my top 10 free:"
  → poi thread con 10 prompt gratuiti → CTA per gli altri 90
