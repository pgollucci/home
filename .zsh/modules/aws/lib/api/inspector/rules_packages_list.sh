aws_inspector_rules_packages_list() {
    shift 0

    log_and_run aws inspector list-rules-packages "$@"
}
