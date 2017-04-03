aws_organizations_policies_for_target_list() {
    local target_id="$1"
    local filter="$2"
    shift 2

    log_and_run aws organizations list-policies-for-target --target-id $target_id --filter $filter "$@"
}
