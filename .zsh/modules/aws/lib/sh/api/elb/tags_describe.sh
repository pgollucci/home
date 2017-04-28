aws_elb_tags_describe() {
    local load_balancer_names="$1"
    shift 1

    log_and_run aws elb describe-tags --load-balancer-names $load_balancer_names "$@"
}
