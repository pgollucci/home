aws_route53_health_check_get() {
    local health_check_id="$1"
    shift 1

    log_and_run aws route53 get-health-check --health-check-id $health_check_id "$@"
}
