aws_elb_tags_describe() {
    local load-balancer-names="$1"
    shift 1

    log_and_run aws elb  --load-balancer-names $load_balancer_names "@"

}
