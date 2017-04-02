aws_inspector_assessment_template_create() {
    local duration-in-seconds="$1"
    local assessment-target-arn="$2"
    local rules-package-arns="$3"
    local assessment-template-name="$4"
    shift 4

    cond_log_and_run aws inspector  --duration-in-seconds $duration_in_seconds --assessment-target-arn $assessment_target_arn --rules-package-arns $rules_package_arns --assessment-template-name $assessment_template_name "@"

}
