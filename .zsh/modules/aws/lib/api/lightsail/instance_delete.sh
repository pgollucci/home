aws_lightsail_instance_delete() {
    local instance_name="$1"
    shift 1

    cond_log_and_run aws lightsail delete-instance --instance-name $instance_name "$@"
}
