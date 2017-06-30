aws_inspector_assessment_report_get() {
    local assessment_run_arn="$1"
    local report_file_format="$2"
    local report_type="$3"
    shift 3

    log_and_run aws inspector get-assessment-report --assessment-run-arn $assessment_run_arn --report-file-format $report_file_format --report-type $report_type "$@"
}
