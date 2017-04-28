aws_route53_vpc_association_authorization_create() {
    local hosted_zone_id="$1"
    local vpc="$2"
    shift 2

    cond_log_and_run aws route53 create-vpc-association-authorization --hosted-zone-id $hosted_zone_id --vpc $vpc "$@"
}
