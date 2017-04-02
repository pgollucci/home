aws_elb_load_balancer_attributes_modify() {
    local load-balancer-attributes="$1"
    local load-balancer-name="$2"
    shift 2

    cond_log_and_run aws elb  --load-balancer-attributes $load_balancer_attributes --load-balancer-name $load_balancer_name "@"

}
