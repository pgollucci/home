aws_ec2_instance_attribute_reset() {
    local attribute="$1"
    local instance_id="$2"
    shift 2

    cond_log_and_run aws ec2 reset-instance-attribute --attribute $attribute --instance-id $instance_id "$@"
}
