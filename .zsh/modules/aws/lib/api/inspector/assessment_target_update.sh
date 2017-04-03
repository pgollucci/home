aws_inspector_assessment_target_update() {
    local assessment_target_arn="$1"
    local assessment_target_name="$2"
    local resource_group_arn="$3"
    shift 3

    log_and_run aws inspector update-assessment-target --assessment-target-arn $assessment_target_arn --assessment-target-name $assessment_target_name --resource-group-arn $resource_group_arn "$@"
}
