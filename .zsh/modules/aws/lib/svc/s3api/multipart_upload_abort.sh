aws_s3api_multipart_upload_abort() {
    local key="$1"
    local upload-id="$2"
    local bucket="$3"
    shift 3

    cond_log_and_run aws s3api  --key $key --upload-id $upload_id --bucket $bucket "@"

}
