aws_opsworks_volume_deregister() {
    local volume_id="$1"
    shift 1

    cond_log_and_run aws opsworks deregister-volume --volume-id $volume_id "$@"
}
