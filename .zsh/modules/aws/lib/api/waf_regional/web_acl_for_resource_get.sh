aws_waf-regional_web_acl_for_resource_get() {
    local resource_arn="$1"
    shift 1

    log_and_run aws waf-regional get-web-acl-for-resource --resource-arn $resource_arn "$@"
}
