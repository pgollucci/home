aws_inspector_assessment_templates_list() {
    shift 0

    log_and_run aws inspector list-assessment-templates "$@"
}
