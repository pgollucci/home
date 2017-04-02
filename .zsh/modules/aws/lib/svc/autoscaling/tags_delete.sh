aws_autoscaling_tags_delete() {
    local tags="$1"
    shift 1

    cond_log_and_run aws autoscaling  --tags $tags "@"

}
