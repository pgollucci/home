aws_opsworks_volume_deregister() {
    local volume-id="$1"
    shift 1

    cond_log_and_run aws opsworks  --volume-id $volume_id "@"

}
