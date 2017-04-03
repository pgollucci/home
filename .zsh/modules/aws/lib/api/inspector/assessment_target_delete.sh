aws_inspector_assessment_target_delete() {
    local assessment_target_arn="$1"
    shift 1

    log_and_run aws inspector delete-assessment-target --assessment-target-arn $assessment_target_arn "$@"
}
