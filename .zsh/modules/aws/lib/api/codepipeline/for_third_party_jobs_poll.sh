aws_codepipeline_for_third_party_jobs_poll() {
    local action_type_id="$1"
    shift 1

    cond_log_and_run aws codepipeline poll-for-third-party-jobs --action-type-id $action_type_id "$@"
}
