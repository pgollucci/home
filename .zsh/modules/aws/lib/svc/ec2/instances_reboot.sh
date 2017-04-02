aws_ec2_instances_reboot() {
    local instance-ids="$1"
    shift 1

    cond_log_and_run aws ec2  --instance-ids $instance_ids "@"

}
