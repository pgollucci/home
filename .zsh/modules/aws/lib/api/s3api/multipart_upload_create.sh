aws_s3api_multipart_upload_create() {
    local bucket="$1"
    local key="$2"
    shift 2

    cond_log_and_run aws s3api create-multipart-upload --bucket $bucket --key $key "$@"
}
