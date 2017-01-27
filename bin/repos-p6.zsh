#!/usr/bin/env zsh -li

echo "$USER @ Github Password: \c"
read -s pass
echo

gh_clone_user_repos "https://github.com" "https://api.github.com" "pgollucci" "$HOME/dev/repos/gh/" "-u $USER:$pass"
