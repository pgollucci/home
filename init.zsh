# shellcheck shell=bash

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

  ln -fs "$P6_DFZ_SRC_DIR/pgollucci/home/README.md" README.md
  ln -fs "$P6_DFZ_SRC_DIR/pgollucci/home/LICENSE" LICENSE

  ln -fs "$P6_DFZ_SRC_DIR/pgollucci/home/.fullname" .fullname
  ln -fs "$P6_DFZ_SRC_DIR/pgollucci/home/.hosts" .hosts
  ln -fs "$P6_DFZ_SRC_DIR/pgollucci/home/.organization" .organization
  ln -fs "$P6_DFZ_SRC_DIR/pgollucci/home/.signature" .signature

  ln -fs "$P6_DFZ_SRC_DIR/pgollucci/home-private/ssh" .ssh
  ln -fs "$P6_DFZ_SRC_DIR/pgollucci/home-private/gnupg" .gnupg
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

  p6_env_export "P6_DFZ_PROFILE" "$profile"

  local op_service_account_token=$(p6_1password_cli_item_get_api_key "1Password MCP/service_account_token")
  p6df::modules::1password::profile::on "$profile" "my" "Private" "$op_service_account_token"

  local airbase_env=$(p6_1password_cli_item_get_code "P6/DFZ/airbase/env")
  local atlassian_env=$(p6_1password_cli_item_get_code "P6/DFZ/atlassian/env")
  local aws_env=$(p6_1password_cli_item_get_code "P6/DFZ/aws/env")
  local claudecode_env=$(p6_1password_cli_item_get_code "P6/DFZ/claudecode/env")
  local cloudsmith_env=$(p6_1password_cli_item_get_code "P6/DFZ/cloudsmith/env")
  local confluence_env=$(p6_1password_cli_item_get_code "P6/DFZ/confluence/env")
  local copilot_env=$(p6_1password_cli_item_get_code "P6/DFZ/copilot/env")
  local datadog_env=$(p6_1password_cli_item_get_code "P6/DFZ/datadog/env")
  local drata_env=$(p6_1password_cli_item_get_code "P6/DFZ/drata/env")
  local figma_env=$(p6_1password_cli_item_get_code "P6/DFZ/figma/env")
  local gemini_env=$(p6_1password_cli_item_get_code "P6/DFZ/gemini/env")
  local github_env=$(p6_1password_cli_item_get_code "P6/DFZ/github/env")
  local greenhouse_env=$(p6_1password_cli_item_get_code "P6/DFZ/greenhouse/env")
  local intacct_env=$(p6_1password_cli_item_get_code "P6/DFZ/intacct/env")
  local jira_env=$(p6_1password_cli_item_get_code "P6/DFZ/jira/env")
  local js_env=$(p6_1password_cli_item_get_code "P6/DFZ/js/env")
  local launchdarkly_env=$(p6_1password_cli_item_get_code "P6/DFZ/launchdarkly/env")
  local lattice_env=$(p6_1password_cli_item_get_code "P6/DFZ/lattice/env")
  local linkedin_env=$(p6_1password_cli_item_get_code "P6/DFZ/linkedin/env")
  local m365_env=$(p6_1password_cli_item_get_code "P6/DFZ/m365/env")
  local miro_env=$(p6_1password_cli_item_get_code "P6/DFZ/miro/env")
  local oneschema_env=$(p6_1password_cli_item_get_code "P6/DFZ/oneschema/env")
  local openai_env=$(p6_1password_cli_item_get_code "P6/DFZ/openai/env")
  local pagerduty_env=$(p6_1password_cli_item_get_code "P6/DFZ/pagerduty/env")
  local postman_env=$(p6_1password_cli_item_get_code "P6/DFZ/postman/env")
  local pusher_env=$(p6_1password_cli_item_get_code "P6/DFZ/pusher/env")
  local rippling_env=$(p6_1password_cli_item_get_code "P6/DFZ/rippling/env")
  local slack_env=$(p6_1password_cli_item_get_code "P6/DFZ/slack/env")
  local superset_env=$(p6_1password_cli_item_get_code "P6/DFZ/superset/env")
  local vscode_env=$(p6_1password_cli_item_get_code "P6/DFZ/vscode/env")
  local zoom_env=$(p6_1password_cli_item_get_code "P6/DFZ/zoom/env")

  p6df::modules::airbase::profile::on "$profile" "$airbase_env"
  p6df::modules::atlassian::profile::on "$profile" "$atlassian_env"
  p6df::modules::aws::profile::on "$profile" "$aws_env"
  p6df::modules::claudecode::profile::on "$profile" "$claudecode_env"
  p6df::modules::cloudsmith::profile::on "$profile" "$cloudsmith_env"
  p6df::modules::confluence::profile::on "$profile" "$confluence_env"
  p6df::modules::copilot::profile::on "$profile" "$copilot_env"
  p6df::modules::datadog::profile::on "$profile" "$datadog_env"
  p6df::modules::drata::profile::on "$profile" "$drata_env"
  p6df::modules::figma::profile::on "$profile" "$figma_env"
  p6df::modules::gemini::profile::on "$profile" "$gemini_env"
  p6df::modules::github::profile::on "$profile" "$github_env"
  p6df::modules::greenhouse::profile::on "$profile" "$greenhouse_env"
  p6df::modules::intacct::profile::on "$profile" "$intacct_env"
  p6df::modules::jira::profile::on "$profile" "$jira_env"
  p6df::modules::js::profile::on "$profile" "$js_env"
  p6df::modules::launchdarkly::profile::on "$profile" "$launchdarkly_env"
  p6df::modules::lattice::profile::on "$profile" "$lattice_env"
  p6df::modules::linkedin::profile::on "$profile" "$linkedin_env"
  p6df::modules::m365::profile::on "$profile" "$m365_env"
  p6df::modules::miro::profile::on "$profile" "$miro_env"
  p6df::modules::oneschema::profile::on "$profile" "$oneschema_env"
  p6df::modules::openai::profile::on "$profile" "$openai_env"
  p6df::modules::pagerduty::profile::on "$profile" "$pagerduty_env"
  p6df::modules::postman::profile::on "$profile" "$postman_env"
  p6df::modules::pusher::profile::on "$profile" "$pusher_env"
  p6df::modules::rippling::profile::on "$profile" "$rippling_env"
  p6df::modules::slack::profile::on "$profile" "$slack_env"
  p6df::modules::superset::profile::on "$profile" "$superset_env"
  p6df::modules::vscode::profile::on "$profile" "$vscode_env"
  p6df::modules::zoom::profile::on "$profile" "$zoom_env"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::home::aliases::init()
#
#>
######################################################################
p6df::modules::home::aliases::init() {

  p6_alias "p6_p_home" "p6df::modules::home::profile::select::me"

  p6_return_void
}
