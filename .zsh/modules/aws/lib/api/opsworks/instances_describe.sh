aws_opsworks_instances_describe() {
    shift 0

    log_and_run aws opsworks describe-instances "$@"
}
