aws_codebuild_curated_environment_images_list() {

    log_and_run aws codebuild list-curated-environment-images "$@"
}
