aws_ds_sso_enable() {
    local directory-id="$1"
    shift 1

    cond_log_and_run aws ds  --directory-id $directory_id "@"

}
