aws_elb_instance_health_describe() {
    local load-balancer-name="$1"
    shift 1

    log_and_run aws elb  --load-balancer-name $load_balancer_name "@"

}
