aws_codepipeline_pipeline_state_get() {
    local name="$1"
    shift 1

    log_and_run aws codepipeline  --name $name "@"

}
