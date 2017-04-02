aws_lightsail_instance_metric_data_get() {
    local end-time="$1"
    local unit="$2"
    local metric-name="$3"
    local start-time="$4"
    local period="$5"
    local instance-name="$6"
    local statistics="$7"
    shift 7

    log_and_run aws lightsail  --end-time $end_time --unit $unit --metric-name $metric_name --start-time $start_time --period $period --instance-name $instance_name --statistics $statistics "@"

}
