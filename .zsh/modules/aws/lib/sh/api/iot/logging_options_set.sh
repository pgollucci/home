aws_iot_logging_options_set() {
    local logging_options_payload="$1"
    shift 1

    cond_log_and_run aws iot set-logging-options --logging-options-payload $logging_options_payload "$@"
}
