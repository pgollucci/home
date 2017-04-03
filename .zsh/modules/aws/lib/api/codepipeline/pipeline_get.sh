aws_codepipeline_pipeline_get() {
    local name="$1"
    shift 1

    log_and_run aws codepipeline get-pipeline --name $name "$@"
}
