aws_xray_telemetry_records_put() {
    local telemetry_records="$1"
    shift 1

    cond_log_and_run aws xray put-telemetry-records --telemetry-records $telemetry_records "$@"
}
