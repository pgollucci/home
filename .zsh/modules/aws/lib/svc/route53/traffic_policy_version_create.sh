aws_route53_traffic_policy_version_create() {
    local document="$1"
    local id="$2"
    shift 2

    cond_log_and_run aws route53  --document $document --id $id "@"

}
