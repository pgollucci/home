aws_sns_permission_remove() {
    local topic-arn="$1"
    local label="$2"
    shift 2

    cond_log_and_run aws sns  --topic-arn $topic_arn --label $label "@"

}
