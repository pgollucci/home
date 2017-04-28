aws_cloudfront_resource_untag() {
    local resource="$1"
    local tag_keys="$2"
    shift 2

    cond_log_and_run aws cloudfront untag-resource --resource $resource --tag-keys $tag_keys "$@"
}
