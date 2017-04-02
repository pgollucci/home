aws_autoscaling_launch_configuration_delete() {
    local launch-configuration-name="$1"
    shift 1

    cond_log_and_run aws autoscaling  --launch-configuration-name $launch_configuration_name "@"

}
