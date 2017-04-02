aws_waf_web_acl_update() {
    local web-acl-id="$1"
    local change-token="$2"
    shift 2

    cond_log_and_run aws waf  --web-acl-id $web_acl_id --change-token $change_token "@"

}
