aws_route53_hosted_zone_create() {
    local name="$1"
    local caller-reference="$2"
    shift 2

    cond_log_and_run aws route53  --name $name --caller-reference $caller_reference "@"

}
