aws_ec2_spot_instances_request() {
    local spot-price="$1"
    shift 1

    cond_log_and_run aws ec2  --spot-price $spot_price "@"

}
