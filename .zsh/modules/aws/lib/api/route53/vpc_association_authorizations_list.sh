aws_route53_vpc_association_authorizations_list() {
    local hosted_zone_id="$1"
    shift 1

    log_and_run aws route53 list-vpc-association-authorizations --hosted-zone-id $hosted_zone_id "$@"
}
