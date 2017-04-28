aws_inspector_tags_for_resource_set() {
    local resource_arn="$1"
    shift 1

    cond_log_and_run aws inspector set-tags-for-resource --resource-arn $resource_arn "$@"
}
