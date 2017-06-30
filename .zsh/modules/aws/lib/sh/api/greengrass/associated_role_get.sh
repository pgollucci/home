aws_greengrass_associated_role_get() {
    local group_id="$1"
    shift 1

    log_and_run aws greengrass get-associated-role --group-id $group_id "$@"
}
