aws_route53_health_check_update() {
    local health_check_id="$1"
    shift 1

    cond_log_and_run aws route53 update-health-check --health-check-id $health_check_id "$@"
}
