aws_sns_topic_attributes_get() {
    local topic-arn="$1"
    shift 1

    log_and_run aws sns  --topic-arn $topic_arn "@"

}
