aws_ec2_vpc_attribute_describe() {
    local attribute="$1"
    local vpc_id="$2"
    shift 2

    log_and_run aws ec2 describe-vpc-attribute --attribute $attribute --vpc-id $vpc_id "$@"
}
