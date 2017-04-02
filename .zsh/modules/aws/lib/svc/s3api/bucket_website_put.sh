aws_s3api_bucket_website_put() {
    local website-configuration="$1"
    local bucket="$2"
    shift 2

    cond_log_and_run aws s3api  --website-configuration $website_configuration --bucket $bucket "@"

}
