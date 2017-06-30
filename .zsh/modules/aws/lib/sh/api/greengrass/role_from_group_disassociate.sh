aws_greengrass_role_from_group_disassociate() {
    local group_id="$1"
    shift 1

    cond_log_and_run aws greengrass disassociate-role-from-group --group-id $group_id "$@"
}
