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

  p6_env_export "P6_DFZ_PROFILE" "P6"

  p6df::modules::home::profile::1password
  p6df::modules::home::profile::aws
  p6df::modules::home::profile::github
  p6df::modules::home::profile::npm
  p6df::modules::home::profile::launchdarkly
  p6df::modules::home::profile::pagerduty
  p6df::modules::home::profile::vscode
  p6df::modules::home::profile::openai
  p6df::modules::home::profile::gemini
  p6df::modules::home::profile::claude

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::1password()
#
#  Environment:	 P6_DFZ_PROFILE_1PASSWORD
#>
######################################################################
p6df::modules::home::profile::1password() {

  p6_env_export "P6_DFZ_PROFILE_1PASSWORD" "P6"

  p6_1password_account_signin "my"
  p6_1password_whoami_email
  p6_1password_vault_select "Private"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::aws()
#
#  Environment:	 P6_AWS_ORG P6_DFZ_PROFILE_AWS
#>
######################################################################
p6df::modules::home::profile::aws() {

   p6_env_export "P6_DFZ_PROFILE_AWS" "P6"

   p6_env_export P6_AWS_ORG "p6"
   p6_aws_cli_organization_on "$P6_AWS_ORG"
   p6df::modules::aws::profiles::list

   p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::github()
#
#  Environment:	 GH_CONFIG_DIR GH_TOKEN GH_USER GITHUB_MCP_PATH HOME P6_DFZ_PROFILE_GITHUB P6_GITHUB_PROFILE
#>
######################################################################
p6df::modules::home::profile::github() {

  p6_env_export "P6_DFZ_PROFILE_GITHUB" "P6"

  local user=$(p6_1password_cli_item_get_username "Github/pgollucci/gh_token/classic")
  local token=$(p6_1password_cli_item_get_api_key "Github/pgollucci/gh_token/classic")

  p6_env_export "GH_CONFIG_DIR" "$HOME/.config/gh-${P6_GITHUB_PROFILE}"
  p6_env_export "GH_USER" "$user"
  p6_env_export "GH_TOKEN" "$token"

  local gemini_token=$(p6_1password_cli_item_get_api_key "Github/pgollucci/gemini/pat")
  p6_env_export GITHUB_MCP_PATH "$gemini_token"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::npm()
#
#  Environment:	 NPM_TOKEN NPM_USER P6_DFZ_PROFILE_NPM
#>
######################################################################
p6df::modules::home::profile::npm() {

  p6_env_export "P6_DFZ_PROFILE_NPM" "P6"

  local user="pgollucci"
  local token=$(p6_1password_cli_item_get_api_key "Npmjs/npm_token")
  p6_env_export NPM_TOKEN "$token"
  p6_env_export NPM_USER "$user"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::launchdarkly()
#
#  Environment:	 P6_DFZ_PROFILE_LAUNCHDARKLY
#>
######################################################################
p6df::modules::home::profile::launchdarkly() {

  p6_env_export "P6_DFZ_PROFILE_LAUNCHDARKLY" "P6"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::pagerduty()
#
#  Environment:	 P6_DFZ_PROFILE_PAGERDUTY
#>
######################################################################
p6df::modules::home::profile::pagerduty() {

  p6_env_export "P6_DFZ_PROFILE_PAGERDUTY" "P6"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::vscode()
#
#  Environment:	 P6_DFZ_PROFILE_VSCODE
#>
######################################################################
p6df::modules::home::profile::vscode() {

  p6_env_export "P6_DFZ_PROFILE_VSCODE" "P6"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::openai()
#
#  Environment:	 P6_DFZ_PROFILE_OPENAI
#>
######################################################################
p6df::modules::home::profile::openai() {

  p6_env_export "P6_DFZ_PROFILE_OPENAI" "P6"

  eval "$(p6_1password_cli_item_get_code OpenAI Private)"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::gemini()
#
#  Environment:	 P6_DFZ_PROFILE_GEMINI
#>
######################################################################
p6df::modules::home::profile::gemini() {

  p6_env_export "P6_DFZ_PROFILE_GEMINI" "P6"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::claude()
#
#  Environment:	 CLAUDE_CODE_OAUTH_TOKEN P6_DFZ_PROFILE_CLAUDE
#>
######################################################################
p6df::modules::home::profile::claude() {

  p6_env_export "P6_DFZ_PROFILE_CLAUDE" "P6"

  local token=$(p6_1password_cli_item_get_api_key "Claude Code/oauth_token")
  p6_env_export "CLAUDE_CODE_OAUTH_TOKEN" "$token"

  p6_return_void
}
