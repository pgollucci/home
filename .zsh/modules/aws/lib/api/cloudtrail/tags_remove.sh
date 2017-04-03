aws_cloudtrail_tags_remove() {
    local resource_id="$1"
    shift 1

    cond_log_and_run aws cloudtrail remove-tags --resource-id $resource_id "$@"
}
