aws_sns_platform_applications_list() {
    shift 0

    log_and_run aws sns list-platform-applications "$@"
}
