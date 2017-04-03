aws_s3api_object_versions_list() {
    local bucket="$1"
    shift 1

    log_and_run aws s3api list-object-versions --bucket $bucket "$@"
}
