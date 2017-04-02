aws_s3api_object_copy() {
    local bucket="$1"
    local copy-source="$2"
    local key="$3"
    shift 3

    cond_log_and_run aws s3api  --bucket $bucket --copy-source $copy_source --key $key "@"

}
