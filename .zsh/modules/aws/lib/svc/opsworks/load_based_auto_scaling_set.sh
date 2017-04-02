aws_opsworks_load_based_auto_scaling_set() {
    local layer-id="$1"
    shift 1

    cond_log_and_run aws opsworks  --layer-id $layer_id "@"

}
