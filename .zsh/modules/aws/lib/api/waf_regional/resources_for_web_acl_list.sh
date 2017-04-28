aws_waf-regional_resources_for_web_acl_list() {
    local web_acl_id="$1"
    shift 1

    log_and_run aws waf-regional list-resources-for-web-acl --web-acl-id $web_acl_id "$@"
}
