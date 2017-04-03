aws_ec2_instance_attribute_describe() {
    local instance_id="$1"
    local attribute="$2"
    shift 2

    log_and_run aws ec2 describe-instance-attribute --instance-id $instance_id --attribute $attribute "$@"
}
