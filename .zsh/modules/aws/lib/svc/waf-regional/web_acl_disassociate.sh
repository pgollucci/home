aws_waf-regional_web_acl_disassociate() {
    local resource-arn="$1"
    shift 1

    cond_log_and_run aws waf-regional  --resource-arn $resource_arn "@"

}
