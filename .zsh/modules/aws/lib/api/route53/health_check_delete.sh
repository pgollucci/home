aws_route53_health_check_delete() {
    local health_check_id="$1"
    shift 1

    cond_log_and_run aws route53 delete-health-check --health-check-id $health_check_id "$@"
}
