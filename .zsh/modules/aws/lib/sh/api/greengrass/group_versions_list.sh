aws_greengrass_group_versions_list() {
    local group_id="$1"
    shift 1

    log_and_run aws greengrass list-group-versions --group-id $group_id "$@"
}
