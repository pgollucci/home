aws_ec2_scheduled_instances_run() {
    local scheduled_instance_id="$1"
    local launch_specification="$2"
    shift 2

    cond_log_and_run aws ec2 run-scheduled-instances --scheduled-instance-id $scheduled_instance_id --launch-specification $launch_specification "$@"
}
