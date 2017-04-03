aws_route53_health_check_last_failure_reason_get() {
    local health_check_id="$1"
    shift 1

    log_and_run aws route53 get-health-check-last-failure-reason --health-check-id $health_check_id "$@"
}
