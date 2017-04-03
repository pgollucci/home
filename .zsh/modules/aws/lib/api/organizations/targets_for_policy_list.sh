aws_organizations_targets_for_policy_list() {
    local policy_id="$1"
    shift 1

    log_and_run aws organizations list-targets-for-policy --policy-id $policy_id "$@"
}
