aws_ds_directories_describe() {
    shift 0

    log_and_run aws ds describe-directories "$@"
}
