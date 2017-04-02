aws_sns_topic_attributes_set() {
    local attribute-name="$1"
    local topic-arn="$2"
    shift 2

    cond_log_and_run aws sns  --attribute-name $attribute_name --topic-arn $topic_arn "@"

}
