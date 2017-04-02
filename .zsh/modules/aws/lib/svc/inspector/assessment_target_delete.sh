aws_inspector_assessment_target_delete() {
    local assessment-target-arn="$1"
    shift 1

    log_and_run aws inspector  --assessment-target-arn $assessment_target_arn "@"

}
