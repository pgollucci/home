aws_inspector_assessment_targets_describe() {
    local assessment_target_arns="$1"
    shift 1

    log_and_run aws inspector describe-assessment-targets --assessment-target-arns $assessment_target_arns "$@"
}
