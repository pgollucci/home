aws_organizations_policy_update() {
    local policy-id="$1"
    shift 1

    cond_log_and_run aws organizations  --policy-id $policy_id "@"

}
