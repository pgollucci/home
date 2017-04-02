aws_logs_log_group_untag() {
    local tags="$1"
    local log-group-name="$2"
    shift 2

    cond_log_and_run aws logs  --tags $tags --log-group-name $log_group_name "@"

}
