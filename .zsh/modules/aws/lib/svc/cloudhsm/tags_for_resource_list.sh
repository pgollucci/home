aws_cloudhsm_tags_for_resource_list() {
    local resource-arn="$1"
    shift 1

    log_and_run aws cloudhsm  --resource-arn $resource_arn "@"

}
