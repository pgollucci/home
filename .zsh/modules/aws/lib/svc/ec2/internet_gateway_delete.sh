aws_ec2_internet_gateway_delete() {
    local internet-gateway-id="$1"
    shift 1

    cond_log_and_run aws ec2  --internet-gateway-id $internet_gateway_id "@"

}
