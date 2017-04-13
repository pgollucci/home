aws_inspector_rules_packages_list() {

    log_and_run aws inspector list-rules-packages "$@"
}
