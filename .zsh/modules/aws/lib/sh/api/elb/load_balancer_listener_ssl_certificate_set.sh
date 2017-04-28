aws_elb_load_balancer_listener_ssl_certificate_set() {
    local load_balancer_name="$1"
    local load_balancer_port="$2"
    local ssl_certificate_id="$3"
    shift 3

    log_and_run aws elb set-load-balancer-listener-ssl-certificate --load-balancer-name $load_balancer_name --load-balancer-port $load_balancer_port --ssl-certificate-id $ssl_certificate_id "$@"
}
