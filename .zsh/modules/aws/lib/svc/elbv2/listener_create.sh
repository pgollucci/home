aws_elbv2_listener_create() {
    local load-balancer-arn="$1"
    local default-actions="$2"
    local protocol="$3"
    local port="$4"
    shift 4

    log_and_run aws elbv2  --load-balancer-arn $load_balancer_arn --default-actions $default_actions --protocol $protocol --port $port "@"

}
