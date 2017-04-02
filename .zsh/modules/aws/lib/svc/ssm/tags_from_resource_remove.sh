aws_ssm_tags_from_resource_remove() {
    local tag-keys="$1"
    local resource-id="$2"
    local resource-type="$3"
    shift 3

    cond_log_and_run aws ssm  --tag-keys $tag_keys --resource-id $resource_id --resource-type $resource_type "@"

}
