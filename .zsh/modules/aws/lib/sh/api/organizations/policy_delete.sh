aws_organizations_policy_delete() {
    local policy_id="$1"
    shift 1

    cond_log_and_run aws organizations delete-policy --policy-id $policy_id "$@"
}
