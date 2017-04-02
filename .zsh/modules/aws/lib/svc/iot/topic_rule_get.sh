aws_iot_topic_rule_get() {
    local rule-name="$1"
    shift 1

    log_and_run aws iot  --rule-name $rule_name "@"

}
