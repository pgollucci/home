aws_ssm_tags_for_resource_list() {
    local resource-type="$1"
    local resource-id="$2"
    shift 2

    log_and_run aws ssm  --resource-type $resource_type --resource-id $resource_id "@"

}
