aws_waf_web_acl_get() {
    local web-acl-id="$1"
    shift 1

    log_and_run aws waf  --web-acl-id $web_acl_id "@"

}
