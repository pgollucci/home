aws_ecr_delete_image_batch() {
    local repository_name="$1"
    local image_ids="$2"
    shift 2

    cond_log_and_run aws ecr batch-delete-image --repository-name $repository_name --image-ids $image_ids "$@"
}
