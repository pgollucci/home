aws_ec2_vpc_endpoint_create() {
    local service_name="$1"
    local vpc_id="$2"
    shift 2

    cond_log_and_run aws ec2 create-vpc-endpoint --service-name $service_name --vpc-id $vpc_id "$@"
}
