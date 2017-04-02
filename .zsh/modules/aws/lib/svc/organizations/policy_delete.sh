aws_organizations_policy_delete() {
    local policy-id="$1"
    shift 1

    cond_log_and_run aws organizations  --policy-id $policy_id "@"

}
