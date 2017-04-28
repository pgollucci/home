aws_codepipeline_pipeline_delete() {
    local name="$1"
    shift 1

    cond_log_and_run aws codepipeline delete-pipeline --name $name "$@"
}
