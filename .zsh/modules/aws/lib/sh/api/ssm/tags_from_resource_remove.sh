aws_ssm_tags_from_resource_remove() {
    local resource_type="$1"
    local resource_id="$2"
    local tag_keys="$3"
    shift 3

    cond_log_and_run aws ssm remove-tags-from-resource --resource-type $resource_type --resource-id $resource_id --tag-keys $tag_keys "$@"
}
