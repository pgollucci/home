aws_waf-regional_resources_for_web_acl_list() {
    local web-acl-id="$1"
    shift 1

    log_and_run aws waf-regional  --web-acl-id $web_acl_id "@"

}
