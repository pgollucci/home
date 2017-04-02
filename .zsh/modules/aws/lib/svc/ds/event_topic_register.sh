aws_ds_event_topic_register() {
    local topic-name="$1"
    local directory-id="$2"
    shift 2

    cond_log_and_run aws ds  --topic-name $topic_name --directory-id $directory_id "@"

}
