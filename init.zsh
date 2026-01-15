######################################################################
#<
#
# Function: p6df::modules::home::deps()
#
#>
######################################################################
p6df::modules::home::deps() {
  ModuleDeps=(
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

  p6_env_export "P6_PROFILE" "arkestro"

  p6df::modules::home::profile::1password
  p6df::modules::home::profile::aws

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::profile::1password()
#
#>
######################################################################
p6df::modules::home::profile::1password() {

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
#  Environment:	 P6_AWS_ORG
#>
######################################################################
p6df::modules::home::profile::aws() {

   p6_env_export P6_AWS_ORG "p6"
   p6_aws_cli_organization_on "$P6_AWS_ORG"
   p6df::modules::aws::profiles::list

   p6_return_void
}
