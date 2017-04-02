aws_ec2_vpc_endpoint_create() {
    local vpc-id="$1"
    local service-name="$2"
    shift 2

    cond_log_and_run aws ec2  --vpc-id $vpc_id --service-name $service_name "@"

}
