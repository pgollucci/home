aws_cloudfront_resource_untag() {
    local tag-keys="$1"
    local resource="$2"
    shift 2

    cond_log_and_run aws cloudfront  --tag-keys $tag_keys --resource $resource "@"

}
