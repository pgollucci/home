aws_s3api_bucket_analytics_configuration_delete() {
    local id="$1"
    local bucket="$2"
    shift 2

    cond_log_and_run aws s3api  --id $id --bucket $bucket "@"

}
