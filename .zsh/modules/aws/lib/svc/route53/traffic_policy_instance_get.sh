aws_route53_traffic_policy_instance_get() {
    local id="$1"
    shift 1

    log_and_run aws route53  --id $id "@"

}
