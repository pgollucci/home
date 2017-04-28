aws_elb_load_balancer_attributes_describe() {
    local load_balancer_name="$1"
    shift 1

    log_and_run aws elb describe-load-balancer-attributes --load-balancer-name $load_balancer_name "$@"
}
