aws_storagegateway_maintenance_start_time_update() {
    local hour-of-day="$1"
    local day-of-week="$2"
    local minute-of-hour="$3"
    local gateway-arn="$4"
    shift 4

    cond_log_and_run aws storagegateway  --hour-of-day $hour_of_day --day-of-week $day_of_week --minute-of-hour $minute_of_hour --gateway-arn $gateway_arn "@"

}
