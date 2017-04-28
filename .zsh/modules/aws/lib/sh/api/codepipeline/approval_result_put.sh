aws_codepipeline_approval_result_put() {
    local pipeline_name="$1"
    local stage_name="$2"
    local action_name="$3"
    local result="$4"
    local token="$5"
    shift 5

    cond_log_and_run aws codepipeline put-approval-result --pipeline-name $pipeline_name --stage-name $stage_name --action-name $action_name --result $result --token $token "$@"
}
