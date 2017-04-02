aws_s3api_object_tagging_get() {
    local key="$1"
    local bucket="$2"
    shift 2

    log_and_run aws s3api  --key $key --bucket $bucket "@"

}
