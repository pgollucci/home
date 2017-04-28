aws_elb_load_balancer_delete() {
    local load_balancer_name="$1"
    shift 1

    cond_log_and_run aws elb delete-load-balancer --load-balancer-name $load_balancer_name "$@"
}
