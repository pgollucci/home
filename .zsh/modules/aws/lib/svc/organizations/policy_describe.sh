aws_organizations_policy_describe() {
    local policy-id="$1"
    shift 1

    log_and_run aws organizations  --policy-id $policy_id "@"

}
