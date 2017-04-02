aws_route53_tags_for_resource_change() {
    local resource-id="$1"
    local resource-type="$2"
    shift 2

    cond_log_and_run aws route53  --resource-id $resource_id --resource-type $resource_type "@"

}
