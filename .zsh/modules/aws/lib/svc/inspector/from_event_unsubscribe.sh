aws_inspector_from_event_unsubscribe() {
    local event="$1"
    local resource-arn="$2"
    local topic-arn="$3"
    shift 3

    cond_log_and_run aws inspector  --event $event --resource-arn $resource_arn --topic-arn $topic_arn "@"

}
