aws_s3api_multipart_upload_complete() {
    local key="$1"
    local bucket="$2"
    local upload-id="$3"
    shift 3

    cond_log_and_run aws s3api  --key $key --bucket $bucket --upload-id $upload_id "@"

}
