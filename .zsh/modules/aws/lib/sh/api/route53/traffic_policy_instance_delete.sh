aws_route53_traffic_policy_instance_delete() {
    local id="$1"
    shift 1

    cond_log_and_run aws route53 delete-traffic-policy-instance --id $id "$@"
}
