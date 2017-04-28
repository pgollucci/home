aws_ecr_get_image_batch() {
    local repository_name="$1"
    local image_ids="$2"
    shift 2

    log_and_run aws ecr batch-get-image --repository-name $repository_name --image-ids $image_ids "$@"
}
