aws_route53_dns_answer_test() {
    local hosted_zone_id="$1"
    local record_name="$2"
    local record_type="$3"
    shift 3

    cond_log_and_run aws route53 test-dns-answer --hosted-zone-id $hosted_zone_id --record-name $record_name --record-type $record_type "$@"
}
