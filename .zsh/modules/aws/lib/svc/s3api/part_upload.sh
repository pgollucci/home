aws_s3api_part_upload() {
    local part-number="$1"
    local key="$2"
    local bucket="$3"
    local upload-id="$4"
    shift 4

    cond_log_and_run aws s3api  --part-number $part_number --key $key --bucket $bucket --upload-id $upload_id "@"

}
