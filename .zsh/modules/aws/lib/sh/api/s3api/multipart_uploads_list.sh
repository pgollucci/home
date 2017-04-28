aws_s3api_multipart_uploads_list() {
    local bucket="$1"
    shift 1

    log_and_run aws s3api list-multipart-uploads --bucket $bucket "$@"
}
