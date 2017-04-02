aws_inspector_assessment_template_delete() {
    local assessment-template-arn="$1"
    shift 1

    cond_log_and_run aws inspector  --assessment-template-arn $assessment_template_arn "@"

}
