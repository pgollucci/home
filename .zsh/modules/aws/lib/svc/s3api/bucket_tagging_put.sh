aws_s3api_bucket_tagging_put() {
    local bucket="$1"
    local tagging="$2"
    shift 2

    cond_log_and_run aws s3api  --bucket $bucket --tagging $tagging "@"

}
