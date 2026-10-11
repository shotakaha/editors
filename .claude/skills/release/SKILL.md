---
name: release
description: Cut a new release for a project using the shared Taskfile conventions, starting from `task bump:check`. Use when the user asks to release, cut a version, bump the version, or invokes /release.
---

# Release workflow

Runs the release procedure defined by `templates/Taskfile.yml` (see the project's own CLAUDE.md/AGENTS.md for any project-specific notes). Every task lives in `templates/Taskfile.yml`, run via `task <name>` from the repo root. Do not skip steps or run them out of order — each depends on the previous one having succeeded.

Confirm with the user before any step that pushes to the remote, creates a tag, or creates a GitLab release (steps 2–5 below all qualify). Never batch multiple steps into one approval.

## Steps

1. **`task bump:check`** — dry-run preview of the next version/changelog from Conventional Commits history. Changes nothing. Run this first and show the user the detected increment (patch/minor/major) and version.

2. **Ask the user which bump to run**, based on step 1's output: `bump:auto` (use the detected increment), or force one of `bump:patch`/`bump:minor`/`bump:major`. Do not pick on the user's behalf — the detected increment is a signal, not a decision. Then run the chosen `task bump:<...>`. This bumps the project's version file(s) (e.g. `pyproject.toml`, a package `__init__.py`), updates the changelog, commits (`bump: version X → Y`), and tags `Y` locally. If the project uses `version_provider = "uv"`, `uv.lock`'s own entry for the package can also change — check `git status` right after; if `uv.lock` is modified, commit it separately (e.g. `chore: update uv.lock`) rather than leaving it uncommitted.

3. **`task docs:release -- X.Y.Z`** — scaffolds `docs/releases/vX.Y.Z.md` from `templates/release.md` (refuses if the file already exists). This only creates the file; write the actual release notes yourself afterward — see the existing notes in `docs/releases/` (if any) for the expected shape and level of detail, and follow `templates/release.md`'s sections. Confirm the drafted content with the user before moving on.

4. **Commit the release note** (e.g. `docs: write vX.Y.Z release notes`) and push it — confirm with the user first, same as any other push.

5. **`task push:tags`** — `git push origin HEAD --tags`, publishing the bump commit and the new tag. Confirm with the user first.

6. **`task push:release -- X.Y.Z`** — `glab release create X.Y.Z --name "vX.Y.Z" --notes-file docs/releases/vX.Y.Z.md`, publishing the GitLab release. Requires the release note to already exist and be pushed. Confirm with the user first.

## Notes

- The tag/release version has no `v` prefix (`X.Y.Z`), but the release note's filename/title use `vX.Y.Z` (`docs/releases/vX.Y.Z.md`). `glab`/`cz` won't catch a mismatch — get this right by hand.
- If any step's precondition fails (e.g. `docs:release` refuses because the file exists), stop and tell the user rather than working around it.
- Task names/behavior above match `templates/Taskfile.yml`'s current shared tasks; if a target project renamed or customized them, adjust the steps accordingly rather than assuming these exact names.
