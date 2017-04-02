aws_waf-regional_web_acl_delete() {
    local web-acl-id="$1"
    local change-token="$2"
    shift 2

    cond_log_and_run aws waf-regional  --web-acl-id $web_acl_id --change-token $change_token "@"

}
