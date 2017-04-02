aws_ecr_get_image_batch() {
    local image-ids="$1"
    local repository-name="$2"
    shift 2

    log_and_run aws ecr  --image-ids $image_ids --repository-name $repository_name "@"

}
