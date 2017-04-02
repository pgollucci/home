aws_waf-regional_web_acl_associate() {
    local resource-arn="$1"
    local web-acl-id="$2"
    shift 2

    cond_log_and_run aws waf-regional  --resource-arn $resource_arn --web-acl-id $web_acl_id "@"

}
