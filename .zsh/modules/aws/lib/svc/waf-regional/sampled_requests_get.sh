aws_waf-regional_sampled_requests_get() {
    local max-items="$1"
    local time-window="$2"
    local web-acl-id="$3"
    local rule-id="$4"
    shift 4

    log_and_run aws waf-regional  --max-items $max_items --time-window $time_window --web-acl-id $web_acl_id --rule-id $rule_id "@"

}
