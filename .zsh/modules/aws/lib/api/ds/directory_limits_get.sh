aws_ds_directory_limits_get() {
    shift 0

    log_and_run aws ds get-directory-limits "$@"
}
