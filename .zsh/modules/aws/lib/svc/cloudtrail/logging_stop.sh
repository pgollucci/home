aws_cloudtrail_logging_stop() {
    local name="$1"
    shift 1

    cond_log_and_run aws cloudtrail  --name $name "@"

}
