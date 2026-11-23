# Copilot Project Baseline

A small, reusable setup for GitHub Copilot in VS Code. It adds project rules and a `/project-baseline` checklist so a new project starts from a consistent set of basics.

## What you get

- Rules Copilot follows during every chat request
- A `/project-baseline` command that checks and fixes missing basics
- Checks for SEO, security, authentication, secrets, APIs and responsive layouts
- Simple instructions for VS Code and GitHub

## 5-minute setup

### 1. Copy the setup

Clone or download this repository. In PowerShell, run:

```powershell
.\setup.ps1 -TargetProject "C:\path\to\your-project"
```

This copies `.github/copilot-instructions.md` and `.github/skills/project-baseline/SKILL.md` into the target project.

Existing files are kept unchanged. To replace existing setup files deliberately, add `-Force`:

```powershell
.\setup.ps1 -TargetProject "C:\path\to\your-project" -Force
```

You can also copy the `.github` folder manually:

Your project should now contain:

```text
your-project/
└── .github/
    ├── copilot-instructions.md
    └── skills/
        └── project-baseline/
            └── SKILL.md
```

### 2. Open Copilot Chat

1. Open the project in VS Code.
2. Press `Ctrl+Alt+I` to open Copilot Chat.
3. Sign in to VS Code with a GitHub account that has Copilot access.
4. Switch Chat to **Agent** mode.

### 3. Run the baseline

Commit or save the work you already have. Then enter:

```text
/project-baseline
```

Review the edits and commands Copilot proposes. Copilot should check existing code, avoid unnecessary rewrites and finish with a status table.

To run only part of the checklist:

```text
/project-baseline only do items 1 to 4
```

### 4. Verify the result

1. Review `git diff`.
2. Run the project's build command.
3. Start the app and test the main flow.
4. Commit only after the checks pass.

## Try it on a project

Clone this repository and open it in VS Code. Then copy `.github/copilot-instructions.md` and `.github/skills/project-baseline/SKILL.md` into a project you want to improve.

```powershell
git clone https://github.com/Abdulqadir-B/copilot-project-baseline.git
cd copilot-project-baseline
code .
```

## How the setup is organized

The setup has two parts:

- `.github/copilot-instructions.md` adds rules that Copilot follows during every chat request.
- `.github/skills/project-baseline/SKILL.md` provides the `/project-baseline` checklist.

Keep the always-on instructions short. Put larger workflows in separate skill folders under `.github/skills/`.

If `/project-baseline` does not appear, reload VS Code and reopen the project. Confirm that `SKILL.md` is inside `.github/skills/project-baseline/`.

## Notes

- Review all edits before accepting them.
- Keep API keys and passwords out of source files.
- Framework-specific files such as `.env`, hosting configuration and deployment settings should be handled through the project's normal tools.
