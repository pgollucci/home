aws_iot_topic_rule_disable() {
    local rule_name="$1"
    shift 1

    cond_log_and_run aws iot disable-topic-rule --rule-name $rule_name "$@"
}
