aws_elb_instances_from_load_balancer_deregister() {
    local load_balancer_name="$1"
    local instances="$2"
    shift 2

    cond_log_and_run aws elb deregister-instances-from-load-balancer --load-balancer-name $load_balancer_name --instances $instances "$@"
}
