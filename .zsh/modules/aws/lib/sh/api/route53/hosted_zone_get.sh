aws_route53_hosted_zone_get() {
    local id="$1"
    shift 1

    log_and_run aws route53 get-hosted-zone --id $id "$@"
}
