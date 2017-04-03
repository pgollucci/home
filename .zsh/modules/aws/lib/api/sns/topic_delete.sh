aws_sns_topic_delete() {
    local topic_arn="$1"
    shift 1

    cond_log_and_run aws sns delete-topic --topic-arn $topic_arn "$@"
}
