---
name: project-baseline
description: Audit the project and implement the baseline checklist
disable-model-invocation: true
---
Audit this project against the checklist below. For each item, check what exists first, then implement only what is missing. Do not rewrite working code.

1. SEO: title and meta description per page, Open Graph and Twitter tags, sitemap.xml, robots.txt, semantic HTML, image alt text, canonical URLs.
2. Rate limiting: all API routes limited, stricter limits on login, signup and form endpoints.
3. Auth: password hashing, token or session expiry, server-side route protection, logout that invalidates the session.
4. Security headers: CSP, X-Content-Type-Options, X-Frame-Options, Referrer-Policy, HSTS. CORS allowlist only.
5. Input validation on every endpoint and a centralized error handler.
6. Secrets: nothing hardcoded, .env.example present, .env in .gitignore.
7. Responsiveness: check layouts at 360px, 768px and 1280px, fix overflow and tap target sizes.
8. Basics: loading and error states, favicon, 404 page, README with setup steps.

For every item:
- Check whether it already exists.
- Implement it only when it is missing or clearly incorrect.
- Skip it when it does not apply, and explain why.
- Mention the relevant file for items that already exist.

Work through the list in order. Run the build after major changes. Finish with a table containing: item, status (`done`, `already existed`, or `skipped`), and files changed.