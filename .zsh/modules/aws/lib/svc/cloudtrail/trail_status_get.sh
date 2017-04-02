aws_cloudtrail_trail_status_get() {
    local name="$1"
    shift 1

    log_and_run aws cloudtrail  --name $name "@"

}
