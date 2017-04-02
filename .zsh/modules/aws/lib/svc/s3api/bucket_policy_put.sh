aws_s3api_bucket_policy_put() {
    local bucket="$1"
    local policy="$2"
    shift 2

    cond_log_and_run aws s3api  --bucket $bucket --policy $policy "@"

}
