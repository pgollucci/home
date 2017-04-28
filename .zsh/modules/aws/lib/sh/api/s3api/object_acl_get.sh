aws_s3api_object_acl_get() {
    local bucket="$1"
    local key="$2"
    shift 2

    log_and_run aws s3api get-object-acl --bucket $bucket --key $key "$@"
}
