aws_s3api_bucket_cors_put() {
    local cors-configuration="$1"
    local bucket="$2"
    shift 2

    cond_log_and_run aws s3api  --cors-configuration $cors_configuration --bucket $bucket "@"

}
