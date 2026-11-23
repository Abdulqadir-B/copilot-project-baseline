# Project rules

## Before coding
- Detect the stack from package.json and existing files. Follow its conventions. Do not add a new framework or library without saying why.
- Read existing code before writing new code. Match its style.

## Always apply
- Validate and sanitize all user input on the server.
- Never hardcode secrets. Use environment variables and keep .env.example updated.
- Auth: hashed passwords, token expiry, protected routes checked on the server.
- Rate limit all API routes, with a stricter limit on auth and form endpoints.
- Security headers and a CORS allowlist, never a wildcard in production.
- Centralized error handling. Never leak stack traces to the client.
- UI must be responsive and mobile-first. Check 360px, 768px and 1280px.
- Public pages need SEO: title, meta description, Open Graph tags, sitemap, robots.txt, semantic HTML.

## Working style
- Make small, focused changes. Run the build or tests after changes.
- If something is ambiguous, ask before guessing.
- End with a short list of what changed and what was skipped.