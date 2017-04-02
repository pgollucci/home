aws_route53_traffic_policy_create() {
    local document="$1"
    local name="$2"
    shift 2

    cond_log_and_run aws route53  --document $document --name $name "@"

}
