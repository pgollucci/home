aws_ec2_spot_instances_request() {
    local spot_price="$1"
    shift 1

    cond_log_and_run aws ec2 request-spot-instances --spot-price $spot_price "$@"
}
