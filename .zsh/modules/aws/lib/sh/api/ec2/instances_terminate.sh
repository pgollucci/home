aws_ec2_instances_terminate() {
    local instance_ids="$1"
    shift 1

    cond_log_and_run aws ec2 terminate-instances --instance-ids $instance_ids "$@"
}
