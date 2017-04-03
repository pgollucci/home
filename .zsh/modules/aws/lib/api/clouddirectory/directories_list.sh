aws_clouddirectory_directories_list() {
    shift 0

    log_and_run aws clouddirectory list-directories "$@"
}
