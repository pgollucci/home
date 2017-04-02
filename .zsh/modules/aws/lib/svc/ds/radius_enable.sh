aws_ds_radius_enable() {
    local directory-id="$1"
    local radius-settings="$2"
    shift 2

    cond_log_and_run aws ds  --directory-id $directory_id --radius-settings $radius_settings "@"

}
