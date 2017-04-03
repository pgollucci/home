aws_deploy_on_premises_instance_get() {
    local instance_name="$1"
    shift 1

    log_and_run aws deploy get-on-premises-instance --instance-name $instance_name "$@"
}
