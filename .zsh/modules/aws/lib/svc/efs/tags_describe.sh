aws_efs_tags_describe() {
    local file-system-id="$1"
    shift 1

    log_and_run aws efs  --file-system-id $file_system_id "@"

}
