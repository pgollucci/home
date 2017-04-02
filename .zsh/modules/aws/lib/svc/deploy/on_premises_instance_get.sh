aws_deploy_on_premises_instance_get() {
    local instance-name="$1"
    shift 1

    log_and_run aws deploy  --instance-name $instance_name "@"

}
