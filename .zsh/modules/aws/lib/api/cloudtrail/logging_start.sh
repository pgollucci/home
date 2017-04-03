aws_cloudtrail_logging_start() {
    local name="$1"
    shift 1

    cond_log_and_run aws cloudtrail start-logging --name $name "$@"
}
