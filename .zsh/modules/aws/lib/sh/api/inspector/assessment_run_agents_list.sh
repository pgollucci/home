aws_inspector_assessment_run_agents_list() {
    local assessment_run_arn="$1"
    shift 1

    log_and_run aws inspector list-assessment-run-agents --assessment-run-arn $assessment_run_arn "$@"
}
