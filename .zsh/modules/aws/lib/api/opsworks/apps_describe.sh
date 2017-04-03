aws_opsworks_apps_describe() {
    shift 0

    log_and_run aws opsworks describe-apps "$@"
}
