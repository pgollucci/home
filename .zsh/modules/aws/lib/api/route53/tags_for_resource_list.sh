aws_route53_tags_for_resource_list() {
    local resource_type="$1"
    local resource_id="$2"
    shift 2

    log_and_run aws route53 list-tags-for-resource --resource-type $resource_type --resource-id $resource_id "$@"
}
