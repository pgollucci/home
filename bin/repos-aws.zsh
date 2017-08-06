#!/usr/bin/env zsh -li

gh_clone_org_repos "https://github.com" "https://api.github.com" "aws" "$HOME/dev/repos/gh"
gh_clone_org_repos "https://github.com" "https://api.github.com" "awslabs" "$HOME/dev/repos/gh"
