aws_waf-regional_web_acl_disassociate() {
    local resource_arn="$1"
    shift 1

    cond_log_and_run aws waf-regional disassociate-web-acl --resource-arn $resource_arn "$@"
}
