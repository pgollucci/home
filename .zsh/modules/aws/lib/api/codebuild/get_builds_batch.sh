aws_codebuild_get_builds_batch() {
    local ids="$1"
    shift 1

    log_and_run aws codebuild batch-get-builds --ids $ids "$@"
}
