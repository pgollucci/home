aws_route53_vpc_association_authorization_create() {
    local vpc="$1"
    local hosted-zone-id="$2"
    shift 2

    cond_log_and_run aws route53  --vpc $vpc --hosted-zone-id $hosted_zone_id "@"

}
