aws_cloudtrail_tags_add() {
    local resource_id="$1"
    shift 1

    cond_log_and_run aws cloudtrail add-tags --resource-id $resource_id "$@"
}
