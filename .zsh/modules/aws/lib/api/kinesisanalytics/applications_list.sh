aws_kinesisanalytics_applications_list() {
    shift 0

    log_and_run aws kinesisanalytics list-applications "$@"
}
