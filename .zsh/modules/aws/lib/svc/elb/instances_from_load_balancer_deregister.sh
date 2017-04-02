aws_elb_instances_from_load_balancer_deregister() {
    local load-balancer-name="$1"
    local instances="$2"
    shift 2

    cond_log_and_run aws elb  --load-balancer-name $load_balancer_name --instances $instances "@"

}
