aws_greengrass_role_to_group_associate() {
    local group_id="$1"
    shift 1

    cond_log_and_run aws greengrass associate-role-to-group --group-id $group_id "$@"
}
