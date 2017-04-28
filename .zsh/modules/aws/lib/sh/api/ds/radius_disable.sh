aws_ds_radius_disable() {
    local directory_id="$1"
    shift 1

    cond_log_and_run aws ds disable-radius --directory-id $directory_id "$@"
}
