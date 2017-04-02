aws_clouddirectory_resource_tag() {
    local tags="$1"
    local resource-arn="$2"
    shift 2

    cond_log_and_run aws clouddirectory  --tags $tags --resource-arn $resource_arn "@"

}
