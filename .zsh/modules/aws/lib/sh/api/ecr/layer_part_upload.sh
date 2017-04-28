aws_ecr_layer_part_upload() {
    local repository_name="$1"
    local upload_id="$2"
    local part_first_byte="$3"
    local part_last_byte="$4"
    local layer_part_blob="$5"
    shift 5

    cond_log_and_run aws ecr upload-layer-part --repository-name $repository_name --upload-id $upload_id --part-first-byte $part_first_byte --part-last-byte $part_last_byte --layer-part-blob $layer_part_blob "$@"
}
