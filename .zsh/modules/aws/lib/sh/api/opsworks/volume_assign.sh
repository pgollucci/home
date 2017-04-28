aws_opsworks_volume_assign() {
    local volume_id="$1"
    shift 1

    cond_log_and_run aws opsworks assign-volume --volume-id $volume_id "$@"
}
