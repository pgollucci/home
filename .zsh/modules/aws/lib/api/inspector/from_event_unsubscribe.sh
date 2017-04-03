aws_inspector_from_event_unsubscribe() {
    local resource_arn="$1"
    local event="$2"
    local topic_arn="$3"
    shift 3

    cond_log_and_run aws inspector unsubscribe-from-event --resource-arn $resource_arn --event $event --topic-arn $topic_arn "$@"
}
