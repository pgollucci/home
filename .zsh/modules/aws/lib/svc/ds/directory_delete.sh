aws_ds_directory_delete() {
    local directory-id="$1"
    shift 1

    cond_log_and_run aws ds  --directory-id $directory_id "@"

}
