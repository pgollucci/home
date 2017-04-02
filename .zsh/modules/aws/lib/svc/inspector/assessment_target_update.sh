aws_inspector_assessment_target_update() {
    local assessment-target-name="$1"
    local resource-group-arn="$2"
    local assessment-target-arn="$3"
    shift 3

    log_and_run aws inspector  --assessment-target-name $assessment_target_name --resource-group-arn $resource_group_arn --assessment-target-arn $assessment_target_arn "@"

}
