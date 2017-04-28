aws_deploy_deployment_instance_get() {
    local deployment_id="$1"
    local instance_id="$2"
    shift 2

    log_and_run aws deploy get-deployment-instance --deployment-id $deployment_id --instance-id $instance_id "$@"
}
