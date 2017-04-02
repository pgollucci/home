aws_organizations_targets_for_policy_list() {
    local policy-id="$1"
    shift 1

    log_and_run aws organizations  --policy-id $policy_id "@"

}
