aws_discovery_tags_describe() {
    shift 0

    log_and_run aws discovery describe-tags "$@"
}
