aws_deploy_on_premises_instance_deregister() {
    local instance_name="$1"
    shift 1

    cond_log_and_run aws deploy deregister-on-premises-instance --instance-name $instance_name "$@"
}
