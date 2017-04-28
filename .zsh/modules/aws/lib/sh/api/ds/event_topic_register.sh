aws_ds_event_topic_register() {
    local directory_id="$1"
    local topic_name="$2"
    shift 2

    cond_log_and_run aws ds register-event-topic --directory-id $directory_id --topic-name $topic_name "$@"
}
