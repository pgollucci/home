aws_cloudwatch_alarm_history_describe() {
    shift 0

    log_and_run aws cloudwatch describe-alarm-history "$@"
}
