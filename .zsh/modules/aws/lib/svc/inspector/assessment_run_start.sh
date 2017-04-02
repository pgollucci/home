aws_inspector_assessment_run_start() {
    local assessment-template-arn="$1"
    shift 1

    cond_log_and_run aws inspector  --assessment-template-arn $assessment_template_arn "@"

}
