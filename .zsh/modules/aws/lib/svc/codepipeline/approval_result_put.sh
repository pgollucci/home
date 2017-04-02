aws_codepipeline_approval_result_put() {
    local stage-name="$1"
    local result="$2"
    local pipeline-name="$3"
    local action-name="$4"
    local token="$5"
    shift 5

    cond_log_and_run aws codepipeline  --stage-name $stage_name --result $result --pipeline-name $pipeline_name --action-name $action_name --token $token "@"

}
