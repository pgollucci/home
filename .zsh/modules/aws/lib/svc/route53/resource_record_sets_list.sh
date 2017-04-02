aws_route53_resource_record_sets_list() {
    local hosted-zone-id="$1"
    shift 1

    log_and_run aws route53  --hosted-zone-id $hosted_zone_id "@"

}
