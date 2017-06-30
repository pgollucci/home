aws_ec2_customer_gateway_create() {
    local bgp_asn="$1"
    local public_ip="$2"
    local type="$3"
    shift 3

    cond_log_and_run aws ec2 create-customer-gateway --bgp-asn $bgp_asn --public-ip $public_ip --type $type "$@"
}
