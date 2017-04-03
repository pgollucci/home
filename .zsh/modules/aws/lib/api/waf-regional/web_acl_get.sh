aws_waf-regional_web_acl_get() {
    local web_acl_id="$1"
    shift 1

    log_and_run aws waf-regional get-web-acl --web-acl-id $web_acl_id "$@"
}
