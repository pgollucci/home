aws_cloudhsm_tags_to_resource_add() {
    local resource_arn="$1"
    local tag_list="$2"
    shift 2

    cond_log_and_run aws cloudhsm add-tags-to-resource --resource-arn $resource_arn --tag-list $tag_list "$@"
}
