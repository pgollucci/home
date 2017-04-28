aws_s3api_part_upload() {
    local bucket="$1"
    local key="$2"
    local part_number="$3"
    local upload_id="$4"
    shift 4

    cond_log_and_run aws s3api upload-part --bucket $bucket --key $key --part-number $part_number --upload-id $upload_id "$@"
}
