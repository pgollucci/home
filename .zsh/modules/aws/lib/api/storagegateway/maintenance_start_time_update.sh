aws_storagegateway_maintenance_start_time_update() {
    local gateway_arn="$1"
    local hour_of_day="$2"
    local minute_of_hour="$3"
    local day_of_week="$4"
    shift 4

    cond_log_and_run aws storagegateway update-maintenance-start-time --gateway-arn $gateway_arn --hour-of-day $hour_of_day --minute-of-hour $minute_of_hour --day-of-week $day_of_week "$@"
}
