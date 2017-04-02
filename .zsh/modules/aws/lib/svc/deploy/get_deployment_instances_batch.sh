aws_deploy_get_deployment_instances_batch() {
    local instance-ids="$1"
    local deployment-id="$2"
    shift 2

    log_and_run aws deploy  --instance-ids $instance_ids --deployment-id $deployment_id "@"

}
