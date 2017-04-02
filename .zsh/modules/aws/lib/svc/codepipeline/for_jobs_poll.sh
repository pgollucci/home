aws_codepipeline_for_jobs_poll() {
    local action-type-id="$1"
    shift 1

    cond_log_and_run aws codepipeline  --action-type-id $action_type_id "@"

}
