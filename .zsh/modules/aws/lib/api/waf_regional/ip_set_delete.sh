aws_waf_regional_ip_set_delete() {
    local ip_set_id="$1"
    local change_token="$2"
    shift 2

    cond_log_and_run aws waf-regional delete-ip-set --ip-set-id $ip_set_id --change-token $change_token "$@"
}
