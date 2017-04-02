aws_elbv2_load_balancer_attributes_modify() {
    local attributes="$1"
    local load-balancer-arn="$2"
    shift 2

    cond_log_and_run aws elbv2  --attributes $attributes --load-balancer-arn $load_balancer_arn "@"

}
