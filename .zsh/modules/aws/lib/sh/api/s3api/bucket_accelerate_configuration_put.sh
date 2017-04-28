aws_s3api_bucket_accelerate_configuration_put() {
    local bucket="$1"
    local accelerate_configuration="$2"
    shift 2

    cond_log_and_run aws s3api put-bucket-accelerate-configuration --bucket $bucket --accelerate-configuration $accelerate_configuration "$@"
}
