aws_greengrass_group_update() {
    local group_id="$1"
    shift 1

    cond_log_and_run aws greengrass update-group --group-id $group_id "$@"
}
