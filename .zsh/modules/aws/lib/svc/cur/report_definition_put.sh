aws_cur_report_definition_put() {
    local report-definition="$1"
    shift 1

    cond_log_and_run aws cur  --report-definition $report_definition "@"

}
