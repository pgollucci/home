aws_organizations_policy_update() {
    local policy_id="$1"
    shift 1

    cond_log_and_run aws organizations update-policy --policy-id $policy_id "$@"
}
