aws_emr_tags_add() {
    local resource-id="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws emr  --resource-id $resource_id --tags $tags "@"

}
