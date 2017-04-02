aws_deploy_on_premises_instance_register() {
    local instance-name="$1"
    shift 1

    cond_log_and_run aws deploy  --instance-name $instance_name "@"

}
