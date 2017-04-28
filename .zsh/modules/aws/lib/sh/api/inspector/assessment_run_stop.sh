aws_inspector_assessment_run_stop() {
    local assessment_run_arn="$1"
    shift 1

    cond_log_and_run aws inspector stop-assessment-run --assessment-run-arn $assessment_run_arn "$@"
}
