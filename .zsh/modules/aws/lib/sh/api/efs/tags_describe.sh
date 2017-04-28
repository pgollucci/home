aws_efs_tags_describe() {
    local file_system_id="$1"
    shift 1

    log_and_run aws efs describe-tags --file-system-id $file_system_id "$@"
}
