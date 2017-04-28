aws_sns_topic_attributes_set() {
    local topic_arn="$1"
    local attribute_name="$2"
    shift 2

    cond_log_and_run aws sns set-topic-attributes --topic-arn $topic_arn --attribute-name $attribute_name "$@"
}
