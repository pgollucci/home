aws_codepipeline_pipeline_update() {
    local pipeline="$1"
    shift 1

    cond_log_and_run aws codepipeline  --pipeline $pipeline "@"

}
