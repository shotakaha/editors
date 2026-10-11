---
icon: lucide/shield
---

# Maintainer Guide

This section covers items for maintainers of this project repository.

## Release Workflow

1. `task bump:check`: Check the next version bump (dry-run)
2. `task bump:auto/minor/major`: Bump the version
3. `task docs:release -- vX.Y.Z`: Generate the release note for the new version
4. `git commit -m "docs: release vX.Y.Z"`: Commit the release note
5. `task push:tags`: Push the new version tag to the remote repository
6. `task push:release -- vX.Y.Z`: Push the release note to the remote repository (GitLab repository)

## Dependency Update Workflow

1. `task deps:outdated`: List outdated dependencies
2. `task deps:update`: Update dependencies to the latest versions
3. `git commit -m "chore: update dependencies"`: Commit the updated dependencies. Write out the updated dependencies in the commit message if necessary.
