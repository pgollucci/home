aws_waf_ip_set_update() {
    local updates="$1"
    local change-token="$2"
    local ip-set-id="$3"
    shift 3

    cond_log_and_run aws waf  --updates $updates --change-token $change_token --ip-set-id $ip_set_id "@"

}
