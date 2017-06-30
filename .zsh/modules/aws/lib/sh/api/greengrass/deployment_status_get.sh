aws_greengrass_deployment_status_get() {
    local deployment_id="$1"
    local group_id="$2"
    shift 2

    log_and_run aws greengrass get-deployment-status --deployment-id $deployment_id --group-id $group_id "$@"
}
