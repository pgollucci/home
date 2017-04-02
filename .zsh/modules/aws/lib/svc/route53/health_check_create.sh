aws_route53_health_check_create() {
    local health-check-config="$1"
    local caller-reference="$2"
    shift 2

    cond_log_and_run aws route53  --health-check-config $health_check_config --caller-reference $caller_reference "@"

}
