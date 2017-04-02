aws_inspector_assessment_run_agents_list() {
    local assessment-run-arn="$1"
    shift 1

    log_and_run aws inspector  --assessment-run-arn $assessment_run_arn "@"

}
