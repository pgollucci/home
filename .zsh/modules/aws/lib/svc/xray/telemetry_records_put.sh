aws_xray_telemetry_records_put() {
    local telemetry-records="$1"
    shift 1

    cond_log_and_run aws xray  --telemetry-records $telemetry_records "@"

}
