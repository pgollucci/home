aws_organizations_policy_detach() {
    local target-id="$1"
    local policy-id="$2"
    shift 2

    cond_log_and_run aws organizations  --target-id $target_id --policy-id $policy_id "@"

}
