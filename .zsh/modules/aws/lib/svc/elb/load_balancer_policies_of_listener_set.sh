aws_elb_load_balancer_policies_of_listener_set() {
    local load-balancer-port="$1"
    local load-balancer-name="$2"
    local policy-names="$3"
    shift 3

    log_and_run aws elb  --load-balancer-port $load_balancer_port --load-balancer-name $load_balancer_name --policy-names $policy_names "@"

}
