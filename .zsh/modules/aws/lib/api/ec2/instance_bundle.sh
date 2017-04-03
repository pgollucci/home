aws_ec2_instance_bundle() {
    local instance_id="$1"
    shift 1

    cond_log_and_run aws ec2 bundle-instance --instance-id $instance_id "$@"
}
