aws_opsworks_load_based_auto_scaling_describe() {
    local layer-ids="$1"
    shift 1

    log_and_run aws opsworks  --layer-ids $layer_ids "@"

}
