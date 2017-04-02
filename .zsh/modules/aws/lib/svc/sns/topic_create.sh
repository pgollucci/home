aws_sns_topic_create() {
    local name="$1"
    shift 1

    cond_log_and_run aws sns  --name $name "@"

}
