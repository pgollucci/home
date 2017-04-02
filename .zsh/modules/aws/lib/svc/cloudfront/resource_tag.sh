aws_cloudfront_resource_tag() {
    local tags="$1"
    local resource="$2"
    shift 2

    cond_log_and_run aws cloudfront  --tags $tags --resource $resource "@"

}
