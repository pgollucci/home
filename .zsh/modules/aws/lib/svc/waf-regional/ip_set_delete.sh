aws_waf-regional_ip_set_delete() {
    local change-token="$1"
    local ip-set-id="$2"
    shift 2

    cond_log_and_run aws waf-regional  --change-token $change_token --ip-set-id $ip_set_id "@"

}
