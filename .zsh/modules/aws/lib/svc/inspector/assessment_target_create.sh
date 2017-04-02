aws_inspector_assessment_target_create() {
    local assessment-target-name="$1"
    local resource-group-arn="$2"
    shift 2

    log_and_run aws inspector  --assessment-target-name $assessment_target_name --resource-group-arn $resource_group_arn "@"

}
