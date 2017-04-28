aws_waf_regional_web_acl_associate() {
    local web_acl_id="$1"
    local resource_arn="$2"
    shift 2

    cond_log_and_run aws waf-regional associate-web-acl --web-acl-id $web_acl_id --resource-arn $resource_arn "$@"
}
