aws_elb_load_balancer_listener_ssl_certificate_set() {
    local load-balancer-port="$1"
    local ssl-certificate-id="$2"
    local load-balancer-name="$3"
    shift 3

    log_and_run aws elb  --load-balancer-port $load_balancer_port --ssl-certificate-id $ssl_certificate_id --load-balancer-name $load_balancer_name "@"

}
