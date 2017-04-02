aws_route53_tags_for_resources_list() {
    local resource-ids="$1"
    local resource-type="$2"
    shift 2

    log_and_run aws route53  --resource-ids $resource_ids --resource-type $resource_type "@"

}
