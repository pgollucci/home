aws_s3api_objects_delete() {
    local bucket="$1"
    local delete="$2"
    shift 2

    cond_log_and_run aws s3api delete-objects --bucket $bucket --delete $delete "$@"
}
