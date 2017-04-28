aws_route53_health_check_status_get() {
    local health_check_id="$1"
    shift 1

    log_and_run aws route53 get-health-check-status --health-check-id $health_check_id "$@"
}
