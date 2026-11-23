# Copilot Project Baseline Guide

This guide explains how the reusable setup works and how to use it in a project.

## What the setup does

The setup gives GitHub Copilot two kinds of help:

1. **Always-on project rules**  
   Copilot reads `.github/copilot-instructions.md` for every chat request.

2. **A project checklist**  
   `/project-baseline` runs a checklist for SEO, security, authentication, rate limiting, responsiveness and basic project setup.

## Add the setup to a project

Copy this repository's `.github` folder into the root of the project:

```text
your-project/
└── .github/
    ├── copilot-instructions.md
    └── skills/
        └── project-baseline/
            └── SKILL.md
```

Keep the `.github` folder inside the project, not inside a `src` or `app` folder.

## One-time VS Code setup

1. Update VS Code.
2. Install GitHub Copilot and GitHub Copilot Chat.
3. Sign in to VS Code with the GitHub account that has Copilot access.
4. Open Copilot Chat with `Ctrl+Alt+I`.
5. Choose **Agent** mode. Agent mode can edit files and run commands.
6. Open the tools menu in Copilot Chat if you need to enable or disable individual tools.

VS Code normally detects `.github/copilot-instructions.md` automatically. Search settings for `useInstructionFiles` only if the instructions do not seem to be active.

## Run the baseline

Before running it, commit or stash the work you already have.

1. Open the target project in VS Code.
2. Open Copilot Chat.
3. Choose Agent mode.
4. Enter `/project-baseline`.
5. Review every suggested edit or command before approving it.
6. Read the final status table.

To handle only part of the checklist:

```text
/project-baseline only do items 1 to 4
```

## What Copilot checks

| Area | What to expect |
| --- | --- |
| SEO | Page titles, descriptions, social tags, sitemap, robots file and semantic HTML |
| Rate limiting | Limits on APIs, with stricter limits for login and form actions |
| Authentication | Password hashing, session expiry, protected routes and secure logout |
| Security headers | Common browser security headers and an explicit CORS allowlist |
| Input handling | Server-side validation and centralized errors |
| Secrets | Environment variables and a complete `.gitignore` |
| Responsiveness | Layout checks at 360px, 768px and 1280px |
| Project basics | Loading states, errors, favicon, 404 page and setup instructions |

The checklist skips items that do not apply to the project. It should check existing code before changing it.

## After the run

1. Review `git diff`.
2. Run the project's build command, usually `npm run build`, `pnpm build`, or the equivalent.
3. Start the app and test the main user flow.
4. Apply or deploy any database, function or hosting changes only after reviewing them.
5. Commit the changes when they work.

## If something does not work

- **The skill is missing:** make sure `SKILL.md` is inside `.github/skills/project-baseline/`.
- **The instructions are missing:** confirm the file is named exactly `.github/copilot-instructions.md`.
- **Copilot does not show `/project-baseline`:** reload VS Code, reopen the project and update the Copilot extensions.
- **Copilot changed too much:** undo the work and run only part of the checklist.
- **A framework-specific step is missing:** ask Copilot to add the equivalent for the framework you use.

## Customize the setup

Keep the always-on instructions short. Add only rules that should apply to every task in the project.

Put broader checklists in `.github/skills/`. They should contain a clear purpose, a step-by-step checklist and instructions to explain skipped items.
