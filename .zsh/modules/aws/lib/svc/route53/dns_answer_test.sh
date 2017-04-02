aws_route53_dns_answer_test() {
    local hosted-zone-id="$1"
    local record-type="$2"
    local record-name="$3"
    shift 3

    cond_log_and_run aws route53  --hosted-zone-id $hosted_zone_id --record-type $record_type --record-name $record_name "@"

}
