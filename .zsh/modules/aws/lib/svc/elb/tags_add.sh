aws_elb_tags_add() {
    local load-balancer-names="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws elb  --load-balancer-names $load_balancer_names --tags $tags "@"

}
