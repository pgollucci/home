aws_efs_tags_delete() {
    local file_system_id="$1"
    local tag_keys="$2"
    shift 2

    cond_log_and_run aws efs delete-tags --file-system-id $file_system_id --tag-keys $tag_keys "$@"
}
