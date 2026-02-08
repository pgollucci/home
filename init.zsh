######################################################################
#<
#
# Function: p6df::modules::home::deps()
#
#>
######################################################################
p6df::modules::home::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6df-aws
    p6m7g8-dotfiles/p61password
  )
}
######################################################################
#<
#
# Function: p6df::modules::home::home::symlink()
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::home::home::symlink() {

  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home/README.md README.md
  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home/LICENSE LICENSE

  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home/.fullname .fullname
  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home/.hosts .hosts
  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home/.organization .organization
  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home/.signature .signature

  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home-private/ssh .ssh
  ln -fs $P6_DFZ_SRC_DIR/pgollucci/home-private/gnupg .gnupg
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::select::me()
#
#  Environment:	 P6_DFZ_PROFILE
#>
######################################################################
p6df::modules::home::profile::select::me() {

  local profile="P6"
  local aws_org="p6"
  local npm_user="pgollucci"

  p6_env_export "P6_DFZ_PROFILE" "$profile"
  p6df::modules::1password::profile::on "$profile" "my" "Private"

  local github_user=$(p6_1password_cli_item_get_username "Github/pgollucci/gh_token/classic")
  local gh_token=$(p6_1password_cli_item_get_api_key "Github/pgollucci/gh_token/classic")
  local npm_token=$(p6_1password_cli_item_get_api_key "Npmjs/npm_token")
  local claude_token=$(p6_1password_cli_item_get_api_key "ClaudeCode/oauth_token")
  local code_env=$(p6_1password_cli_item_get_code "OpenAI")

  p6df::modules::aws::profile::on "$profile" "$aws_org"
  p6df::modules::claudecode::profile::on "$profile" "$claude_token"
  p6df::modules::copilot::profile::on "$profile"
  p6df::modules::gemini::profile::on "$profile"
  p6df::modules::github::profile::on "$profile" "$github_user" "$gh_token"
  p6df::modules::js::profile::on "$profile" "$npm_user" "$npm_token"
  p6df::modules::openai::profile::on "$profile" "$code_env"
  p6df::modules::vscode::profile::on "$profile"

  p6_return_void
}
