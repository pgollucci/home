aws_inspector_assessment_runs_describe() {
    local assessment-run-arns="$1"
    shift 1

    log_and_run aws inspector  --assessment-run-arns $assessment_run_arns "@"

}
