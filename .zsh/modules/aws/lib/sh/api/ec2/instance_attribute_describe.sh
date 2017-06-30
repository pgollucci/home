aws_ec2_instance_attribute_describe() {
    local attribute="$1"
    local instance_id="$2"
    shift 2

    log_and_run aws ec2 describe-instance-attribute --attribute $attribute --instance-id $instance_id "$@"
}
