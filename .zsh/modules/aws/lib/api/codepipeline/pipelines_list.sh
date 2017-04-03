aws_codepipeline_pipelines_list() {
    shift 0

    log_and_run aws codepipeline list-pipelines "$@"
}
