aws_opsworks_layer_update() {
    local layer-id="$1"
    shift 1

    cond_log_and_run aws opsworks  --layer-id $layer_id "@"

}
