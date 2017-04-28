aws_waf_web_acl_get() {
    local web_acl_id="$1"
    shift 1

    log_and_run aws waf get-web-acl --web-acl-id $web_acl_id "$@"
}
