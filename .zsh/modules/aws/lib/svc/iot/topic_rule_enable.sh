aws_iot_topic_rule_enable() {
    local rule-name="$1"
    shift 1

    cond_log_and_run aws iot  --rule-name $rule_name "@"

}
