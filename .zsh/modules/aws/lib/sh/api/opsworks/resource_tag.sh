aws_opsworks_resource_tag() {
    local resource_arn="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws opsworks tag-resource --resource-arn $resource_arn --tags $tags "$@"
}
