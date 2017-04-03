aws_deploy_get_deployment_instances_batch() {
    local deployment_id="$1"
    local instance_ids="$2"
    shift 2

    log_and_run aws deploy batch-get-deployment-instances --deployment-id $deployment_id --instance-ids $instance_ids "$@"
}
