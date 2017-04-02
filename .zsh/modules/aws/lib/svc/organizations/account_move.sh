aws_organizations_account_move() {
    local account-id="$1"
    local source-parent-id="$2"
    local destination-parent-id="$3"
    shift 3

    cond_log_and_run aws organizations  --account-id $account_id --source-parent-id $source_parent_id --destination-parent-id $destination_parent_id "@"

}
