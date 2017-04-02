aws_organizations_policy_type_disable() {
    local policy-type="$1"
    local root-id="$2"
    shift 2

    cond_log_and_run aws organizations  --policy-type $policy_type --root-id $root_id "@"

}
