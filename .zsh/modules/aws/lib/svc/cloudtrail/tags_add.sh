aws_cloudtrail_tags_add() {
    local resource-id="$1"
    shift 1

    cond_log_and_run aws cloudtrail  --resource-id $resource_id "@"

}
