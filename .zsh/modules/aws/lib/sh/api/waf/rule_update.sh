aws_waf_rule_update() {
    local rule_id="$1"
    local change_token="$2"
    local updates="$3"
    shift 3

    cond_log_and_run aws waf update-rule --rule-id $rule_id --change-token $change_token --updates $updates "$@"
}
