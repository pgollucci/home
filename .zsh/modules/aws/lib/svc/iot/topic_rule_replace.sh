aws_iot_topic_rule_replace() {
    local topic-rule-payload="$1"
    local rule-name="$2"
    shift 2

    cond_log_and_run aws iot  --topic-rule-payload $topic_rule_payload --rule-name $rule_name "@"

}
