aws_ecr_images_list() {
    local repository_name="$1"
    shift 1

    log_and_run aws ecr list-images --repository-name $repository_name "$@"
}
