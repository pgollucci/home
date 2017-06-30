aws_greengrass_group_delete() {
    local group_id="$1"
    shift 1

    cond_log_and_run aws greengrass delete-group --group-id $group_id "$@"
}
