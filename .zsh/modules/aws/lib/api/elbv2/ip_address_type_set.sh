aws_elbv2_ip_address_type_set() {
    local load_balancer_arn="$1"
    local ip_address_type="$2"
    shift 2

    cond_log_and_run aws elbv2 set-ip-address-type --load-balancer-arn $load_balancer_arn --ip-address-type $ip_address_type "$@"
}
