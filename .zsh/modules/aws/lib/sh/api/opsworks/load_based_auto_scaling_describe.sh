aws_opsworks_load_based_auto_scaling_describe() {
    local layer_ids="$1"
    shift 1

    log_and_run aws opsworks describe-load-based-auto-scaling --layer-ids $layer_ids "$@"
}
