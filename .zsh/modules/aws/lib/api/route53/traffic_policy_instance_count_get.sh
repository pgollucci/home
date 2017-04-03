aws_route53_traffic_policy_instance_count_get() {
    shift 0

    log_and_run aws route53 get-traffic-policy-instance-count "$@"
}
