aws_cur_report_definition_put() {
    local report_definition="$1"
    shift 1

    cond_log_and_run aws cur put-report-definition --report-definition $report_definition "$@"
}
