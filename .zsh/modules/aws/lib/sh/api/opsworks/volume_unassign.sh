aws_opsworks_volume_unassign() {
    local volume_id="$1"
    shift 1

    cond_log_and_run aws opsworks unassign-volume --volume-id $volume_id "$@"
}
