aws_deploy_deployment_instance_get() {
    local deployment-id="$1"
    local instance-id="$2"
    shift 2

    log_and_run aws deploy  --deployment-id $deployment_id --instance-id $instance_id "@"

}
