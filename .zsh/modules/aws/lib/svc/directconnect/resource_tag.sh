aws_directconnect_resource_tag() {
    local resource-arn="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws directconnect  --resource-arn $resource_arn --tags $tags "@"

}
