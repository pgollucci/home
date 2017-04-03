aws_cloudfront_resource_tag() {
    local resource="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws cloudfront tag-resource --resource $resource --tags $tags "$@"
}
