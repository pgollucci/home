aws_ec2_scheduled_instances_run() {
    local launch-specification="$1"
    local scheduled-instance-id="$2"
    shift 2

    cond_log_and_run aws ec2  --launch-specification $launch_specification --scheduled-instance-id $scheduled_instance_id "@"

}
