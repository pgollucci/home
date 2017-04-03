aws_codepipeline_action_types_list() {
    shift 0

    log_and_run aws codepipeline list-action-types "$@"
}
