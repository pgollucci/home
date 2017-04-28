aws_iot_topic_rule_create() {
    local rule_name="$1"
    local topic_rule_payload="$2"
    shift 2

    cond_log_and_run aws iot create-topic-rule --rule-name $rule_name --topic-rule-payload $topic_rule_payload "$@"
}
