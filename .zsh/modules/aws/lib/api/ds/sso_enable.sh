aws_ds_sso_enable() {
    local directory_id="$1"
    shift 1

    cond_log_and_run aws ds enable-sso --directory-id $directory_id "$@"
}
