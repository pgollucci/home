aws_ds_directory_delete() {
    local directory_id="$1"
    shift 1

    cond_log_and_run aws ds delete-directory --directory-id $directory_id "$@"
}
