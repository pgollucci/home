aws_route53_resource_record_sets_change() {
    local change-batch="$1"
    local hosted-zone-id="$2"
    shift 2

    cond_log_and_run aws route53  --change-batch $change_batch --hosted-zone-id $hosted_zone_id "@"

}
