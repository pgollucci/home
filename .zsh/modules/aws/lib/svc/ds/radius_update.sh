aws_ds_radius_update() {
    local radius-settings="$1"
    local directory-id="$2"
    shift 2

    cond_log_and_run aws ds  --radius-settings $radius_settings --directory-id $directory_id "@"

}
