aws_opsworks_volume_update() {
    local volume_id="$1"
    shift 1

    cond_log_and_run aws opsworks update-volume --volume-id $volume_id "$@"
}
