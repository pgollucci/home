aws_waf-regional_ip_set_get() {
    local ip-set-id="$1"
    shift 1

    log_and_run aws waf-regional  --ip-set-id $ip_set_id "@"

}
