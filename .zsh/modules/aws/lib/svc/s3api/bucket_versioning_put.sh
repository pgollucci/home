aws_s3api_bucket_versioning_put() {
    local bucket="$1"
    local versioning-configuration="$2"
    shift 2

    cond_log_and_run aws s3api  --bucket $bucket --versioning-configuration $versioning_configuration "@"

}
