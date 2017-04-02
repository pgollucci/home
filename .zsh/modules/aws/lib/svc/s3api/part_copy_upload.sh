aws_s3api_part_copy_upload() {
    local bucket="$1"
    local upload-id="$2"
    local copy-source="$3"
    local key="$4"
    local part-number="$5"
    shift 5

    cond_log_and_run aws s3api  --bucket $bucket --upload-id $upload_id --copy-source $copy_source --key $key --part-number $part_number "@"

}
