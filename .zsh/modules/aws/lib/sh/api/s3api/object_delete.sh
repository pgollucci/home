aws_s3api_object_delete() {
    local bucket="$1"
    local key="$2"
    shift 2

    cond_log_and_run aws s3api delete-object --bucket $bucket --key $key "$@"
}
