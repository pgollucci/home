aws_s3api_bucket_create() {
    local bucket="$1"
    shift 1

    cond_log_and_run aws s3api create-bucket --bucket $bucket "$@"
}
