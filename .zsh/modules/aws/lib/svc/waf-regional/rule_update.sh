aws_waf-regional_rule_update() {
    local change-token="$1"
    local updates="$2"
    local rule-id="$3"
    shift 3

    cond_log_and_run aws waf-regional  --change-token $change_token --updates $updates --rule-id $rule_id "@"

}
