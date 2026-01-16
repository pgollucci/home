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
#  Environment:	 P6_PROFILE
#>
######################################################################
p6df::modules::home::profile::select::me() {

  p6_env_export "P6_PROFILE" "P6"

  p6df::modules::home::profile::1password
  p6df::modules::home::profile::aws
  p6df::modules::home::profile::github
  p6df::modules::home::profile::npm
  p6df::modules::home::profile::launchdarkly
  p6df::modules::home::profile::pagerduty
  p6df::modules::home::profile::vscode
  # chat gpt
  # gemini
  # claud code
  # codex
  # huggingface
  # cursor

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::1password()
#
#  Environment:	 P6_1PASSWORD_PROFILE
#>
######################################################################
p6df::modules::home::profile::1password() {

  p6_env_export "P6_1PASSWORD_PROFILE" "Gollucci"

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
#  Environment:	 P6_AWS_ORG P6_AWS_PROFILE
#>
######################################################################
p6df::modules::home::profile::aws() {

   p6_env_export "P6_AWS_PROFILE" "p6m7g8"

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
#  Environment:	 GH_CONFIG_DIR GH_TOKEN P6_GITHUB_PROFILE XXX
#>
######################################################################
p6df::modules::home::profile::github() {

  p6_env_export "P6_GITHUB_PROFILE" "Personal/pgollucci"

  local user=$(p6_1password_cli_item_get_username "Github")
  local token=$(p6_1password_cli_item_get_password "Github")

  # GH_CONFIG_DIR ~/.config/gh
  # XXX: Maintain symlinks like aws
  p6_env_export "GH_TOKEN" "$token"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::npm()
#
#  Environment:	 NPM NPM_TOKEN P6_NPM_PROFILE
#>
######################################################################
p6df::modules::home::profile::npm() {

  p6_env_export "P6_NPM_PROFILE" "Personal/pgollucci"

  local token=$(p6_1password_cli_item_get_password "NPM")
  p6_env_export NPM_TOKEN "$token"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::launchdarkly()
#
#  Environment:	 P6_LAUNCHDARKLY_PROFILE
#>
######################################################################
p6df::modules::home::profile::launchdarkly() {

  p6_env_export "P6_LAUNCHDARKLY_PROFILE" "Personal/"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::pagerduty()
#
#  Environment:	 P6_PAGERDUTY_PROFILE
#>
######################################################################
p6df::modules::home::profile::pagerduty() {

  p6_env_export "P6_PAGERDUTY_PROFILE" "Personal/"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::vscode()
#
#  Environment:	 P6_VSCODE_PROFILE
#>
######################################################################
p6df::modules::home::profile::vscode() {

  p6_env_export "P6_VSCODE_PROFILE" "Personal"

  p6_return_void
}
