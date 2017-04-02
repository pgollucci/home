aws_cloudtrail_tags_list() {
    local resource-id-list="$1"
    shift 1

    log_and_run aws cloudtrail  --resource-id-list $resource_id_list "@"

}
