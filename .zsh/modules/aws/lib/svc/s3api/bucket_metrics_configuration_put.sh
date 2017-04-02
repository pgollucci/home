aws_s3api_bucket_metrics_configuration_put() {
    local bucket="$1"
    local id="$2"
    local metrics-configuration="$3"
    shift 3

    cond_log_and_run aws s3api  --bucket $bucket --id $id --metrics-configuration $metrics_configuration "@"

}
