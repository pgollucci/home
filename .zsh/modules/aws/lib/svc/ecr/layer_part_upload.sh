aws_ecr_layer_part_upload() {
    local layer-part-blob="$1"
    local part-first-byte="$2"
    local repository-name="$3"
    local upload-id="$4"
    local part-last-byte="$5"
    shift 5

    cond_log_and_run aws ecr  --layer-part-blob $layer_part_blob --part-first-byte $part_first_byte --repository-name $repository_name --upload-id $upload_id --part-last-byte $part_last_byte "@"

}
