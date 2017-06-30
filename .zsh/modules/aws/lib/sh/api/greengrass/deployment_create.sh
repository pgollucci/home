aws_greengrass_deployment_create() {
    local group_id="$1"
    shift 1

    cond_log_and_run aws greengrass create-deployment --group-id $group_id "$@"
}
