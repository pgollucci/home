aws_opsworks_load_based_auto_scaling_set() {
    local layer_id="$1"
    shift 1

    cond_log_and_run aws opsworks set-load-based-auto-scaling --layer-id $layer_id "$@"
}
