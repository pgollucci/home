aws_route53_vpc_with_hosted_zone_associate() {
    local hosted_zone_id="$1"
    local vpc="$2"
    shift 2

    cond_log_and_run aws route53 associate-vpc-with-hosted-zone --hosted-zone-id $hosted_zone_id --vpc $vpc "$@"
}
