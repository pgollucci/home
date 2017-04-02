aws_efs_tags_delete() {
    local file-system-id="$1"
    local tag-keys="$2"
    shift 2

    cond_log_and_run aws efs  --file-system-id $file_system_id --tag-keys $tag_keys "@"

}
