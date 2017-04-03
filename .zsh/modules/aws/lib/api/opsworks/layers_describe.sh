aws_opsworks_layers_describe() {
    shift 0

    log_and_run aws opsworks describe-layers "$@"
}
