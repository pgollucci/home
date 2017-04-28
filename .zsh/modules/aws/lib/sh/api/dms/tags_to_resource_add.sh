aws_dms_tags_to_resource_add() {
    local resource_arn="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws dms add-tags-to-resource --resource-arn $resource_arn --tags $tags "$@"
}
