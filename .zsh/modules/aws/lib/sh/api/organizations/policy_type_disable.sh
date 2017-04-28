aws_organizations_policy_type_disable() {
    local root_id="$1"
    local policy_type="$2"
    shift 2

    cond_log_and_run aws organizations disable-policy-type --root-id $root_id --policy-type $policy_type "$@"
}
