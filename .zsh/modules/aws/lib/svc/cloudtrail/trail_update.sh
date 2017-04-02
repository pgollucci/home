aws_cloudtrail_trail_update() {
    local name="$1"
    shift 1

    cond_log_and_run aws cloudtrail  --name $name "@"

}
