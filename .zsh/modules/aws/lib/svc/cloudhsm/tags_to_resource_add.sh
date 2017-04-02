aws_cloudhsm_tags_to_resource_add() {
    local resource-arn="$1"
    local tag-list="$2"
    shift 2

    cond_log_and_run aws cloudhsm  --resource-arn $resource_arn --tag-list $tag_list "@"

}
