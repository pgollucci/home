aws_s3api_bucket_website_put() {
    local bucket="$1"
    local website_configuration="$2"
    shift 2

    cond_log_and_run aws s3api put-bucket-website --bucket $bucket --website-configuration $website_configuration "$@"
}
