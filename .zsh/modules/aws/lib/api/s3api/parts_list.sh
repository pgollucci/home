aws_s3api_parts_list() {
    local bucket="$1"
    local key="$2"
    local upload_id="$3"
    shift 3

    log_and_run aws s3api list-parts --bucket $bucket --key $key --upload-id $upload_id "$@"
}
