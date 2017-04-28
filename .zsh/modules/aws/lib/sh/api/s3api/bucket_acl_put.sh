aws_s3api_bucket_acl_put() {
    local bucket="$1"
    shift 1

    cond_log_and_run aws s3api put-bucket-acl --bucket $bucket "$@"
}
