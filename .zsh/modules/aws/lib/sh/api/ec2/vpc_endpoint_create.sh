aws_ec2_vpc_endpoint_create() {
    local vpc_id="$1"
    local service_name="$2"
    shift 2

    cond_log_and_run aws ec2 create-vpc-endpoint --vpc-id $vpc_id --service-name $service_name "$@"
}
