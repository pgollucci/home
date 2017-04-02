aws_elb_tags_remove() {
    local tags="$1"
    local load-balancer-names="$2"
    shift 2

    cond_log_and_run aws elb  --tags $tags --load-balancer-names $load_balancer_names "@"

}
