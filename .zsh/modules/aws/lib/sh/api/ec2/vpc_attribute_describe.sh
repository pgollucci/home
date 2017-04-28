aws_ec2_vpc_attribute_describe() {
    local vpc_id="$1"
    local attribute="$2"
    shift 2

    log_and_run aws ec2 describe-vpc-attribute --vpc-id $vpc_id --attribute $attribute "$@"
}
