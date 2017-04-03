aws_ds_sso_disable() {
    local directory_id="$1"
    shift 1

    cond_log_and_run aws ds disable-sso --directory-id $directory_id "$@"
}
