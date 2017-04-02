aws_ssm_tags_to_resource_add() {
    local resource-id="$1"
    local resource-type="$2"
    local tags="$3"
    shift 3

    cond_log_and_run aws ssm  --resource-id $resource_id --resource-type $resource_type --tags $tags "@"

}
