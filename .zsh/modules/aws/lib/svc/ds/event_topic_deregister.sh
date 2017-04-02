aws_ds_event_topic_deregister() {
    local directory-id="$1"
    local topic-name="$2"
    shift 2

    cond_log_and_run aws ds  --directory-id $directory_id --topic-name $topic_name "@"

}
