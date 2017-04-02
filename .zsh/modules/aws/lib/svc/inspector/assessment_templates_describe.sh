aws_inspector_assessment_templates_describe() {
    local assessment-template-arns="$1"
    shift 1

    log_and_run aws inspector  --assessment-template-arns $assessment_template_arns "@"

}
