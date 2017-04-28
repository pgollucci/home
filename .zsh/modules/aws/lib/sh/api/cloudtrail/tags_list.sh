aws_cloudtrail_tags_list() {
    local resource_id_list="$1"
    shift 1

    log_and_run aws cloudtrail list-tags --resource-id-list $resource_id_list "$@"
}
