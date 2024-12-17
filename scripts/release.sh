#!/bin/bash

# Ensure we're on master branch
if [[ $(git branch --show-current) != "master" ]]; then
    echo "Must be on master branch"
    exit 1
fi

# Ensure working directory is clean
if [[ -n $(git status -s) ]]; then
    echo "Working directory must be clean"
    exit 1
fi

# Get version bump type
echo "Version bump type (patch/minor/major):"
read BUMP_TYPE

# Bump version
poetry version $BUMP_TYPE
NEW_VERSION=$(poetry version -s)

# Update CHANGELOG.md
echo "Enter changelog entries (Ctrl+D when done):"
CHANGELOG_ENTRY=$(cat)

cat >> CHANGELOG.md << EOF

## [$NEW_VERSION] - $(date +%Y-%m-%d)
$CHANGELOG_ENTRY
EOF

# Commit and tag
git add pyproject.toml CHANGELOG.md
git commit -m "Release $NEW_VERSION"
git tag v$NEW_VERSION

# Push
echo "Ready to push? (y/n)"
read CONFIRM

if [[ $CONFIRM == "y" ]]; then
    git push origin master v$NEW_VERSION
    echo "Pushed! CircleCI will handle the PyPI release"
else
    echo "Cancelled. You'll need to push manually:"
    echo "git push origin master v$NEW_VERSION"
fi