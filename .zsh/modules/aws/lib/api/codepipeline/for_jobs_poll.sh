aws_codepipeline_for_jobs_poll() {
    local action_type_id="$1"
    shift 1

    cond_log_and_run aws codepipeline poll-for-jobs --action-type-id $action_type_id "$@"
}
