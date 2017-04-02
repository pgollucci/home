aws_s3api_bucket_lifecycle_delete() {
    local bucket="$1"
    shift 1

    cond_log_and_run aws s3api  --bucket $bucket "@"

}
