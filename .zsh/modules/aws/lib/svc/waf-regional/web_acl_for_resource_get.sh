aws_waf-regional_web_acl_for_resource_get() {
    local resource-arn="$1"
    shift 1

    log_and_run aws waf-regional  --resource-arn $resource_arn "@"

}
