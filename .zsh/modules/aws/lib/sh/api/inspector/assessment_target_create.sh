aws_inspector_assessment_target_create() {
    local assessment_target_name="$1"
    local resource_group_arn="$2"
    shift 2

    log_and_run aws inspector create-assessment-target --assessment-target-name $assessment_target_name --resource-group-arn $resource_group_arn "$@"
}
