aws_greengrass_group_version_create() {
    local group_id="$1"
    shift 1

    cond_log_and_run aws greengrass create-group-version --group-id $group_id "$@"
}
