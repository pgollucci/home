aws_iot_logging_options_set() {
    local logging-options-payload="$1"
    shift 1

    cond_log_and_run aws iot  --logging-options-payload $logging_options_payload "@"

}
