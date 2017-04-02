aws_inspector_assessment_targets_describe() {
    local assessment-target-arns="$1"
    shift 1

    log_and_run aws inspector  --assessment-target-arns $assessment_target_arns "@"

}
