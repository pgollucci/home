aws_codepipeline_pipeline_execution_start() {
    local name="$1"
    shift 1

    cond_log_and_run aws codepipeline  --name $name "@"

}
