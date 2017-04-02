aws_route53_vpc_with_hosted_zone_associate() {
    local hosted-zone-id="$1"
    local vpc="$2"
    shift 2

    cond_log_and_run aws route53  --hosted-zone-id $hosted_zone_id --vpc $vpc "@"

}
