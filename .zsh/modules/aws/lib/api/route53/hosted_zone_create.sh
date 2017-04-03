aws_route53_hosted_zone_create() {
    local name="$1"
    local caller_reference="$2"
    shift 2

    cond_log_and_run aws route53 create-hosted-zone --name $name --caller-reference $caller_reference "$@"
}
