aws_ec2_instance_attribute_describe() {
    local instance-id="$1"
    local attribute="$2"
    shift 2

    log_and_run aws ec2  --instance-id $instance_id --attribute $attribute "@"

}
