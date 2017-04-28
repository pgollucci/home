aws_cloudtrail_trail_create() {
    local name="$1"
    local s3_bucket_name="$2"
    shift 2

    cond_log_and_run aws cloudtrail create-trail --name $name --s3-bucket-name $s3_bucket_name "$@"
}
