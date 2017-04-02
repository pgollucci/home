aws_waf_rule_update() {
    local change-token="$1"
    local rule-id="$2"
    local updates="$3"
    shift 3

    cond_log_and_run aws waf  --change-token $change_token --rule-id $rule_id --updates $updates "@"

}
