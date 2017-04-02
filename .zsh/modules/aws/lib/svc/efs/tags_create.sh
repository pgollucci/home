aws_efs_tags_create() {
    local tags="$1"
    local file-system-id="$2"
    shift 2

    cond_log_and_run aws efs  --tags $tags --file-system-id $file_system_id "@"

}
