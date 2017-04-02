aws_s3api_parts_list() {
    local key="$1"
    local upload-id="$2"
    local bucket="$3"
    shift 3

    log_and_run aws s3api  --key $key --upload-id $upload_id --bucket $bucket "@"

}
