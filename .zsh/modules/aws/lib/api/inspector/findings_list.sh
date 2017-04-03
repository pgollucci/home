aws_inspector_findings_list() {
    shift 0

    log_and_run aws inspector list-findings "$@"
}
