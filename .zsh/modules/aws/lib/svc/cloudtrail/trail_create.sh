aws_cloudtrail_trail_create() {
    local s3-bucket-name="$1"
    local name="$2"
    shift 2

    cond_log_and_run aws cloudtrail  --s3-bucket-name $s3_bucket_name --name $name "@"

}
