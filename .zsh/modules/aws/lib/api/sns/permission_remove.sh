aws_sns_permission_remove() {
    local topic_arn="$1"
    local label="$2"
    shift 2

    cond_log_and_run aws sns remove-permission --topic-arn $topic_arn --label $label "$@"
}
