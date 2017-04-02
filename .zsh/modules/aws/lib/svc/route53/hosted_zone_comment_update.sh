aws_route53_hosted_zone_comment_update() {
    local id="$1"
    shift 1

    cond_log_and_run aws route53  --id $id "@"

}
