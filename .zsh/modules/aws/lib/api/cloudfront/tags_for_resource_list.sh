aws_cloudfront_tags_for_resource_list() {
    local resource="$1"
    shift 1

    log_and_run aws cloudfront list-tags-for-resource --resource $resource "$@"
}
