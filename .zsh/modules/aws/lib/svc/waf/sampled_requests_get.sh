aws_waf_sampled_requests_get() {
    local web-acl-id="$1"
    local time-window="$2"
    local rule-id="$3"
    local max-items="$4"
    shift 4

    log_and_run aws waf  --web-acl-id $web_acl_id --time-window $time_window --rule-id $rule_id --max-items $max_items "@"

}
