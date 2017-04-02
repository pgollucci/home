aws_route53_traffic_policy_versions_list() {
    local id="$1"
    shift 1

    log_and_run aws route53  --id $id "@"

}
