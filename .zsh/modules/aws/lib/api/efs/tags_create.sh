aws_efs_tags_create() {
    local file_system_id="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws efs create-tags --file-system-id $file_system_id --tags $tags "$@"
}
