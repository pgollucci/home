aws_s3api_bucket_replication_put() {
    local replication-configuration="$1"
    local bucket="$2"
    shift 2

    cond_log_and_run aws s3api  --replication-configuration $replication_configuration --bucket $bucket "@"

}
