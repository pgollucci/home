aws_waf-regional_sampled_requests_get() {
    local web_acl_id="$1"
    local rule_id="$2"
    local time_window="$3"
    local max_items="$4"
    shift 4

    log_and_run aws waf-regional get-sampled-requests --web-acl-id $web_acl_id --rule-id $rule_id --time-window $time_window --max-items $max_items "$@"
}
