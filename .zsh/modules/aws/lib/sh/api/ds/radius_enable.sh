aws_ds_radius_enable() {
    local directory_id="$1"
    local radius_settings="$2"
    shift 2

    cond_log_and_run aws ds enable-radius --directory-id $directory_id --radius-settings $radius_settings "$@"
}
