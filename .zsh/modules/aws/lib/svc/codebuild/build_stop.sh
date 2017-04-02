aws_codebuild_build_stop() {
    local id="$1"
    shift 1

    cond_log_and_run aws codebuild  --id $id "@"

}
