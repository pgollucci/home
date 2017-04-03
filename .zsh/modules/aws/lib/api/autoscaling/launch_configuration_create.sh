aws_autoscaling_launch_configuration_create() {
    local launch_configuration_name="$1"
    shift 1

    cond_log_and_run aws autoscaling create-launch-configuration --launch-configuration-name $launch_configuration_name "$@"
}
