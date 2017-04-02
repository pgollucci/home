aws_autoscaling_or_update_tags_create() {
    local tags="$1"
    shift 1

    cond_log_and_run aws autoscaling  --tags $tags "@"

}
