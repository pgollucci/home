aws_cloudfront_distributions_by_web_acl_id_list() {
    local web-acl-id="$1"
    shift 1

    log_and_run aws cloudfront  --web-acl-id $web_acl_id "@"

}
