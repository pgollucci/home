aws_elb_load_balancer_policies_for_backend_server_set() {
    local instance-port="$1"
    local load-balancer-name="$2"
    local policy-names="$3"
    shift 3

    cond_log_and_run aws elb  --instance-port $instance_port --load-balancer-name $load_balancer_name --policy-names $policy_names "@"

}
