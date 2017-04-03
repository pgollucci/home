aws_sns_topics_list() {
    shift 0

    log_and_run aws sns list-topics "$@"
}
