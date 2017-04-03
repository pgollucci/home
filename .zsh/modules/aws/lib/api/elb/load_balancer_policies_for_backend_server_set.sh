aws_elb_load_balancer_policies_for_backend_server_set() {
    local load_balancer_name="$1"
    local instance_port="$2"
    local policy_names="$3"
    shift 3

    cond_log_and_run aws elb set-load-balancer-policies-for-backend-server --load-balancer-name $load_balancer_name --instance-port $instance_port --policy-names $policy_names "$@"
}
