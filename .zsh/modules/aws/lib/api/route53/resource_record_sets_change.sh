aws_route53_resource_record_sets_change() {
    local hosted_zone_id="$1"
    local change_batch="$2"
    shift 2

    cond_log_and_run aws route53 change-resource-record-sets --hosted-zone-id $hosted_zone_id --change-batch $change_batch "$@"
}
