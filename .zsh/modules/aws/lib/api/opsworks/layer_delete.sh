aws_opsworks_layer_delete() {
    local layer_id="$1"
    shift 1

    cond_log_and_run aws opsworks delete-layer --layer-id $layer_id "$@"
}
