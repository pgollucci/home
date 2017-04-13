aws_inspector_findings_list() {

    log_and_run aws inspector list-findings "$@"
}
