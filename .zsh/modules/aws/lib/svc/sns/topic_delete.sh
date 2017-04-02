aws_sns_topic_delete() {
    local topic-arn="$1"
    shift 1

    cond_log_and_run aws sns  --topic-arn $topic_arn "@"

}
