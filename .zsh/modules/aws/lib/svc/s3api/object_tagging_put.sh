aws_s3api_object_tagging_put() {
    local bucket="$1"
    local key="$2"
    local tagging="$3"
    shift 3

    cond_log_and_run aws s3api  --bucket $bucket --key $key --tagging $tagging "@"

}
