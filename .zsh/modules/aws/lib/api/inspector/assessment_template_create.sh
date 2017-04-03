aws_inspector_assessment_template_create() {
    local assessment_target_arn="$1"
    local assessment_template_name="$2"
    local duration_in_seconds="$3"
    local rules_package_arns="$4"
    shift 4

    cond_log_and_run aws inspector create-assessment-template --assessment-target-arn $assessment_target_arn --assessment-template-name $assessment_template_name --duration-in-seconds $duration_in_seconds --rules-package-arns $rules_package_arns "$@"
}
