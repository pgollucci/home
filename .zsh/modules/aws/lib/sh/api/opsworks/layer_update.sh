aws_opsworks_layer_update() {
    local layer_id="$1"
    shift 1

    cond_log_and_run aws opsworks update-layer --layer-id $layer_id "$@"
}
